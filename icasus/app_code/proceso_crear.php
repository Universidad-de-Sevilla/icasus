<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: proceso_crear.php
//---------------------------------------------------------------------------------------------------
// Descripcion: Creación de nuevos procesos
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;

//if (isset($_REQUEST["id_entidad"]))
if (filter_has_var(INPUT_GET, 'id_entidad'))
{
//    $id_entidad = sanitize($_REQUEST["id_entidad"], INT);
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $entidad = new Entidad();
    $entidad->load("id = $id_entidad");
    $smarty->assign("entidad", $entidad);

    $usuario_entidad = new Usuario_entidad;
    $usuarios_entidad = $usuario_entidad->Find_usuarios("id_entidad = $id_entidad");
    $smarty->assign("usuarios_entidad", $usuarios_entidad);

    $proceso_madre = new Proceso();
    $procesos_madre = $proceso_madre->find("id_entidad = $id_entidad");
    $smarty->assign('procesos_madre', $procesos_madre);

    $smarty->assign("_nombre_pagina", TXT_PROC_NUEVO . " - " . $entidad->nombre);
    $plantilla = "proceso_crear.tpl";
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=entidad_listar");
}

