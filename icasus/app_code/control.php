<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: control.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es) 
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Control de Indicadores, Mediciones, Valores...
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;

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
//---- Muestra todos los datos al inicio del año actual    -----------
//------------------------------------------------------------------------------
if ($modulo == 'inicio')
{
    $valor = new Valor();
    $smarty->assign("id_entidad", $id_entidad);

    //Indicadores/Datos con Valores nulos agrupados
    $valores_agrupados = $valor->filtro_onlyear_agrupados($fecha, $cadena);
    $smarty->assign("valores_agrupados", $valores_agrupados);

    //Indicadores/Datos con Valores nulos
    $valores = $valor->filtro_onlyear($fecha, $cadena);
    $smarty->assign("valores", $valores);

    //Indicadores/Datos última modificación
    $valores_ult_mod = $valor->filtro_onlyear_modificados($fecha, $cadena);
    $smarty->assign("valores_ult_mod", $valores_ult_mod);

    //Indicadores/Datos sin Mediciones 
    $indicador = new Indicador();
    $indicadores_sin_med = $indicador->find_sin_mediciones($id_entidad, $fecha);
    $smarty->assign("indicadores_sin_med", $indicadores_sin_med);

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
                //Desactiva el valor
                $id_val = filter_var($id_valor, FILTER_SANITIZE_NUMBER_INT);
                $valor->load("id = $id_val");
                $valor->activo = 0;
                $valor->Save();
                $contador ++;
            }
            $exito = MSG_VALS_DESACT . ' ' . $contador . ' ' . TXT_VALS;
            $smarty->assign("exito", $exito);
            header("index.php?page=control&modulo=inicio&id_entidad=$entidad->id&exito=$exito");
        }
    }
}

//------------------------------------------------------------------------------
//---- Muestra datos en función del parámetro fecha -----------
//------------------------------------------------------------------------------
if ($modulo == 'filtrOnlyear')
{
    $fecha = filter_input(INPUT_GET, 'fecha', FILTER_SANITIZE_NUMBER_INT);
    $valor = new Valor();
    $smarty->assign("id_entidad", $id_entidad);

    //Indicadores/Datos con Valores nulos agrupados
    $valores_agrupados = $valor->filtro_onlyear_agrupados($fecha, $cadena);
    $smarty->assign("valores_agrupados", $valores_agrupados);

    //Indicadores/Datos con Valores nulos
    $valores = $valor->filtro_onlyear($fecha, $cadena);
    $smarty->assign("valores", $valores);

    //Indicadores/Datos última modificación
    $valores_ult_mod = $valor->filtro_onlyear_modificados($fecha, $cadena);
    $smarty->assign("valores_ult_mod", $valores_ult_mod);

    //Indicadores/Datos sin Mediciones 
    $indicador = new Indicador();
    $indicadores_sin_med = $indicador->find_sin_mediciones($id_entidad, $fecha);
    $smarty->assign("indicadores_sin_med", $indicadores_sin_med);
}

$smarty->assign("modulo", $modulo);
$smarty->assign("entidad", $entidad);
$smarty->assign("fecha", $fecha);
$smarty->assign('_javascript', array('control'));
$smarty->assign("_nombre_pagina", "Control:  $entidad->nombre");
$plantilla = "control.tpl";
