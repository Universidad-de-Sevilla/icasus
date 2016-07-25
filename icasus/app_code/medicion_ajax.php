<?php

//------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: medicion_ajax.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//------------------------------------------------------------------------------
// Controlador que devuelve todas las peticiones que se hacen desde
// medicion.tpl en ajax
//------------------------------------------------------------------------------

global $smarty;
global $usuario;
global $plantilla;
//Variables para operar con Indicadores/Datos
$logicaIndicador = new LogicaIndicador();
$logicaMedicion = new LogicaMedicion();

$modulo = filter_input(INPUT_GET, 'modulo', FILTER_SANITIZE_STRING);
$medicion = new Medicion();
$indicador = new Indicador();
$valor = new Valor();
$valor_referencia_medicion = new Valor_referencia_medicion();
$indicador_subunidad = new Indicador_subunidad();
$entidad = new Entidad();

//valores que se definen como filas --------------------------------------------
if ($modulo == 'anularvalor')
{
    $id_valor = filter_input(INPUT_POST, 'id_valor', FILTER_SANITIZE_NUMBER_INT);
    $valor->load("id = $id_valor");
    $valor->valor = NULL;
    $valor->valor_parcial = NULL;
    $valor->id_usuario = NULL;
    $valor->fecha_recogida = NULL;
    $valor->save();

    //Chequeamos indicadores dependientes para el cálculo automático
    $medicion->load("id=$valor->id_medicion");
    $logicaIndicador->actualizar_valor_indicadores_calculados($medicion->id_indicador, $medicion->etiqueta, $valor->id_entidad);
}

if ($modulo == 'grabarfila')
{
    $valor_parcial = filter_input(INPUT_POST, 'valor', FILTER_SANITIZE_NUMBER_FLOAT, FILTER_FLAG_ALLOW_FRACTION);
    $id_valor = filter_input(INPUT_POST, 'id_valor', FILTER_SANITIZE_NUMBER_INT);
    $valor->load("id = $id_valor");
    $valor->valor_parcial = $valor_parcial;
    $valor->valor = $valor_parcial;
    $valor->id_usuario = $usuario->id;
    $valor->fecha_recogida = date("Y-m-d");
    $valor->save();

    //Chequeamos indicadores dependientes para el cálculo automático
    $medicion->load("id=$valor->id_medicion");
    $logicaIndicador->actualizar_valor_indicadores_calculados($medicion->id_indicador, $medicion->etiqueta, $valor->id_entidad);
}

if ($modulo == 'editarfila')
{
    $id_medicion = filter_input(INPUT_GET, 'id_medicion', FILTER_SANITIZE_NUMBER_INT);

    $id_valor = filter_input(INPUT_GET, 'id_valor', FILTER_SANITIZE_NUMBER_INT);
    $smarty->assign("valor_edit", $id_valor);
    $smarty->assign("usuario", $usuario);

    $medicion->load("id = $id_medicion");
    $smarty->assign("medicion", $medicion);

    $indicador->load("id = $medicion->id_indicador");
    $smarty->assign("indicador", $indicador);

    $entidad->load("id = $indicador->id_entidad");
    $smarty->assign('entidad', $entidad);

    $valores = $valor->Find_joined_jjmc($id_medicion, $usuario->id);
    $smarty->assign("valores", $valores);

    $smarty->assign("modulo", "editarfila");
    $plantilla = 'medicion_ajax.tpl';

    //Calculamos el total si la medición de Indicador/Dato se divide en subunidades
    $total = $logicaIndicador->calcular_total($indicador, $valores, $medicion->etiqueta);
    $tipo_agregacion = new Tipo_agregacion();
    $tipo_agregacion->Load("id=$indicador->id_tipo_agregacion");
    $smarty->assign("agregacion", $tipo_agregacion->descripcion);
    $smarty->assign("total", $total);
}
if ($modulo == 'cancelarfila')
{
    $id_medicion = filter_input(INPUT_GET, 'id_medicion', FILTER_SANITIZE_NUMBER_INT);
    $smarty->assign("medicion_edit", $id_medicion);
    $smarty->assign("usuario", $usuario);

    $medicion->load("id = $id_medicion");
    $smarty->assign("medicion", $medicion);

    $indicador->load("id = $medicion->id_indicador");
    $smarty->assign("indicador", $indicador);

    $entidad->load("id = $indicador->id_entidad");
    $smarty->assign('entidad', $entidad);

    $valores = $valor->Find_joined_jjmc($id_medicion, $usuario->id);
    $smarty->assign("valores", $valores);

    $smarty->assign("modulo", "cancelarfila");
    $plantilla = 'medicion_ajax.tpl';

    //Calculamos el total si la medición de Indicador/Dato se divide en subunidades
    $total = $logicaIndicador->calcular_total($indicador, $valores, $medicion->etiqueta);
    $tipo_agregacion = new Tipo_agregacion();
    $tipo_agregacion->Load("id=$indicador->id_tipo_agregacion");
    $smarty->assign("agregacion", $tipo_agregacion->descripcion);
    $smarty->assign("total", $total);
}
//etiquetas y fechas -----------------------------------------------------------
if ($modulo == 'grabaretiqueta')
{
    $valor = filter_input(INPUT_POST, 'valor', FILTER_SANITIZE_STRING);
    $contenedor = filter_input(INPUT_POST, 'contenedor', FILTER_SANITIZE_STRING);
    $id_medicion = filter_input(INPUT_POST, 'id_medicion', FILTER_SANITIZE_NUMBER_INT);
    $medicion->load("id = $id_medicion");
    if ($contenedor == 'et')
    {
        $medicion->etiqueta = $valor;
    }
    else if ($contenedor == 'pi')
    {
        $medicion->periodo_inicio = $valor;
    }
    else if ($contenedor == 'pf')
    {
        $medicion->periodo_fin = $valor;
    }
    else if ($contenedor == 'gi')
    {
        $medicion->grabacion_inicio = $valor;
    }
    else if ($contenedor == 'gf')
    {
        $medicion->grabacion_fin = $valor;
    }
    $medicion->save();
}

