<?php
//chargement du model
include('init_admin.php');
// variable pour le menu de navigation
$page_category = "tarifs";
include('security.php');

//control
$message = '';
$erreur = '';
// on initialise la tableau d'erreur du formulaire comme vide
$erreurs_champs_form = [];
$valeurs_tableau_form = [];
// définition des règles à appliquer sur les champs des formulaires add/mod
$regles_tarifs = [
    'prestation' => [
                'required' => true,
                'max' => 255
            ],
    'prix' => [
                'required' => true,
                'min' => 1
    ],
    'type' => [
                'required' => true,
                'min' => 1
    ]
];

$regles_type_tarifs = [
    'nom' => [
                'required' => true,
                'max' => 255
            ]
];

$array_list = ['list', 'listtype'];
//gestion du paramètre $_GET['id'] afin de charger la bonne option à traiter
// ou de générer un message d'erreur
if(in_array($_GET['action'], ['del','mod','deltype','modtype'])){
	if(isset($_GET['id'])){
		// si l'url a été modifiée...
	    if(is_numeric($_GET['id'])){
	        // on charge l'objet grace à la méthode "get"
	        if(in_array($_GET['action'], ['del','mod'])){
	        	$oTarifs->get($_GET['id']);
	        	//bidouillage de l'id dans l'url ...
	        	if(!$oTarifs->fields){
				    $message = 'L\'entrée n\'existe pas !';	            
	        	}		        
	        }
	        //type de tarifs
	        else{
	        	$oTypeTarifs->get($_GET['id']);
	        	//bidouillage de l'id dans l'url ...
	        	if(!$oTypeTarifs->fields){
				    $message = 'L\'entrée n\'existe pas !';	            
	        	}		        
	        }
	    }
	    else{
	    	//pas un nombre
	        $message = 'Identifiant invalide!';
	    }
	}
	else{
		//pas d'id...
	    $message = "Veuillez choisir un élément de la liste.";
	}
	
	if($message !=''){
	    $_SESSION['message'] = "<b>(';..;')</b><br/>Merci de ne pas modifier l'url!! <br/>". $message;
	    header("Location: $url_redirect");
	    die();					
	}
}

// chargement des variables pour le template
switch ($_GET['action']) {
	/* ---------------------------- TARIFS ---------------------------- */
	/*---------------------------------------------------------------------*/
	case 'add':
		$action_txt = 'Créer';
		// on pré remplit le tableau valeurs_tableau_form avec les clef du tableau de règle
		foreach ($regles_tarifs as $key => $value) {
		    $valeurs_tableau_form[$key] = '';
		}

		break;
	/*---------------------------------------------------------------------*/
	case 'mod':
		$action_txt = 'Modifier';
		foreach ($regles_tarifs as $key => $value) {
		    $valeurs_tableau_form[$key] = $oTarifs->fields[$key];
		}
		break;
	/*---------------------------------------------------------------------*/
	case 'del':
		$action_txt = 'Supprimer';
		break;
	
	/*---------------------------------------------------------------------*/
	case 'list':
		// chargement de la liste des tarifs
		$list_tarifs = $oTarifs->getListAll();
		break;
	/* ---------------------------- TYPE TARIFS ---------------------------- */
	case 'addtype':
		$action_txt = 'Créer';
		// on pré remplit le tableau valeurs_tableau_form avec les clef du tableau de règle
		foreach ($regles_type_tarifs as $key => $value) {
		    $valeurs_tableau_form[$key] = '';
		}

		break;
	/*---------------------------------------------------------------------*/
	case 'modtype':
		$action_txt = 'Modifier';
		foreach ($regles_type_tarifs as $key => $value) {
		    $valeurs_tableau_form[$key] = $oTypeTarifs->fields[$key];
		}
		break;
	/*---------------------------------------------------------------------*/
	case 'deltype':
		$action_txt = 'Supprimer';
		break;
	
	/*---------------------------------------------------------------------*/
	case 'listtype':
		// chargement de la liste des types de tarifs
		$list_tarifs = $oTypeTarifs->getListAll();
		break;
	/*---------------------------------------------------------------------*/
	default:
		break;
}

//préparation de l'url de redirection vers la liste
if(!in_array($_GET['action'],$array_list))
	$url_redirect = str_replace($_GET['action'], 'list', $_SERVER['REDIRECT_URL']);

