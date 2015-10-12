<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: entidad_mostrar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Muestra la página principal de una Unidad
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
global $usuario;

if (filter_has_var(INPUT_GET, 'id_entidad') && filter_has_var(INPUT_GET, 'principal'))
{
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $entidad = new Entidad();
    $entidad->load_joined("id = $id_entidad");
    $smarty->assign('entidad', $entidad);
    $principal = filter_input(INPUT_GET, 'principal', FILTER_SANITIZE_NUMBER_INT);
    $smarty->assign('principal', $principal);

    //Cantidad de procesos, indicadores y datos
    $proceso = new Proceso();
    $procesos = $proceso->Find("id_entidad = $id_entidad");
    $smarty->assign('num_procesos', count($procesos));

    $indicador = new Indicador();
    $indicadores = $indicador->Find("id_entidad = $id_entidad AND id_proceso IS NOT NULL");
    $smarty->assign('num_indicadores', count($indicadores));

    $dato = new Indicador();
    $datos = $dato->Find("id_entidad = $id_entidad AND id_proceso IS NULL");
    $smarty->assign('num_datos', count($datos));

    $smarty->assign('_nombre_pagina', $entidad->nombre);
    $plantilla = "entidad_mostrar.tpl";
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?error=$error");
}
