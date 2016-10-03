<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: proceso_crear.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Creación de nuevos procesos
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;

if (filter_has_var(INPUT_GET, 'id_entidad'))
{
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

    $cuadro = new Cuadro();
    $cuadros_proceso = $cuadro->Find("privado = 0 AND id_entidad = $id_entidad");
    $smarty->assign('cuadros_proceso', $cuadros_proceso);

    $smarty->assign('_javascript', array('proceso_crear'));
    $smarty->assign("_nombre_pagina", TXT_PROC_CREAR . " - " . $entidad->nombre);
    $plantilla = "proceso_crear.tpl";
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
