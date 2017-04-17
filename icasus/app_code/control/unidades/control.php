<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: unidades/control.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es) 
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Control de Indicadores, Mediciones, Valores...
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
global $usuario;

$modulo = filter_input(INPUT_GET, 'modulo', FILTER_SANITIZE_STRING);
$id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

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

// Indicadores/datos bajo la responsabilidad del usuario
$indicador = new Indicador();
$indicadores_datos_propios = $indicador->Find_joined("(id_responsable = $usuario->id OR id_responsable_medicion = $usuario->id) AND id_entidad=$id_entidad AND archivado IS NULL");
$smarty->assign("indicadores_datos_propios", $indicadores_datos_propios);
$cadena_aux = '';
if (!$control && $indicadores_datos_propios)
{
    $cadena_aux = "AND (i.id_responsable = $usuario->id OR i.id_responsable_medicion = $usuario->id OR p.id_propietario = $usuario->id)";
    $cadena = $cadena . ' ' . $cadena_aux;
}

// Procesos bajo la responsabilidad del usuario actual
$proceso = new Proceso();
$procesos_propios = $proceso->Find("id_propietario = $usuario->id AND id_entidad = $id_entidad");
$smarty->assign('procesos_propios', $procesos_propios);
if (!$control && !$indicadores_datos_propios && $procesos_propios)
{
    $cadena_aux = "AND p.id_propietario = $usuario->id";
    $cadena = $cadena . ' ' . $cadena_aux;
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
    $indicadores_sin_med = $indicador->find_sin_mediciones($id_entidad, $fecha, $cadena_aux);
    $smarty->assign("indicadores_sin_med", $indicadores_sin_med);

    //Indicadores/Datos valores de referencia
    //Buscar todos valores ref de los indicadores/datos para el año actual
    $indicadores = array();
    if ($indicadores_datos_propios)
    {
        $indicadores = $indicadores_datos_propios;
    }
    if ($procesos_propios)
    {
        $proc_indics = array();
        foreach ($procesos_propios as $proc)
        {
            $proc_indics = array_merge($proc_indics, $indicador->Find_joined("id_proceso=$proc->id AND archivado is NULL"));
        }
        $indicadores = array_merge($indicadores, $proc_indics);
    }
    if ($control)
    {
        $indicadores = $indicador->Find_joined("id_entidad=$id_entidad AND archivado is NULL");
    }

    $medicion = new Medicion();
    $mediciones = array();
    $medicion_lim = array();
    $medicion_obj = array();
    $valor_referencia_medicion = new Valor_referencia_medicion();
    $valor_referencia = new Valor_referencia();

    if ($indicadores)
    {
        foreach ($indicadores as $indicador)
        {
            $mediciones[$indicador->id] = $medicion->find("id_indicador=$indicador->id AND etiqueta like '$fecha%'");
            $valores_referencia = $valor_referencia->Find("id_indicador = $indicador->id");
            if ($valores_referencia)
            {
                foreach ($mediciones[$indicador->id] as $med)
                {
                    foreach ($valores_referencia as $valor_referencia)
                    {
                        $existe = $valor_referencia_medicion->Load("id_valor_referencia=$valor_referencia->id AND id_medicion=$med->id");
                        if (!$existe)
                        {
                            $valor_referencia_medicion = new Valor_referencia_medicion();
                            $valor_referencia_medicion->id_valor_referencia = $valor_referencia->id;
                            $valor_referencia_medicion->id_medicion = $med->id;
                            $valor_referencia_medicion->save();
                        }
                    }
                    $mediciones_referencias[$med->id] = $valor_referencia_medicion->Find_joined("id_medicion=$med->id");
                    foreach ($mediciones_referencias[$med->id] as $valores_referencia_medicion)
                    {
                        //Es la referencia Límite
                        if (strpos($valores_referencia_medicion->valor_referencia->nombre, 'mite') !== false)
                        {
                            $medicion_lim[$indicador->id][$med->id] = $valores_referencia_medicion->valor;
                        }
                        //Es la referencia Meta
                        if (strpos($valores_referencia_medicion->valor_referencia->nombre, 'eta') !== false)
                        {
                            $medicion_obj[$indicador->id][$med->id] = $valores_referencia_medicion->valor;
                        }
                    }
                }
            }
        }
    }
    $smarty->assign('indicadores', $indicadores);
    $smarty->assign('mediciones', $mediciones);
    $smarty->assign('medicion_lim', $medicion_lim);
    $smarty->assign('medicion_obj', $medicion_obj);

    if (filter_has_var(INPUT_GET, 'desactivar'))
    {
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
        else
        {
            $aviso = MSG_VALS_NO_MARCADOS;
            $smarty->assign("aviso", $aviso);
            header("index.php?page=control&modulo=inicio&id_entidad=$entidad->id&aviso=$aviso");
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
    $indicadores_sin_med = $indicador->find_sin_mediciones($id_entidad, $fecha, $cadena_aux);
    $smarty->assign("indicadores_sin_med", $indicadores_sin_med);

    //Indicadores/Datos valores de referencia
    //Buscar todos valores ref de los indicadores/datos para el año actual
    $indicadores = array();
    if ($indicadores_datos_propios)
    {
        $indicadores = $indicadores_datos_propios;
    }
    if ($procesos_propios)
    {
        $proc_indics = array();
        foreach ($procesos_propios as $proc)
        {
            $proc_indics = array_merge($proc_indics, $indicador->Find_joined("id_proceso=$proc->id AND archivado is NULL"));
        }
        $indicadores = array_merge($indicadores, $proc_indics);
    }
    if ($control)
    {
        $indicadores = $indicador->Find_joined("id_entidad=$id_entidad AND archivado is NULL");
    }

    $medicion = new Medicion();
    $mediciones = array();
    $medicion_lim = array();
    $medicion_obj = array();
    $valor_referencia_medicion = new Valor_referencia_medicion();
    $valor_referencia = new Valor_referencia();

    if ($indicadores)
    {
        foreach ($indicadores as $indicador)
        {
            $mediciones[$indicador->id] = $medicion->find("id_indicador=$indicador->id AND etiqueta like '$fecha%'");
            $valores_referencia = $valor_referencia->Find("id_indicador = $indicador->id");
            if ($valores_referencia)
            {
                foreach ($mediciones[$indicador->id] as $med)
                {
                    foreach ($valores_referencia as $valor_referencia)
                    {
                        $existe = $valor_referencia_medicion->Load("id_valor_referencia=$valor_referencia->id AND id_medicion=$med->id");
                        if (!$existe)
                        {
                            $valor_referencia_medicion = new Valor_referencia_medicion();
                            $valor_referencia_medicion->id_valor_referencia = $valor_referencia->id;
                            $valor_referencia_medicion->id_medicion = $med->id;
                            $valor_referencia_medicion->save();
                        }
                    }
                    $mediciones_referencias[$med->id] = $valor_referencia_medicion->Find_joined("id_medicion=$med->id");
                    foreach ($mediciones_referencias[$med->id] as $valores_referencia_medicion)
                    {
                        //Es la referencia Límite
                        if (strpos($valores_referencia_medicion->valor_referencia->nombre, 'mite') !== false)
                        {
                            $medicion_lim[$indicador->id][$med->id] = $valores_referencia_medicion->valor;
                        }
                        //Es la referencia Meta
                        if (strpos($valores_referencia_medicion->valor_referencia->nombre, 'eta') !== false)
                        {
                            $medicion_obj[$indicador->id][$med->id] = $valores_referencia_medicion->valor;
                        }
                    }
                }
            }
        }
    }
    $smarty->assign('indicadores', $indicadores);
    $smarty->assign('mediciones', $mediciones);
    $smarty->assign('medicion_lim', $medicion_lim);
    $smarty->assign('medicion_obj', $medicion_obj);
}

$smarty->assign("modulo", $modulo);
$smarty->assign("entidad", $entidad);
$smarty->assign("fecha", $fecha);
$smarty->assign('_javascript', array('control'));
$smarty->assign("_nombre_pagina", TXT_CONTROL . ": " . $entidad->nombre);
$plantilla = "unidades/control.tpl";
