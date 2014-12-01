<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: proceso_editar.php
//---------------------------------------------------------------------------------------------------
// Descripcion: Modifica procesos existentes
//--------------------------------------------------------------------------------------------------- 
global $smarty;
global $plantilla;

// Para empezar a hablar necesitamos el id del proceso              
//if (isset($_REQUEST['id_proceso']) && isset($_REQUEST['id_entidad']))
if (filter_has_var(INPUT_POST, 'id_proceso') && filter_has_var(INPUT_POST, 'id_entidad'))
{
//    $id_proceso = sanitize($_REQUEST['id_proceso'], 16);
    $id_proceso = filter_input(INPUT_POST, 'id_proceso', FILTER_SANITIZE_NUMBER_INT);
//    $id_entidad = sanitize($_REQUEST['id_entidad'], 16);
    $id_entidad = filter_input(INPUT_POST, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $entidad = new Entidad();
    $entidad->load("id = $id_entidad");

    // Si vienen todos los datos necesarios del formulario grabamos
//    if (isset($_POST['nombre']) && isset($_POST['codigo']))
    if (filter_has_var(INPUT_POST, 'nombre') && filter_has_var(INPUT_POST, 'codigo'))
    {
        $proceso = new Proceso();
        $proceso->load("id = $id_proceso");
//        $proceso->id_madre = isset($_POST['madre']) ? sanitize($_POST['madre'], 2) : 0;
        $proceso->id_madre = filter_has_var(INPUT_POST, 'madre') ? filter_input(INPUT_POST, 'madre', FILTER_SANITIZE_NUMBER_INT) : 0;
//        $proceso->codigo = isset($_POST['codigo']) ? sanitize($_POST['codigo'], 2) : null;
        $proceso->codigo = filter_has_var(INPUT_POST, 'codigo') ? filter_input(INPUT_POST, 'codigo', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
//        $proceso->revision = isset($_POST['revision']) ? sanitize($_POST['revision'], 2) : null;
        $proceso->revision = filter_has_var(INPUT_POST, 'revision') ? filter_input(INPUT_POST, 'revision', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
//        $fecha = isset($_POST['fecha_revision']) ? sanitize($_POST['fecha_revision'], SQL) : null;
        $fecha = filter_has_var(INPUT_POST, 'fecha_revision') ? filter_input(INPUT_POST, 'fecha_revision', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
        $fecha = explode("/", $fecha);
        $fecha = $fecha[2] . "/" . $fecha[1] . "/" . $fecha[0];
        $proceso->fecha_revision = $fecha;
//        $proceso->nombre = isset($_POST['nombre']) ? sanitize($_POST['nombre'], 2) : null;
        $proceso->nombre = filter_has_var(INPUT_POST, 'nombre') ? filter_input(INPUT_POST, 'nombre', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
//        $proceso->alcance = isset($_POST['alcance']) ? sanitize($_POST['alcance'], 2) : null;
        $proceso->alcance = filter_has_var(INPUT_POST, 'alcance') ? filter_input(INPUT_POST, 'alcance', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
//        $proceso->mision = isset($_POST['mision']) ? sanitize($_POST['mision'], 2) : null;
        $proceso->mision = filter_has_var(INPUT_POST, 'mision') ? filter_input(INPUT_POST, 'mision', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
//        $proceso->resultados_clave = isset($_POST['resultados_clave']) ? sanitize($_POST['resultados_clave'], 2) : null;
        $proceso->resultados_clave = filter_has_var(INPUT_POST, 'resultados_clave') ? filter_input(INPUT_POST, 'resultados_clave', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
//        $proceso->entradas = isset($_POST['entradas']) ? sanitize($_POST['entradas'], 2) : null;
        $proceso->entradas = filter_has_var(INPUT_POST, 'entradas') ? filter_input(INPUT_POST, 'entradas', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
//        $proceso->proveedores = isset($_POST['proveedores']) ? sanitize($_POST['proveedores'], 2) : null;
        $proceso->proveedores = filter_has_var(INPUT_POST, 'proveedores') ? filter_input(INPUT_POST, 'proveedores', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
//        $proceso->salidas = isset($_POST['salidas']) ? sanitize($_POST['salidas'], 2) : null;
        $proceso->salidas = filter_has_var(INPUT_POST, 'salidas') ? filter_input(INPUT_POST, 'salidas', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
//        $proceso->clientes = isset($_POST['clientes']) ? sanitize($_POST['clientes'], 2) : null;
        $proceso->clientes = filter_has_var(INPUT_POST, 'clientes') ? filter_input(INPUT_POST, 'clientes', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
//        $proceso->actividades = isset($_POST['actividades']) ? sanitize($_POST['actividades'], 2) : null;
        $proceso->actividades = filter_has_var(INPUT_POST, 'actividades') ? filter_input(INPUT_POST, 'actividades', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
//        $proceso->documentacion = isset($_POST['documentacion']) ? sanitize($_POST['documentacion'], 2) : null;
        $proceso->documentacion = filter_has_var(INPUT_POST, 'documentacion') ? filter_input(INPUT_POST, 'documentacion', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
//        $proceso->mediciones = isset($_POST['mediciones']) ? sanitize($_POST['mediciones'], 2) : null;
        $proceso->mediciones = filter_has_var(INPUT_POST, 'mediciones') ? filter_input(INPUT_POST, 'mediciones', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
//        $proceso->registros = isset($_POST['registros']) ? sanitize($_POST['registros'], 2) : null;
        $proceso->registros = filter_has_var(INPUT_POST, 'registros') ? filter_input(INPUT_POST, 'registros', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
//        $proceso->equipo_de_proceso = isset($_POST['equipo_de_proceso']) ? sanitize($_POST['equipo_de_proceso'], 2) : null;
        $proceso->equipo_de_proceso = filter_has_var(INPUT_POST, 'equipo_de_proceso') ? filter_input(INPUT_POST, 'equipo_de_proceso', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
//        $proceso->variables_control = isset($_POST['variables_control']) ? sanitize($_POST['variables_control'], 2) : null;
        $proceso->variables_control = filter_has_var(INPUT_POST, 'variables_control') ? filter_input(INPUT_POST, 'variables_control', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
//        $proceso->id_propietario = isset($_POST['id_propietario']) ? sanitize($_POST['id_propietario'], 2) : null;
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

