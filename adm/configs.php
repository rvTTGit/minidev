<?php
//chargement du model
include('init_admin.php');

// variable pour le menu de navigation
$page_category = "configs";
include('security.php');


//control
$message = '';
$erreur = '';
// on initialise la tableau d'erreur du formulaire comme vide
$erreurs_champs_form = [];
$valeurs_tableau_form = [];
// définition des règles à appliquer sur les champs des formulaires add/mod
$regles = [
    'tag' => [
                'required' => true,
                'max' => 255
            ],
    'valeur' => [
                'required' => true,
                'min' => 1
    ],
    'type' => [
                'required' => true,
                'min' => 1
    ],
    'description' => [
                'required' => false
    ],
    'acces_client' => [
                'required' => false
    ]
];

//gestion du paramètre $_GET['id'] afin de charger la bonne option à traiter
// ou de générer un message d'erreur
if(in_array($_GET['action'], ['del','mod'])){
	if(isset($_GET['id'])){
		// si l'url a été modifiée...
	    if(is_numeric($_GET['id'])){
	        // on charge l'objet grace à la méthode "get"
	        $oConfigs->get($_GET['id']);
	        //bidouillage de l'id dans l'url ...
	        if(!$oConfigs->fields){
			    $message = 'L\'entrée n\'existe pas !';	            
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

// chargement des variables pour le template
switch ($_GET['action']) {
	/*---------------------------------------------------------------------*/
	case 'add':
		$action_txt = 'Créer';
		// on pré remplit le tableau valeurs_tableau_form avec les clef du tableau de règle
		foreach ($regles as $key => $value) {
		    $valeurs_tableau_form[$key] = '';
		}

		break;
	/*---------------------------------------------------------------------*/
	case 'mod':
		$action_txt = 'Modifier';
		foreach ($regles as $key => $value) {
		    $valeurs_tableau_form[$key] = $oConfigs->fields[$key];
		}
		break;
	/*---------------------------------------------------------------------*/
	case 'del':
		$action_txt = 'Supprimer';
		break;
	
	/*---------------------------------------------------------------------*/
	case 'modules':
		// chargement de la liste des modules
		$list_modules = $oConfigs->getListModules();
		break;	
	/*---------------------------------------------------------------------*/
	case 'list':
		// chargement de la liste des configuration en fonction des droits
		if($_SESSION['droit'] <=1){
			$type_config = isset($_GET['type'])?$_GET['type']:'';
			$list_configs = $oConfigs->getListAll($type_config);
		}
		else
			$list_configs = $oConfigs->getListClient();
		break;
	/*---------------------------------------------------------------------*/
	default:
		break;
}

//traitement des retour de formulaires POST
if(count($_POST)) {
	// suppression
	switch ($_GET['action']) {
		/*---------------------------------------------------------------------*/
		case 'add':
		case 'mod':
			//traitement du retour du formulaire
		    $form_validation = validate_form($_POST, $regles);
		    $erreur = $form_validation['erreur'];
		    $erreurs_champs_form = $form_validation['erreurs_champs'];
		    $valeurs_tableau_form = $form_validation['valeurs_nettoyees'];

		    // si nous n'avons pas d'erreur, on peut tenter l'enregistrement
		    if($erreur == ''){
		        // on inserre les donnée dans l'objet
		        foreach ($valeurs_tableau_form as $key => $value) {
		            $oConfigs->fields[$key] = $value;
		        }
		        
		        $insert = $oConfigs->save();
		        if(!$insert){
		            $erreur = 'Erreur lors de l\'insertion en bdd.';
		        }
		        else{
		            $message = 'L\'option '.$oConfigs->fields['tag'] .' a bien été enregistrée, valeur : ' . $oConfigs->fields['valeur'];
		        }
		    }
			break;
		/*---------------------------------------------------------------------*/
		case 'del':
			//traitement du retour du formulaire
		    $suppression = $oConfigs->delete();

		    if(!$suppression){
		        $erreur = "Problème lors de la suppression de l'option &laquo;";
		        $erreur .= $oConfigs->fields['tag'] ." &raquo; ( id: " . $oConfigs->fields['id'] .");"; 
		    }
		    else{
		        $message = "L'option &laquo;".$oConfigs->fields['tag'] ." &raquo";
		        $message .= " a correctement été supprimée ( id: " . $oConfigs->fields['id'] .")"; 
		    }
			break;
		/*---------------------------------------------------------------------*/
		case 'modules':
			//traitement du retour du formulaire
			if(isset($_POST['module']))
				$tab = $_POST['module'];
			else
				$tab = [];

		    if(!$oConfigs->updateModule($tab)){
		        $erreur = "Problème lors de la mise à jour des modules...";
		    }
		    else{
		        $message = "Mise à jour effectuée : ". implode(', ', $_POST['module']);
		    }
		    // mise à jour de la liste
		    $list_modules = $oConfigs->getListModules();
			break;
		default:
			break;
	}
	//log
	$oLogs->logAction($_GET['action']." ".$page_category.": ".$message);	
}


//préparation de l'url de redirection vers la liste
if($_GET['action'] != 'list')
	$url_redirect = str_replace($_GET['action'], 'list', $_SERVER['REDIRECT_URL']);


//chargement de la vue
switch ($_GET['action']) {
	/*---------------------------------------------------------------------*/
	case 'add':
	case 'mod':
	case 'del':
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
			include('views/configs_action.phtml');
	break;
	
	/*---------------------------------------------------------------------*/
	case 'modules':
		if($_SESSION['droit'] == 1){
			include('views/modules_list.phtml');
		}
		else{
			include('views/index_admin.phtml');
		}
		break;	
	/*---------------------------------------------------------------------*/
	case 'list':
		include('views/configs_list.phtml');
		break;
	/*---------------------------------------------------------------------*/
	default:
		break;
}