//traitement des retour de formulaires POST
if(count($_POST)) {
	// suppression
	switch ($_GET['action']) {
		/*---------------------------------------------------------------------*/
		case 'add':
		case 'mod':
			//traitement du retour du formulaire
			if(count($_POST)) {
			    $form_validation = validate_form($_POST, $regles_tarifs);
			    $erreur = $form_validation['erreur'];
			    $erreurs_champs_form = $form_validation['erreurs_champs'];
			    $valeurs_tableau_form = $form_validation['valeurs_nettoyees'];

			    // si nous n'avons pas d'erreur, on peut tenter l'enregistrement
			    if($erreur == ''){
			        // on inserre les donnée dans l'objet
			        foreach ($valeurs_tableau_form as $key => $value) {
			            $oTarifs->fields[$key] = $value;
			        }
			        
			        $insert = $oTarifs->save();
			        if(!$insert){
			            $erreur = 'Erreur lors de l\'insertion en bdd.';
			        }
			        else{
			            $message = 'Le tarif '.$oTarifs->fields['prestation'] .' a bien été créée, il porte l\'id : ' . $oTarifs->fields['id'];
			        }
			    }
			}
			break;
		case 'addtype':
		case 'modtype':
			//traitement du retour du formulaire
			if(count($_POST)) {
			    $form_validation = validate_form($_POST, $regles_type_tarifs);
			    $erreur = $form_validation['erreur'];
			    $erreurs_champs_form = $form_validation['erreurs_champs'];
			    $valeurs_tableau_form = $form_validation['valeurs_nettoyees'];

			    // si nous n'avons pas d'erreur, on peut tenter l'enregistrement
			    if($erreur == ''){
			        // on inserre les donnée dans l'objet
			        foreach ($valeurs_tableau_form as $key => $value) {
			            $oTypeTarifs->fields[$key] = $value;
			        }
			        
			        $insert = $oTypeTarifs->save();
			        if(!$insert){
			            $erreur = 'Erreur lors de l\'insertion en bdd.';
			        }
			        else{
			            $message = 'Le groupe de tarifs '.$oTypeTarifs->fields['nom'] .' a bien été créée, il porte l\'id : ' . $oTypeTarifs->fields['id'];
			        }
			    }
			}
			break;
		/*---------------------------------------------------------------------*/
		case 'deltype':
			//traitement du retour du formulaire
			if(count($_POST) > 0){
			    $suppression = $oTypeTarifs->delete();

			    if(!$suppression){
			        $erreur = "Problème lors de la suppression du groupe de tarifs &laquo;";
			        $erreur .= $oTypeTarifs->fields['nom'] ." &raquo; ( id: " . $oTypeTarifs->fields['id'] .");"; 
			    }
			    else{
			        $message = "Le groupe de tarifs &laquo;".$oTypeTarifs->fields['nom'] ." &raquo";
			        $message .= " a correctement été supprimée ( id: " . $oTypeTarifs->fields['id'] .")"; 
			    }
			}
			break;			
		/*---------------------------------------------------------------------*/
		case 'del':
			//traitement du retour du formulaire
			if(count($_POST) > 0){
			    $suppression = $oTarifs->delete();

			    if(!$suppression){
			        $erreur = "Problème lors de la suppression du tarif &laquo;";
			        $erreur .= $oTarifs->fields['prestation'] ." &raquo; ( id: " . $oTarifs->fields['id'] .");"; 
			    }
			    else{
			        $message = "Le tarif &laquo;".$oTarifs->fields['prestation'] ." &raquo";
			        $message .= " a correctement été supprimée ( id: " . $oTarifs->fields['id'] .")"; 
			    }
			}
			break;
		/*---------------------------------------------------------------------*/
		default:
			break;
	}
	//log
	$oLogs->logAction($_GET['action']." ".$page_category.": ".$message);	
}

//chargement de la vue
// if($_GET['action'] != 'list'){
if(!in_array($_GET['action'],$array_list)){
	// le formulaire d'action a été validé et sans erreur
	// redirection vers le liste pour affichage de la confirmation de l'action
	if( ($message != '') && !empty($_POST) ){
	    $_SESSION['message'] = $message;
	    header("Location: $url_redirect");
	    die();
	}
	else
		// on vérifie que l'utilisateur courant est autorisé à venir là
		if($_SESSION['droit'] > 2){
		    $_SESSION['message'] = 'Vous n\'êtes pas autorisé à accéder à cette page.';
		    header("Location: $url_redirect");
		    die();
		}
		else
			include('views/tarifs_action.phtml');
}
else{
    include('views/tarifs_list.phtml');
}			