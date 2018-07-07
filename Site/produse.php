<?php
include "header.php";
include "connect.php";
?>

<div id="content">
    <?php
        $id = $_GET["categorie"];
        $sql="SELECT * FROM meniu WHERE idMeniu=".$id."";
        $result = mysqli_query($conexiune, $sql);

        $row=mysqli_fetch_array($result);
        if($row){
        echo '<div class="centered"><img src="'.$row['caleImagineCategorie'].
            '" height="100" weight="100"/><br/>'.$row['numeCategorie'].'</div>';
        }

        $query = "SELECT * FROM produse WHERE idProdus IN (SELECT idProdus FROM detaliimeniu WHERE idMeniu=".$id.")";
        $result = mysqli_query($conexiune, $query);

        if(mysqli_num_rows($result)){
            echo '<table align="center" border="1" class="centered"><tr>
            <th></th>
            <th>NUME</th>
            <th>GRAME</th>
            <th>PRET</th>
            <th>INGREDIENTE</th>
            </tr>';
            while($row=mysqli_fetch_array($result)){
                echo '<tr><td><img src="'.$row['caleImagineProdus'].
                '" height="50" weight="50"/></td>'.
                '<td>'.$row['numeProdus'].'</td>'.
                '<td>'.$row['gramaj'].'</td>'.
                '<td>'.$row['pret'].'</td>'.
                '<td>'.$row['ingrediente'].'</td>'.
                '</tr>';
            }
        }else{
            echo "Nu exista intrari in baza de date!";
        }
    ?>
</div>

<?php
include "footer.php"
 ?>
