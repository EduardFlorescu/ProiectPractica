<?php
include "header.php";
include "connect.php";
?>
<div id="meniuri">
<?php
    $query = "Select * from Meniu";
    $result = mysqli_query($conexiune, $query);

    if(mysqli_num_rows($result)){
        print('<br/><table align="center"><tr>');
        while($row=mysqli_fetch_array($result)){
           echo '<td><a href="produse.php"><img src="data:image/jpeg;base64,'.base64_encode($row['Img']).
            '"height="100" weight="100"/><div class="centered">'.$row['Nume'].'</div></a></td>';
        }
        print('</tr></table>');
    }else{
        print("Nu exista intrari in baza de date!");
    }
?>
</div>
<?php
include "footer.php"
 ?>
