<?php
//chargement du model
include('init_admin.php');
// variable pour le menu de navigation
$page_category = "news";
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

// si filtre sur les sections
if( isset($_POST['section']) ){
    $_SESSION['filter_section_id'] = $_POST['section'];
    // si un trie a été lancé, on reset $page_actuelle
    $page_actuelle = 1;
}
else{
    if(!isset($_SESSION['filter_section_id']))
        $_SESSION['filter_section_id'] = 0;
}

// récupération de nombre d'articles par sections
$tab_news = $oArticles->countSections();

//control
$message = '';
$erreur = '';
// on initialise la tableau d'erreur du formulaire comme vide
$erreurs_champs_form = [];
$valeurs_tableau_form = [];


         

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
	        $oArticles->get($_GET['id']);
            $article = $oArticles->fields;
            // protection de la page poue les utilisateurs non admin ou non propriétaire
            if($oArticles->fields['auteur'] != $_SESSION['login']  && $_SESSION['droit'] > 2){
              $message = 'Vous n\'êtes pas autorisé à supprimer cet article';
            }

	        //bidouillage de l'id dans l'url ...
	        if(!$oArticles->fields){
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
	    $message = "Veuillez choisir un article.";
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
		// définition des règles à appliquer sur les champs des formulaires add/mod
		$regles = ['titre' => ['required' => true, 'max' => 250, 'function' => 'is_unique_titre'],
		           'auteur' => ['required' => true, 'max' => 50],
		           'section' => ['required' => true, 'max' => 50],
		           'texte' => ['required' => true, 'min' => 10],
		           'image' => ['uploaded' => true, 'function' => 'is_image']
		          ];
		// on pré remplit le tableau valeurs_tableau_form avec les clef du tableau de règle
		foreach ($regles as $key => $value) {
		    $valeurs_tableau_form[$key] = '';
		}

		break;
	/*---------------------------------------------------------------------*/
	case 'mod':
		$action_txt = 'Modifier';
		$regles = ['titre' => ['required' => true, 'max' => 250, 'function' => 'is_unique_titre'],
		           'auteur' => ['required' => true, 'max' => 50],
		           'section' => ['required' => true, 'max' => 50],
		           'texte' => ['required' => true, 'min' => 10],
		           // mettre « false » à uploaded va vérifier l’upload, mais ne
		           // va pas provoquer d’erreur si aucun fichier n’est envoyé
		           'image' => ['uploaded' => false, 'function' => 'is_image']
		          ]; 
		foreach ($regles as $key => $value) {
		    $valeurs_tableau_form[$key] = $oArticles->fields[$key];
		}
		break;
	/*---------------------------------------------------------------------*/
	case 'del':
		$action_txt = 'Supprimer';
		break;
	
	/*---------------------------------------------------------------------*/
	case 'list':
		$tabNombreArticlesSection = $oArticles->countSections();
		$list_articles = $oArticles->getNewsFromPageSection($page_actuelle,$_SESSION['filter_section_id']);
	    // reformatage de la date de la news pour l affichage dans la page html
	    foreach($list_articles as $id => $article){
	        $date = new DateTime($article['date']);
	        // formatage de la date
	        $list_articles[$id]['date'] = $date->format("d-m-Y à H:i:s");
	    }
  	 	// on génère le menu
	    $menu_pagination = $oArticles->pagination_menu($page_actuelle,$tabNombreArticlesSection[$_SESSION['filter_section_id']]);		
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

			        // il va falloir retirer la clef 'section_nom' si elle existe
			        if(array_key_exists('section_nom', $oArticles->fields))
			        	unset($oArticles->fields['section_nom']);

			        // on inserre les donnée dans l'objet
			        foreach ($valeurs_tableau_form as $key => $value) {
			            $oArticles->fields[$key] = $value;
			        }
			        
			        $insert = $oArticles->save();
			        if(!$insert){
			            $erreur = 'Erreur lors de l\'envoi en bdd.';
			        }
			        else{
			            $message = 'L\'article "'.$oArticles->fields['titre'] .'" est bien en bdd, il porte l\'id : ' . $oArticles->fields['id'];
			        }
			    }
			}
			break;
		/*---------------------------------------------------------------------*/
		case 'del':
			//traitement du retour du formulaire
			if(count($_POST) > 0){
			    $suppression = $oArticles->delete();

			    if(!$suppression){
			        $erreur = "Problème lors de la suppression de l'article &laquo;";
			        $erreur .= $oArticles->fields['titre'] ." &raquo; ( id: " . $oArticles->fields['id'] .");"; 
			    }
			    else{
			        // la suppression est passée, il va falloir supprimer également l'image associée
			        if(file_exists("../img/".$oArticles->fields['image'])){
			            // on ne supprime pas les images qui ont été placées dans l insertion en masse
			            // if($oArticles->fields['image'] != "blog-2.jpg" && $oArticles->fields['image'] != "blog-1.jpg" ){
			                unlink("../img/".$oArticles->fields['image']);
			            // }
			        }
			        $message = "L'article &laquo;".$oArticles->fields['titre'] ." &raquo";
			        $message .= " a correctement été supprimé ( id: " . $oArticles->fields['id'] .")"; 
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
		include('views/articles_action.phtml');
}
else{
    include('views/articles_list.phtml');
}			