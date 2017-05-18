<?php
// chargement du model
include('init_admin.php');

$oLogs = new Logs();
$oLogs->logAction("logout");
session_destroy();

// on redirige vers l'index qui redirigera vers la page de login
header('Location: index.php');

