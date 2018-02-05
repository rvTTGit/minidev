<?php 
//chargement du modele
include('script/init.php');

//controleur général du front office du site

// => vérification des infos reçus en $_GET
//récupération du slug de la section renvoyé par le htaccess
$nav_en_cours = (isset($_GET['section']) ? $_GET['section'] : 'home');

// récupération de la page pour le menu de pagination
if(!isset($_GET['page']) || !is_numeric($_GET['page'])){
    $page_actuelle = 1;
}
else{
    $page_actuelle = $_GET['page'];
    if($page_actuelle < 1)
        $page_actuelle = 1;
}


try{
	// chargement du menu
	$menu = $oSections->getListMenu();
	//chargement des informations de la section
	$oSections->getByTag($nav_en_cours);
	// si on est pas dans le cas item, on charge tout
	if($nav_en_cours != 'item') {
		//chargement des tableaux
		// liste des derniers items de la section en cours pour le slider
		$newsSection = $oArticles->getLastNewsSection($nav_en_cours);
		// liste des items de la section en cours pour la pagination de la liste d'article
		if(isset($oSections->fields) && !empty($oSections->fields))
			$newsSectionPage = $oArticles->getNewsFromPageSection($page_actuelle,$oSections->fields['id']);
		// récupération de nombre de news par section
		$tabNombreNewsSection = $oArticles->countSections();
		// liste des sections dans les écrans de la home
		$tabSectionScreen2 = $oSections->getListScreen2();
		$tabSectionScreen3 = $oSections->getListScreen3();

		// chargement des message pour ecran_contact
		$tab_messages = $oMessages->getLastMessages(2);
		//récupération de la liste des modules
		$tab_modules = $oConfigs->getConfigModules();
	}

}
catch(PDOException $e){
    include('views/header.phtml');
    echo "<h1>Erreur</h1>";
    //mode débugage
    echo '<span style="color : red;">Problème de connexion : ' . $e->getMessage() . '</span></br>';
    var_dump($e->getTrace());
    include('views/footer.phtml');
    die();
}

//chargement de la vue

