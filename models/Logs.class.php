<?php
class Logs extends Model{
    protected $table = '`logs`';
    /**
    * méthode enregistrant les actions
    * 
    * @param string $action action à loguer
    */

    public function logAction($action){
		$this->fields['action'] = $action;
		$this->fields['ip'] = $_SERVER['REMOTE_ADDR'];
		$this->fields['user'] = $_SESSION['id'];

		$this->save();
    }

    /**
    * permet de récupérer l'ensemble des éléments et la liaison avec users
    */
    public function getListAll(){
        // définition de la requete
        $query = 'SELECT '.$this->table.'.*, users.nom as user_name, users.droit as droit FROM ' . $this->table;
        $query .= ' INNER JOIN users ON '.$this->table.'.user = users.id ';
        $query .= ' ORDER BY `date` DESC';

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