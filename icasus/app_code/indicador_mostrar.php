<?php
//-------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: indicador_mostrar.php
//-------------------------------------------------------------------------------
// Muestra la ficha del indicador y los gráficos con los valores
//-------------------------------------------------------------------------------

global $smarty;
global $plantilla;

if (isset($_REQUEST['id_indicador']))
{
  $id_indicador = sanitize($_REQUEST['id_indicador'],16);
  $indicador = new indicador();
  if ($indicador->load_joined("id = $id_indicador"))
  {
    $smarty->assign('indicador', $indicador);
  }
  else
  {
    $error = "No se puede mostrar el indicador, el identificador no existe en la base de datos.";
    header("location:index.php?error=$error");
  }
  $indicador->load_joined("id = $id_indicador");
  $smarty->assign('indicador', $indicador);

  $entidad = new entidad();
  $entidad->load("id = $indicador->id_entidad");
  $smarty->assign('entidad', $entidad);

  //Subunidades asignadas a la medicion de este indicador
  $indicador_subunidad = new indicador_subunidad();
  $indicador_subunidades = $indicador_subunidad->Find_entidades("id_indicador = $id_indicador");
  $smarty->assign("indicador_subunidades", $indicador_subunidades);

  //Simplemente ver si hay mediciones
  $medicion = new medicion();
  if ($mediciones = $medicion->Find("id_indicador = $id_indicador"))
  {
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

  $smarty->assign('_nombre_pagina', "Ficha del indicador: " . $indicador->nombre);
  $plantilla = 'indicador_mostrar.tpl';
}
else
{
  $error = "No se puede mostrar el indicador por falta de parámetros.";
  header("location:index.php?error=$error");
}
