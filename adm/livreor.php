<?php
//chargement du model
include('init_admin.php');

// variable pour le menu de navigation
$page_category = "livreor";
include('security.php');


//control
$message = '';
$erreur = '';


//gestion du paramètre $_GET['id'] afin de charger la bonne option à traiter
// ou de générer un message d'erreur
if(in_array($_GET['action'], ['del','mod'])){
	if(isset($_GET['id'])){
		// si l'url a été modifiée...
	    if(is_numeric($_GET['id'])){
	        // on charge l'objet grace à la méthode "get"
	        $oMessages->get($_GET['id']);
	        //bidouillage de l'id dans l'url ...
	        if(!$oMessages->fields){
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
	    $message = "Veuillez choisir un message.";
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
	case 'del':
		$action_txt = 'Supprimer';
		break;
	/*---------------------------------------------------------------------*/
	case 'mod':
		$action_txt = 'Modifier';
		$regles = ['text' => ['required' => true, 'min' => 10],
		           'visible_livreor' => ['required' => true, 'max' => 1]
		          ];
		// on pré remplit le tableau valeurs_tableau_form avec les clef du tableau de règle
		foreach ($regles as $key => $value) {
		    $valeurs_tableau_form[$key] = $oMessages->fields[$key];
		}
		break;			
	/*---------------------------------------------------------------------*/
	case 'list':
		// chargement de la liste des messages
		$list_messages = $oMessages->getList('livreor');
		break;
	/*---------------------------------------------------------------------*/
	default:
		break;
}

//préparation de l'url de redirection vers la liste
if($_GET['action'] != 'list')
	$url_redirect = str_replace($_GET['action'], 'list', $_SERVER['REDIRECT_URL']);

//traitement des retour de formulaires POST
if(count($_POST)) {
	// suppression
	switch ($_GET['action']) {
		/*---------------------------------------------------------------------*/
		case 'del':
			//traitement du retour du formulaire
			if(count($_POST) > 0){
			    $suppression = $oMessages->delete();

			    if(!$suppression){
			        $erreur = "Problème lors de la suppression du message &laquo;";
			        $erreur .= $oMessages->fields['text'] ." &raquo; ( id: " . $oMessages->fields['id'] .");"; 
			    }
			    else{
			        $message = "Le message &laquo;".$oMessages->fields['text'] ." &raquo";
			        $message .= " a correctement été supprimé ( id: " . $oMessages->fields['id'] .")"; 
			    }
			}
			break;
		/*---------------------------------------------------------------------*/
		case 'mod':
			if(count($_POST)) {
			    $form_validation = validate_form($_POST, $regles);
			    $erreur = $form_validation['erreur'];
			    $erreurs_champs_form = $form_validation['erreurs_champs'];
			    $valeurs_tableau_form = $form_validation['valeurs_nettoyees'];

			    // si nous n'avons pas d'erreur, on peut tenter l'enregistrement
			    if($erreur == ''){
			    	// si il n y a pas eu de modification on simule l'update poue éviter la suuression inutile des valeurs 
			    	if(($oMessages->fields['text'] != $valeurs_tableau_form['text']) || ($oMessages->fields['visible_livreor'] != $valeurs_tableau_form['visible_livreor'])){
				    	//suppression des clefs dans fields inutiles pour l update
				    	// et chargée lors du get
				    	unset($oMessages->fields['date']);
				    	unset($oMessages->fields['contact']);
				    	unset($oMessages->fields['type']);
				    	unset($oMessages->fields['prenom']);
				    	unset($oMessages->fields['nom']);
				    	unset($oMessages->fields['mail']);

			            $oMessages->fields['text'] = $valeurs_tableau_form['text'];
			            $oMessages->fields['visible_livreor'] = $valeurs_tableau_form['visible_livreor'];

			            // on enregistre le message
			        	$insertMsg = $oMessages->save();
				        if(!$insertMsg){
				            $erreur = 'Erreur lors de l\'insertion en bdd.';
				        }
				        else{
				            if($oMessages->fields['visible_livreor'])
				            	$message = 'Message publié!';
				            else
				            	$message = 'Message masqué!';
				            	
				        }			        	
			    	}
			    	else{
			    		$message = 'Aucune mise à jour effectuée.';
			    	}
			    }
			}		
			break;
		/*---------------------------------------------------------------------*/
		default:
			break;
	}
	//log
	$oLogs->logAction($_GET['action']." ".$page_category.": ".$message." - id :".$oMessages->fields['id']);	
}

//chargement de la vue
if($_GET['action'] != 'list'){
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
			include('views/livreor_action.phtml');
}
else{
    include('views/livreor_list.phtml');
}			