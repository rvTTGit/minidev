<?php
class News extends Model{
    protected $table = '`news`';

    /**
    * Cette méthode retourne le nombre de news par section
    *
    * @return tableau contenant pour clef l'id de l auteur et en valeur son nombre de news
    */
    public function countSections(){
        $retour = [];
        $query = 'SELECT count(*) as nb_news, section FROM ' . $this->table . ' GROUP BY section';
        $this->query = $query;
        $query_result = $this->db->query($query);
        if(!$query_result){
            $error = $this->db->errorInfo();
            $error = $error[2];
            throw new PDOException('Erreur de requête : ' .$error. '</br>'.$query);
        }
        $values = $query_result->fetchAll();
        foreach ($values as $key => $news) {
            $retour[$news['section']] = $news['nb_news'];
        }
        $retour[0] = $this->countAll();
        
        return $retour;
    }

    /**
    * Cette méthode retourne le nombre de news par users
    *
    * @return tableau contenant pour clef l'id de l auteur et en valeur son nombre de news
    */
    public function countNews(){
        $retour = [];
        $query = 'SELECT count(*) as nb_news, auteur FROM ' . $this->table . ' GROUP BY auteur';
        $this->query = $query;
        $query_result = $this->db->query($query);
        if(!$query_result){
            $error = $this->db->errorInfo();
            $error = $error[2];
            throw new PDOException('Erreur de requête : ' .$error. '</br>'.$query);
        }
        $values = $query_result->fetchAll();
        foreach ($values as $key => $news) {
            $retour[$news['auteur']] = $news['nb_news'];
        }
        
        return $retour;
    }



    /**
    * Cette méthode renvoie les news les plus récentes de la table des news triées apr date décroissantes
    *
    * @return tableau contenant pour clef l'id de l auteur et en valeur son nombre de news
    */
    function getLastNews(){
        global $config;
        $retour = [];

        $query = 'SELECT * FROM news ORDER BY `date` DESC LIMIT '.$config['nombreNewsIndex'].'';
        $this->query = $query;

        $query_result = $this->db->query($query);
        if(!$query_result){
            $error = $this->db->errorInfo();
            $error = $error[2];
            throw new PDOException('Erreur de requête : ' .$error. '</br>'.$query);
        }
        $values = $query_result->fetchAll();
        if($values){
            $retour = $values;
        }
        
        return $retour;
    }

    /**
    * Cette méthode renvoie les news les plus récentes de la table des news triées apr date décroissantes
    *
    * @param string $section tag de la section propriétaire des news
    * @return tableau contenant pour clef l'id de l auteur et en valeur son nombre de news
    */
    function getLastNewsSection($section){
        global $config;
        $retour = [];
        $limit = $config['news_par_page'];

        $query = 'SELECT `news`.* FROM '. $this->table ;
        $query .= ' JOIN `sections` ON `news`.section = `sections`.id ';
        $query .= ' WHERE `sections`.tag='.$this->db->quote($section);
        $query .= ' AND `news`.visible=1';
        // pour la home, on ajoute les autres sections
        if($section == 'home'){
            $query .= ' OR `sections`.tag!='.$this->db->quote($section);
            $limit *= 2;
        }
        $query .= ' ORDER BY `news`.`date` DESC LIMIT '.$limit.'';
        
        $this->query = $query;

        $query_result = $this->db->query($query);
        if(!$query_result){
            $error = $this->db->errorInfo();
            $error = $error[2];
            throw new PDOException('Erreur de requête : ' .$error. '</br>'.$query);
        }
        $values = $query_result->fetchAll();
        if($values){
            $retour = $values;
        }
        
        return $retour;
    }


    /**
    * Cette fonction renvoie une liste de news correspondant à un numéro de page
    * triées pas date décroissante
    *
    * @param integer $page le numéro de la page souhaité
    * @param string $section la section courante
    * @return array|boolean un tableau de news paginées
    * chaque news est un tableau associatif contenant les clefs: 
    * id, titre, date, texte, auteur et image
    * si aucune news n'est pas trouvée, la fonction retourne 'false'
    */
    function getNewsFromPageSection($page,$section,$visible=1){
        global $config;
        $retour = [];       
        // definition de l offset
        $offset = ($page-1) * $config['news_par_page'];

        $query = 'SELECT news.*, sections.`nom` AS section, sections.`nom` AS tag , users.nom AS auteur, users.droit AS droit ';
        $query .= 'FROM news INNER JOIN users ON news.auteur = users.id ';
        $query .= 'JOIN `sections` ON `news`.section = `sections`.id ';
        // $query .= 'WHERE `news`.visible='.$this->db->quote($visible);        
        $query .= 'WHERE `news`.visible=1';        
        if($section > 0)
        // if($section!='all')
            // $query .= 'WHERE `sections`.tag='.$this->db->quote($section);        
            $query .= ' AND `sections`.id='.$this->db->quote($section);        

        $query .= ' ORDER BY date DESC LIMIT ' . $offset .', '. $config['news_par_page'];
        // echo "query:" . $query . "<br/>"; 
        $this->query = $query;
        $query_result = $this->db->query($query);
        if(!$query_result){
            $error = $this->db->errorInfo();
            $error = $error[2];
            throw new PDOException('Erreur de requête : ' .$error. '</br>'.$query);
        }        
        $values = $query_result->fetchAll();
        if($values){
            $retour = $values;
        }
        
        return $retour;
    }

