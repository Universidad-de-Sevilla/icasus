<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: planes/objop_mostrar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Muestra la página principal de un objetivo operacional
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
global $usuario;

if (filter_has_var(INPUT_GET, 'id_objop'))
{
    $id_objop = filter_input(INPUT_GET, 'id_objop', FILTER_SANITIZE_NUMBER_INT);

    //Obtenemos los datos del objetivo operacional
    $objop = new ObjetivoOperacional();
    if ($objop->load_joined("id = $id_objop"))
    {
        $smarty->assign('objop', $objop);
    }
    else
    {
        $error = ERR_OBJOP_MOSTRAR;
        header("location:index.php?page=error&error=$error");
    }

    //Responsables
    $responsable = false;
    if ($objop->id_responsable == $usuario->id)
    {
        $responsable = true;
    }
    $smarty->assign('responsable', $responsable);

    //Obtener todos los objetivos operacionales para avanzar o retroceder 
    $objops = $objop->Find("id_objest = $objop->id_objest order by indice");
    $smarty->assign("objops", $objops);
    $cont = 0;
    foreach ($objops as $obj)
    {
        if ($id_objop == $obj->id)
        {
            $indice = $cont;
            $smarty->assign("indice", $indice);
        }
        $cont++;
    }

    //Obtenemos los datos del objetivo estratégico de la línea y del plan
    $smarty->assign('objest', $objop->objest);
    $linea = new Linea();
    $id_linea = $objop->objest->id_linea;
    $linea->load_joined("id = $id_linea");
    $smarty->assign('linea', $linea);
    $smarty->assign('plan', $linea->plan);

    //Obtenemos sus ejecuciones, activaciones y resultados anuales
    $ejecucion = new Ejecucion();
    $ejecucion_anual = array();
    $activacion_anual = array();
    $resultado_anual = array();
    for ($i = $linea->plan->anyo_inicio; $i <= ($linea->plan->anyo_inicio + $linea->plan->duracion); $i++)
    {
        if ($ejecucion->Load("id_objop=$objop->id AND anyo=$i"))
        {
            $ejecucion_anual[$i] = $ejecucion->valor;
            $activacion_anual[$i] = $ejecucion->activo;
            $resultado_anual[$i] = $ejecucion->resultado;
        }
        else
        {
            $ejecucion_anual[$i] = 0;
            $activacion_anual[$i] = 1;
            $resultado_anual[$i] = "";
        }
    }
    $smarty->assign("ejecucion_anual", $ejecucion_anual);
    $smarty->assign("activacion_anual", $activacion_anual);
    $smarty->assign("resultado_anual", $resultado_anual);

    //Indicadores del objetivo operacional
    $objetivo_indicador = new ObjetivoIndicador();
    $indicadores_correlacion = array();
    $indicadores_control = array();
    //De correlación
    $correlaciones = $objetivo_indicador->Find("id_objop=$objop->id AND control=0");
    foreach ($correlaciones as $correlacion)
    {
        $indicador = new Indicador();
        $indicador->load_joined("id=$correlacion->id_indicador");
        array_push($indicadores_correlacion, $indicador);
    }
    $smarty->assign('indicadores_correlacion', $indicadores_correlacion);
    //De control
    $controladores = $objetivo_indicador->Find("id_objop=$objop->id AND control=1");
    foreach ($controladores as $controlador)
    {
        $indicador = new Indicador();
        $indicador->load_joined("id=$controlador->id_indicador");
        array_push($indicadores_control, $indicador);
    }
    $smarty->assign('indicadores_control', $indicadores_control);

    //Unidades
    $objetivo_subunidad = new ObjetivoUnidad();
    $objetivo_subunidades = $objetivo_subunidad->Find_entidades("id_objop = $id_objop");
    $smarty->assign("objetivo_subunidades", $objetivo_subunidades);

    $entidad = new Entidad();
    $id_entidad = $linea->plan->id_entidad;
    $entidad->load("id = $id_entidad");
    $smarty->assign('entidad', $entidad);

    $smarty->assign('_javascript', array('objop_mostrar'));
    $smarty->assign('_nombre_pagina', FIELD_OBJ_OP . ": " . $objop->objest->linea->indice . "." . $objop->objest->indice . "." . $objop->indice . ". " . $objop->nombre);
    $plantilla = 'planes/objop_mostrar.tpl';
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
