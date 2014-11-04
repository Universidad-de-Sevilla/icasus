<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (https://gestionproyectos.us.es/projects/r2h2-icasus)
// Archivo: valor_referencia_crear.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es) 
//---------------------------------------------------------------------------------------------------
// Descripcion: 
//---------------------------------------------------------------------------------------------------

global $smarty;
global $usuario;
global $plantilla;

if (isset($_REQUEST["id_indicador"]))
{
  $id_indicador = sanitize($_REQUEST["id_indicador"], INT);
  $tipo = "indicador";
}
else if (isset($_REQUEST["id_dato"]))
{
  $id_indicador = sanitize($_REQUEST["id_dato"], INT);
  $tipo = "dato";
}
else // falta id_indicador o id_entidad
{
	$smarty->assign('error', 'Faltan parámetros para realizar esta acción.'); 
	$smarty->assign('_nombre_pagina','Error');
	$plantilla = 'error.tpl';
}

$indicador = new Indicador();
$indicador->load_joined("id=$id_indicador");

$smarty->assign('_javascript', array('valor_referencia_crear'));
$smarty->assign('indicador', $indicador);
$smarty->assign('_nombre_pagina', $indicador->nombre);

$smarty->assign('tipo',$tipo);
$plantilla = 'valor_referencia_crear.tpl';
?>
