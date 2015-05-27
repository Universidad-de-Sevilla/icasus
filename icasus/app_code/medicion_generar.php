<?php

//------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: medicion_generar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//------------------------------------------------------------------------------
// Genera las mediciones de un Indicador/Dato para el año actual en 
// función de su periodicidad
//------------------------------------------------------------------------------

global $smarty;
global $usuario;
global $plantilla;
//Variable para operar con Indicadores/Datos
$logicaIndicador = new LogicaIndicador();

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
        $permiso_generar = true;
    }
    else
    {
        $permiso_generar = false;
    }

    if ($permiso_generar)
    {
        //Generamos mediciones en función de la Periodicidad y 
        //el Histórico del Indicador/Dato
        $logicaIndicador->generar_mediciones($indicador, $tipo);
    }
    else
    {
        // El usuario no tiene permisos avisamos error
        $error = ERR_MED_AUT . " $tipo";
        header("Location:index.php?page=" . $tipo . "_mostrar&id_$tipo=$id_indicador&error=$error");
    }
}
else
{
    $error = "$tipo " . ERR_MED_TIPO_NO_BD;
    header("location:index.php?error=$error");
}
