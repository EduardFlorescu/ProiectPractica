<?php
include "header.php";
include "connect.php";
?>

<div id="content">
    <?php
        $idCateg = $_GET["categorie"];
        $sqlCateg="SELECT * FROM meniu WHERE idMeniu='$idCateg'";
        $resultCateg = mysqli_query($conexiune, $sqlCateg) or die(mysqli_error($conexiune));

        $rowCateg=mysqli_fetch_array($resultCateg);
        if($rowCateg){
        echo '<div class="centered"><img src="'.$rowCateg['caleImagineCategorie'].
            '" height="100" weight="100"/><br/>'.$rowCateg['numeCategorie'].'</div>';
        }
?>
        <div id="btn">
        <?php if($ok==1){
                $idCateg = $_GET["categorie"];
                echo '<form action="produse.php?categorie='.$idCateg.'">
                <input name="comanda" type="hidden" value="add" />
                <button class="btn btn-primary" type="submit"  name="categorie" value="'.$idCateg.'">ADD</button>
                </form>';
        }
            ?>
        <div>
<?php
        $comanda = $_REQUEST["comanda"];
        if (isset($comanda)) {
            if($ok==1){
            switch ($comanda){
                case 'delete':
                    $idSterg = $_REQUEST["delete"];
                    $sqlSterg = "DELETE FROM detaliimeniu WHERE idProdus='$idSterg'";
                    if (!mysqli_query($conexiune, $sqlSterg)) {
                        die('Error: ' . mysqli_error($conexiune));
                    }

                    $sqlSterg = "DELETE FROM produse WHERE idProdus='$idSterg'";
                    if (!mysqli_query($conexiune, $sqlSterg)) {
                        die('Error: ' . mysqli_error($conexiune));
                    }
                    //echo "<font color='red'>Intrarea cu id-ul $idSterg a fost stearsa cu succes</font><br/>";
                    break;

                case 'edit':
                    $idEdit = $_REQUEST["edit"];
                    $idCateg = $_GET["categorie"];
                    $sqlEdit = "SELECT * FROM produse WHERE idProdus='$idEdit'";
                    $result = mysqli_query($conexiune, $sqlEdit);
                    if ($rowEdit = mysqli_fetch_array($result)) {
                        $idProdus=$rowEdit['idProdus'];
                        $numeProdus=$rowEdit['numeProdus'];
                        $pret=$rowEdit['pret'];
                        $gramaj=$rowEdit['gramaj'];
                        $ingrediente=$rowEdit['ingrediente'];
                        $caleImagineProdus=$rowEdit['caleImagineProdus'];
                    if($ok==1){
                    echo '
                    <div class="centered">
                      <div class="row">
                        <div class="col-xs-12">
                          <form action="produse.php?categorie='.$idCateg.'" method="post" class="form-horizontal" enctype="multipart/form-data">
                            <input name="comanda" type="hidden" value="update" />
                            <input name="idProdus" type="hidden" value="'.$idProdus.'"/>
                            <div class="form-group">
                                <label for="NumeProdus" class="col-sm-2 control-label">  Nume: </label>
                                <div class="col-sm-10">
                                  <input name="numeProdus" class="form-control" type="text" id="NumeProddus" value="'.$numeProdus.'" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="Pret" class="col-sm-2 control-label">Pret:</label>
                                <div class="col-sm-10">
                                  <input name="pret" class="form-control" type="number" min="0" step="any" id="Pret" value="'.$pret.'" />
                                </div>
                            </div>
                            <div class="form-group">
                              <label for="Gramaj" class="col-sm-2 control-label" >Gramaj:</label>
                                <div class="col-sm-10">
                                  <input name="gramaj" class="form-control" type="number" min="0" step="any" id="Gramaj" value="'.$gramaj.'" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="Ingrediente" class="col-sm-2 control-label">Ingrediente:</label>
                                <div class="col-sm-10">
                                  <input name="ingrediente" class="form-control" type="text" id="Ingrediente" value="'.$ingrediente.'" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="caleImagineProdus"  class="col-sm-2 control-label">Imagine:</label>
                                <div class="col-sm-10">
                                  <input name="caleImagineProdus"  class="form-control" type="file" id="caleImagineProdus" value="'.$caleImagineProdus.'"/>
                                </div>
                            </div>
                            <div class="form-group">
                              <div class="col-sm-10  col-sm-push-2 ">
                                <button class="btn btn-primary" type="submit" name="categorie" value="'.$idCateg.'">Update</button>
                              </div>
                            </div>
                        </form>
                    </div>
                  </div>
                </div>';
                }
                    }else{
                        //echo "<font color='red'>Intrarea cu id-ul $idEdit nu exista!</font><br/>";
                    }
                    break;
                case 'update':

                $target_dir = "../Imagini/";
                $target_file = $target_dir . basename($_FILES["caleImagineProdus"]["name"]);
                $uploadOk = 1;
                $imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
                // Check if image file is a actual image or fake image
                if(isset($_POST["submit"])) {
                $check = getimagesize($_FILES["caleImagineProdus"]["tmp_name"]);
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
                //echo "Sorry, file already exists.";
                $uploadOk = 0;
                }

                // Allow certain file formats
                if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
                && $imageFileType != "gif" ) {
               // echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
                $uploadOk = 0;
                }
                // Check if $uploadOk is set to 0 by an error
                if ($uploadOk == 0) {
                //echo "Sorry, your file was not uploaded.";
                // if everything is ok, try to upload file
                } else {
                if (move_uploaded_file($_FILES["caleImagineProdus"]["tmp_name"], $target_file)) {
                    //echo "The file ". basename( $_FILES["caleImagineProdus"]["name"]). " has been uploaded.";
                } else {
                   // echo "Sorry, there was an error uploading your file.";
                }
                }

                    $idProdus= $_REQUEST["idProdus"];
                    $numeProdus= $_REQUEST["numeProdus"];
                    $pret= $_REQUEST["pret"];
                    $gramaj= $_REQUEST["gramaj"];
                    $ingrediente= $_REQUEST["ingrediente"];

                    $caleImagineProdus= $target_file;




                    $numeProdus= htmlspecialchars($numeProdus);
                    $numeProdus=mysqli_real_escape_string($conexiune,$numeProdus);

                    $ingrediente= htmlspecialchars($ingrediente);
                    $ingrediente=mysqli_real_escape_string($conexiune,$ingrediente);

                    $caleImagineProdus= htmlspecialchars($caleImagineProdus);
                    $caleImagineProdus=mysqli_real_escape_string($conexiune,$caleImagineProdus);

                if(basename($_FILES["caleImagineProdus"]["name"]) && $numeProdus && $pret && $gramaj && $ingrediente && $ok==1){
                    $sqlUpp = "UPDATE produse SET numeProdus='$numeProdus', pret='$pret', gramaj='$gramaj',
                    ingrediente='$ingrediente', caleImagineProdus ='$caleImagineProdus' WHERE idProdus='$idProdus'";

                    if (!mysqli_query($conexiune, $sqlUpp)) {
                    die('Error: ' . mysqli_error($conexiune));
                    } else {
                   // echo "<font color='red'>Intrarea cu idul
                    //$idProdus a fost actualizata cu succes!</font><br/>";
                    }
                }
                break;

                case 'add':
                    $idCateg = $_GET["categorie"];
                    echo '
                    <div class="centered">
                      <div class="row">
                        <div class="col-xs-12">

                          <form action="produse.php?categorie='.$idCateg.'" method="post" class="form-horizontal" enctype="multipart/form-data">
                            <input name="comanda" type="hidden" value="add" />
                            <div class="form-group">
                                <label for="NumeProdus" class="col-sm-2 control-label">  Nume: </label>
                                <div class="col-sm-10">
                                  <input name="numeProdus" class="form-control" type="text" id="NumeProddus" value="'.$numeProdus.'" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="Pret" class="col-sm-2 control-label">Pret:</label>
                                <div class="col-sm-10">
                                  <input name="pret" class="form-control" type="number" min="0" step="any" id="Pret" value="'.$pret.'" />
                                </div>
                            </div>
                            <div class="form-group">
                              <label for="Gramaj" class="col-sm-2 control-label" >Gramaj:</label>
                                <div class="col-sm-10">
                                  <input name="gramaj" class="form-control" type="number" min="0" step="any" id="Gramaj" value="'.$gramaj.'" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="Ingrediente" class="col-sm-2 control-label">Ingrediente:</label>
                                <div class="col-sm-10">
                                  <input name="ingrediente" class="form-control" type="text" id="Ingrediente" value="'.$ingrediente.'" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="caleImagineProdus"  class="col-sm-2 control-label">Imagine:</label>
                                <div class="col-sm-10">
                                  <input name="caleImagineProdus" class="form-control" type="file" id="caleImagineProdus" value="'.$caleImagineProdus.'"/>
                                </div>
                            </div>
                            <div class="form-group">
                              <div class="col-sm-10  col-sm-push-2 ">
                                <button type="submit" name="categorie" class="btn btn-primary" value="'.$idCateg.'">ADD</button>
                              </div>
                          </form>

                      </div>
                    </div>
                  </div>';

                    $target_dir = "../Imagini/";
                    $target_file = $target_dir . basename($_FILES["caleImagineProdus"]["name"]);
                    $uploadOk = 1;
                    $imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
                    // Check if image file is a actual image or fake image
                    if(isset($_POST["submit"])) {
                    $check = getimagesize($_FILES["caleImagineProdus"]["tmp_name"]);
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
                    //echo "Sorry, file already exists.";
                    $uploadOk = 0;
                    }

                    // Allow certain file formats
                    if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
                    && $imageFileType != "gif" ) {
                   // echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
                    $uploadOk = 0;
                    }
                    // Check if $uploadOk is set to 0 by an error
                    if ($uploadOk == 0) {
                   // echo "Sorry, your file was not uploaded.";
                    // if everything is ok, try to upload file
                    } else {
                    if (move_uploaded_file($_FILES["caleImagineProdus"]["tmp_name"], $target_file)) {
                        //echo "The file ". basename( $_FILES["caleImagineProdus"]["name"]). " has been uploaded.";
                    } else {
                       // echo "Sorry, there was an error uploading your file.";
                    }
                    }



                    $numeProdus= $_REQUEST["numeProdus"];
                    $pret= $_REQUEST["pret"];
                    $gramaj= $_REQUEST["gramaj"];
                    $ingrediente= $_REQUEST["ingrediente"];
                    $caleImagineProdus= $target_file;

                    if(basename($_FILES["caleImagineProdus"]["name"]) && $numeProdus && $pret && $gramaj && $ingrediente){
                        $numeProdus= htmlspecialchars($numeProdus);
                        $numeProdus=mysqli_real_escape_string($conexiune,$numeProdus);

                        $ingrediente= htmlspecialchars($ingrediente);
                        $ingrediente=mysqli_real_escape_string($conexiune,$ingrediente);

                        $caleImagineProdus= htmlspecialchars($caleImagineProdus);
                        $caleImagineProdus=mysqli_real_escape_string($conexiune,$caleImagineProdus);

                        $stmt =$conexiune -> prepare("INSERT INTO produse (numeProdus,pret,gramaj,ingrediente,caleImagineProdus) VALUES (?,?,?,?,?)");
                        $stmt->bind_param("sddss",$numeProdus,$pret,$gramaj,$ingrediente, $caleImagineProdus);

                        $stmt->execute();
                           // echo $numeProdus;
                        $sqlSelect="SELECT * FROM produse WHERE numeProdus LIKE '$numeProdus'";
                        $resSelect = mysqli_query($conexiune, $sqlSelect) or die(mysqli_error($conexiune));
                        $rowSelect=mysqli_fetch_array($resSelect);

                        $idProdusSelectat = $rowSelect['idProdus'];
                        $sqlAddLeg =$conexiune -> prepare("INSERT INTO detaliimeniu(idMeniu,idProdus) VALUES (?,?)");
                        $sqlAddLeg->bind_param("dd",$idCateg,$idProdusSelectat );
                        $sqlAddLeg->execute();
                    }
                break;
            }
        }else{
            header("Location: login.php");
        }
        }

        $query = "SELECT * FROM produse WHERE idProdus IN (SELECT idProdus FROM detaliimeniu WHERE idMeniu='$idCateg')";
        $res = mysqli_query($conexiune, $query) or die(mysqli_error($conexiune));

        if(mysqli_num_rows($res)>0){
            echo '<table align="center" class="table table-hover">
            <thead>
            <tr>
            <th></th>
            <th>NUME</th>
            <th>GRAME</th>
            <th>PRET</th>
            <th>INGREDIENTE</th>';
            if($ok==1)
            {
               echo '<th></th>
                <th></th>';
            }
            echo '</tr></thead><tbody>';

            while($row=mysqli_fetch_array($res)){
                echo '<tr><td><img src="'.$row['caleImagineProdus'].
                '" height="50" weight="50"/></td>'.
                '<td>'.$row['numeProdus'].'</td>'.
                '<td>'.$row['gramaj'].'</td>'.
                '<td>'.$row['pret'].'</td>'.
                '<td>'.$row['ingrediente'].'</td>';
                if($ok==1){
                    echo '<td><form action="produse.php?categorie='.$idCateg.'"><input name="comanda" type="hidden" value="delete" />
                    <input type="hidden" name="delete" value="'.$row["idProdus"].'"/>
                    <button class="btn btn-primary" type="submit" name="categorie" value="'.$idCateg.'">Delete</button></form></td>';

                    echo '<td><form action="produse.php?categorie='.$idCateg.'"><input name="comanda" type="hidden" value="edit" />
                    <input type="hidden" name="edit" value="'.$row["idProdus"].'"/>
                    <button class="btn btn-primary" type="submit" name="categorie" value="'.$idCateg.'">Edit</button>
                    </form></td>';
                }
                echo '</tr>';
            }
            echo '</tbody></table>';
        }else{
            echo "Nu exista intrari in baza de date!";
        }
    ?>
</div>

<?php
include "footer.php"
 ?>
