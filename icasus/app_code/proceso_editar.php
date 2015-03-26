<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: proceso_editar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Modifica procesos existentes
//--------------------------------------------------------------------------------------------------- 
global $smarty;
global $plantilla;

// Para empezar a hablar necesitamos el id del proceso              
if (filter_has_var(INPUT_GET, 'id_proceso') && filter_has_var(INPUT_GET, 'id_entidad'))
{
    $id_proceso = filter_input(INPUT_GET, 'id_proceso', FILTER_SANITIZE_NUMBER_INT);
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $entidad = new Entidad();
    $entidad->load("id = $id_entidad");

    // Si vienen todos los datos necesarios del formulario grabamos
    if (filter_has_var(INPUT_POST, 'nombre') && filter_has_var(INPUT_POST, 'codigo'))
    {
        $proceso = new Proceso();
        $proceso->load("id = $id_proceso");
        $proceso->id_madre = filter_has_var(INPUT_POST, 'madre') ? filter_input(INPUT_POST, 'madre', FILTER_SANITIZE_NUMBER_INT) : 0;
        $proceso->codigo = filter_has_var(INPUT_POST, 'codigo') ? filter_input(INPUT_POST, 'codigo', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
        $proceso->revision = filter_has_var(INPUT_POST, 'revision') ? filter_input(INPUT_POST, 'revision', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
        $fecha = filter_has_var(INPUT_POST, 'fecha_revision') ? filter_input(INPUT_POST, 'fecha_revision', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
        $fecha = explode("/", $fecha);
        $fecha = $fecha[2] . "/" . $fecha[1] . "/" . $fecha[0];
        $proceso->fecha_revision = $fecha;
        $proceso->nombre = filter_has_var(INPUT_POST, 'nombre') ? filter_input(INPUT_POST, 'nombre', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
        $proceso->alcance = filter_has_var(INPUT_POST, 'alcance') ? filter_input(INPUT_POST, 'alcance', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
        $proceso->mision = filter_has_var(INPUT_POST, 'mision') ? filter_input(INPUT_POST, 'mision', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
        $proceso->resultados_clave = filter_has_var(INPUT_POST, 'resultados_clave') ? filter_input(INPUT_POST, 'resultados_clave', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
        $proceso->entradas = filter_has_var(INPUT_POST, 'entradas') ? filter_input(INPUT_POST, 'entradas', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
        $proceso->proveedores = filter_has_var(INPUT_POST, 'proveedores') ? filter_input(INPUT_POST, 'proveedores', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
        $proceso->salidas = filter_has_var(INPUT_POST, 'salidas') ? filter_input(INPUT_POST, 'salidas', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
        $proceso->clientes = filter_has_var(INPUT_POST, 'clientes') ? filter_input(INPUT_POST, 'clientes', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
        $proceso->actividades = filter_has_var(INPUT_POST, 'actividades') ? filter_input(INPUT_POST, 'actividades', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
        $proceso->documentacion = filter_has_var(INPUT_POST, 'documentacion') ? filter_input(INPUT_POST, 'documentacion', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
        $proceso->mediciones = filter_has_var(INPUT_POST, 'mediciones') ? filter_input(INPUT_POST, 'mediciones', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
        $proceso->registros = filter_has_var(INPUT_POST, 'registros') ? filter_input(INPUT_POST, 'registros', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
        $proceso->observaciones = filter_has_var(INPUT_POST, 'observaciones') ? filter_input(INPUT_POST, 'observaciones', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
        $proceso->equipo_de_proceso = filter_has_var(INPUT_POST, 'equipo_de_proceso') ? filter_input(INPUT_POST, 'equipo_de_proceso', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
        $proceso->variables_control = filter_has_var(INPUT_POST, 'variables_control') ? filter_input(INPUT_POST, 'variables_control', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
        $proceso->id_propietario = filter_has_var(INPUT_POST, 'id_propietario') ? filter_input(INPUT_POST, 'id_propietario', FILTER_SANITIZE_NUMBER_INT) : null;

        if ($proceso->save())
        {
            header("Location: index.php?page=proceso_mostrar&id_proceso=$id_proceso&id_entidad=$id_entidad");
        }
        else
        {
            $error = ERR_PROC_GRABAR;
            header("location:index.php?error=$error");
        }
    }
    // Si no vienen datos mostramos el formulario
    else
    {
        $proceso = new Proceso();
        $proceso->load_joined("id = $id_proceso");
        $smarty->assign('proceso', $proceso);

        $usuario_entidad = new Usuario_entidad();
        $usuarios_entidad = $usuario_entidad->Find_usuarios("id_entidad = $id_entidad");
        $smarty->assign('usuarios_entidad', $usuarios_entidad);

        $proceso_madre = new Proceso();
        $procesos_madre = $proceso_madre->Find("id_entidad = $id_entidad AND id <> $id_proceso");
        $smarty->assign('procesos_madre', $procesos_madre);

        $smarty->assign("entidad", $entidad);
        $smarty->assign('_nombre_pagina', TXT_PROC_EDIT . ": " . $proceso->nombre);
        $plantilla = "proceso_editar.tpl";
    }
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}

