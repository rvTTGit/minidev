<?php
// on vérifie si on a la clef "connected" et si elle ne contient pas 'false'
if(!isset($_SESSION['connected']) || !$_SESSION['connected']){
	// var_dump(basename($_SERVER['SCRIPT_NAME']));exit;
	// var_dump(str_replace(basename($_SERVER['SCRIPT_NAME']), '', $_SERVER['SCRIPT_NAME']));exit;

    // si il n'y a pas cette clef ou si elle contient false, on redirige vers la page de login
	$url_redirect = str_replace(basename($_SERVER['SCRIPT_NAME']), 'login.php', $_SERVER['SCRIPT_NAME']);
    header('Location: '. $url_redirect);

    die();
}

//récupération de la liste des modules actifs
$tab_modules = $oConfigs->getConfigModules();

// mis à part la page d'accueil et la gestion des article
// on vérifie que l'utilisateur courant est autorisé à voir les modules
if(!in_array($page_category, ["news", "home"])){
	// echo "b";exit;
	// var_dump($_SESSION['droit']);
	// var_dump($tab_modules[$page_category]);
	// var_dump(($_SESSION['droit'] > 2 && $tab_modules[$page_category]));
	// exit;
	if($_SESSION['droit'] > 2){
	    $_SESSION['message'] = 'Vous n\'êtes pas autorisé à accéder à cette page.';
		// $url_redirect = $_SERVER['HTTP_REFERER'];
		// var_dump($_SERVER);
		$url_redirect = str_replace(basename($_SERVER['SCRIPT_NAME']), 'index.php', $_SERVER['SCRIPT_NAME']);		
	    header("Location: $url_redirect");
	    die();
	}

	if(!$tab_modules[$page_category] && $_SESSION['droit'] > 1){
	    $_SESSION['message'] = 'Vous n\'êtes pas autorisé à accéder à cette page.';
		$url_redirect = str_replace(basename($_SERVER['SCRIPT_NAME']), 'index.php', $_SERVER['SCRIPT_NAME']);
		// var_dump($url_redirect);exit;
	    header("Location: $url_redirect");
	    die();
	}

}

//test si le module est actif, sinon redirection vers l'index
// if(!$tab_modules[$page_category]){

// }