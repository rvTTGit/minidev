<?php
class Droits extends Model{
    protected $table = '`droits`';
    /**
    * permet de récupérer l'ensemble des élément d'une table
    */
    public function getListAll(){
        // définition de la requete
        $query = 'SELECT * FROM ' . $this->table . ' ORDER BY niveau ASC';
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
}