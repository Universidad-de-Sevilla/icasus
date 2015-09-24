<?php

//------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: medicion_crear.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//------------------------------------------------------------------------------
// Muestra la interfaz para programar las mediciones que se van a realizar de manera 
// manual.
// Muestra un listado con la unidad y las subunidades para indicar las afectadas
//------------------------------------------------------------------------------
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
    $error = ERR_MED_CREAR;
    header("location:index.php?page=entidad_listar&error=$error");
}

$valor_referencia = new Valor_referencia();
$valores_referencia = $valor_referencia->Find("id_indicador = $id_indicador");

$smarty->assign("valores_referencia", $valores_referencia);

$indicador = new Indicador;
if ($indicador->load("id = $id_indicador"))
{
    $id_entidad = $indicador->id_entidad;

    //comprobar permisos para cambiar mediciones tanto para responsables del
    //indicador como de la medición o responsables de la unidad
    if ($control OR $indicador->id_responsable == $usuario->id
            OR $indicador->id_responsable_medicion == $usuario->id)
    {
        $permiso_crear = true;
    }
    else
    {
        $permiso_crear = false;
    }

    if ($permiso_crear)
    {
        $smarty->assign("indicador", $indicador);
        $smarty->assign("tipo", $tipo);
        $entidad = new Entidad;
        $entidad->load("id = $indicador->id_entidad");
        $smarty->assign("entidad", $entidad);
        $subunidades = $entidad->Find("id = $id_entidad OR id_madre = $id_entidad ORDER BY etiqueta");
        $smarty->assign('subunidades', $subunidades);
        $indicador_subunidad = new Indicador_subunidad();
        $indicador_subunidades = $indicador_subunidad->Find_entidades("id_indicador = $id_indicador");
        $smarty->assign("indicador_subunidades", $indicador_subunidades);
        $smarty->assign('_javascript', array('medicion_crear'));
        $smarty->assign("_nombre_pagina", TXT_MED_AGREGAR . ': ' . $indicador->nombre);
        $plantilla = "medicion_crear.tpl";
    }
    else
    {
        // El usuario no tiene permisos avisamos error
        $error = ERR_MED_AUT . " $tipo";
        header("Location:index.php?page=medicion_listar&id_$tipo=$id_indicador&id_entidad=$id_entidad&error=$error");
    }
}
else
{
    $error = "$tipo " . ERR_MED_TIPO_NO_BD;
    header("location:index.php?error=$error");
}
