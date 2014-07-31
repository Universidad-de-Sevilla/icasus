<?php
//------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: medicion_crear.php
//------------------------------------------------------------------------------
// Muestra la interfaz para programar las mediciones que se van a realizar
// Puede hacerse manualmente o utilizando una plantilla que genera las
// mediciones automaticamente (TODO)
// Muestra un listado con la unidad y las subunidades para indicar las afectadas
//------------------------------------------------------------------------------
global $smarty;
global $usuario;
global $plantilla;

if (isset($_REQUEST["id_indicador"]))
{
  $id_indicador = sanitize($_REQUEST["id_indicador"], INT);
  $tipo = "indicador";

  $valor_referencia = new valor_referencia();
  $valores_referencia = $valor_referencia->Find("id_indicador = $id_indicador");

  $smarty->assign("valores_referencia", $valores_referencia);
}
else if (isset($_REQUEST["id_dato"]))
{
  $id_indicador = sanitize($_REQUEST["id_dato"], INT);
  $tipo = "dato";
}
else
{
  $error = "Faltan datos para procesar la petición de creación de medición";
  header("location:index.php?page=entidad_listar&error=$error");
}

$indicador = new indicador;
if ($indicador->load("id = $id_indicador"))
{
  $id_entidad = $indicador->id_entidad;

  //comprobar permisos para cambiar mediciones tanto para responsables del
  //indicador como de la medición o responsables de la unidad
  $responsable_unidad = false;
  foreach($usuario->entidades AS $usuario_entidad)
  {
    if (($usuario_entidad->id_rol == 1 OR $usuario_entidad->id_rol == 2) AND $usuario_entidad->id_entidad == $indicador->id_entidad)
    {
      $responsable_unidad = true;
    }
  }
  if ($responsable_unidad == true
      OR $indicador->id_responsable == $usuario->id
      OR $indicador->id_responsable_medicion == $usuario->id)
  {
    $permiso_crear = true;
  }
  else
  {
    $permiso_crear = false;
  }

  if ($permiso_crear)
  {
    $smarty->assign("indicador", $indicador);
    $smarty->assign("tipo", $tipo);
    $entidad = new entidad;
    $entidad->load("id = $indicador->id_entidad");
    $smarty->assign("entidad", $entidad);
    $subunidades = $entidad->Find("id = $id_entidad OR id_madre = $id_entidad ORDER BY etiqueta");
    $smarty->assign('subunidades', $subunidades);
    $indicador_subunidad = new indicador_subunidad();
    $indicador_subunidades = $indicador_subunidad->Find_entidades("id_indicador = $id_indicador");
    $smarty->assign("indicador_subunidades", $indicador_subunidades);
    $smarty->assign("_nombre_pagina", "Programar medición");
    $plantilla = "medicion_crear.tpl";
  }
  else
  {
    // El usuario no tiene permisos avisamos error
    $error = "No tiene permisos suficientes para agregar mediciones a este $tipo";
    header("Location:index.php?page=".$tipo."_mostrar&id_$tipo=$id_indicador&error=$error");
  }
}
else
{
  $error = "El {$tipo} solicitado no existe en la base de datos";
  header("location:index.php?error=$error");
}