if ($modulo == 'grabarobservaciones')
{
    $valor = filter_input(INPUT_POST, 'valor', FILTER_SANITIZE_STRING);
    $contenedor = filter_input(INPUT_POST, 'contenedor', FILTER_SANITIZE_STRING);
    $id_medicion = filter_input(INPUT_POST, 'id_medicion', FILTER_SANITIZE_NUMBER_INT);
    $medicion->load("id = $id_medicion");
    if ($contenedor == 'ob')
    {
        $medicion->observaciones = $valor;
    }
    else if ($contenedor == 'pi')
    {
        $medicion->periodo_inicio = $valor;
    }
    else if ($contenedor == 'pf')
    {
        $medicion->periodo_fin = $valor;
    }
    else if ($contenedor == 'gi')
    {
        $medicion->grabacion_inicio = $valor;
    }
    else if ($contenedor == 'gf')
    {
        $medicion->grabacion_fin = $valor;
    }
    $medicion->save();
}

if ($modulo == 'editaretiqueta')
{
    $id_medicion = filter_input(INPUT_GET, 'id_medicion', FILTER_SANITIZE_NUMBER_INT);
    $contenedor = filter_input(INPUT_GET, 'contenedor', FILTER_SANITIZE_STRING);
    $smarty->assign("contenedor", $contenedor);
    $medicion->load("id = $id_medicion");
    $smarty->assign("medicion", $medicion);
    if ($contenedor == 'pi' OR $contenedor == 'pf' OR $contenedor == 'gi' OR $contenedor == 'gf')
    {
        $smarty->assign("modulo", "editarfecha");
    }
    else
    {
        $smarty->assign("modulo", "editaretiqueta");
    }
    $plantilla = 'medicion_ajax.tpl';
}

if ($modulo == 'editarobservaciones')
{
    $id_medicion = filter_input(INPUT_GET, 'id_medicion', FILTER_SANITIZE_NUMBER_INT);
    $contenedor = filter_input(INPUT_GET, 'contenedor', FILTER_SANITIZE_STRING);
    $smarty->assign("contenedor", $contenedor);
    $medicion->load("id = $id_medicion");
    $smarty->assign("medicion", $medicion);
    if ($contenedor == 'pi' OR $contenedor == 'pf' OR $contenedor == 'gi' OR $contenedor == 'gf')
    {
        $smarty->assign("modulo", "editarfecha");
    }
    else
    {
        $smarty->assign("modulo", "editarobservaciones");
    }
    $plantilla = 'medicion_ajax.tpl';
}

if ($modulo == 'cancelaretiqueta')
{
    $id_medicion = filter_input(INPUT_GET, 'id_medicion', FILTER_SANITIZE_NUMBER_INT);
    $contenedor = filter_input(INPUT_GET, 'contenedor', FILTER_SANITIZE_STRING);
    $medicion->load("id = $id_medicion");
    $smarty->assign('medicion', $medicion);
    $smarty->assign('contenedor', $contenedor);
    $smarty->assign("modulo", "cancelaretiqueta");
    $plantilla = 'medicion_ajax.tpl';
}

if ($modulo == 'cancelarobservaciones')
{
    $id_medicion = filter_input(INPUT_GET, 'id_medicion', FILTER_SANITIZE_NUMBER_INT);
    $contenedor = filter_input(INPUT_GET, 'contenedor', FILTER_SANITIZE_STRING);
    $medicion->load("id = $id_medicion");
    $smarty->assign('medicion', $medicion);
    $smarty->assign('contenedor', $contenedor);
    $smarty->assign("modulo", "cancelarobservaciones");
    $plantilla = 'medicion_ajax.tpl';
}

// valores de referencia ---------------------------------------------------------
if ($modulo == 'anularvalorreferencia')
{
    $id_referencia = filter_input(INPUT_POST, 'id_referencia', FILTER_SANITIZE_NUMBER_INT);
    $valor_referencia_medicion->load("id = $id_referencia");
    $valor_referencia_medicion->valor = NULL;
    $valor_referencia_medicion->save();
}

