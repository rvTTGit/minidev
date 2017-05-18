<?php
class Tarifs extends Model{
    protected $table = '`tarifs`';

    /**
    * permet de récupérer l'ensemble des éléments et la liaison avec la table type
    */
    public function getListAll(){
        // définition de la requete
        $query = 'SELECT '.$this->table.'.*, type_tarifs.nom as groupe FROM ' . $this->table;
        $query .= ' INNER JOIN type_tarifs ON '.$this->table.'.type = type_tarifs.id ';

        // éxécution de la requete
        $resultat = $this->db->query($query);

        if(!$resultat){
            return false;
        }
        else{
            return $resultat->fetchAll();
        }
    }

    public function getListType($type){
        // définition de la requete
        $query = 'SELECT '.$this->table.'.*, type_tarifs.nom as groupe FROM ' . $this->table;
        $query .= ' INNER JOIN type_tarifs ON '.$this->table.'.type = type_tarifs.id ';
        $query .= ' WHERE type='.$this->db->quote($type);

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