<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: cuadros/panel_editar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Controlador principal para editar paneles
//---------------------------------------------------------------------------------------------------

global $usuario;
global $plantilla;
global $smarty;

if (filter_has_var(INPUT_GET, 'id_panel'))
{
    $id_panel = filter_input(INPUT_GET, 'id_panel', FILTER_SANITIZE_NUMBER_INT);
    $panel = new Panel();
    $panel->Load(("id = $id_panel"));
    $smarty->assign('panel', $panel);

    $cuadro = new Cuadro();
    $cuadro->Load("id=$panel->id_cuadro");
    $smarty->assign("cuadro", $cuadro);

    $entidad = new Entidad();
    $entidad->load("id=$cuadro->id_entidad");
    $smarty->assign("entidad", $entidad);

    if ($control || $usuario->id == $cuadro->id_usuario)
    {
        //Validar orden del panel dentro del cuadro de mando
        $ordenes = array();
        $paneles = $panel->Find("id_cuadro=$panel->id_cuadro");
        foreach ($paneles as $pl)
        {
            if ($pl->orden != $panel->orden)
            {
                array_push($ordenes, $pl->orden);
            }
        }
        $smarty->assign('elementos', $ordenes);

        //Indicadores/datos del panel
        $panel_indicador = new Panel_indicador();
        $panel_indicadores = $panel_indicador->Find("id_panel=$id_panel");

        $indicadores = array();
        $unidades = array();

        foreach ($panel_indicadores as $pi)
        {
            $indicador = new Indicador();
            $entidad = new Entidad();
            $indicador->load("id=$pi->id_indicador");
            $indicadores[$pi->id] = $indicador;
            //Si es la unidad madre a la que pertenece el cuadro
            if ($pi->id_entidad == 0)
            {
                $entidad->id = 0;
                $entidad->etiqueta = 'Total';
            }
            else
            {
                $entidad->load("id=$pi->id_entidad");
            }
            $unidades[$pi->id] = $entidad;
        }

        $smarty->assign('panel_indicadores', $panel_indicadores);
        $smarty->assign('indicadores', $indicadores);
        $smarty->assign('unidades', $unidades);

        //Indicadores y datos de la unidad
        $indicador = new Indicador();
        $indicadores_unidad = $indicador->find("id_entidad = $cuadro->id_entidad AND archivado is NULL");
        $smarty->assign('indicadores_unidad', $indicadores_unidad);
        //Primer indicador del panel, necesario para paneles tarta y mixtos
        $id_indicador = reset($indicadores)->id;
        $smarty->assign('id_indicador', $id_indicador);

        //Paneles de tarta
        if ($panel->id_paneltipo == 3)
        {
            //Mediciones    
            $medicion = new Medicion();
            $mediciones = $medicion->find("id_indicador = $id_indicador ORDER BY periodo_inicio");
            $smarty->assign('mediciones', $mediciones);
        }

        //Paneles de tabla
        if ($panel->id_paneltipo == 6)
        {
            //Indicadores de proceso
            $indicadores_unidad_no_datos = $indicador->find("id_entidad = $cuadro->id_entidad AND id_proceso is NOT NULL AND archivado is NULL");
            $smarty->assign('indicadores_unidad_no_datos', $indicadores_unidad_no_datos);
            //Indicadores de control
            $indicadores_ctl = $indicador->find("id_entidad = $cuadro->id_entidad AND control=1 AND archivado is NULL");
            $smarty->assign('indicadores_ctl', $indicadores_ctl);
            //Indicadores de datos
            $datos_unidad = $indicador->find("id_entidad = $cuadro->id_entidad AND id_proceso is NULL AND control=0 AND archivado is NULL");
            $smarty->assign('datos_unidad', $datos_unidad);
            //Unidad del panel
            $id_unidad = reset($unidades)->id;
            $smarty->assign('id_unidad', $id_unidad);
            $smarty->assign('datos_unidad', $datos_unidad);
            $subunidades = $entidad->Find("id_madre=$id_entidad ORDER BY etiqueta");
            $smarty->assign('subunidades', $subunidades);
        }

        //Determinamos el js a cargar en función del tipo de panel
        switch ($panel->id_paneltipo)
        {
            case 1: break;
            case 2:
            case 7:
                $smarty->assign('_javascript', array('panel_lb'));
                break;
            case 3:
                $smarty->assign('_javascript', array('panel_tarta'));
                break;
            case 4:
                $smarty->assign('_javascript', array('panel_mixto'));
                break;
            case 5: break;
            case 6:
                $smarty->assign('_javascript', array('panel_tabla'));
                break;
            default :
                break;
        }

        $smarty->assign('_nombre_pagina', TXT_PANEL_EDITAR . ': ' . $panel->nombre);
        $plantilla = 'cuadros/panel_editar.tpl';
    }
    else
    {
        $error = ERR_PERMISOS;
        header("location:index.php?page=cuadro_mostrar&id_cuadro=$panel->id_cuadro&id_entidad=$entidad->id&error=$error");
    }
}
else
{
    // Faltan parametros avisamos error
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
