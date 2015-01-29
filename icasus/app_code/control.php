<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: cuadro_unidad.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es) 
// Joaquín Valonero Zaera (jvalzae@hotmail.com)
//---------------------------------------------------------------------------------------------------
// Descripcion: Control de indicadores, mediciones, valores...
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
//$modulo = sanitize($_REQUEST["modulo"], SQL);
//$id_entidad = sanitize($_REQUEST["id_entidad"], SQL);

$modulo = filter_input(INPUT_GET, 'modulo', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
$id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));

$entidad = new Entidad();
$entidad->load("id = $id_entidad");

$subunidades = $entidad->find("id_madre = $id_entidad");
$num_subunidades = count($subunidades);
if ($num_subunidades == 0)
{
    $cadena = "AND e.id = $id_entidad ";
}
else
{
    $cadena = "AND (e.id_madre = $id_entidad OR e.id= $id_entidad)";
}
$fecha = date("Y");

//------------------------------------------------------------------------------
//---- Muestra todos los valores NULL al inicio con el año actual    -----------
//------------------------------------------------------------------------------
if ($modulo == 'inicio')
{
    $valor = new Valor();
    $valores = $valor->filtro_onlyear($fecha, $cadena);
    $smarty->assign("valores", $valores);
    $smarty->assign("id_entidad", $id_entidad);

    //Comprobamos si existen valores a desactivar
    if (filter_has_var(INPUT_POST, 'id_valor'))
    {
        $post_array = filter_input_array(INPUT_POST);
        $id_valores = $post_array['id_valor'];
        if ($id_valores)
        {
            $contador = 0;
            foreach ($id_valores as $id_valor)
            {
                $id_val = filter_var($id_valor);
                $valor->load("id = $id_val");
                $valor->activo = 0;
                $valor->Save();
                $contador ++;
            }
            $aviso = MSG_VALS_DESACT . ' ' . $contador . ' ' . TXT_VALS;
            $smarty->assign("aviso", $aviso);
            header("index.php?page=control&modulo=inicio&id_entidad=$entidad->id&aviso=$aviso");
        }
    }
}

//------------------------------------------------------------------------------
//---- Muestra todos los valores NULL en función del parámetro fecha -----------
//------------------------------------------------------------------------------
if ($modulo == 'filtrOnlyear')
{
//	$fecha = sanitize($_REQUEST["fecha"],INT);
    $fecha = filter_input(INPUT_GET, 'fecha', FILTER_SANITIZE_NUMBER_INT);
    $valor = new Valor();
    $valores = $valor->filtro_onlyear($fecha, $cadena);
    $smarty->assign("valores", $valores);
}

//------------------------------------------------------------------------------
//Desactiva un valor quitándolo de la lista de control
//------------------------------------------------------------------------------

if ($modulo == 'desactivar_valor')
{
    $post_array = filter_input_array(INPUT_POST);
//    $id_valores = $post_array['id_valor'];
//    if ($id_valores)
//    {
//        $contador = 0;
//        foreach ($id_valores as $id_valor)
//        {
//            $id_valor = filter_input(INPUT_GET, 'id_valor', FILTER_SANITIZE_NUMBER_INT);
//            
//            $valor->load("id = $id_valor");
//            $valor->activo = 0;
//            $valor->Save();
//        }
//    }
}

//------------------------------------------------------------------------------
//Cálculo de indicadores y datos sin mediciones
//------------------------------------------------------------------------------

$indicador = new Indicador();
$indicadores_sin_med = $indicador->find_sin_mediciones($id_entidad);
$proceso = new Proceso();
$smarty->assign("indicadores_sin_med", $indicadores_sin_med);

$smarty->assign("modulo", $modulo);
$smarty->assign("entidad", $entidad);
$smarty->assign("_nombre_pagina", "Control:  $entidad->nombre");
$plantilla = "control.tpl";

