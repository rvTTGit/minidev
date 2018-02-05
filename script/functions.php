<?php 
// documentation pour l autoload
// http://php.net/manual/fr/language.oop5.autoload.php

spl_autoload_register('classLoader');

function classLoader($nomClasse){
    if(is_file('models/'.$nomClasse.'.class.php')){
        require('models/'.$nomClasse.'.class.php');
    }
}

include('form_functions.php');

/*******  TRI  ********/
// Notre fonction qui affiche les liens
function sort_link($text, $order=false){
    global $db, $order_by, $order_dir;

    if(!$order)
        $order = $text;

    $link = '<a href="?order=' . $order;
    if($order_by==$order && $order_dir=='ASC')
        $link .= '&inverse=true';
    $link .= '"';
    if($order_by==$order && $order_dir=='ASC')
        $link .= ' class="order_asc"';
    elseif($order_by==$order && $order_dir=='DESC')
        $link .= ' class="order_desc"';
    $link .= '>' . $text . '</a>';

    return $link;
}