<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: proceso_listar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Lista los procesos definidos en esta unidad
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;

if (filter_has_var(INPUT_GET, 'id_entidad'))
{
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $entidad = new Entidad();
    $entidad->load("id =  $id_entidad");
    $smarty->assign('entidad', $entidad);

    $proceso = new Proceso();
    $procesos = $proceso->Find_joined("id_entidad = $id_entidad");
    $smarty->assign('procesos', $procesos);

    $smarty->assign('_javascript', array('proceso_listar'));
    $smarty->assign('_nombre_pagina', TXT_PROCS . ": " . $entidad->nombre);
    $plantilla = 'proceso_listar.tpl';
}
else
{
    $error = ERR_UNID;
    header("location:index.php?page=procesos&error=$error");
}
