<?php

//------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: medicion_actualizar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//------------------------------------------------------------------------------
// Controlador que actualiza los valores de una medicion para 
// indicadores/datos calculados
//------------------------------------------------------------------------------

global $smarty;
global $usuario;
global $plantilla;
//Variable para operar con Indicadores/Datos
$logicaIndicador = new LogicaIndicador();

if (filter_has_var(INPUT_GET, 'id_entidad') && filter_has_var(INPUT_GET, 'id_medicion') && filter_has_var(INPUT_GET, 'tipo'))
{
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $id_medicion = filter_input(INPUT_GET, 'id_medicion', FILTER_SANITIZE_NUMBER_INT);
    $tipo = filter_input(INPUT_GET, 'tipo', FILTER_SANITIZE_STRING);
    $medicion = new Medicion();
    $medicion->load("id = $id_medicion");
    $indicador = new Indicador();
    $indicador->load("id = $medicion->id_indicador");

    //Si el indicador/dato es no agregado
    if ($indicador->id_tipo_agregacion == 0)
    {
        $logicaIndicador->actualizar_valor($indicador, $medicion->etiqueta, $id_entidad);
    }
    //El indicador/dato es agregado
    else
    {
        //Calculamos subunidades del indicador y actualizamos valores para cada
        //una de ellas
        $indicador_subunidad = new Indicador_subunidad();
        $indicador_subunidades = $indicador_subunidad->Find_entidades("id_indicador = $indicador->id");
        foreach ($indicador_subunidades as $ind_sub)
        {
            $logicaIndicador->actualizar_valor($indicador, $medicion->etiqueta, $ind_sub->id_entidad);
        }
    }
    $exito = MSG_VALS_CALCULADOS; //Cambiar texto
    header("location:index.php?page=medicion&id_medicion=$medicion->id&id_entidad=$indicador->id_entidad&tipo=$tipo&exito=$exito");
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
