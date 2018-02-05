<?php
//chargement du model
include('init_admin.php');

// control
$erreur = '';
if(isset($_POST['login'], $_POST['password'])){
    // on vérifie que le couple reçu est celui qu'on attend
    // utilisation de la fonction
    // if( (authenticate($_POST['password'],$_POST['login'])) ){
    if( ($oUser->authenticate($_POST['password'],$_POST['login'])) ){
        // on stocke en session le nom
        $_SESSION['login'] = $_POST['login'];
        $_SESSION['connected'] = true;
        // on stocke également l'id de l'utilisateur
        $_SESSION['id'] = $oUser->fields['id'];
        $_SESSION['droit'] = $oUser->fields['droit'];

        // var_dump($oUser);exit;
        if(isset($_SERVER['HTTP_X_FORWARDED_FOR'])) 
        {
          $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
        }
        elseif(isset($_SERVER['HTTP_CLIENT_IP'])) 
        {
          $ip  = $_SERVER['HTTP_CLIENT_IP'];
        }
        else 
        {
          $ip = $_SERVER['REMOTE_ADDR'];
        }
        $oLogs->logAction("Authentification, ip:".$ip);
    }
    else{
        $erreur = "Echec de l'authentification !!";
    }
}

if(isset($_SESSION['connected']) && $_SESSION['connected']){
    header('Location: index.php');
    die();
}


// chargement de la vue
include('views/login.phtml');
// include('views/login_test.phtml');

