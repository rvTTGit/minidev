<?php
//chargement du model
include('init_admin.php');
// variable pour le menu de navigation
$page_category = "users";
include('security.php');

// récupération de nombre de news par utilisateur
$tab_news = $oArticles->countNews();

//control
$message = '';
$erreur = '';
// on initialise la tableau d'erreur du formulaire comme vide
$erreurs_champs_form = [];

//préparation de l'url de redirection vers la liste
if($_GET['action'] != 'list')
	$url_redirect = str_replace($_GET['action'], 'list', $_SERVER['REDIRECT_URL']);


//gestion du paramètre $_GET['id'] afin de charger le bon utilisateur à traiter
// ou de générer un message d'erreur
if(in_array($_GET['action'], ['del','mod'])){
	if(isset($_GET['id'])){
		// si l'url a été modifiée...
	    if(is_numeric($_GET['id'])){
	        // on charge l'objet grace à la méthode "get"
	        $oUser->get($_GET['id']);
	        //bidouillage de l'id dans l'url ...
	        if(!$oUser->fields){
			    $message = 'L\' utilisateur n\'existe pas !';	            
	        }		        
	    }
	    else{
	    	//pas un nombre
	        $message = 'Identifiant invalide!';
	    }
	}
	else{
		//pas d'id...
	    $message = "Veuillez choisir un compte.";
	}
	
	if($message !=''){
	    $_SESSION['message'] = "<b>(';..;')</b><br/>Merci de ne pas modifier l'url!! <br/>". $message;
	    header("Location: $url_redirect");
	    die();					
	}
}

