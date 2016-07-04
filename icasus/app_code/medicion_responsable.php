<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: medicion_responsable.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Permite cambiar la asignación de mediciones a otros usuarios
// Hay que ser responsable de grabación de la subunidad, responsable de grabación del indicador o
// responsable de seguimiento del indicador
//---------------------------------------------------------------------------------------------------

global $smarty;
global $usuario;
global $plantilla;

if (filter_has_var(INPUT_GET, 'id_indicador'))
{
    $id_indicador = filter_input(INPUT_GET, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
    $tipo = "indicador";
}
else if (filter_has_var(INPUT_GET, 'id_dato'))
{
    $id_indicador = filter_input(INPUT_GET, 'id_dato', FILTER_SANITIZE_NUMBER_INT);
    $tipo = "dato";
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}

// Comprueba permisos para el usuario: responsable unidad, responsable delegado,
// responsable indicador, responsable medicion
$indicador = new Indicador();
$indicador->load_joined("id = $id_indicador");
$smarty->assign('indicador', $indicador);
$id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
//Responsables
$responsable = false;
if ($indicador->id_responsable == $usuario->id)
{
    $responsable = true;
}
$smarty->assign('responsable', $responsable);

//Avanzar entre indicadores/datos
if ($tipo == "indicador")
{
    //Proceso del indicador
    $proceso = new Proceso();
    $proceso->load("id = $indicador->id_proceso");
    $smarty->assign('proceso', $proceso);
    //Obtener todos los indicadores del proceso para avanzar o retroceder 
    if ($indicador->archivado)
    {
        $indicadores = $indicador->Find("id_entidad = $id_entidad AND id_proceso=$proceso->id AND archivado is NOT NULL");
    }
    else
    {
        $indicadores = $indicador->Find("id_entidad = $id_entidad AND id_proceso=$proceso->id AND archivado is NULL");
    }
    $smarty->assign('_nombre_pagina', FIELD_INDIC . ": $indicador->nombre");
}
else
{
    //Obtener todos los datos para avanzar o retroceder 
    if ($indicador->archivado)
    {
        $indicadores = $indicador->Find("id_entidad = $id_entidad AND id_proceso IS NULL AND archivado is NOT NULL");
    }
    else
    {
        $indicadores = $indicador->Find("id_entidad = $id_entidad AND id_proceso IS NULL AND archivado is NULL");
    }
    $smarty->assign('_nombre_pagina', FIELD_DATO . ": $indicador->nombre");
}
$smarty->assign("indicadores", $indicadores);
$cont = 0;
foreach ($indicadores as $ind)
{
    if ($id_indicador == $ind->id)
    {
        $indice = $cont;
        $smarty->assign("indice", $indice);
    }
    $cont++;
}

$indicador_subunidad = new Indicador_subunidad();
$indicadores_subunidades = $indicador_subunidad->Find_entidades_responsables($id_indicador, $usuario->id);
$smarty->assign("indicadores_subunidades", $indicadores_subunidades);

$entidad = new Entidad();
$entidad->load("id = $indicador->id_entidad");
$smarty->assign('entidad', $entidad);
$smarty->assign('tipo', $tipo);
$smarty->assign('_javascript', array('medicion_responsable'));
$plantilla = "medicion_responsable.tpl";
