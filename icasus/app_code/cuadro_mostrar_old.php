<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: cuadro_listar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Muestra los indicadores y las gráficas de un cuadro de mando 
//---------------------------------------------------------------------------------------------------

global $smarty;
global $basedatos;
global $plantilla;

// Esto es para prevenir que se cargue el script sin pasar por index.php
if (!is_object($smarty)) {
    header('Location:index.php');
}
if (isset($_REQUEST['id'])) {
    $smarty->assign('_javascript', array('confirmar_borrado'));
    $id = sanitize($_REQUEST['id'], 16);
    $cuadro = new Cuadro();
    $cuadro->Load("id = $id");
    $smarty->assign('cuadro', $cuadro);
    $indicadores = $cuadro->carga_indicadores();
    $smarty->assign('indicadores', $indicadores);
    $plantilla = 'cuadro_mostrar.tpl';
    $smarty->assign('_nombre_pagina', "Cuadro de Mando: $cuadro->nombre");
} else {
    //Si se llama a esta pagina si un id de cuadro se redirecciona al listado
    header('Location:index.php?page=cuadro_listar');
}

