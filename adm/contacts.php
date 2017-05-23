<?php
//chargement du model
include('init_admin.php');
// variable pour le menu de navigation
$page_category = "contacts";
include('security.php');

//controleur => vérification de la page reçu en $_GET avant appel 
// de la fonction de récupération des news de la page correspondante
// et la construction du menu
// on vérifie si on a la page demandée en GET
if(!isset($_GET['page']) || !is_numeric($_GET['page'])){
    $page_actuelle = 1;
}
else{
    $page_actuelle = $_GET['page'];
    if($page_actuelle < 1)
        $page_actuelle = 1;
}

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
	        $oContacts->get($_GET['id']);
	        //bidouillage de l'id dans l'url ...
	        if(!$oContacts->fields){
			    $message = 'Le contact n\'existe pas !';	            
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
	//que pour contact type client, à faire plus tard
		$action_txt = 'Créer';
		/*
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
		            $oContacts->fields[$key] = $value;
		        }
		        
		        $insert = $oContacts->save();
		        if(!$insert){
		            $erreur = 'Erreur lors de l\'insertion en bdd.';
		        }
		        else{
		            $message = 'Le compte "'.$oContacts->fields['nom'].'" a bien été créé, il porte l\'id : ' . $oContacts->fields['id'];
		        }
		    }
		}
		*/
		break;
	/*---------------------------------------------------------------------*/
	case 'mod':
		$action_txt = 'Modifier';
		// définition des règles à appliquer sur les différents champs du formulaire posté

		$regles = [
			'nom' => ['required' => true, 'max' => 50],
			'prenom' => ['required' => true, 'max' => 255],
			'tel' => ['required' => false, 'max' => 255],
			'adresse' => ['required' => false, 'max' => 255],
			'cp' => ['required' => false, 'max' => 10],
			'ville' => ['required' => false, 'max' => 255],
			'note' => ['required' => false, 'max' => 255],
			'type_contact' => ['required' => true, 'min' => 5],
			'mail' => ['email' => true]
			];		
		// on pré remplit le tableau valeurs_tableau_form avec les clef du tableau de règle
		$valeurs_tableau_form = [];
		foreach ($regles as $key => $value) {
		    $valeurs_tableau_form[$key] = $oContacts->fields[$key];
		}

		//traitement du retour du formulaire
		if(count($_POST)) {
		    $form_validation = validate_form($_POST, $regles);
		    $erreur = $form_validation['erreur'];
		    $erreurs_champs_form = $form_validation['erreurs_champs'];
		    $valeurs_tableau_form = $form_validation['valeurs_nettoyees'];


		    // si nous n'avons pas d'erreur, on peut tenter l'enregistrement
		    if($erreur == ''){
		        // on met à jour les données dans l'objet contact
		        foreach ($valeurs_tableau_form as $key => $value) {
		            if($value != '')
		                $oContacts->fields[$key] = $value;
		        }
		        
		        $update = $oContacts->save();
		        if(!$update){
		            $erreur = 'Erreur lors de la mise à jour en bdd.';
		        }
		        else{
		            $message = 'Le contact '.$oContacts->fields['prenom'].' '.$oContacts->fields['nom'].' a bien été mis à jour.' ;
		        }
		    }
		}
		break;
	/*---------------------------------------------------------------------*/
	case 'del':
		$action_txt = 'Supprimer';
		/*
		//traitement du retour du formulaire
		if(count($_POST) > 0){
		    $suppression = $oContacts->delete();

		    if(!$suppression){
		        $erreur = "Problème lors de la suppression de l'utilisateur &laquo;";
		        $erreur .= $oContacts->fields['nom'] ." &raquo; ( id: " . $oContacts->fields['id'] .");"; 
		    }
		    else{
		        $message = "L'utilisateur &laquo;".$oContacts->fields['nom'] ." &raquo";
		        $message .= " a correctement été supprimée ( id: " . $oContacts->fields['id'] .")"; 
		    }
		}
		*/
		break;
	
	/*---------------------------------------------------------------------*/
	case 'list':
		// chargement de la liste des utilisateurs
		$liste_contacts = $oContacts->getListAll();
		break;	
	/*---------------------------------------------------------------------*/
	case 'messages':
		// chargement de la liste des messages issus du formulaire de contact
		$list_messages = $oMessages->getMessageFromPageType($page_actuelle,'form_contact');
		$list_messages = $oMessages->getList('form_contact');
		$menu_pagination = $oMessages->pagination_menu($page_actuelle,$oMessages->countMessages('form_contact'));

		/*
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
		include('views/contacts_action.phtml');
	}
}
else{
	if($_GET['action'] == 'messages')
    	include('views/contacts_messages_list.phtml');
    else
    	include('views/contacts_list.phtml');
}			