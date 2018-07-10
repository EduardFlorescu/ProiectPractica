<?php
include "header.php";
include "connect.php";
?>

<div id="content">
<?php
    $comanda = $_REQUEST["comanda"];
    if (isset($comanda)) {
        switch ($comanda){
            case 'add':

                $target_dir = "../Imagini/";
                $target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
                $uploadOk = 1;
                $imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
                // Check if image file is a actual image or fake image
                if(isset($_POST["submit"])) {
                $check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);
                if($check !== false) {
                    //echo "File is an image - " . $check["mime"] . ".";
                    $uploadOk = 1;
                } else {
                    //echo "File is not an image.";
                    $uploadOk = 0;
                }
                }
                // Check if file already exists
                if (file_exists($target_file)) {
               // echo "Sorry, file already exists.";
                $uploadOk = 0;
                }
                
                // Allow certain file formats
                if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
                && $imageFileType != "gif" ) {
                echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
                $uploadOk = 0;
                }
                // Check if $uploadOk is set to 0 by an error
                if ($uploadOk == 0) {
                //echo "Sorry, your file was not uploaded.";
                // if everything is ok, try to upload file
                } else {
                if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
                    //echo "The file ". basename( $_FILES["fileToUpload"]["name"]). " has been uploaded.";
                } else {
                  //  echo "Sorry, there was an error uploading your file.";
                }
                }

                $img =$target_file;
                $nume = $_REQUEST["nume"];
                $nume=mysqli_real_escape_string($conexiune,$nume);
                if(basename($_FILES["fileToUpload"]["name"]) && $nume){
                $sql="INSERT INTO meniu(numeCategorie,caleImagineCategorie) VALUES ('$nume','$img')";

                if (!mysqli_query($conexiune, $sql)) {
                    die('Error: ' . mysqli_error($conexiune));
                }
                echo "<font color='red'>Intrare adaugata cu succes</font><br/>";
                }
                break;
        }

    }

?>

    <form action="add_meniu.php" method="post" enctype="multipart/form-data">
      <input name="comanda" type="hidden" value="add" />
      Nume: <input type="text" name="nume" />
      <br/>
      <br/>
       <input type="file" name="fileToUpload" id="fileToUpload">
       <input type="submit" value="Submit" name="submit">
    </form>

</div>

<?php
include "footer.php"
 ?>
