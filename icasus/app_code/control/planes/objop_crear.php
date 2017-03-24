<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: planes/objop_crear.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripción: muestra el formulario que permite crear un nuevo objetivo operacional
//---------------------------------------------------------------------------------------------------

if (filter_has_var(INPUT_GET, 'id_objest') && $control)
{
    $id_objest = filter_input(INPUT_GET, 'id_objest', FILTER_SANITIZE_NUMBER_INT);

    //Obtenemos los datos del objetivo estratégico
    $objest = new ObjetivoEstrategico();
    if ($objest->load_joined("id=$id_objest"))
    {
        $smarty->assign('objest', $objest);
    }
    else
    {
        $error = ERR_OBJEST_MOSTRAR;
        header("location:index.php?page=error&error=$error");
    }

    $smarty->assign('linea', $objest->linea);

    $plan = new Plan();
    $id_plan = $objest->linea->id_plan;
    $plan->load("id=$id_plan");
    $smarty->assign('plan', $plan);

    $entidad = new Entidad();
    $entidad->load("id=$plan->id_entidad");
    $smarty->assign('entidad', $entidad);
    $subunidades = $entidad->Find("id_madre = $entidad->id ORDER BY etiqueta");
    $smarty->assign('subunidades', $subunidades);

    //Responsable
    $usuario_entidad = new Usuario_entidad;
    $usuarios_entidad = $usuario_entidad->Find_usuarios("id_entidad = $entidad->id");
    $smarty->assign("usuarios_entidad", $usuarios_entidad);

    //Indicadores
    $indicador = new Indicador();
    $indicadores = $indicador->Find("id_entidad=$plan->id_entidad AND id_proceso IS NOT NULL AND archivado IS NULL");
    $indicadores_ctl = $indicador->Find("id_entidad=$plan->id_entidad AND control=1 AND archivado IS NULL");
    $smarty->assign("indicadores", $indicadores);
    $smarty->assign("indicadores_ctl", $indicadores_ctl);

    //Validar índice de un objetivo operacional
    $objop = new ObjetivoOperacional();
    $indices = array();
    $objops = $objop->Find("id_objest=$id_objest");
    foreach ($objops as $obj)
    {
        array_push($indices, $obj->indice);
    }
    $smarty->assign('elementos', $indices);

    $smarty->assign('_javascript', array('objop_crear'));
    $smarty->assign('_nombre_pagina', TXT_OBJOP_CREAR . ': ' . FIELD_OBJ_EST . " " . $objest->linea->indice . '.' . $objest->indice . '. ' . $objest->nombre);
    $plantilla = 'planes/objop_crear.tpl';
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
