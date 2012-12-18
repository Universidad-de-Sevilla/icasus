<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: medicion_editar.php
//---------------------------------------------------------------------------------------------------
// Muestra los datos asociados a una medicion, si el usuario está autorizado le permite editarlo
//---------------------------------------------------------------------------------------------------
global $smarty;
global $usuario;
global $plantilla;

if (isset($_REQUEST["id_medicion"]) AND isset($_REQUEST["tipo"]))
{
  $id_medicion = sanitize($_REQUEST["id_medicion"], INT);
  $tipo = sanitize($_REQUEST["tipo"], SQL);
  $smarty->assign("tipo",$tipo);

  $medicion = new medicion();
  $medicion->load("id = $id_medicion");
  $smarty->assign("medicion",$medicion);

  $indicador = new indicador();
  $indicador->load("id = $medicion->id_indicador");
  $smarty->assign("indicador",$indicador);

  $valor = new valor();
  $valores = $valor->Find_joined_jjmc($id_medicion,$usuario->id);
  $smarty->assign("valores",$valores);
  
  $valor_referencia_medicion = new valor_referencia_medicion();
  $valores_referencia_mediciones = $valor_referencia_medicion->Find_joined("id_medicion = $id_medicion");
  $smarty->assign("valores_referencia_mediciones", $valores_referencia_mediciones);

	$indisub = new indicador_subunidad();
	$indicador_subunidades = $indisub->find("id_usuario = $usuario->id AND id_indicador = $indicador->id");
	$smarty->assign('indicador_subunidades',$indicador_subunidades);

  $entidad = new entidad();
  $entidad->load("id = $indicador->id_entidad");
  $smarty->assign('entidad', $entidad);
  
  // Comprobamos si el usuario tiene autorización para borrar la medición
  $usuario_entidad = new usuario_entidad();
  if ($usuario_entidad->load("id_usuario=$usuario->id AND id_entidad=$entidad->id AND (id_rol = 1 OR id_rol =2)"))
  {
    $autorizado_borrar = true;
  }
  else if ($indicador->id_responsable == $usuario->id OR $indicador->id_responsable_medicion == $usuario->id)
  {
    $autorizado_borrar = true;
  }
  else
  {
    $autorizado_borrar = false;
  }
  $smarty->assign("autorizado_borrar", $autorizado_borrar);
  
  $smarty->assign("usuario", $usuario);
  $smarty->assign("_nombre_pagina", "$indicador->codigo - $indicador->nombre");
	$smarty->assign('_javascript', array('medicion_editar'));
  $plantilla = "medicion_editar.tpl";
}
else
{
  $error = "Faltan parámetros para mostrar los datos de la medición";
  header("location:index.php?error=$error");
}
?>

