<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: dato_crear.php
//---------------------------------------------------------------------------------------------------
// Creación de nuevos datos. Son indicadores que usan menos propiedades 
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;

//if (isset($_REQUEST["id_entidad"]))
if (filter_has_var(INPUT_POST, 'id_entidad'))
{
//  $id_entidad = sanitize($_REQUEST["id_entidad"],INT);
    $id_entidad = filter_input(INPUT_POST, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $entidad = new Entidad();
    $entidad->load("id = $id_entidad");
    $smarty->assign("entidad", $entidad);
    $subunidades = $entidad->Find("id_madre = $id_entidad");
    $smarty->assign('subunidades', $subunidades);

    $usuario_entidad = new Usuario_entidad;
    $usuarios_entidad = $usuario_entidad->Find_usuarios("id_entidad = $id_entidad");
    $smarty->assign("usuarios_entidad", $usuarios_entidad);

    $visibilidad = new Visibilidad;
    $visibilidades = $visibilidad->Find("1=1");
    $smarty->assign("visibilidades", $visibilidades);

    $smarty->assign("_nombre_pagina", TXT_DATO_NUEVO . " - " . $entidad->nombre);
    $plantilla = "dato_crear.tpl";
}
else
{
    $error = ERR_DATO_CREAR;
    header("location:index.php?error=$error");
}