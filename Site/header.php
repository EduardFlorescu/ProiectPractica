<?php
    include "connect.php";
    session_start();
    //require_once("connect.php")
?>
<html>
<head>
    <meta charset="utf-8" />
    <title>Restaurant</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  

    <link rel="stylesheet" href="../CSS/style.css"
</head>
<body>
    <div id="container">
        <div id="header">
            <div id="logo">
                <h1>HILMAD</h1>
            </div>

            <div id="navigation-bar">
                <a href="index.php"><button type="button" class="btn btn-success">HOME</button></a>
                <a href="meniu.php"><button type="button" class="btn btn-success">MENIU</button></a>
                <a href="contact.php"><button type="button" class="btn btn-success">CONTACT</button></a>
                <?php
                if (isset($_SESSION['username']) && isset($_SESSION['password'])) {
                     // preia datele din sesiune
                    $username = $_SESSION['username'];
                    $password = $_SESSION['password'];
                
                    // formeaza si executa query-ul de select din baza de date
                    $query = "SELECT * FROM cont WHERE `username` = '".$username."' AND `password` = '".$password."'";
                    $result = mysqli_query($conexiune,$query) or die ( "Error : ". mysqli_error($conexiune) );
                
                    // verifica daca interogarea MySQL a gasit date valide
                    if (mysqli_num_rows($result) < 1) {
                        // daca nu, afiseaza un mesaj de eroare
                        $ok=0;
                        echo '<a href="login.php"><button type="button" class="btn btn-success">LOG IN</button></a>';
                    } else {
                        echo '<a href="signout.php"><button type="button" class="btn btn-success">SIGN OUT</button></a>';
                        $ok=1;
                    }
                        
                }else{
                    echo '<a href="login.php"><button type="button" class="btn btn-success">LOG IN</button></a>';
                    $ok=0;
                } 
                ?>
                
            </div>
            
            <img id="imgLogo" src="../Imagini/restaurant.jpg" alt="Restaurant"/>
            
            
        </div>
    