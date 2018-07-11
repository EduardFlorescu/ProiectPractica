<?php
include "header.php";
?>
<div id="content">
    <div id="btn">
    <?php if($ok==1)
            echo '<a href="add_meniu.php"><button type="button" class="btn btn-success">ADD</button></a>';
        ?>
    <div>
    <div id="meniuri">
    <?php

    $comanda = $_REQUEST["comanda"];
    
    if (isset($comanda)) {
        if($ok==1){
            switch ($comanda){
                case 'delete':

                    $id = $_REQUEST["delete"];
                    $sqlSterg = "DELETE FROM detaliimeniu WHERE idMeniu='$id'";
                        if (!mysqli_query($conexiune, $sqlSterg)) {
                            die('Error: ' . mysqli_error($conexiune));
                        }

                    $id = $_REQUEST["delete"];
                    $sql = "DELETE FROM meniu WHERE idMeniu='$id'";
                    if (!mysqli_query($conexiune, $sql)) {
                        die('Error: ' . mysqli_error($conexiune));
                    }
                    //echo "<font color='red'>Intrarea cu id-ul $id a fost stearsa cu succes</font><br/>";
                    break;
            }
        }else{
            header("Location: login.php");
        }

    }

?>
    
    <?php
        $query = "Select * from meniu";
        $result = mysqli_query($conexiune, $query);

        if(mysqli_num_rows($result)){
            print('<br/><table align="center"><tr>');
            while($row=mysqli_fetch_array($result)){
            echo '<td><form action="produse.php"><button type="submit" name="categorie" value="'.$row['idMeniu'].'">
            <img src="'.$row['caleImagineCategorie'].'" alt="'.$row['numeCategorie'].'" height="100" weight="100" ></button>
            <div class="centered">'.$row['numeCategorie'].'</div></a>    </form>';
    ?>

     <?php if($ok==1)
    echo '<form action="meniu.php" method="post">
      <input name="comanda" type="hidden" value="delete" />
      <input type="hidden" name="delete" value="'.$row["idMeniu"].'"/>
        <input type="submit" value="Delete" />
    </form>';
    ?>
    
    <?php
      echo '</td>';
            }
            print('</tr></table>');
        }else{
            print("Nu exista un meniu disponibil!");
        }
    ?>
    </div>
</div>
<?php
include "footer.php"
 ?>
