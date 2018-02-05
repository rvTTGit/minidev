<?php
// chargement du model
include('init_admin.php');
$page_category = "home";
include('security.php');

// variable pour le menu de navigation
$erreur = '';

// chargement de la vue
include('views/index_admin.phtml');