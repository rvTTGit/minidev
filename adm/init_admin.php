<?php
session_start();

// chargement de la conf bdd
include('../script/config.php');

/*-----------------------------------------------------------------------------------------*/

include('functions.php');
include('../script/form_functions.php');

try{
    $db = Database::getInstance();
    // création des instances
    $oUser = new Users();
    $oArticles = new News();
    $oSections = new Sections();
    $oConfigs = new Configs();
    $oLogs = new Logs();
    $oDroits = new Droits();
    $oTypeTarifs = new TypeTarifs();
    $oTarifs = new Tarifs();
    $oContacts = new Contacts();
    $oMessages = new Messages();

    //message du footer pour le livre d'or
    $message_livreor_check = $oMessages->countMessages('livreor', false);

}
catch(PDOException $e){
    include('views/header.phtml');
    echo "<h1>Erreur</h1>";
    echo '<span style="color : red;">Problème de connexion : ' . $e->getMessage() . '</span></br>';
    include('views/footer.phtml');
    die();
}
/*-----------------------------------------------------------------------------------------*/

