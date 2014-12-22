<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: valor_exportar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Prepara datos y genera ficheros cvs para exportar indicadores 
// y valores a otras aplicaciones
//---------------------------------------------------------------------------------------------------

global $smarty;
global $basedatos;
global $plantilla;

//$id_entidad = sanitize($_REQUEST['id_entidad'], 16);
$id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

$entidad = new Entidad($base_datos);
$entidad->obtener_datos($id_entidad);
$indicadores = $entidad->listar_indicadores();

$indicador = new Indicador($base_datos);
$indicador->obtener_datos($id_indicador);
$valores = $indicador->listar_valores($identificador);

$cvs = new cvs($IC_DIR_BASE);
$tipo_datos = 'indicador';
$cvs->exportar_datos($datos, $tipo_datos, $identificador);

