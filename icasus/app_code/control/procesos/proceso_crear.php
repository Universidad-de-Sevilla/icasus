<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: procesos/proceso_crear.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Creación de nuevos procesos
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
//Variable para operar con Procesos
$logicaProceso = new LogicaProceso();

if (filter_has_var(INPUT_GET, 'id_entidad'))
{
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $entidad = new Entidad();
    $entidad->load("id = $id_entidad");
    $smarty->assign("entidad", $entidad);

    $nombre_pagina = TXT_PROC_CREAR;
    // Si creamos un subproceso desde la ficha de un proceso
    $permiso_proceso = FALSE;
    if (filter_has_var(INPUT_GET, 'id_proceso'))
    {
        $id_proceso = filter_input(INPUT_GET, 'id_proceso', FILTER_SANITIZE_NUMBER_INT);
        $proceso->load("id = $id_proceso");
        $nombre_pagina = $nombre_pagina . " - " . $proceso->nombre;
        //Permisos del proceso
        $permiso_proceso = $logicaProceso->comprobar_responsable_proceso($usuario->id, $proceso);
        $smarty->assign('proceso', $proceso);
    }
    else
    {
        $proceso_madre = new Proceso();
        $procesos_madre = $proceso_madre->find("id_entidad = $id_entidad");
        $smarty->assign('procesos_madre', $procesos_madre);
    }

    if ($control || $permiso_proceso)
    {
        $usuario_entidad = new Usuario_entidad;
        $usuarios_entidad = $usuario_entidad->Find_usuarios("id_entidad = $id_entidad");
        $smarty->assign("usuarios_entidad", $usuarios_entidad);

        $cuadro = new Cuadro();
        $cuadros_proceso = $cuadro->Find("privado = 0 AND id_entidad = $id_entidad");
        $smarty->assign('cuadros_proceso', $cuadros_proceso);
    }
    else
    {
        $error = ERR_PERMISOS;
        if ($id_proceso)
        {
            header("Location: index.php?page=proceso_mostrar&id_proceso=$id_proceso&id_entidad=$id_entidad&error=$error");
        }
        else
        {
            header("Location: index.php?page=proceso_listar&id_entidad=$id_entidad&error=$error");
        }
    }

    $nombre_pagina = $nombre_pagina . " - " . $entidad->nombre;
    $smarty->assign("_nombre_pagina", $nombre_pagina);
    $smarty->assign('_javascript', array('proceso_crear'));
    $plantilla = "procesos/proceso_crear.tpl";
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
