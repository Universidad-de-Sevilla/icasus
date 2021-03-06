<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: procesos/proceso_grabar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Graba un nuevo proceso en la base de datos comprobando que el código no se 
// encuentre repetido
//---------------------------------------------------------------------------------------------------
// Si vienen todos los datos necesarios del formulario grabamos     
if (filter_has_var(INPUT_POST, 'alcance') && filter_has_var(INPUT_POST, 'nombre') && filter_has_var(INPUT_POST, 'codigo') && filter_has_var(INPUT_POST, 'id_propietario') && filter_has_var(INPUT_POST, 'madre'))
{
    $proceso = new Proceso();
    $proceso->id_madre = filter_has_var(INPUT_POST, 'madre') ? filter_input(INPUT_POST, 'madre', FILTER_SANITIZE_NUMBER_INT) : 0;
    $proceso->id_cuadro = filter_has_var(INPUT_POST, 'cuadro') ? filter_input(INPUT_POST, 'cuadro', FILTER_SANITIZE_NUMBER_INT) : 0;
    $proceso->codigo = filter_has_var(INPUT_POST, 'codigo') ? filter_input(INPUT_POST, 'codigo', FILTER_SANITIZE_STRING) : null;
    $proceso->revision = filter_has_var(INPUT_POST, 'revision') ? filter_input(INPUT_POST, 'revision', FILTER_SANITIZE_STRING) : null;
    $fecha = filter_has_var(INPUT_POST, 'fecha_revision') ? filter_input(INPUT_POST, 'fecha_revision', FILTER_SANITIZE_STRING) : null;
    $fecha = explode("/", $fecha);
    $fecha = $fecha[2] . "/" . $fecha[1] . "/" . $fecha[0];
    $proceso->fecha_revision = $fecha;
    $proceso->nombre = filter_has_var(INPUT_POST, 'nombre') ? filter_input(INPUT_POST, 'nombre', FILTER_SANITIZE_STRING) : null;
    $proceso->alcance = filter_has_var(INPUT_POST, 'alcance') ? filter_input(INPUT_POST, 'alcance', FILTER_SANITIZE_STRING) : null;
    $proceso->mision = filter_has_var(INPUT_POST, 'mision') ? filter_input(INPUT_POST, 'mision', FILTER_SANITIZE_STRING) : null;
    $proceso->equipo_de_proceso = filter_has_var(INPUT_POST, 'equipo_de_proceso') ? filter_input(INPUT_POST, 'equipo_de_proceso', FILTER_SANITIZE_STRING) : null;
    $proceso->resultados_clave = filter_has_var(INPUT_POST, 'resultados_clave') ? filter_input(INPUT_POST, 'resultados_clave', FILTER_SANITIZE_STRING) : null;
    $proceso->entradas = filter_has_var(INPUT_POST, 'entradas') ? filter_input(INPUT_POST, 'entradas', FILTER_SANITIZE_STRING) : null;
    $proceso->salidas = filter_has_var(INPUT_POST, 'salidas') ? filter_input(INPUT_POST, 'salidas', FILTER_SANITIZE_STRING) : null;
    $proceso->actividades = filter_has_var(INPUT_POST, 'actividades') ? filter_input(INPUT_POST, 'actividades', FILTER_SANITIZE_STRING) : null;
    $proceso->variables_control = filter_has_var(INPUT_POST, 'variables_control') ? filter_input(INPUT_POST, 'variables_control', FILTER_SANITIZE_STRING) : null;
    $proceso->documentacion = filter_has_var(INPUT_POST, 'documentacion') ? filter_input(INPUT_POST, 'documentacion', FILTER_SANITIZE_STRING) : null;
    $proceso->mediciones = filter_has_var(INPUT_POST, 'mediciones') ? filter_input(INPUT_POST, 'mediciones', FILTER_SANITIZE_STRING) : null;
    $proceso->registros = filter_has_var(INPUT_POST, 'registros') ? filter_input(INPUT_POST, 'registros', FILTER_SANITIZE_STRING) : null;
    $proceso->observaciones = filter_has_var(INPUT_POST, 'observaciones') ? filter_input(INPUT_POST, 'observaciones', FILTER_SANITIZE_STRING) : null;
    $proceso->id_propietario = filter_has_var(INPUT_POST, 'id_propietario') ? filter_input(INPUT_POST, 'id_propietario', FILTER_SANITIZE_NUMBER_INT) : null;
    $id_entidad = filter_has_var(INPUT_POST, 'id_entidad') ? filter_input(INPUT_POST, 'id_entidad', FILTER_SANITIZE_NUMBER_INT) : null;
    $proceso->id_entidad = $id_entidad;

    if ($proceso->save())
    {
        $exito = MSG_PROC_GRABAR;
        header("Location:index.php?page=proceso_mostrar&id_proceso=$proceso->id&id_entidad=$id_entidad&exito=$exito");
    }
    else
    {
        $error = ERR_PROC_GRABAR;
        header("Location:index.php?page=proceso_listar&id_entidad=$id_entidad&error=$error");
    }
}
// Si no vienen datos mostramos el formulario
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
