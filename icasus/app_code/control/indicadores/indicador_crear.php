<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: indicadores/indicador_crear.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Creación de nuevos indicadores
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
global $usuario;
//Variable para operar con Procesos
$logicaProceso = new LogicaProceso();

if (filter_has_var(INPUT_GET, 'id_entidad'))
{
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $entidad = new Entidad();
    $entidad->load("id = $id_entidad");
    $smarty->assign("entidad", $entidad);
    $subunidades = $entidad->Find("id_madre = $id_entidad ORDER BY etiqueta");
    $smarty->assign('subunidades', $subunidades);

    $usuario_entidad = new Usuario_entidad;
    $usuarios_entidad = $usuario_entidad->Find_usuarios("id_entidad = $id_entidad");
    $smarty->assign("usuarios_entidad", $usuarios_entidad);

    $proceso = new Proceso();
    $procesos = $proceso->Find("id_entidad = $id_entidad");
    $smarty->assign('procesos', $procesos);

    $nombre_pagina = TXT_INDIC_CREAR;
    // Si creamos indicador desde la ficha de un proceso
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

    if ($control || $permiso_proceso)
    {
        $criterio = new Criterio_efqm();
        $criterios_efqm = $criterio->Find('1=1');
        $smarty->assign('criterios_efqm', $criterios_efqm);

        $visibilidad = new Visibilidad;
        $visibilidades = $visibilidad->Find("1=1");
        $smarty->assign("visibilidades", $visibilidades);

        $tipo_agregacion = new Tipo_agregacion();
        $tipos_agregacion = $tipo_agregacion->Find("true ORDER BY id");
        $smarty->assign("tipos_agregacion", $tipos_agregacion);

        $nombre_pagina = $nombre_pagina . " - " . $entidad->nombre;
        $smarty->assign("_nombre_pagina", $nombre_pagina);
        $smarty->assign('_javascript', array('indicador_crear'));
        $plantilla = "indicadores/indicador_crear.tpl";
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
            header("Location: index.php?page=indicador_listar&id_entidad=$id_entidad&error=$error");
        }
    }
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
