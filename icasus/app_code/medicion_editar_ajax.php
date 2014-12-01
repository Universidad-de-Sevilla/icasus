<?php

//------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: medicion_editar_ajax.php
//------------------------------------------------------------------------------
// Controlador que devuelve todas las peticiones que se hacen desde
// medicion_editar.tpl en ajax
//------------------------------------------------------------------------------
global $smarty;
global $usuario;
global $plantilla;

//$modulo = sanitize($_REQUEST["modulo"], SQL);
$modulo = filter_input(INPUT_GET, 'modulo', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
$medicion = new Medicion();
$indicador = new Indicador();
$valor = new Valor();
$valor_referencia_medicion = new Valor_referencia_medicion();
$indicador_subunidad = new Indicador_subunidad();

//valores que se definen como filas --------------------------------------------
if ($modulo == 'anularvalor')
{
//    $id_valor = sanitize($_REQUEST["id_valor"], INT);
    $id_valor = filter_input(INPUT_GET, 'id_valor', FILTER_SANITIZE_NUMBER_INT);
    $valor->load("id = $id_valor");
    if ($valor->puede_grabarse($valor->id, $usuario->id))
    {
        $valor->valor = NULL;
        $valor->valor_parcial = NULL;
        $valor->id_usuario = $usuario->id;
        $valor->fecha_recogida = date("Y-m-d");
        $valor->save();
    }
}

if ($modulo == 'grabarfila')
{
//    $valor_parcial = sanitize($_REQUEST["valor"], FLOAT);
    $valor_parcial = filter_input(INPUT_GET, 'id_valor', FILTER_SANITIZE_NUMBER_FLOAT);
//    $id_valor = sanitize($_REQUEST["id_valor"], INT);
    $id_valor = filter_input(INPUT_GET, 'id_valor', FILTER_SANITIZE_NUMBER_INT);
    $valor->load("id = $id_valor");
    if ($valor->puede_grabarse($valor->id, $usuario->id))
    {
        //la función calcular calcula y graba el valor final y el parcial en el objeto $valor
        $valor->calcular($id_valor, $valor_parcial);
        $valor->valor_parcial = $valor_parcial;
        $valor->id_usuario = $usuario->id;
        $valor->fecha_recogida = date("Y-m-d");
        $valor->save();
    }
    //TODO: que pasa si no puede grabar por falta de permisos
}
if ($modulo == 'editarfila')
{
//    $id_medicion = sanitize($_REQUEST["id_medicion"], INT);
    $id_medicion = filter_input(INPUT_GET, 'id_medicion', FILTER_SANITIZE_NUMBER_INT);
//    $id_valor = sanitize($_REQUEST["id_valor"], INT);
    $id_valor = filter_input(INPUT_GET, 'id_valor', FILTER_SANITIZE_NUMBER_INT);
    $smarty->assign("valor_edit", $id_valor);
    $smarty->assign("usuario", $usuario);

    $medicion->load("id = $id_medicion");
    $smarty->assign("medicion", $medicion);

    $indicador->load("id = $medicion->id_indicador");
    $smarty->assign("indicador", $indicador);

    $valores = $valor->Find_joined_jjmc($id_medicion, $usuario->id);
    $smarty->assign("valores", $valores);

    $smarty->assign("modulo", "editarfila");
    $plantilla = 'medicion_editar_ajax.tpl';
}
if ($modulo == 'cancelarfila')
{
//    $id_medicion = sanitize($_REQUEST["id_medicion"], INT);
    $id_medicion = filter_input(INPUT_GET, 'id_medicion', FILTER_SANITIZE_NUMBER_INT);
    $smarty->assign("medicion_edit", $id_medicion);
    $smarty->assign("usuario", $usuario);

    $medicion->load("id = $id_medicion");
    $smarty->assign("medicion", $medicion);

    $indicador->load("id = $medicion->id_indicador");
    $smarty->assign("indicador", $indicador);

    $valores = $valor->Find_joined_jjmc($id_medicion, $usuario->id);
    $smarty->assign("valores", $valores);

    $smarty->assign("modulo", "cancelarfila");
    $plantilla = 'medicion_editar_ajax.tpl';
}
//etiquetas y fechas -----------------------------------------------------------
if ($modulo == 'grabaretiqueta')
{
//    $valor = sanitize($_POST["valor"], SQL);
    $valor = filter_input(INPUT_POST, 'valor', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
//    $contenedor = sanitize($_POST["contenedor"], SQL);
    $contenedor = filter_input(INPUT_POST, 'contenedor', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
//    $id_medicion = sanitize($_POST["id_medicion"], INT);
    $id_medicion = filter_input(INPUT_POST, 'id_medicion', FILTER_SANITIZE_NUMBER_INT);
    $medicion->load("id = $id_medicion");
    if ($contenedor == 'et')
    {
        $medicion->etiqueta = $valor;
    }
    elseif ($contenedor == 'pi')
    {
        $medicion->periodo_inicio = $valor;
    }
    elseif ($contenedor == 'pf')
    {
        $medicion->periodo_fin = $valor;
    }
    elseif ($contenedor == 'gi')
    {
        $medicion->grabacion_inicio = $valor;
    }
    elseif ($contenedor == 'gf')
    {
        $medicion->grabacion_fin = $valor;
    }
    $medicion->save();
}
if ($modulo == 'editaretiqueta')
{
//    $id_medicion = sanitize($_REQUEST["id_medicion"], INT);
    $id_medicion = filter_input(INPUT_GET, 'id_medicion', FILTER_SANITIZE_NUMBER_INT);
//    $contenedor = sanitize($_REQUEST["contenedor"], SQL);
    $contenedor = filter_input(INPUT_GET, 'contenedor', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
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
    $plantilla = 'medicion_editar_ajax.tpl';
}
if ($modulo == 'cancelaretiqueta')
{
//    $id_medicion = sanitize($_REQUEST["id_medicion"], INT);
    $id_medicion = filter_input(INPUT_GET, 'id_medicion', FILTER_SANITIZE_NUMBER_INT);
//    $contenedor = sanitize($_REQUEST["contenedor"], SQL);
    $contenedor = filter_input(INPUT_GET, 'contenedor', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
    $medicion->load("id = $id_medicion");
    $smarty->assign('medicion', $medicion);
    $smarty->assign('contenedor', $contenedor);
    $smarty->assign("modulo", "cancelaretiqueta");
    $plantilla = 'medicion_editar_ajax.tpl';
}
// valores de referencia ---------------------------------------------------------
// TODO: comprobar permisos
if ($modulo == 'anularvalorreferencia')
{
//    $id_referencia = sanitize($_REQUEST["id_referencia"], INT);
    $id_referencia = filter_input(INPUT_GET, 'id_referencia', FILTER_SANITIZE_NUMBER_INT);
    $valor_referencia_medicion->load("id = $id_referencia");
    $valor_referencia_medicion->valor = NULL;
    $valor_referencia_medicion->save();
}

if ($modulo == 'grabarvalorreferencia')
{
//    $id_referencia = sanitize($_REQUEST["id_referencia"], 2);
    $id_referencia = filter_input(INPUT_GET, 'id_referencia', FILTER_SANITIZE_NUMBER_INT);
//    $valor = sanitize($_REQUEST["valor"], 2);
    $valor = filter_input(INPUT_POST, 'valor', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
    $valor_referencia_medicion->load("id =$id_referencia");
    $valor_referencia_medicion->valor = $valor;
    $valor_referencia_medicion->save();
}

if ($modulo == 'cancelarvalorreferencia')
{
//    $id_referencia = sanitize($_REQUEST["id"], INT);
    $id_referencia = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);
    $valor_referencia_medicion->load("id = $id_referencia");
    $smarty->assign("valor_referencia_medicion", $valor_referencia_medicion);
    $smarty->assign("modulo", "cancelarvalorreferencia");
    $plantilla = 'medicion_editar_ajax.tpl';
}

if ($modulo == 'editarvalorreferencia')
{
//    $id_referencia = sanitize($_REQUEST["id_referencia"], INT);
    $id_referencia = filter_input(INPUT_GET, 'id_referencia', FILTER_SANITIZE_NUMBER_INT);
    $valor_referencia_medicion->load("id = $id_referencia");
    $smarty->assign("referencia", $valor_referencia_medicion);
    $smarty->assign("modulo", "editarvalorreferencia");
    $plantilla = 'medicion_editar_ajax.tpl';
}
