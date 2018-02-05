<?php
/**
* Classe générique permetant de manipuler une entité issue d'une table
*/
abstract class Model{
    // http://php.net/manual/fr/language.oop5.visibility.php
    // L'accès aux éléments protégés est limité à la classe elle-même
    // ainsi qu'aux classes qui en héritent
    protected $db;
    protected $table = 'nom_de_la_table';
    protected $query = '';

    public $fields = [];

    public function __construct(){
        $this->db = Database::getInstance();
    }

    public function get($id){
        $query = 'SELECT * FROM ' . $this->table . ' WHERE id=' . $this->db->quote($id);
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

         // return $values;
    }

    /**
    * Cette fonction supprime une ligne identifiée par son ID en base de données
    *
    * @param int $id identifiant de la ligne à supprimer en bdd
    * @return boolean l'état de la suppression
    */
    public function delete(){
        $query = 'DELETE FROM '.$this->table.' WHERE ';
        $query .= 'id=' .$this->db->quote($this->fields['id']). ' LIMIT 1';
        $this->query = $query;
        $retour = $this->db->exec($query);

        // on conserve le comportement de la fonction initiale
        if(!$retour) return false;
        // OU
        // if(!$retour) throw new PDOException("Erreur durant la suppression");


        return $retour;
    }

    /**
    * Cette méthode permet de créer PU de metre à jour une entité en BDD
    */
    public function save(){
        // on vérifie dans un premier temps si 
        // nous sommes dans le cadre d'une mise à jour (une clef id est présente dnas l'attribut fields)
        // ou dans une création
        if(isset($this->fields['id'])){
            // il s'agit d'une mise à jour
            $query = 'UPDATE ' . $this->table . ' SET ';
            $datas = [];
            foreach ($this->fields as $key => $value) {
                // on remplace la date de la news par celle de la mise à jour
                if($key == 'date'){
                    $value = new DateTime();
                    $value = $value->format("Y-m-d H:i:s");
                }
                // remplissage du tableau $datas sans la clef 'id' 
                // et si il s'agit d'une chaine de caractère => dans le cas de la nom mise à jour de l image
                // on reçoit un tableau vide
                if($key != 'id' && is_string($value)){
                    $datas[] = '`'.$key.'`' . ' = ' . $this->db->quote($value);
                }
            }
            $query .= implode(', ', $datas) . ' WHERE id='.$this->db->quote($this->fields['id']);
            $this->query = $query;
            

            $status = $this->db->exec($query);
            if($status){
                // throw new PDOException('insertion: '.$query);
                return true;
            }
            else{
                // throw new PDOException('Erreur durant l\'insertion: '.$query);
                return false;
            }            
        }
        else{
            // création
            $query = 'INSERT INTO '. $this->table . ' (';
            $names = [];
            $values = [];
            
            // création de la clef date si elle n existe pas
            if(!isset($this->fields['date'])){
                $this->fields['date'] = new DateTime();
                $this->fields['date'] = $this->fields['date']->format("Y-m-d H:i:s");
            }

            // on parcourt l'attribut fields pour extraire les noms des champs et les valeurs
            foreach ($this->fields as $key => $value) {
                $names[] = '`'.$key.'`';

                if(is_string($value)){
                    $values[] = $this->db->quote($value);
                }
                else{
                    $values[] = $this->db->quote('');
                }

            }

            $query .= implode(', ', $names) . ') VALUES (' . implode(', ', $values) . ')';
            $this->query = $query;
            
            // echo $query."</br>";exit;
            $status = $this->db->exec($query);
            if($status){
                $this->fields['id'] = $this->db->lastInsertId();
                return true;
            }
            else{
                // throw new PDOException('Erreur durant l\'insertion');
                return false;
            }
        }
    }

    /**
    * permet de récupérer l'ensemble des élément d'une table
    */
    public function getListAll(){
        // définition de la requete
        $query = 'SELECT * FROM ' . $this->table;
        $this->query = $query;
        // éxécution de la requete
        $resultat = $this->db->query($query);

        if(!$resultat){
            return false;
        }
        else{
            return $resultat->fetchAll();
        }
    }

    /**
    * permet de récupérer l'ensemble des élément d'une table
    */
    public function countAll(){
        // définition de la requete
        $query = 'SELECT count(*) as total FROM ' . $this->table;
        $this->query = $query;
        // éxécution de la requete
        $resultat = $this->db->query($query);

        if(!$resultat){
            return false;
        }
        else{
            $count = $resultat->fetch();
            return $count['total'];
        }
    }

    /**
    * Cette fonction renvoie un menu de navigation entre les page de contenu
    *
    * @param int $page numéro de la page courante (commence à 0)
    * @param int $max nombre total d'éléments pour la section
    * @return string $sMenu la représentation html du menu
    */
    function pagination_menu($page,$max){
        global $config;
        $sMenu = '';
        // le nombre total de page
        $iMaxPage = ceil($max / $config['news_par_page']);
        $iPreviousPage = $page - 1;
        $iNextPage = $page + 1;

        $sMenu = '<ul class="pagination">'.PHP_EOL;

        //affichage du lien vers la 1ere page
        if($page != 1){
            $sMenu .= '<li><a href="'.$_SERVER['REDIRECT_URL'].'?page=1">1...</a></li>'.PHP_EOL;
        }

        // page précendente
        if($iPreviousPage > 1){
            $sMenu .= '<li><a href="'.$_SERVER['REDIRECT_URL'].'?page='.$iPreviousPage.'">'.$iPreviousPage.'</a></li>'.PHP_EOL;
        }

        // page courante
        $sMenu .= '<li class="active"><a href="'.$_SERVER['REDIRECT_URL'].'?page='.$page.'">'.$page.'</a></li>'.PHP_EOL;

        //page suivante
        if($iNextPage < $iMaxPage){
            $sMenu .= '<li><a href="'.$_SERVER['REDIRECT_URL'].'?page='.$iNextPage.'">'.$iNextPage.'</a></li>'.PHP_EOL;
        }

        //lien vers la derniere page
        if($page < $iMaxPage){
            $sMenu .= '<li><a href="'.$_SERVER['REDIRECT_URL'].'?page='.$iMaxPage.'">...'.$iMaxPage.'</a></li>'.PHP_EOL;
        }

        $sMenu .= '</ul>'.PHP_EOL;

        return $sMenu;

    }   
}