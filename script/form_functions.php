<?php
/**
 * Cette fonction valide une donnée (typiquement soumise dans un
 * formulaire), et renvoie soit true, soit un message d’erreur, selon
 * une liste de règles (un tableau associatif dont les clés sont les
 * noms de règles, et les valeurs sont les éventuels paramètres de ces
 * règles).
 *
 * Règles possibles :
 *
 * - required : renverra true si la valeur n’est pas vide (l’argument
 *   importe peu)
 * - min : renverra true si le nombre de caractères de la valeur est
 *   supérieur ou égal à l’argument
 * - max : renverra true si le nombre de caractères de la valeur est
 *   inférieur ou égal à l’argument
 * - function : la fonction passée en argument sera appelée, avec la
 *   valeur en paramètre. Le retour de la fonction sera renvoyé (celui-ci
 *   doit donc être true ou un message d’erreur)
 *
 * @param string $value la valeur à tester
 * @param array $rules le tableau de règles (voir plus haut)
 * @return bool|string true si toutes les règles sont respectées, le
 * message d’erreur correspondant sinon
 */
function validate_form_data($value, $rules) {
    foreach($rules as $rule_name => $arg) {
        switch($rule_name) {

        case 'required':
            if($arg)
                if($value=='') return 'Cette valeur est requise.';
                // if(empty($value)) return 'Cette valeur est requise.';
                // if(empty($value)) return 'Cette valeur est requise.rule_name:'.$rule_name.' - arg:'.$arg.' - value:'.$value;
            break;

        case 'min':
            if(strlen($value) < $arg) return 'Cette valeur doit faire au moins '.$arg.' caractères.';
            break;

        case 'max':
            if(strlen($value) > $arg) return 'Cette valeur doit faire au maximum '.$arg.' caractères.';
            break;

        case 'function':
            if(is_array($arg)) {
                $function_name = $arg['name'];
                if(!function_exists($function_name)) return 'La fonction de validation '.$function_name.' n’existe pas.';
                return $function_name($value, $arg['args']);
            } else {
                if(!function_exists($arg)) return 'La fonction de validation '.$arg.' n’existe pas.';
                return $arg($value);
            }
            break;

        case 'email':
            if(!filter_var($value, FILTER_VALIDATE_EMAIL)) return 'Veuillez renseigner une adresse e-mail valide.';
            break;

        case 'uploaded':
            if($value['error'] != UPLOAD_ERR_OK) {
                switch($value['error']) {
                    case UPLOAD_ERR_INI_SIZE:
                    case UPLOAD_ERR_FORM_SIZE:
                        $message = 'Votre fichier est trop gros.';
                        break;
                    case UPLOAD_ERR_PARTIAL:
                        $message = 'Le fichier a été envoyé partiellement ; veuillez réessayer.';
                        break;
                    case UPLOAD_ERR_NO_FILE:
                        // si on fournit « false » à cette règle, on
                        // considère que cette erreur n’est pas grave.
                        if(!$arg) return true;
                        $message = 'Veuillez choisir un fichier.';
                        break;
                    default:
                        $message = 'Une erreur est survenue durant l’envoi du fichier (code '.$value['error'].').';
                        break;
                }
                return $message;
            }
            break;

        default:
            return 'Règle '.$rule_name.' introuvable.';
            break;
        }
    }
    return true;
}

/**
* Cette fonction permet de valider intégralement un formulaire,
* en appliquant une série de règles à chacun de ses champs.
* Elle prend en paramètres un tableau associatif, dont les clés sont les
* noms de champs et les valeurs sont les valeurs soumises (un tableau
* associatif dans le cas d’un upload de fichier). Un second paramètre
* définit les règles de validation à appliquer sur chacun des champs.
* Elle retourne trois valeurs : un éventuel message d’erreur principal,
* une liste de messages d’erreurs sous forme de tableau associatif dont
* les clés correspondent aux noms de champs, et enfin une liste de valeurs
* nettoyées correspondant au premier argument.
*
* @param array $values un tableau associatif, issu de $_POST ou autre (ou
* plusieurs sources fusionnées).
* @param array $rules un tableau associatif, dont les clés représentent
* les champs requis, et dont les valeurs sont des tableaux de règles tels
* qu’acceptés par la fonction validate_form_data.
* @return array un tableau associatif contenant 3 clés : 'erreur',
* 'erreurs_champs' et 'valeurs_nettoyees'.
*/
function validate_form($values, $rules) {
    $erreur = '';
    $erreurs_champs = [];
    // on préremplit $valeurs_nettoyees avec les clés de $rules
    $valeurs_nettoyees = [];
    foreach($rules as $cle => $null) {
        $valeurs_nettoyees[$cle] = '';
    }
    foreach($rules as $cle => $tab_regles) {
        // est-ce que ce champ a été soumis ?
        if(isset($values[$cle])) {
            if(is_array($values[$cle])) {
                $valeurs_nettoyees[$cle] = $values[$cle];
            } else {
                // il s'agit d'une valeur simple, on applique "htmlspecialchars"
                $valeurs_nettoyees[$cle] = htmlspecialchars($values[$cle]);
            }
            $statut = validate_form_data($valeurs_nettoyees[$cle], $tab_regles);
            if($statut !== true) {
                $erreur = 'Veuillez corriger les erreurs suivantes.';
                $erreurs_champs[$cle] = $statut;
            }
        } else {
            // $erreur = 'Erreur lors de l’envoi des champs. Veuillez réessayer';
            $erreur = 'Erreur lors de l’envoie de '.$cle.' des champs '.$values[$cle].'. Veuillez réessayer';
            break;
        }
    }
    return ['erreur' => $erreur,
            'erreurs_champs' => $erreurs_champs,
            'valeurs_nettoyees' => $valeurs_nettoyees];
}

