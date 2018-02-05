<?php
class Configs extends Model{
    protected $table = '`configs`';

    public function __construct(){
        parent::__construct();
        $this->loadConfigs();
    }

    /**
    * Cette méthode retourne les paramètres de configguration 
    * stockés en bdd et la ajoute au tableau global config
    *
    */
    private function loadConfigs(){
    	global $config;
        $taille_miniatures = [];
        $query = 'SELECT * FROM ' . $this->table ;
        $query_result = $this->db->query($query);
        if(!$query_result){
            $error = $this->db->errorInfo();
            $error = $error[2];
            throw new PDOException('Erreur de requête : ' .$error. '</br>'.$query);
        }
        $configs = $query_result->fetchAll();
        foreach ($configs as $key => $data) {
            // test si la config est sous la forme d un tableau
            if($data['tag'] == 'taille_miniatures'){
                // éclate la chaine en tableau de nombre et caractères avec la regexp
                $tab = preg_split('/(?<=\D)(?=\d)|\d+\K/', $data['valeur']);
                foreach ($tab as $chaine) {
                    if(is_numeric($chaine)){
                        $taille_miniatures[] = $chaine;
                    }
                }
                $data['valeur'] = $taille_miniatures;
            }
            $config[$data['tag']] = $data['valeur'];
        }
    }    

    /**
    * permet de récupérer l'ensemble des configuration editable par le client
    */
    public function getListClient(){
        // définition de la requete
        $query = 'SELECT * FROM ' . $this->table . ' WHERE acces_client=1';
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
    public function getListAll($type=''){
        // définition de la requete
        $query = 'SELECT * FROM ' . $this->table;
        if($type!= '')
            $query .= ' WHERE `type`=' . $this->db->quote($type);
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

    // renvoie les valeurs du champ ENUM sous forme d'un tableau
    public function getTypes(){
        // définition de la requete
        $query = 'SHOW COLUMNS FROM  ' . $this->table . '  like \'type\'';
        $this->query = $query;
        // éxécution de la requete
        $resultat = $this->db->query($query);

        if(!$resultat){
            return [];
        }
        else{
            $clean = ['enum(', ')', '\''];
            $liste = explode(',', str_replace($clean, '', $resultat->fetch()['Type']));            
            return $liste;
        }
    }

    public function getListModules(){
        // définition de la requete
        $query = 'SELECT * FROM modules';
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

    public function getConfigModules(){
        $retour = [];
        // définition de la requete
        $query = 'SELECT * FROM modules';
        $this->query = $query;
        // éxécution de la requete
        $resultat = $this->db->query($query)->fetchAll();

        foreach ($resultat as $module) {
            $retour[$module['slug']] = $module['actif'];
        }

        return $retour;
    }

    public function updateModule($tab){
        if(!empty($tab)){
            $in = implode("','", $tab);
            $query1 = "UPDATE `modules` SET `actif`=0, `date`=NOW() WHERE slug NOT IN ('".$in."')";
            $query2 = "UPDATE `modules` SET `actif`=1, `date`=NOW() WHERE slug IN ('".$in."')";
            $this->query = $query1."<br/>".$query2;
        
            $status1 = $this->db->exec($query1);
            $status2 = $this->db->exec($query2);

            if($status1 === false || $status2 === false){
                return false;
            }
            else{
                return true;
            }
        }
        else{
            $query = "UPDATE `modules` SET `actif`=0";
            $this->query = $query;
            $status = $this->db->exec($query);

            if($status === false){
                return false;
            }
            else{
                return true;
            }
        }
    }
}