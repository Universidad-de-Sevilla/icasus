<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: informe/informe_listar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: lista de informes disponibles en el sistema
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;

if (isset($_REQUEST['id_entidad']))
{
    $id_entidad = sanitize($_REQUEST['id_entidad'], INT);
    $smarty->assign('id_entidad', $id_entidad);
    $smarty->assign('_nombre_pagina', TXT_INFORME_LIST);
    $plantilla = 'informe/informe_listar.tpl';
}
else
{
    header("location: index.php");
}

