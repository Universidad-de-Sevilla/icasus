<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: panel_tabla_multi.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Controlador para la creación de paneles de tabla_multi
//---------------------------------------------------------------------------------------------------

if (filter_has_var(INPUT_GET, 'page') && filter_has_var(INPUT_GET, 'modulo'))
{
    $modulo = filter_input(INPUT_GET, 'modulo', FILTER_SANITIZE_STRING);
    $tipo = filter_input(INPUT_GET, 'page', FILTER_SANITIZE_STRING);

    $panel_tipo = new Panel_tipo();
    $panel_tipo->load("clase_css = '$tipo'");
    $smarty->assign('panel', $panel_tipo);

    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $entidad = new Entidad();
    $subunidades = $entidad->Find("id_madre=$id_entidad ORDER BY etiqueta");
    $smarty->assign('subunidades', $subunidades);
    $smarty->assign('id_entidad', $id_entidad);

    $smarty->assign('modulo', $modulo);
    $smarty->assign('_nombre_pagina', TXT_PANEL_CREAR);
    $plantilla = "$tipo.tpl";
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
