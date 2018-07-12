<?php
require_once "config.php";
//Stabiliesc conexiunea cu serverul MySQL
$conexiune = mysqli_connect(DB_HOST, DB_USER, DB_PASS);
$conexiune -> query("SET NAMES utf8");
if (!$conexiune) {
 die('Eroare conectare la MySQL: ' . mysqli_connect_error());
}
mysqli_select_db($conexiune, DB_NAME) or die("Eroare la selectarea bazei de date " . mysqli_error($conexiune));
?>
