<?php 
session_start();
include('functions.php');
include('config.php'); 


try{
    $db = Database::getInstance();
	// chargement des models
	$oConfigs = new Configs();
	$oSections = new Sections();
	$oArticles = new News();
	$oTarifs = new Tarifs();
	$oTypeTarifs = new TypeTarifs();
	$oContacts = new Contacts();
	$oMessages = new Messages();
} 
catch(PDOException $e){
    // include('views/header.php');
    echo '<h1>Erreur</h1>';
    echo '<p> Erreur de connexion à la bdd: '.$e->getMessage().'</p>';
    include('views/footer.php');
    die();
}




