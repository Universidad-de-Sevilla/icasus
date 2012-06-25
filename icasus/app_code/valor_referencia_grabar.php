<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: valor_referencia_grabar.php
//---------------------------------------------------------------------------------------------------
// Graba valor de referencia para un indicador
//---------------------------------------------------------------------------------------------------
global $usuario;
if (isset($_REQUEST["etiqueta"]) AND isset($_REQUEST["nombre"]) AND isset($_REQUEST["grafica"]) AND isset($_REQUEST["id_indicador"]))
{
	$vr = new valor_referencia();
	$vr->id_indicador = sanitize($_REQUEST["id_indicador"],SQL);
	$vr->etiqueta = sanitize($_REQUEST["etiqueta"],SQL);
	$vr->nombre = sanitize($_REQUEST["nombre"],SQL);
	$vr->grafica = sanitize($_REQUEST["grafica"],SQL);
	if ($vr->save())
	{
		$aviso = "Se creado correctamente el valor de referencia";
		header("Location: index.php?page=valor_referencia_crear&id_indicador=$vr->id_indicador&aviso=$aviso");
	}
	else
	{
		$error = "No se ha podido grabar el valor de referencia.";
		header("Location: index.php?page=valor_referencia_crear&id_indicador=$vr->id_indicador&error=$error");
	}
}
else
{
	// Avisamos de error por falta de parametros
	$error = 'Faltan parámetros necesarios para grabar el indicador';
	header("Location: index.php?page=valor_referencia_crear&id_indicador=$vr->id_indicador&error=$error");
}
?>
