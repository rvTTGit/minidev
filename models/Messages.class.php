<?php
class Messages extends Model{
    protected $table = '`messages`';

    /**
    * Cette méthode renvoie les news les plus récentes de la table des news triées apr date décroissantes
    *
    * @return tableau contenant pour clef l'id de l auteur et en valeur son nombre de news
    */
    function getLastMessages($limit){
        global $config;
        $retour = [];

        $query = 'SELECT ' . $this->table . '.*, contacts.prenom FROM ' . $this->table . ' ';
        $query .= ' JOIN `contacts` ON ' . $this->table . '.contact = `contacts`.id ';
        $query .= ' ORDER BY `date` DESC LIMIT '.$limit.'';

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
    * Cette méthode retourne le nombre de message par type et visibilité
    *
    * @param string $type type des messages (livreor, form_contact)
    * @return tableau contenant pour clef l'id de l auteur et en valeur son nombre de news
    */
    public function countMessages($type,$visible=true){
        $retour = '';
        $query = 'SELECT count(*) as nb FROM ' . $this->table . ' WHERE type_message = '.$this->db->quote($type);
        if($type=='livreor')
            $query .= ' AND ' . $this->table . '.visible_livreor='.$this->db->quote($visible);
        $this->query = $query;
        $query_result = $this->db->query($query);
        if(!$query_result){
            $error = $this->db->errorInfo();
            $error = $error[2];
            throw new PDOException('Erreur de requête : ' .$error. '</br>'.$query);
        }
        $retour = $query_result->fetch();
        
        return $retour['nb'];
    }

    /**
    * Cette fonction renvoie une liste de message correspondant à un numéro de page
    * triées pas date décroissante
    *
    * @param integer $page le numéro de la page souhaité
    * @param string $type type d emessage à remonter
    * @return array|boolean un tableau de news paginées
    * chaque news est un tableau associatif contenant les clefs: 
    * id, titre, date, texte, auteur et image
    * si aucune news n'est pas trouvée, la fonction retourne 'false'
    */
    function getMessageFromPageType($page, $type){
        global $config;
        $retour = [];       
        // definition de l offset
        $offset = ($page-1) * $config['news_par_page'];

        $query = 'SELECT ' . $this->table . '.*, contacts.prenom FROM ' . $this->table . ' ';
        $query .= ' JOIN `contacts` ON ' . $this->table . '.contact = `contacts`.id ';
        $query .= ' WHERE ' . $this->table . '.type_message='.$this->db->quote($type); 
        if($type=='livreor')
            $query .= ' AND ' . $this->table . '.visible_livreor=1 ';
        $query .= ' ORDER BY `date` DESC LIMIT ' . $offset .', '. $config['news_par_page'];

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

    function getList($type){
        $retour = [];       

        $query = 'SELECT ' . $this->table . '.*, contacts.prenom, contacts.nom, contacts.mail FROM ' . $this->table . ' ';
        $query .= ' JOIN `contacts` ON ' . $this->table . '.contact = `contacts`.id ';
        $query .= ' WHERE ' . $this->table . '.type_message='.$this->db->quote($type); 
        $query .= ' ORDER BY `date` DESC';

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

    public function get($id){
        $query = 'SELECT ' . $this->table . '.*, contacts.prenom, contacts.nom, contacts.mail FROM ' . $this->table . ' ';
        $query .= ' JOIN `contacts` ON ' . $this->table . '.contact = `contacts`.id ';
        $query .= ' WHERE ' . $this->table . '.id=' . $this->db->quote($id);

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