/**
* Fonction appelant la méthode de vérification du Login pour l'objet $oUsers
* est utilisée par la fonction de vérification des données soumises dans le formualire
* de création et modification d'un utilisateur
*
* @param string $nom le nom dont il faut vérifier l'unicité
* @return bool|string true si $nom est unique, un message d’erreur sinon
*/
function is_unique_user($nom){
    global $oUser;
    return $oUser->isUniqueNom($nom);
}

/**
* Fonction appelant la méthode de vérification du titre pour l'objet $oArticles
* est utilisée par la fonction de vérification des données soumises dans le formualire
* de création et modification d'une news
*
* @param string $titre le titre dont il faut vérifier l'unicité
* @return bool|string true si $titre est unique, un message d’erreur sinon
*/
function is_unique_titre($titre){
    global $oArticles;
    return $oArticles->isUniqueTitre($titre);
}


/**
* Cette fonction vérifie si le fichier uploadé correspond bien à
* une image (en se basant sur son extension finale ET sur son contenu
*
* @param array $file le tableau associatif issu de $_FILES représentant
* le fichier
* @return bool|string renvoie true si le fichier est bien une image, un
* message d’erreur sinon
*/
function is_image($file) {
    // on extrait l'extension du fichier à vérifier
    $tab_fichier = explode('.', $file['name']);
    // array-pop permet de sortir la dernière valeur d un tableau, donc forcément l'extension
    $extention = '.' . array_pop($tab_fichier);
    // on passe l'extension en minuscule afin de la comparer aux valeurs du tableau des extensions acceptées
    $extention = strtolower($extention);

    $liste_extensions_autorisees = ['.jpg', '.jpeg', '.png', '.bmp'];
    if(!in_array($extention, $liste_extensions_autorisees)) {
        return 'Cette extension n’est pas autorisée (extensions permises : '.implode(', ', $liste_extensions_autorisees).')';
    }

    // on vérifie le contenu
    try {
        $image = new Imagick($file['tmp_name']);
    } catch(ImagickException $e) {
        return 'Le fichier n’est pas une image !';
    }

    return true;

}

/**
* Cette fonction renvoie un nom de fichier unique en lien avec celui
* fourni en paramètre, dans le dossier 'images'.
*
* @param string $nom le nom de fichier à tester
* @return string un nom de fichier n’existant pas dans le dossier
* @return string un nom de repertoire 
*/
function get_unique_filename($nom,$rep){
    if(file_exists('../img/'. $rep . '/' . $nom)){
        // microtime renvoie une ',' dans la valeur, on la remplace par rien
        $unique = str_replace('.', '', microtime(true));

        $nouveau_nom = $unique.$nom;
        // on retourne la concaténation de notre valeur unique et le nom du fichier
        return $nouveau_nom;
    }

    // si le nom est unique, on le retourne
    return $nom;
}

/**
 * Cette fonction enregistre une image uploadée dans son dossier définitif,
 * après l’avoir croppée et redimensionnée, en s’assurant que son nom
 * est unique.
 *
 * @param array $file le tableau associatif issu de $_FILES représentant
 * le fichier
 * @return string le nom définitif du fichier tel qu’enregistré
 */
function create_thumbnail($file) {
    global $config;
    $image = new Imagick($file['tmp_name']);
    $nom_fichier = get_unique_filename(htmlspecialchars($file['name']),'item');
    //stockage de l original
    $image->writeImage('../img/item/'.$nom_fichier);
    // création de la miniature
    // $image->cropThumbnailImage($config['taille_miniatures'][0],
    //                           $config['taille_miniatures'][1]);
    $image->resizeImage($config['taille_miniatures'][0],$config['taille_miniatures'][1],Imagick::FILTER_LANCZOS,1);    
    $image->writeImage('../img/thumb/'.$nom_fichier);
    $image->destroy();
    return $nom_fichier;
}


/**
 * Cette fonction enregistre une image uploadée dans son dossier définitif,
 * après l’avoir croppée et redimensionnée, en s’assurant que son nom
 * est unique.
 *
 * @param array $file le tableau associatif issu de $_FILES représentant
 * le fichier
 * @return string le nom définitif du fichier tel qu’enregistré
 */
function create_thumbnail_section($file) {
    global $config;
    $image = new Imagick($file['tmp_name']);
    $nom_fichier = get_unique_filename(htmlspecialchars($file['name']),'section');
    //stockage de l original
    $image->writeImage('../img/section/'.$nom_fichier);

    //modification de l'image => flou
    $image->blurImage(0,8);    
    $image->writeImage('../img/section/hover_'.$nom_fichier);


    // création de la miniature
    // $image->resizeImage($config['taille_miniatures'][0],$config['taille_miniatures'][1],Imagick::FILTER_LANCZOS,1);    
    // $image->writeImage('../img/thumb/'.$nom_fichier);
    $image->destroy();
    return $nom_fichier;
}