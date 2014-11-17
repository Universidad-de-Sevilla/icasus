<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (https://forja.rediris.es/projects/icasus/)
// Archivo: dimension_crear.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Creación de nuevas dimensiones
//---------------------------------------------------------------------------------------------------

global $smarty;
global $basedatos;
global $plantilla;

$dimension = new Dimension();
// Si vienen los datos necesarios del formulario grabamos
//if (isset($_POST['nombre'])) 
if (filter_has_var(INPUT_POST, 'nombre'))
{
//    $dimension->nombre = sanitize($_POST['nombre'], 2);
    //$dimension->codigo = sanitize($_POST['codigo'],2);
    $dimension->nombre = filter_input(INPUT_POST, 'nombre', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
    $adodb->execute("SET NAMES utf8");
    if ($dimension->save())
    {
        $smarty->assign('aviso', MSG_DIM_CREADA);
    }
    else
    {
        $error = $dimension->ErrorMsg();
        $smarty->assign('error', ERR_CREA_DIM); //Este es el error reportado: '.$error);
    }
}

// Array de dimensiones que pasamos a la vista para ver las existentes
$dimensiones = $dimension->find('1 = 1 ORDER BY nombre');
$smarty->assign('dimensiones', $dimensiones);
$plantilla = "dimension_crear.tpl";
$smarty->assign('_nombre_pagina', TXT_REL_DIM);