    function getNewsFromPageSectionAdm($page,$section){
        global $config;
        $retour = [];       
        // definition de l offset
        $offset = ($page-1) * $config['news_par_page'];

        $query = 'SELECT news.*, sections.`nom` AS section, sections.`nom` AS tag , users.nom AS auteur, users.droit AS droit ';
        $query .= 'FROM news INNER JOIN users ON news.auteur = users.id ';
        $query .= 'JOIN `sections` ON `news`.section = `sections`.id ';
        // $query .= 'WHERE ';        
        if($section > 0)
        // if($section!='all')
            $query .= 'WHERE `sections`.id='.$this->db->quote($section);        
            // $query .= ' `sections`.id='.$this->db->quote($section);        

        $query .= ' ORDER BY date DESC LIMIT ' . $offset .', '. $config['news_par_page'];
        echo "query:" . $query . "<br/>"; 
        $this->query = $query;
        $query_result = $this->db->query($query);
        if(!$query_result){
            $error = $this->db->errorInfo();
            $error = $error[2];
            throw new PDOException('Erreur de requête : ' .$error. '</br>'.$query);
        }        
        $values = $query_result->fetchAll();
        if($values){
            $retour = $values;
        }
        
        return $retour;
    }    

    /**
    * Cette méthode re affecte les news à un nouvel utilisateur
    *
    * @param int $old identifiant du propriétaire actuel des news
    * @param int $new identifiant du nouveau propriétaire des news
    * @return tableau contenant pour clef l'id de l auteur et en valeur sont nombre de news
    */
    public function changeOwner($old, $new){

        $query = 'UPDATE ' . $this->table . ' SET auteur='.$this->db->quote($new).' WHERE auteur='.$this->db->quote($old);
        // echo $query;exit;
        $this->query = $query;
        $query_result = $this->db->exec($query);
        if($query_result === false){
            // $error = $this->db->errorInfo();
            // $error = $error[2];
            // throw new PDOException('Erreur de requête : ' .$error);
            return false;
        }
        else{
            return true;
        }
    }
    /**
    * Cette méthode re affecte les news à l'accueil lors de la suppression de la section
    *
    * @param int $old identifiant de la section actuelle des news
    * @param int $new identifiant de la nouvelle section des news
    * @return tableau contenant pour clef l'id de l auteur et en valeur sont nombre de news
    */
    public function changeSection($old, $new){

        $query = 'UPDATE ' . $this->table . ' SET section='.$this->db->quote($new).', visible=0 WHERE section='.$this->db->quote($old);
        // echo $query;exit;
        $this->query = $query;
        $query_result = $this->db->exec($query);
        if($query_result === false){
            // $error = $this->db->errorInfo();
            // $error = $error[2];
            // throw new PDOException('Erreur de requête : ' .$error);
            return false;
        }
        else{
            return true;
        }
    }

    /**
    * Cette fonction vérifie en base de donnée si il existe une news possèdant le titre passé en paramètre
    * il y a un index UNIQUE sur cette colonne dans la table des news.
    * Elle sera appellée lors de la création (il ne doit pas y avoir deja le titre à tester en bdd)
    *
    * Elle sera également appellée lors de l'édition d'une news, il faudra dans ce cas exclure la news 
    * qui est actuellement en cours de modificatin de la requete de selection
    * 
    * Afin de rendre un paramètre optionnel lors de la définition d'une fonction, 
    * il s'uffit de la déclarer avec une valeur par défaut, une chaine vide dans notre cas
    *
    * @param string $titre le titre dont il faut vérifier l'unicité
    * @param int $id optionnel id de la news en cours d'édition
    * @return bool|string true si $titre est unique, un message d’erreur sinon
    */
    public function isUniqueTitre($titre) {
        //requete de base qui va remonter l'id de la news qui possède le titre passé en paramètre
        $query = 'SELECT id FROM '.$this->table.' WHERE titre = '.$this->db->quote($titre);
        
        //si le paramètre optionnel a été renseigné lors de l'appel, on ajpoute une condition dans la clause WHERE
        if(isset($this->fields['id'])) {
            $query .= ' AND id != '.$this->db->quote($this->fields['id']);
        }
        $this->query = $query;

        //exécution de la requete et recupération du tableau contenant le retour si il y a, false sinon
        $doublon = $this->db->query($query)->fetch();

        //si le retour est 'false', c'est qu'il n y a aucune entrée dans la table news correspondant à ce titre
        if($doublon === false){
            // le titre est donc unique, la fonction renvoie 'true'     
            return true; 
        }
        return 'Ce titre existe déjà.';
    } 

    public function get($id){
        $query = 'SELECT `news`.*, `sections`.`nom` AS section_nom, `users`.nom AS auteur ';
        $query .= 'FROM ' . $this->table . ' JOIN `users` ON `news`.auteur = `users`.id ';
        $query .= 'INNER JOIN sections ON news.section = sections.id ';
        $query .= ' WHERE `news`.id=' . $this->db->quote($id);
        $this->query = $query;

        $query_result = $this->db->query($query);
        if(!$query_result){
            $error = $this->db->errorInfo();
            $error = $error[2];
            throw new PDOException('Erreur de requête : ' .$error);
        }
        $values = $query_result->fetch();

        if(!$values){
            // au choix, soit on lève une exception, 
            // soit on retourne false pour garder le comportement du controleur
            // trow new PDOException('Elément introuvable');
            return false;
        }

        // remplissage de l'attribut fields
        foreach ($values as $key => $value) {
             $this->fields[$key] = $value;
         } 
    }
}