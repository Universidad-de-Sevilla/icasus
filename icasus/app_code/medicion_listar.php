<?php
//-------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: medicion_listar.php
//-------------------------------------------------------------------------------
// Muestra un listado de las mediciones establecidas para un indicador
//-------------------------------------------------------------------------------
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
else
{
  $error = "Faltan parámetros para mostrar la lista de mediciones";
  header("location:index.php?page=entidad_listar&error=$error");
}

$indicador = new indicador();
$indicador->load("id = $id_indicador");
$smarty->assign('indicador',$indicador);

$entidad = new entidad();
$entidad->load("id = $indicador->id_entidad");
$smarty->assign('entidad', $entidad);
$smarty->assign('tipo',$tipo);


$medicion = new medicion();
if ($mediciones = $medicion->Find("id_indicador = $id_indicador ORDER BY periodo_inicio"))
{
  $smarty->assign('mediciones',$mediciones);
  $paneles = array();
  $panel = new panel();
  $panel->tipo = new panel_tipo();
  $panel->ancho = 16;
  if ($indicador->periodicidad != "Anual")
  {
    // Prepara el panel intraanual
    $anio_inicio = date('Y') - 2;
    $anio_fin = date('Y');
    $panel->id = 2;
    $panel->tipo->clase_css = "lineal";
    $panel->ancho = 8;
    $panel->nombre = $indicador->nombre . " (" . $anio_inicio . " - " . $anio_fin . ")";
    $panel->fecha_inicio = $anio_inicio. "-01-01";
    $panel->fecha_fin = date("Y-m-d");
    $panel->periodicidad = "todos";
    $paneles[] = clone($panel);
  }
  // Prepara el panel anual
  $anio_inicio = $indicador->historicos;
  $anio_fin = date('Y') - 1;
  $panel->id = 1;
  $panel->tipo->clase_css = "lineal";
  $panel->nombre = $indicador->nombre . " (" . $anio_inicio . " - " . $anio_fin . ")";
  $panel->fecha_inicio = $indicador->historicos . "-01-01";
  $panel->fecha_fin = $anio_fin . "-12-31";
  $panel->periodicidad = "anual";
  $paneles[] = clone($panel);
  $smarty->assign("paneles", $paneles);
  $smarty->assign("mediciones", $mediciones);
}
//array de subunidades con las mediciones y sus valores
$subunidades_mediciones = $entidad->find_subunidades_mediciones($id_indicador,$entidad->id);
$smarty->assign('subunidades_mediciones',$subunidades_mediciones);

$smarty->assign('_nombre_pagina', "Gestión de mediciones: $indicador->nombre");
$plantilla = 'medicion_listar.tpl';
