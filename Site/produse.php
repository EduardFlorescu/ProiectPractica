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
        <?php if($ok==1)
                $idCateg = $_GET["categorie"];
                echo '<form action="produse.php?categorie='.$idCateg.'">
                <input name="comanda" type="hidden" value="add" />
                <button type="submit" name="categorie" value="'.$idCateg.'">ADD</button>
                </form>';
            ?>
        <div>
<?php
        $comanda = $_REQUEST["comanda"];
        if (isset($comanda)) {
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
                    echo "<font color='red'>Intrarea cu id-ul $idSterg a fost stearsa cu succes</font><br/>";
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
                    echo '<div class="centered">
                        <form action="produse.php?categorie='.$idCateg.'" method="post">
                            <input name="comanda" type="hidden" value="update" />
                            <input name="idProdus" type="hidden" value="'.$idProdus.'"/>
                            <label>
                            Nume:
                            </label>
                            <input name="numeProdus" type="text" value="'.$numeProdus.'" />
                            <label>
                            Pret:
                            </label>
                            <input name="pret" type="number" value="'.$pret.'" />
                            <label>
                            Gramaj:
                            </label>
                            <input name="gramaj" type="number" value="'.$gramaj.'" />
                            <label>
                            Ingrediente:
                            </label>
                            <input name="ingrediente" type="text" value="'.$ingrediente.'" />
                            <label>
                            Imagine:
                            </label>
                            <input name="caleImagineProdus" type="text" value="'.$caleImagineProdus.'" />
                            <button type="submit" name="categorie" value="'.$idCateg.'">Update</button>
                        </form> 
                        <br/>
                        <br/>
                        </div>';
                    }else{
                        echo "<font color='red'>Intrarea cu id-ul $idEdit nu exista!</font><br/>"; 
                    }
                    break;
                case 'update':
                    $idProdus= $_REQUEST["idProdus"];
                    $numeProdus= $_REQUEST["numeProdus"];
                    $pret= $_REQUEST["pret"];
                    $gramaj= $_REQUEST["gramaj"];
                    $ingrediente= $_REQUEST["ingrediente"];
                    $caleImagineProdus= $_REQUEST["caleImagineProdus"];
                    
                    $numeProdus= mysqli_real_escape_string($conexiune,$numeProdus);
                    $pret= mysqli_real_escape_string($conexiune,$pret);
                    $gramaj= mysqli_real_escape_string($conexiune,$gramaj);
                    $ingrediente= mysqli_real_escape_string($conexiune,$ingrediente);
                    $caleImagineProdus= mysqli_real_escape_string($conexiune,$caleImagineProdus);

                    $sqlUpp = "UPDATE produse SET numeProdus='$numeProdus', pret='$pret', gramaj='$gramaj', 
                    ingrediente='$ingrediente', caleImagineProdus ='$caleImagineProdus' WHERE idProdus='$idProdus'";
                    if (!mysqli_query($conexiune, $sqlUpp)) {
                    die('Error: ' . mysqli_error($conexiune));
                    } else {
                    echo "<font color='red'>Intrarea cu idul
                    $idProdus a fost actualizata cu succes!</font><br/>";
                    } 

                break;

                case 'add':
                    $idCateg = $_GET["categorie"];
                    echo '<div class="centered">
                        <form action="produse.php?categorie='.$idCateg.'" method="post">
                        <input name="comanda" type="hidden" value="add" />
                        <label>
                            Nume:
                        </label>
                        <input name="numeProdus" type="text" value="'.$numeProdus.'" />
                        <label>
                            Pret:
                        </label>
                        <input name="pret" type="number" value="'.$pret.'" />
                        <label>
                        Gramaj:
                        </label>
                        <input name="gramaj" type="number" value="'.$gramaj.'" />
                        <label>
                        Ingrediente:
                        </label>
                        <input name="ingrediente" type="text" value="'.$ingrediente.'" />
                        <label>
                        Imagine:
                        </label>
                        <input name="caleImagineProdus" type="text" value="'.$caleImagineProdus.'"/>
                        <button type="submit" name="categorie" value="'.$idCateg.'">ADD</button>
                    </form>
                    <br/>
                    <br/>
                    </div>';
                    
                    $numeProdus= $_REQUEST["numeProdus"];
                    $pret= $_REQUEST["pret"];
                    $gramaj= $_REQUEST["gramaj"];
                    $ingrediente= $_REQUEST["ingrediente"];
                    $caleImagineProdus= $_REQUEST["caleImagineProdus"];

                    $stmt =$conexiune -> prepare("INSERT INTO produse (numeProdus,pret,gramaj,ingrediente,caleImagineProdus) VALUES (?,?,?,?,?)");
                    $stmt->bind_param("sddss",$numeProdus,$pret,$gramaj,$ingrediente, $caleImagineProdus);
                   
                    $stmt->execute();

                    $sqlSelect="SELECT * FROM produse WHERE numeProdus='$numeProdus' AND pret='$pret' AND gramaj='$gramaj' AND
                    ingrediente='$ingrediente' AND caleImagineProdus ='$caleImagineProdus'";
                    $resSelect = mysqli_query($conexiune, $sqlSelect) or die(mysqli_error($conexiune));
                    $rowSelect=mysqli_fetch_array($resSelect);

                    $idProdusSelectat = $rowSelect['idProdus'];
                    $sqlAddLeg =$conexiune -> prepare("INSERT INTO detaliimeniu(idMeniu,idProdus) VALUES (?,?)");
                    $sqlAddLeg->bind_param("dd",$idCateg,$idProdusSelectat );
                    $sqlAddLeg->execute();

                break;
            }
        }

        $query = "SELECT * FROM produse WHERE idProdus IN (SELECT idProdus FROM detaliimeniu WHERE idMeniu='$idCateg')";
        $res = mysqli_query($conexiune, $query) or die(mysqli_error($conexiune));

        if(mysqli_num_rows($res)>0){
            echo '<table align="center" border="1" class="centered"><tr>
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
            echo '</tr>';
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
                    <button type="submit" name="categorie" value="'.$idCateg.'">Delete</button></form></td>';

                    echo '<td><form action="produse.php?categorie='.$idCateg.'"><input name="comanda" type="hidden" value="edit" />
                    <input type="hidden" name="edit" value="'.$row["idProdus"].'"/>
                    <button type="submit" name="categorie" value="'.$idCateg.'">Edit</button>
                    </form></td>';
                }
                echo '</tr>';
            }
            echo '</table>';
        }else{
            echo "Nu exista intrari in baza de date!";
        }
    ?>
</div>

<?php
include "footer.php"
 ?>
