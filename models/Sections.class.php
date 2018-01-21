<?php
class Sections extends Model{
    protected $table = '`sections`';


    /**
    * permet de récupérer l'ensemble des élément d'une table
    */

    public function getByTag($tag){
        $query = 'SELECT * FROM ' . $this->table . ' WHERE tag=' . $this->db->quote($tag);
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

    public function getListAll(){
        // définition de la requete
        $query = 'SELECT * FROM ' . $this->table . ' ORDER BY `position` ASC';
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
    public function getListMenu(){
        // définition de la requete
        $query = 'SELECT * FROM ' . $this->table . ' WHERE menu=1 ORDER BY `position` ASC';
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
    public function getListScreen2(){
        // définition de la requete
        $query = 'SELECT * FROM ' . $this->table . ' WHERE inScreen2=1 ORDER BY `position` ASC';
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
    public function getListScreen3(){
        // définition de la requete
        $query = 'SELECT * FROM ' . $this->table . ' WHERE inScreen3=1 ORDER BY `position` ASC';
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
    * permet de récupérer le nom d'une section à partir de son tag
    */
    // public function getName($tag){
    //     // définition de la requete
    //     $query = 'SELECT nom FROM ' . $this->table . ' WHERE tag='.$this->db->quote($section);
    //     $this->query = $query;
    //     // éxécution de la requete
    //     $resultat = $this->db->query($query);

    //     if(!$resultat){
    //         return false;
    //     }
    //     else{
    //         return $resultat->fetch();
    //     }
    // }

    /**
    * permet de récupérer l'ensemble des élément d'une table qui accèpte les items
    */
    public function getListHasItem(){
        // définition de la requete
        $query = 'SELECT * FROM ' . $this->table . ' WHERE hasItem=1 ORDER BY `position` ASC';
        // éxécution de la requete
        $this->query = $query;
        $resultat = $this->db->query($query);

        if(!$resultat){
            return false;
        }
        else{
            return $resultat->fetchAll();
        }
    }

    public function getHomeId(){
        $query = 'SELECT id FROM '.$this->table.' WHERE tag ="home"' ;
        
        $resultat = $this->db->query($query)->fetch();

        return $resultat['id'];
    }

    /**
    * Surcharge de la méthode parent (Model)
    * Cette fonction supprime une ligne identifiée par son ID en base de données
    * lors de la suppression d'une section, ses news sont attribuées à l'accueil
    * avec une visibilité à 0
    *
    * @return boolean l'état de la suppression
    */
    public function delete(){
        // on créé une instance de News pour appeller la méthode de changement de section
        $objet = new News;
        // récupération de l'identifiant en bdd de la section home
        $home_id = $this->getHomeId();
        // si le changement c'est bien passé, on supprime la section à l'aide de la méthode du parent 
        if($objet->changeSection($this->fields['id'], $home_id)){
            return parent::delete();
        }
        else{
            return false;
        }
    }     
}