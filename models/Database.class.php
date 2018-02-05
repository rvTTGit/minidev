<?php

class Database{
    /**
    * L'objet unique instance : Singleton
    *
    * @var instance
    * @access private
    * @static
    */
    private static $instance = null;

    /**
    * Constructeur de la classe
    *
    * @access private
    */
    private function __construct(){}

    /**
    * Méthode qui crée l'unique instance de la classe
    * si elle n'existe pas encore puis la retourne.
    *
    * @return instance
    */
    static function getInstance(){
        if(is_null(self::$instance)){
            // appel à la variable $config
            global $config;
            // var_dump($config);
            try{
            $dsn = 'mysql:dbname='.$config['dbname'].';host='.$config['dbhost'].'; charset=utf8';
            $db = new PDO($dsn, $config['dbuser'], $config['dbpassword'] );
            $db->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
            self::$instance = $db;
            } catch(PDOException $e) {
                throw new Exception('<p>Erreur de connexion à la base de données: '.$e->getMessage().'</p>');
            }            
        }

        return self::$instance;
    }

}