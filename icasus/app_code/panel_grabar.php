<?php

if (!empty($_REQUEST["id_cuadro"]) OR !empty($_REQUEST["id_entidad"]) OR !empty($_REQUEST["nombre"])  OR !empty($_REQUEST["orden"])OR !empty($_REQUEST["tipo"]) OR !empty($_REQUEST["ancho"]) OR !empty($_REQUEST["id_indicador"]))
{
	$id_entidad = sanitize($_REQUEST["id_entidad"],INT);
	$id_cuadro = sanitize($_REQUEST["id_cuadro"],INT);
	$nombre = sanitize($_REQUEST["nombre"],SQL);
	$tipo = sanitize($_REQUEST["tipo"],INT);
	$orden = sanitize($_REQUEST["orden"],SQL);
	$ancho = sanitize($_REQUEST["ancho"],SQL);
	$id_indicador = sanitize($_REQUEST["id_indicador"],INT);
	/*
	if ($tipo == 3)
	{
		$id_medicion_inicio = sanitize($_REQUEST["id_medicion_inicio"],INT);
		$id_medicion_fin = 0;
	}
	*/
	$panel = new panel();
	$panel->id_cuadro = $id_cuadro;
	$panel->nombre = $nombre;
	$panel->id_paneltipo = $tipo;
	$panel->id_medicion_ini = 2323101;
	$panel->id_medicion_fin = 100;
	//$panel->id_medicion_inicio = $id_medicion_inicio;
	//$panel->id_medicion_fin = $id_medicion_fin;
	$panel->orden = $orden;
	$panel->ancho = $ancho;
	$panel->save();

	//header("location:index.php?page=cuadro_listar");
}
	/*
if (!empty($_REQUEST["id_cuadro"]) OR !empty($_REQUEST["id_entidad"]) OR !empty($_REQUEST["nombre"]) OR !empty($_REQUEST["tipo"]) OR !empty($_REQUEST["ancho"]) OR !empty($_REQUEST["id_indicador"]))
{
	


	//$panel->id_entidad = $id_entidad;
	
	{
		$panel_indicador = new panel_indicador();
		$panel_indicador->id_panel = $panel->id;
		$panel_indicador->id_entidad = $id_entidad;
		$panel_indicador->id_indicador = $id_indicador;
		$panel_indicador->mostrar_referencias = 1;
		$panel_indicador->save();
	}
	else
	{
		//error no se grabó correctamente
	}
	header("location:index.php?page=cuadro_listar");
}
else
{
	//faltan parámetros
}
*/
?>
