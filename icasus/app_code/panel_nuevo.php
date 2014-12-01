<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: panel_nuevo.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es) 
//---------------------------------------------------------------------------------------------------
// Descripcion: Controlador principal para generar paneles
//---------------------------------------------------------------------------------------------------
//$id_cuadro = sanitize($_REQUEST["id_cuadro"], INT);
$id_cuadro = filter_input(INPUT_GET, 'id_cuadro', FILTER_SANITIZE_NUMBER_INT);
$id_entidad = 14;
if (!empty($id_cuadro) OR ! empty($id_entidad))
{
    $smarty->assign('id_entidad', $id_entidad);
    $smarty->assign('id_cuadro', $id_cuadro);
    $smarty->assign('_nombre_pagina', TXT_NEW_PANEL);
    $plantilla = "panel_nuevo.tpl";
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}

