<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: objop_ajax.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Edita los grados de ejecucion anuales de un obejtivo operacional
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
global $usuario;

$modulo = filter_input(INPUT_GET, 'modulo', FILTER_SANITIZE_STRING);
$smarty->assign('modulo', $modulo);

$id_objop = filter_input(INPUT_GET, 'id_objop', FILTER_SANITIZE_NUMBER_INT);
$objop = new ObjetivoOperacional();
$objop->load("id=$id_objop");
$smarty->assign('objop', $objop);

$anyo = filter_input(INPUT_GET, 'anyo', FILTER_SANITIZE_NUMBER_INT);
$smarty->assign('anyo', $anyo);
$plantilla = 'objop_ajax.tpl';
