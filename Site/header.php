<!DOCTYPE html>
<?php
    include "connect.php";
    session_start();
    //require_once("connect.php")
?>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>HILMAD-Restaurant</title>
<!-- Favicons
    ================================================== -->
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="img/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72" href="img/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114" href="img/apple-touch-icon-114x114.png">

<!-- Bootstrap -->
<link rel="stylesheet" type="text/css"  href="../css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="../fonts/font-awesome/css/font-awesome.css">

<!-- Stylesheet
    ================================================== -->
<link rel="stylesheet" type="text/css"  href="../css/style.css">
<link rel="stylesheet" type="text/css" href="../css/prettyPhoto.css">
<link href='http://fonts.googleapis.com/css?family=Lato:400,700,900,300' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800,600,300' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="../js/modernizr.custom.js"></script>


</head>
<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">

<!-- Header -->
<header id="header">
  <div class="intro text-center">
    <div class="overlay">
      <div class="container">
        <div class="row">
          <div class="intro-text">
            <h1>Hilmad</h1>
          </div>
        </div>
      </div>
    </div>
  </div>
</header>

<!-- Navigation -->
<div id="nav">
  <nav class="navbar navbar-custom">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse"> <i class="fa fa-bars"></i> </button>
      </div>
      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse navbar-main-collapse">
        <ul class="nav navbar-nav">
          <!-- Hidden li included to remove active class from about link when scrolled up past about section -->
          <li class="hidden"> <a href="#page-top"></a> </li>
          <li> <a class="page-scroll" href="index.php">Home</a> </li>
          <li> <a class="page-scroll" href="meniu.php" >Meniu</a> </li>
          <li> <a class="page-scroll" href="contact.php">Contact</a> </li>
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
                        echo '<li><a class="page-scroll" href="login.php">LOG IN</a></li>';
                    } else {
                        echo '<li><a class="page-scroll" href="signout.php">SIGN OUT</a></li>';
                        $ok=1;
                    }

                }else{
                    echo '<li><a class="page-scroll" href="login.php">LOG IN</a></li>';
                    $ok=0;
                }
                ?>
        </ul>
      </div>
    </div>
  </nav>
</div>
