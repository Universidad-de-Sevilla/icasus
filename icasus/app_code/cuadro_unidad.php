<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: cuadro_unidad.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Lista los indicadores de la unidad
//---------------------------------------------------------------------------------------------------

global $smarty;
global $usuario;
global $plantilla;

// Esto es para prevenir que se cargue el script sin pasar por index.php
if (!is_object($smarty))
{
    header('Location:index.php?page=cuadro_listar');
}

if (filter_has_var(INPUT_GET, 'id_entidad'))
{
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $entidad = new Entidad();
    $entidad->load("id = $id_entidad");
    $smarty->assign('entidad', $entidad);
    $proceso = new Proceso();

    //obtiene los procesos de la unidad y sus indicadores
    $procesos_propios = $proceso->find("id_entidad = $id_entidad");
    $smarty->assign('procesos_propios', $procesos_propios);

    //si la unidad mide indicadores de otras unidades, busca los procesos de estos indicadores
    $procesos_indicadores_segregados = $proceso->procesos_indicadores_segregados($id_entidad);
    $smarty->assign('procesos_indicadores_segregados', $procesos_indicadores_segregados);
    //obtiene los procesos de la unidad superior y sus indicadores
    $procesos_indicadores_superior = $proceso->proceso_indicador_superior($id_entidad);
    $smarty->assign('procesos_indicadores_superior', $procesos_indicadores_superior);

    //obtiene entidad superior.
    $entidad_madre = new Entidad();
    $entidad_madre->load("id = $entidad->id_madre");
    $smarty->assign('entidad_superior', $entidad_madre);
    $smarty->assign('procesos_indicadores_superior', $procesos_indicadores_superior);

    $plantilla = 'cuadro_unidad.tpl';
    $smarty->assign('_nombre_pagina', TXT_CUAD_RES . ": $entidad->nombre");
}
else
{
    $error = ERR_UNID;
    header("location:index.php?page=error&error=$error");
}


