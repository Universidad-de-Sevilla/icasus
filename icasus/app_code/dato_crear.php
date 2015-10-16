<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: dato_crear.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Creación de nuevos datos. Son indicadores con menos propiedades (no asociados a procesos)
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;

if (filter_has_var(INPUT_GET, 'id_entidad'))
{
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $entidad = new Entidad();
    $entidad->load("id = $id_entidad");
    $smarty->assign("entidad", $entidad);
    $subunidades = $entidad->Find("id_madre = $id_entidad ORDER BY etiqueta");
    $smarty->assign('subunidades', $subunidades);

    $usuario_entidad = new Usuario_entidad;
    $usuarios_entidad = $usuario_entidad->Find_usuarios("id_entidad = $id_entidad");
    $smarty->assign("usuarios_entidad", $usuarios_entidad);

    $visibilidad = new Visibilidad;
    $visibilidades = $visibilidad->Find("1=1");
    $smarty->assign("visibilidades", $visibilidades);

    $tipo_agregacion = new Tipo_agregacion();
    $tipos_agregacion = $tipo_agregacion->Find("true ORDER BY id");
    $smarty->assign("tipos_agregacion", $tipos_agregacion);

    $smarty->assign('_javascript', array('dato_crear'));
    $smarty->assign("_nombre_pagina", TXT_DATO_NUEVO . " - " . $entidad->nombre);
    $plantilla = "dato_crear.tpl";
}
else
{
    $error = ERR_DATO_CREAR;
    header("location:index.php?error=$error");
}
