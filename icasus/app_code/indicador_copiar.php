<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: indicador_copiar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Copia uno o mas indicadores desde el catalogo de indicadores
//---------------------------------------------------------------------------------------------------

global $smarty;
global $basedatos;
global $plantilla;

$smarty->assign('_javascript', array('ordenatabla'));

$id_entidad = filter_input(INPUT_GET | INPUT_POST, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

//if (isset($_REQUEST['id_entidad']) && $_REQUEST['id_entidad'] > 1)
if ($id_entidad > 1) {
//	$id_entidad = sanitize($_REQUEST['id_entidad'],16);
    $smarty->assign('id_entidad', $id_entidad);
    // Si vienen indicadores del formulario los asignamos a la entidad
    if (isset($_POST['indicadores'])) {
        $contador = 0;
        foreach ($_POST['indicadores'] as $id_indicador) {
            $id_indicador = sanitize($id_indicador, 16);
            //echo 'copiando'.$id_entidad;
            $indicador = new Indicador($basedatos);
            if ($indicador->copiar($id_indicador, $id_entidad)) {
                $contador ++;
            }
        }
        $smarty->assign('aviso', $contador . ' ' . MSG_INDIC_COPIADOS);
    }
    // Si no vienen indicadores o hemos terminado de grabar mostramos el formulario con el listado
    $entidad = new Entidad($basedatos);
    //Obtengo los datos de la entidad actual
    $datos = $entidad->obtener_datos($id_entidad);
    // Cargo la entidad padre para obtener sus indicadores
    $entidad->id_entidad = $datos['id_padre'];
    $indicadores = $entidad->listar_indicadores();
    $smarty->assign('indicadores', $indicadores);
    $smarty->assign('_nombre_pagina', TXT_INDICS_COPIAR);
    $plantilla = 'indicador_copiar.tpl';
} else {
    $smarty->assign('error', ERR_PARAM_INC);
    $plantilla = 'error.tpl';
}

