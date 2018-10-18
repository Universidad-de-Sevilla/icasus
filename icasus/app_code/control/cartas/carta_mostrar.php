<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: cartas/carta_mostrar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Muestra la página principal de una Carta de Servicios
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
global $usuario;

if (filter_has_var(INPUT_GET, 'id_entidad') AND filter_has_var(INPUT_GET, 'id_carta')) {
    $id_carta = filter_input(INPUT_GET, 'id_carta', FILTER_SANITIZE_NUMBER_INT);
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    //Obtenemos los datos de la Carta
    $carta = new Carta();
    if ($carta->load_joined("id = $id_carta")) {
        $smarty->assign('carta', $carta);
    } else {
        $error = ERR_CARTA_MOSTRAR;
        header("location:index.php?page=error&error=$error");
    }
    //Obtener todas las Cartas para avanzar o retroceder
    $cartas = $carta->Find("id_entidad = $id_entidad");
    $smarty->assign("cartas", $cartas);
    $cont = 0;
    foreach ($cartas as $cart) {
        if ($id_carta == $cart->id) {
            $indice = $cont;
            $smarty->assign("indice", $indice);
        }
        $cont++;
    }
    //Normativas
    $normativa = new Normativa();
    $normativas = $normativa->Find("id_carta=$id_carta");
    $smarty->assign('normativas', $normativas);
    //Servicios
    $servicio = new Servicio();
    $servicios = $servicio->Find("id_carta=$id_carta order by indice");
    $smarty->assign('servicios', $servicios);
    //Compromisos
    $compromiso = new Compromiso();
    $compromisos = array();
    $compromisos_servicios = array();
    foreach ($servicios as $serv) {
        $compromisos = array_merge($compromisos, $compromiso->Find_joined("id_servicio=$serv->id"));
        $compromisos_servicios[$serv->id] = $compromiso->Find("id_servicio=$serv->id order by indice");
    }
    $smarty->assign('compromisos', $compromisos);
    $smarty->assign('compromisos_servicios', $compromisos_servicios);
    //Indicadores
    $compromiso_indicador = new CompromisoIndicador();
    //Guarda todos los indicadores del servicio
    $indicadores = array();
    //Guarda los ids de indicadores asociados a un id_compromiso
    $compromiso_indicadores_ids = array();
    //Guarda los indicadores de un compromiso
    $compromiso_indicadores = array();
    foreach ($compromisos as $comp) {
        //Buscamos los indicadores del compromiso
        $compromiso_indicadores_ids[$comp->id] = $compromiso_indicador->Find("id_compromiso=$comp->id");
        //Guardamos los indicadores
        if ($compromiso_indicadores_ids[$comp->id]) {
            $compromiso_indicadores[$comp->id] = array();
            foreach ($compromiso_indicadores_ids[$comp->id] as $comp_ind_id) {
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
    //Derechos
    $derecho = new Derecho();
    $derechos = $derecho->Find("id_carta=$id_carta");
    $smarty->assign('derechos', $derechos);
    //Archivos
    $archivo = new Fichero();
    $archivos = $archivo->find_joined("id_objeto = $id_carta AND tipo_objeto = 'carta' AND visible=1");
    $smarty->assign('archivos', $archivos);
    //Seguimiento
    $anio_fin = date('Y');
    $anio_inicio = $anio_fin - 5;
    $smarty->assign('anio_inicio', $anio_inicio);
    $smarty->assign('anio_fin', $anio_fin);
    $entidad = new Entidad();
    $entidad->load("id = $id_entidad");
    $smarty->assign('entidad', $entidad);
    $smarty->assign('_javascript', array('carta_mostrar'));
    $smarty->assign('_nombre_pagina', TXT_CARTA_TITULO . " " . date("Y", strtotime($carta->fecha))
        . ': ' . $entidad->nombre . ' - ' . $carta->nombre);
    $plantilla = 'cartas/carta_mostrar.tpl';
} else {
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
