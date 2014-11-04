<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: indicador_crear.php
//---------------------------------------------------------------------------------------------------
// Creación de nuevos indicadores
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;

$id_entidad = filter_input(INPUT_GET | INPUT_POST, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

//if (isset($_REQUEST["id_entidad"]))
if ($id_entidad)
{
//  $id_entidad = sanitize($_REQUEST["id_entidad"],INT);
    $entidad = new entidad();
    $entidad->load("id = $id_entidad");
    $smarty->assign("entidad", $entidad);
    $subunidades = $entidad->Find("id_madre = $id_entidad");
    $smarty->assign('subunidades', $subunidades);

    $usuario_entidad = new usuario_entidad;
    $usuarios_entidad = $usuario_entidad->Find_usuarios("id_entidad = $id_entidad");
    $smarty->assign("usuarios_entidad", $usuarios_entidad);

    $proceso = new proceso();
    $procesos = $proceso->Find("id_entidad = $id_entidad");
    $smarty->assign('procesos', $procesos);

    $criterio = new criterio_efqm();
    $criterios_efqm = $criterio->Find('1=1');
    $smarty->assign('criterios_efqm', $criterios_efqm);

    $visibilidad = new visibilidad;
    $visibilidades = $visibilidad->Find("1=1");
    $smarty->assign("visibilidades", $visibilidades);

    $smarty->assign("_nombre_pagina", TXT_NEW_INDIC . " - " . $entidad->nombre);
    $plantilla = "indicador_crear.tpl";
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?error=$error");
}