// chargement de la vue en fonction de l action reçue
switch ($_GET['action']) {
	/*---------------------------------------------------------------------*/
	case 'add':
		$action_txt = 'Créer';
		// définition des règles à appliquer sur les différents champs du formulaire posté
		$regles = [
		    'nom' => [
		                'required' => true,
		                'max' => 255,
		                'function' => 'is_unique_user'
		            ],
		    'password' => [
		                'required' => true,
		                'min' => 3
		    ],
		    'password_confirm' => [
		                'required' => true,
		                'min' => 3
		    ],
           'droit' => ['required' => true, 'max' => 50]

		];
		// on pré remplit le tableau valeurs_tableau_form avec les clef du tableau de règle
		$valeurs_tableau_form = [];
		foreach ($regles as $key => $value) {
		    $valeurs_tableau_form[$key] = '';
		}
		//traitement du retour du formulaire
		if(count($_POST)) {
		    $form_validation = validate_form($_POST, $regles);
		    $erreur = $form_validation['erreur'];
		    $erreurs_champs_form = $form_validation['erreurs_champs'];
		    $valeurs_tableau_form = $form_validation['valeurs_nettoyees'];

		    if($_POST['password'] != $_POST['password_confirm']){
		        $erreur .= "</br>Le mot de passe doit être identique!";
		    }
	        // si nous n'avons pas d'erreur, on peut tenter l'enregistrement
		    if($erreur == ''){
		        // il va falloir retirer la clef 'password_confirm'
		        unset($valeurs_tableau_form['password_confirm']);

		        // on inserre les donnée dans l'objet user
		        foreach ($valeurs_tableau_form as $key => $value) {
		            $oUser->fields[$key] = $value;
		        }
		        
		        $insert = $oUser->save();
		        if(!$insert){
		            $erreur = 'Erreur lors de l\'insertion en bdd.';
		        }
		        else{
		            $message = 'Le compte "'.$oUser->fields['nom'].'" a bien été créé, il porte l\'id : ' . $oUser->fields['id'];
		        }
		    }
		}
		break;
	/*---------------------------------------------------------------------*/
	case 'mod':
		$action_txt = 'Modifier';
		// définition des règles à appliquer sur les différents champs du formulaire posté
		$regles = [
		    'nom' => [
		                'required' => true,
		                'max' => 255,
		                'function' => 'is_unique_user'
		            ],
		    'droit' => ['required' => true, 'max' => 50]
		            /*,
		    'password' => [
		                'required' => true,
		                'min' => 3
		    ],
		    'password_confirm' => [
		                'required' => true,
		                'min' => 3
		    ]*/
		];
		// on pré remplit le tableau valeurs_tableau_form avec les clef du tableau de règle
		$valeurs_tableau_form = [];
		foreach ($regles as $key => $value) {
		    $valeurs_tableau_form[$key] = $oUser->fields[$key];
		}
		// ajout des clef pour les passwords
		$valeurs_tableau_form['password'] = '';
		$valeurs_tableau_form['password_confirm'] = '';
		//traitement du retour du formulaire
		if(count($_POST)) {
		    $form_validation = validate_form($_POST, $regles);
		    $erreur = $form_validation['erreur'];
		    $erreurs_champs_form = $form_validation['erreurs_champs'];
		    $valeurs_tableau_form = $form_validation['valeurs_nettoyees'];

		    if($_POST['password'] != $_POST['password_confirm']){
		        $erreur .= "</br>Le mot de passe doit être identique!";
		    }

		    // si nous n'avons pas d'erreur, on peut tenter l'enregistrement
		    if($erreur == ''){
		        // si les clef "new_password" et "new_password_confirm" sont vides, 
		        // c'est qu'il ne faut pas mettre le champ password à jour en bdd
		        if($_POST['password'] == '' && $_POST['password_confirm'] == ''){
		            // on supprime la valeur de la clef "password" dans l'objet pour
		            // qu'elle ne soit pas prise en compte dans la méthode save qui déclenche l'update
		            $oUser->fields['password'] = '';
		        }
		        else{
		            $valeurs_tableau_form['password'] = $_POST['password'];
		        }

		        // on met à jour les données dans l'objet user
		        foreach ($valeurs_tableau_form as $key => $value) {
		            if($value != '')
		                $oUser->fields[$key] = $value;
		        }
		        
		        $update = $oUser->save();
		        if(!$update){
		            $erreur = 'Erreur lors de la mise à jour en bdd.';
		        }
		        else{
		            $message = 'Le compte '.$oUser->fields['id'].' a bien été mis à jour.' ;
		        }
		    }
		}
		break;
	/*---------------------------------------------------------------------*/
	case 'del':
		$action_txt = 'Supprimer';

		//traitement du retour du formulaire
		if(count($_POST) > 0){
			if($oUser->fields['id'] != 1)
		    	$suppression = $oUser->delete();
		    else
		    	$suppression = false;

		    if(!$suppression){
		        $erreur = "Problème lors de la suppression de l'utilisateur &laquo;";
		        $erreur .= $oUser->fields['nom'] ." &raquo; ( id: " . $oUser->fields['id'] .");"; 
		    }
		    else{
		        $message = "L'utilisateur &laquo;".$oUser->fields['nom'] ." &raquo";
		        $message .= " a correctement été supprimée ( id: " . $oUser->fields['id'] .")"; 
		    }
		}
		break;
	
	/*---------------------------------------------------------------------*/
	case 'list':
		// chargement de la liste des utilisateurs
		$liste_users = $oUser->getListAll();
		break;	
	/*---------------------------------------------------------------------*/
	case 'logs':
		// chargement de la liste des logs utilisateurs
		$list_logs = $oLogs->getListAll();
	    // reformatage de la date
	    foreach($list_logs as $id => $log_item){
	        $date = new DateTime($log_item['date']);
	        // formatage de la date
	        $list_logs[$id]['date'] = $date->format("d-m-Y à H:i:s");
	    }
		break;
	/*---------------------------------------------------------------------*/
	default:
		break;
}


//log
if(count($_POST) > 0)
	$oLogs->logAction($_GET['action']." ".$page_category.": ".$message);

//chargement de la vue
// if($_GET['action'] != 'list'){
if(in_array($_GET['action'], ['add', 'mod', 'del'])){
	// le formulaire d'action a été validé et sans erreur
	// redirection vers le liste pour affichage de la confirmation de l'action
	if( ($message != '') && !empty($_POST) ){
	    $_SESSION['message'] = $message;
	    header("Location: $url_redirect");
	    die();
	}
	else{
		include('views/users_action.phtml');
	}
}
else{
	if($_GET['action'] == 'logs')
    	include('views/logs_list.phtml');
    else
    	include('views/users_list.phtml');
}			