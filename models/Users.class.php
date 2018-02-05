<?php
class Users extends Model{
    protected $table = '`users`';

    /**
    * méthode vérifiant le couple login / password
    * 
    * @param string $password mot de passe à verifier
    * @param string login nom de l'utilisateur
    * 
    * @return bool true si l'authentification est correcte
    */

    public function authenticate($password, $login){
        $query_user = 'SELECT * FROM ' . $this->table . ' WHERE nom='.$this->db->quote($login);

        $result = $this->db->query($query_user);

        if($result !== false){
            $user = $result->fetch();
            if(password_verify($password,$user['password'])){
                //récupération de l'id de l'utilisateur connecté
                $this->get($user['id']);
                return true;
            }
            else{
                return false;
            }
        }
        return false;
    }    

     /**
    * Cette méthode permet de créer et de metre à jour une entité en BDD
    * surcharge de la méthode du parent
    *
    * @return int|bool l'id de l'utilisateur inserré en bdd ou l'état de la requete
    * peut éventuellement lever une PDOException
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
                // remplissage du tableau $datas sans la clef 'id' 
                // et si il s'agit du mot de passe => on le hash
                // on vérifie qu'on a bien une valeur sous la forme d'une chaine de caractères non vide à mettre à jour
                if($key != 'id' && is_string($value) && !empty($value)){
                    // hash du password
                    if($key =='password'){
                        $datas[] = $key . ' = ' . $this->db->quote(password_hash($value, PASSWORD_DEFAULT));
                    }
                    else{
                        $datas[] = $key . ' = ' . $this->db->quote($value);
                    }
                }
            }
            $query .= implode(', ', $datas) . ' WHERE id='.$this->db->quote($this->fields['id']);
            
            // echo $query;exit;
            $status = $this->db->exec($query);
            
            if($status !== false){
                return true;
            }
            else{
                // throw new PDOException('Erreur durant l\'insertion');
                return false;
            }            
        }
        else{        
           // création
            $query = 'INSERT INTO '. $this->table . ' (';
            $names = [];
            $values = [];
            
            // hash du password
            if(isset($this->fields['password'])){
                $this->fields['password'] = password_hash($this->fields['password'] , PASSWORD_DEFAULT);
            }

            // on parcourt l'attribut fields pour extraire les noms des champs et les valeurs
            foreach ($this->fields as $key => $value) {
                $names[] = $key;
                $values[] = $this->db->quote($value);
            }

            $query .= implode(', ', $names) . ') VALUES (' . implode(', ', $values) . ')';
            // echo $query;exit;
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
    * Cette fonction vérifie en base de donnée si il existe une utilisateur possèdant le nom passé en paramètre
    * il y a un index UNIQUE sur cette colonne dans la table des users.
    * Elle sera appellée lors de la création (il ne doit pas y avoir deja le nom à tester en bdd)
    *
    * Elle sera également appellée lors de l'édition d'un utilisateur, il faudra dans ce cas exclure l'utilisateur 
    * qui est actuellement en cours de modification de la requete de selection
    *
    * @param string $nom le nom dont il faut vérifier l'unicité
    * @return bool|string true si $titre est unique, un message d’erreur sinon
    */
    public function isUniqueNom($nom) {
        //requete de base qui va remonter l'id de l'utilisateur qui possède le nom passé en paramètre
        $query = 'SELECT id FROM '.$this->table.' WHERE nom = '.$this->db->quote($nom);
        
        //si le paramètre optionnel a été renseigné lors de l'appel, on ajpoute une condition dans la clause WHERE
        if(isset($this->fields['id'])) {
            $query .= ' AND id != '.$this->db->quote($this->fields['id']);
        }

        //exécution de la requete et recupération du tableau contenant le retour si il y a, false sinon
        $doublon = $this->db->query($query)->fetch();

        //si le retour est 'false', c'est qu'il n y a aucune entrée dans la table users correspondant à ce titre
        if($doublon === false){
            // le nom est donc unique, la fonction renvoie 'true'     
            return true;
        }
        return 'Ce nom existe déjà.';
    } 

    /**
    * Fonction remontant depuis la bdd l'identifiant unique de l'utilisateur admin
    *
    * @return int l'id de l'admin
    */
    public function getAdminId(){
        $query = 'SELECT id FROM '.$this->table.' WHERE nom ="rv"' ;
        
        $resultat = $this->db->query($query)->fetch();

        return $resultat['id'];
    }

    /**
    * Surcharge de la méthode parent (Model)
    * Cette fonction supprime une ligne identifiée par son ID en base de données
    * lors de la suppression d'un utilisateur, ses news sont attribuées à l'admin
    *
    * @return boolean l'état de la suppression
    */
    public function delete(){
        // on créé une instance de News pour appeller la méthode de changement de propriétaire
        $objet = new News;
        // récupération de l'identifiant en bdd de l'utilisateur Admin
        $admin_id = $this->getAdminId();
        // si le changement c'est bien passé, on supprime l'utilisateur à l'aide de la méthode du parent 
        if($objet->changeOwner($this->fields['id'], $admin_id)){
            return parent::delete();
        }
        else{
            return false;
        }
        // return parent::delete();
    }    


    /**
    * permet de récupérer l'ensemble des éléments et la liaison avec la table droits
    */
    public function getListAll(){
        // définition de la requete
        $query = 'SELECT '.$this->table.'.*, droits.niveau as niveau FROM ' . $this->table;
        $query .= ' INNER JOIN droits ON '.$this->table.'.droit = droits.id ';

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