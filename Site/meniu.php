<?php
include "header.php";
include "connect.php";
?>

<?php
    $query = "Select * from Meniu";
    $result = mysqli_query($conexiune, $query);

    if(mysqli_num_rows($result)){
        while($row=mysqli_fetch_array($result)){
            //print("<img src=&quot;date:image/jpeg;base64,".base64_encode($row['Img']).">");
            echo '<img src="data:image/jpeg;base64,'.base64_encode($row['Img']).'"height="100" weight="100"/> <br/>';
        }
    }else{
        print("Nu exista intrari in baza de date!");
    }
?>

<?php
include "footer.php"
 ?>
