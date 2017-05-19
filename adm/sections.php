<?php
//chargement du model
include('init_admin.php');
// variable pour le menu de navigation
$page_category = "sections";
include('security.php');

// récupération de nombre de news par sections
$tab_news = $oArticles->countSections();

//control
$message = '';
$erreur = '';
// on initialise la tableau d'erreur du formulaire comme vide
$erreurs_champs_form = [];
$valeurs_tableau_form = [];
// définition des règles à appliquer sur les champs des formulaires add/mod
$regles = [
           'nom' => ['required' => true, 'max' => 50, 'function' => 'is_unique_titre'],
           'tag' => ['required' => true, 'max' => 50, 'function' => 'is_unique_titre'],
           'auteur' => ['required' => true, 'max' => 50],
           'meta-description' => ['required' => false, 'max' => 255],
           'meta-keywords' => ['required' => false, 'max' => 255],
           'texte' => ['required' => false, 'max' => 255],
           'menu' => ['required' => false, 'max' => 10],
           'position' => ['required' => false, 'min' => 1],
           'delete' => ['required' => true, 'max' => 1],
           'modify' => ['required' => true, 'max' => 1],
           'hasItem' => ['required' => false, 'max' => 10],
           'inScreen2' => ['required' => false, 'max' => 10],
           'inScreen3' => ['required' => false, 'max' => 10],
           'image' => ['uploaded' => false, 'function' => 'is_image']
          ];

//préparation de l'url de redirection vers la liste
if($_GET['action'] != 'list')
	$url_redirect = str_replace($_GET['action'], 'list', $_SERVER['REDIRECT_URL']);
//gestion du paramètre $_GET['id'] afin de charger la bonne option à traiter
// ou de générer un message d'erreur
if(in_array($_GET['action'], ['del','mod'])){
	if(isset($_GET['id'])){
		// si l'url a été modifiée...
	    if(is_numeric($_GET['id'])){
	        // on charge l'objet grace à la méthode "get"
	        $oSections->get($_GET['id']);
	        //bidouillage de l'id dans l'url ...
	        if(!$oSections->fields){
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
		    if($key='position')
		    	$valeurs_tableau_form[$key] = 20;//max 127
		}

		break;
	/*---------------------------------------------------------------------*/
	case 'mod':
		$action_txt = 'Modifier';
		foreach ($regles as $key => $value) {
		    $valeurs_tableau_form[$key] = $oSections->fields[$key];
		}
		break;
	/*---------------------------------------------------------------------*/
	case 'del':
		$action_txt = 'Supprimer';
		break;
	
	/*---------------------------------------------------------------------*/
	case 'list':
		// chargement de la liste des utilisateurs
		$list_sections = $oSections->getListAll();
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
			if(count($_POST)) {
			    $form_validation = validate_form(array_merge($_POST, $_FILES), $regles);
			    $erreur = $form_validation['erreur'];
			    $erreurs_champs_form = $form_validation['erreurs_champs'];
			    $valeurs_tableau_form = $form_validation['valeurs_nettoyees'];

			    // si nous n'avons pas d'erreur, on peut tenter l'enregistrement
			    if($erreur == ''){
			        if($valeurs_tableau_form['image']['name'] == '') {
			            $nom_fichier = null;
			        } else {
			            if(file_exists('../img/'.$news_item['image'])) {
			                //suppression de l'ancien fichier image
			                // unlink('../img/'.$news_item['image']);
			            }
			            $nom_fichier = create_thumbnail($valeurs_tableau_form['image']);
			            // modification du tableau pour l'objet $oSections avant update
			            $valeurs_tableau_form['image'] = $nom_fichier;
			        }

			        // on inserre les donnée dans l'objet
			        foreach ($valeurs_tableau_form as $key => $value) {
			            $oSections->fields[$key] = $value;
			        }
			        
			        $insert = $oSections->save();
			        if(!$insert){
			            $erreur = 'Erreur lors de l\'envoi en bdd.';
			        }
			        else{
			            $message = 'La section "'.$oSections->fields['nom'] .'" est bien en bdd, elle porte l\'id : ' . $oSections->fields['id'];
			        }
			    }
			}
			break;
		/*---------------------------------------------------------------------*/
		case 'del':
			//traitement du retour du formulaire
			if(count($_POST) > 0){
			    $suppression = $oSections->delete();

			    if(!$suppression){
			        $erreur = "Problème lors de la suppression de la section &laquo;";
			        $erreur .= $oSections->fields['tag'] ." &raquo; ( id: " . $oSections->fields['id'] .");"; 
			    }
			    else{
			        $message = "La section &laquo;".$oSections->fields['tag'] ." &raquo";
			        $message .= " a correctement été supprimée ( id: " . $oSections->fields['id'] .")"; 
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
			include('views/sections_action.phtml');
}
else{
    include('views/sections_list.phtml');
}			