//si le fichier template existe, alors on le charge (verif cas 'item')
//c'est le cas pour contact / tarifs / home / 404 / livreor
$erreur = '';
if( file_exists('views/'.$nav_en_cours.'.phtml') ) {
	//cas particulier pour "item" qui sert à lire un artice
	if($nav_en_cours == 'item')
	{
		// on vérifie si on a bien une clef 'id' en GET
		if(isset($_GET['id'])){
		    // on vérifie qu'il s'agit bien d'un nombre
		    if(is_numeric($_GET['id'])){
		        // on tente de charger la news
		        $oArticles->get($_GET['id']);
		        // si on reçoit un false, il n'y a pas de news correspondant
		        if(empty($oArticles->fields)){
		            $erreur = 'L\'article '. $_GET['id'] . ' n\'existe pas!';
		        }
		        else{
		        	// on charge la section de la news
					$oSections->get($oArticles->fields['section']);
					$nav_en_cours = $oSections->fields['tag'];
		            // on reformate la date
		            $date = new DateTime($oArticles->fields['date']);
		            $oArticles->fields['date'] = $date->format('M j, Y');
		        }
		    }
		    else{
		        $erreur = 'Identifiant invalide: ' . $_GET['id'];
		    }
		}else{
		    $erreur = 'Veuillez choisir un article à consulter.';
		}

		// chargement des informations de la section 'home' en cas d erreur
		if($erreur != ''){
			$oSections->getByTag('home');
			$nav_en_cours = 'home';
		}
		// chargement de la vue
    	include 'views/item.phtml';
	}
	else{
		//gestion du livreor
		if($nav_en_cours == 'livreor'){
			// si le module n'est pas actif, on redirige vers la home
			if(!$tab_modules['livreor'])
				$nav_en_cours = 'home';
			//control
			$message = '';
			$erreur = '';
			// on initialise la tableau d'erreur du formulaire comme vide
			$erreurs_champs_form = [];
			$valeurs_tableau_form = [];			
			// définition des règles à appliquer sur les champs des formulaires add/mod
			$regles = ['nom' => ['required' => true, 'max' => 50],
			           'prenom' => ['required' => true, 'max' => 50],
			           'text' => ['required' => true, 'min' => 10],
			           'visible_livreor' => ['required' => true, 'max' => 1],
			           'mail' => ['email' => true]
			          ];
			// on pré remplit le tableau valeurs_tableau_form avec les clef du tableau de règle
			foreach ($regles as $key => $value) {
			    $valeurs_tableau_form[$key] = '';
			}

			if(count($_POST)) {
			    $form_validation = validate_form($_POST, $regles);
			    $erreur = $form_validation['erreur'];
			    $erreurs_champs_form = $form_validation['erreurs_champs'];
			    $valeurs_tableau_form = $form_validation['valeurs_nettoyees'];

			    // si nous n'avons pas d'erreur, on peut tenter l'enregistrement
			    if($erreur == ''){
			    	// insertion des données contact
			    	$oContacts->fields['nom'] = $valeurs_tableau_form['nom'];
			    	$oContacts->fields['prenom'] = $valeurs_tableau_form['prenom'];
			    	$oContacts->fields['mail'] = $valeurs_tableau_form['mail'];
			    	$oContacts->fields['type_contact'] = 'livreor';
			    	$insertContact = $oContacts->checkContact();
			        if(!$insertContact){
			            $erreur = 'Erreur lors de l\'insertion en bdd.';
			        }
			        else{
			            // on enregistre le message
			            $oMessages->fields['type_message'] = 'livreor';
			            $oMessages->fields['text'] = $valeurs_tableau_form['text'];
			            $oMessages->fields['contact'] = $oContacts->fields['id'];
			        	$insertMsg = $oMessages->save();
				        if(!$insertMsg){
				            $erreur = 'Erreur lors de l\'insertion en bdd.';
				        }
				        else{
				            $message = 'Message correctement envoyé, il sera publié dès sa vérification !';
				            // mise à jour de la liste des messages
				            // $tab_messages = $oMessages->getMessageFromPage($page_actuelle);
				        }			        	
			        }			    	
			    }
			}

			$tab_messages = $oMessages->getMessageFromPageType($page_actuelle,'livreor');
			if($oMessages->countMessages('livreor') > $config['news_par_page'])
				$menu_pagination = $oMessages->pagination_menu($page_actuelle,$oMessages->countMessages('livreor'));
		    else
		    	$menu_pagination = '';			
		}

		//formulaire de contact
		if($nav_en_cours == 'contact'){
			//control
			$message = '';
			$erreur = '';
			// on initialise la tableau d'erreur du formulaire comme vide
			$erreurs_champs_form = [];
			$valeurs_tableau_form = [];			
			// définition des règles à appliquer sur les champs des formulaires add/mod
			$regles = ['nom' => ['required' => true, 'max' => 50],
			           'prenom' => ['required' => true, 'max' => 50],
			           'text' => ['required' => true, 'min' => 10],
			           'mail' => ['email' => true]
			          ];
			// on pré remplit le tableau valeurs_tableau_form avec les clef du tableau de règle
			foreach ($regles as $key => $value) {
			    $valeurs_tableau_form[$key] = '';
			}

			if(count($_POST)) {
			    $form_validation = validate_form($_POST, $regles);
			    $erreur = $form_validation['erreur'];
			    $erreurs_champs_form = $form_validation['erreurs_champs'];
			    $valeurs_tableau_form = $form_validation['valeurs_nettoyees'];

			    // si nous n'avons pas d'erreur, on peut tenter l'enregistrement
			    if($erreur == ''){
			    	// insertion des données contact
			    	$oContacts->fields['nom'] = $valeurs_tableau_form['nom'];
			    	$oContacts->fields['prenom'] = $valeurs_tableau_form['prenom'];
			    	$oContacts->fields['mail'] = $valeurs_tableau_form['mail'];
			    	$oContacts->fields['type_contact'] = 'form_contact';
			    	$insertContact = $oContacts->checkContact();
			        if(!$insertContact){
			            $erreur = 'Erreur lors de l\'insertion en bdd.';
			        }
			        else{
			            // on enregistre le message
			            $oMessages->fields['type_message'] = 'form_contact';
			            $oMessages->fields['text'] = $valeurs_tableau_form['text'];
			            $oMessages->fields['contact'] = $oContacts->fields['id'];
			        	$insertMsg = $oMessages->save();
				        if(!$insertMsg){
				            $erreur = 'Erreur lors de l\'insertion en bdd.';
				        }
				        else{
				            $message = 'Message envoyé !';
				            // mise à jour de la liste des messages
				            // $tab_messages = $oMessages->getMessageFromPage($page_actuelle);
				        }			        	
			        }			    	
			    }

			    // envoi du mail sur $config['mail']
			    	// code à faire 
			    // envoi du mail au prospect
			    if(isset($_POST['sendmail'])){
			    	//code à faire
			    }

			}
		}
    	include 'views/'.$nav_en_cours.'.phtml';
	}
}
else {
	//pas de fichier template, donc c est une section dynamique:
	// verification qu'elle a bien été chargée et qu'elle peut recevoir des articles
	if(!empty($oSections->fields) && $oSections->fields['hasItem']){
		// verification des articles chargés
		if(!$newsSectionPage){
		    $erreur = 'Rien à lire içi pour le moment.';
		}
		else{
		    // reformatage de la date de la news pour l affichage dans la page html
		    foreach($newsSectionPage as $id => $news_item){
		        $date = new DateTime($news_item['date']);
		        // formatage de la date
		        $newsSectionPage[$id]['date'] = $date->format("d-m-Y à H:i:s");
		        // on coupe le texte afin de ne pas trop afficher de contenu
		        $newsSectionPage[$id]['texte'] = substr($newsSectionPage[$id]['texte'], 0, 50) . '...';
		    }
			// construction du menu de pagination
			if($tabNombreNewsSection[$oSections->fields['id']] > $config['news_par_page'])
		    	$menu_pagination = $oArticles->pagination_menu($page_actuelle,$tabNombreNewsSection[$oSections->fields['id']]);
		    else
		    	$menu_pagination = '';
		}
	    include 'views/section.phtml';
	}
	else{
		// chargement des informations de la section 'home' si pas de template
		// et si le slug n'est pas connu
		$oSections->getByTag('home');
		$nav_en_cours = 'home';
	    include 'views/home.phtml';
	}
}