if ($modulo == 'grabarvalorreferencia')
{
    $id_referencia = filter_input(INPUT_POST, 'id_referencia', FILTER_SANITIZE_NUMBER_INT);
    $valor = filter_input(INPUT_POST, 'valor', FILTER_VALIDATE_FLOAT);
    $valor_referencia_medicion->load("id =$id_referencia");
    $valor_referencia_medicion->valor = $valor;
    $valor_referencia_medicion->save();
}

if ($modulo == 'cancelarvalorreferencia')
{
    $id_medicion = filter_input(INPUT_GET, 'id_medicion', FILTER_SANITIZE_NUMBER_INT);
    $id_referencia = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);
    $medicion->load("id = $id_medicion");
    $valor_referencia_medicion->load("id = $id_referencia");
    $smarty->assign("medicion", $medicion);
    $smarty->assign("valor_referencia_medicion", $valor_referencia_medicion);
    $smarty->assign("modulo", "cancelarvalorreferencia");
    $plantilla = 'medicion_ajax.tpl';
}

if ($modulo == 'editarvalorreferencia')
{
    $id_medicion = filter_input(INPUT_GET, 'id_medicion', FILTER_SANITIZE_NUMBER_INT);
    $id_referencia = filter_input(INPUT_GET, 'id_referencia', FILTER_SANITIZE_NUMBER_INT);
    $medicion->load("id = $id_medicion");
    $valor_referencia_medicion->load("id = $id_referencia");
    $smarty->assign("medicion", $medicion);
    $smarty->assign("referencia", $valor_referencia_medicion);
    $smarty->assign("modulo", "editarvalorreferencia");
    $plantilla = 'medicion_ajax.tpl';
}

//Gráfico de tarta
if ($modulo == 'grafica')
{
    $id_medicion = filter_input(INPUT_GET, 'id_medicion', FILTER_SANITIZE_NUMBER_INT);
    $medicion->load("id = $id_medicion");
    $indicador->load("id = $medicion->id_indicador");
    $valores = $valor->Find_joined_jjmc($id_medicion, $usuario->id);

    //Prepara el gráfico de tarta si hay valores
    $pinta_grafico = false;
    if ($valores)
    {
        foreach ($valores as $val)
        {
            if ($val->valor != null)
            {
                $pinta_grafico = true;
            }
        }
        if ($pinta_grafico)
        {
            $panel = new Panel();
            $panel->nombre = TXT_VALS_SUBUNID;
            $smarty->assign("panel", $panel);
        }
    }

    //Calculamos el total si la medición de Indicador/Dato se divide en subunidades
    $total = $logicaIndicador->calcular_total($indicador, $valores, $medicion->etiqueta);
    $tipo_agregacion = new Tipo_agregacion();
    $tipo_agregacion->Load("id=$indicador->id_tipo_agregacion");
    $smarty->assign("agregacion", $tipo_agregacion->descripcion);
    $smarty->assign("total", $total);

    $smarty->assign("modulo", "grafica");
    $smarty->assign("indicador", $indicador);
    $smarty->assign('medicion', $medicion);
    $smarty->assign("pinta_grafico", $pinta_grafico);
    $plantilla = 'medicion_ajax.tpl';
}

//Buscar todos valores ref del indicador y recorrer si no existe entrada 
//en la tabla valores_ref _med creamos entrada y despues asignamos a la plantilla
$valor_referencia = new Valor_referencia();
$valores_referencia = $valor_referencia->Find("id_indicador = $indicador->id");
if ($valores_referencia)
{
    foreach ($valores_referencia as $valor_referencia)
    {
        $existe = $valor_referencia_medicion->Load("id_valor_referencia=$valor_referencia->id AND id_medicion=$id_medicion");
        if (!$existe)
        {
            $valor_referencia_medicion = new Valor_referencia_medicion();
            $valor_referencia_medicion->id_valor_referencia = $valor_referencia->id;
            $valor_referencia_medicion->id_medicion = $id_medicion;
            $valor_referencia_medicion->save();
        }
    }
    $valores_referencia_medicion = $valor_referencia_medicion->Find_joined("id_medicion = $id_medicion");
    $smarty->assign("valores_referencia_medicion", $valores_referencia_medicion);

    //Control (Status) de valores límite y metas
    $medicion_lim = null;
    $medicion_obj = null;
    if ($valores_referencia_medicion)
    {
        foreach ($valores_referencia_medicion as $med_ref)
        {
            //Es la referencia Límite
            if (strpos($med_ref->valor_referencia->nombre, 'mite'))
            {
                $medicion_lim = $med_ref->valor;
                $smarty->assign('medicion_lim', $medicion_lim);
            }
            //Es la referencia Meta
            if (strpos($med_ref->valor_referencia->nombre, 'eta'))
            {
                $medicion_obj = $med_ref->valor;
                $smarty->assign('medicion_obj', $medicion_obj);
            }
        }
        $status = $logicaMedicion->calcular_status_medicion($indicador->inverso, $total, $medicion_lim, $medicion_obj);
        $smarty->assign('status', $status);
    }
}
