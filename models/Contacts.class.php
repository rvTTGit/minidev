<?php
class Contacts extends Model{
    protected $table = '`contacts`';

    /**
    * Cette fonction vérifie si un contact existe deja
    * le charge si c est le cas, l enregistre sinon
    */
    public function checkContact(){
        $query = 'SELECT * FROM ' . $this->table . ' WHERE mail=' . $this->db->quote($this->fields['mail']);
        $this->query = $query;
        $query_result = $this->db->query($query)->fetch();
        if(!$query_result){
            // on sauvegarde
            return $this->save();
        }
        else{
            // on le charge
            $this->get($query_result['id']);
            return true;
        }
    }

}