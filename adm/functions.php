<?php
// documentation pour l autoload
// http://php.net/manual/fr/language.oop5.autoload.php

spl_autoload_register('classLoader');

function classLoader($nomClasse){
    if(is_file('../models/'.$nomClasse.'.class.php')){
        require('../models/'.$nomClasse.'.class.php');
    }
}


