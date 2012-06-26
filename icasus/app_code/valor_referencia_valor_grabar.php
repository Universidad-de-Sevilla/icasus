<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: valor_referencia_grabar.php
//---------------------------------------------------------------------------------------------------
// Graba valor de referencia para una medicion
//---------------------------------------------------------------------------------------------------
global $usuario;

if (isset($_REQUEST["id_referencia"]) AND isset($_REQUEST["valor"]))
{
	$id_referencia = sanitize($_REQUEST["id_referencia"],2);
	$valor = sanitize($_REQUEST["valor"],2);

	$vrm = new valor_referencia_medicion();
	$vrm->load("id =$id_referencia");
	$vrm->valor = $valor;

	$vrm->save();
}
?>
