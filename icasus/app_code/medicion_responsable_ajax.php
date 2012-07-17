<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: valor_referencia_ajax.php
//---------------------------------------------------------------------------------------------------
// Descripcion: Graba de manera asincrona los nuevos valores de referencias y los actualiza desde la 
// plantilla valor_referencia_crear.tpl
//---------------------------------------------------------------------------------------------------

global $smarty;
global $usuario;
global $plantilla;

$modulo = sanitize($_REQUEST["modulo"],SQL);
$indicador_subunidad = new indicador_subunidad();
//$db = $vr->DB();

if ($modulo == 'grabar')
{
	$id = sanitize($_REQUEST["id"],INT);
	$id_usuario = sanitize($_REQUEST["id_usuario"],INT);

	if($indicador_subunidad->load("id = $id"))
	{
		$indicador_subunidad->id_usuario = $id_usuario;
		$indicador_subunidad->save();
	}
}
?>
