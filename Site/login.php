<?php
include "header.php"
?>

<br/>
<form name="login_form" action="login.php" method="post">
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td align="right">Username: </td>
            <td><input type="text" name="login_username" id="login_username" /></td>
        </tr>
        <tr>
            <td align="right">Parola: </td>
            <td><input type="password" name="login_password" id="login_password" /></td>
        </tr>
        <tr>
            <td></td>
            <td><input class="btn btn-primary" type="submit" name="login_btn" value="Login" /></td>
        </tr>
    </table>
    <br>
</form>

<?php
//  verifica daca exista date transmise
if ($_POST['login_username'] != '' && $_POST['login_password'] != '') {

    // preia datele din formular
    $username = $_POST['login_username'];
    $password = md5($_POST['login_password']);

    $username = mysqli_real_escape_string($conexiune,$username);
    $password = mysqli_real_escape_string($conexiune,$password);

    // formeaza si executa query-ul de select din baza de date
    $query = "SELECT * FROM cont WHERE `username` = '$username' AND `password` = '$password'";
    $result = mysqli_query($conexiune,$query) or die ( "Error : ". mysqli_error($conexiune) );

    // verifica daca interogarea MySQL a gasit date valide
    if (mysqli_num_rows($result) < 1) {
        // daca nu, afiseaza un mesaj de eroare
        echo "Datele introduse sunt incorecte";
    } else {

        // salveaza username-ul si parola in sesiune
        $_SESSION['username'] = $username;
        $_SESSION['password'] = $password;
        // afiseaza un mesaj de succes
        //echo "Autentificarea a fost efectuata cu succes.";
        header("Location: index.php");
    }
}

include "footer.php"
?>
