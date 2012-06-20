<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: medicion_crear.php
//---------------------------------------------------------------------------------------------------
// Muestra la interfaz para programar las mediciones que se van a realizar de un indicador
// Puede hacerse manualmente o utilizando una plantilla que genera las mediciones automaticamente (porhacer)
// Muestra un listado con la unidad y las subunidades para indicar las afectadas
//---------------------------------------------------------------------------------------------------
global $smarty;
global $usuario;
global $plantilla;

if (isset($_REQUEST["id_indicador"]))
{
  $id_indicador = sanitize($_REQUEST["id_indicador"], INT);

  $indicador = new indicador;
  if ($indicador->load("id = $id_indicador"))
  {
    $smarty->assign("indicador", $indicador);

    $entidad = new entidad;
    $entidad->load("id = $indicador->id_entidad");
    $smarty->assign("entidad", $entidad);

    $valor_referencia_indicador = new valor_referencia_indicador();
    $valores_referencia_indicadores = $valor_referencia_indicador->Find_joined("id_indicador = $id_indicador");
    $smarty->assign("valores_referencia_indicador", $valores_referencia_indicadores);

    $smarty->assign("_javascript", array(""));
    $smarty->assign("_nombre_pagina", "Programar medición");
    $plantilla = "medicion_crear.tpl";
  }
  else
  {
    $error = "Faltan datos para procesar la petición de creación de medición";
    header("location:index.php?page=entidad_listar&error=$error");
  }
}
else
{
  $error = "Faltan datos para procesar la petición de creación de medición";
  header("location:index.php?page=entidad_listar&error=$error");
}
?>
