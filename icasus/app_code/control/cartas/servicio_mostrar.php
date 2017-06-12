<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: cartas/servicio_mostrar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Muestra la página principal de un Servicio
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
global $usuario;

if (filter_has_var(INPUT_GET, 'id_entidad') AND filter_has_var(INPUT_GET, 'id_servicio'))
{
    $id_servicio = filter_input(INPUT_GET, 'id_servicio', FILTER_SANITIZE_NUMBER_INT);
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

    //Obtenemos los datos del Servicio
    $servicio = new Servicio();
    if ($servicio->load_joined("id = $id_servicio"))
    {
        $smarty->assign('servicio', $servicio);
    }
    else
    {
        $error = ERR_SERVICIO_MOSTRAR;
        header("location:index.php?page=error&error=$error");
    }

    //Carta de Servicios
    $carta = $servicio->carta;
    $smarty->assign('carta', $carta);

    //Obtener todos los Servicios para avanzar o retroceder
    $servicios = $servicio->Find("id_carta=$carta->id");
    $smarty->assign("servicios", $servicios);
    $cont = 0;
    foreach ($servicios as $serv)
    {
        if ($id_servicio == $serv->id)
        {
            $indice = $cont;
            $smarty->assign("indice", $indice);
        }
        $cont++;
    }

    //Compromisos
    $compromiso = new Compromiso();
    $compromisos = $compromiso->Find("id_servicio=$id_servicio order by indice");
    $smarty->assign('compromisos', $compromisos);

    //Indicadores
    $compromiso_indicador = new CompromisoIndicador();
    //Guarda todos los indicadores del servicio
    $indicadores = array();
    //Guarda los ids de indicadores asociados a un id_compromiso
    $compromiso_indicadores_ids = array();
    //Guarda los indicadores de un compromiso
    $compromiso_indicadores = array();
    foreach ($compromisos as $comp)
    {
        //Buscamos los indicadores del compromiso
        $compromiso_indicadores_ids[$comp->id] = $compromiso_indicador->Find("id_compromiso=$comp->id");
        //Guardamos los indicadores
        if ($compromiso_indicadores_ids[$comp->id])
        {
            $compromiso_indicadores[$comp->id] = array();
            foreach ($compromiso_indicadores_ids[$comp->id] as $comp_ind_id)
            {
                //Guardamos el indicador asociado a un compromiso
                $indicador = new Indicador();
                $indicador->load_joined("id=$comp_ind_id->id_indicador");
                array_push($compromiso_indicadores[$comp->id], $indicador);
            }
            $indicadores = array_merge($indicadores, $compromiso_indicadores[$comp->id]);
        }
    }
    $smarty->assign('indicadores', $indicadores);
    $smarty->assign('compromiso_indicadores', $compromiso_indicadores);

    $entidad = new Entidad();
    $entidad->load("id = $id_entidad");
    $smarty->assign('entidad', $entidad);

    $smarty->assign('_javascript', array('servicio_mostrar'));
    $smarty->assign('_nombre_pagina', FIELD_SERVICIO . ": S." . $servicio->indice . ". " . $servicio->nombre);
    $plantilla = 'cartas/servicio_mostrar.tpl';
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
