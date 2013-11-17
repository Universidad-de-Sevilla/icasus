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

	//comprobar permisos para cambiar mediciones tanto para responsables del indicador como
	//de la medición o responsables de la unidad
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
		$permiso_editar = true;
	}
	else
	{ 
		$permiso_editar = false;
	}
	$smarty->assign('permiso_editar',$permiso_editar);

  /*
  // Lo mismo pero preguntando a la base de datos
  $usuario_entidad = new usuario_entidad();
  if ($usuario_entidad->load("id_usuario=$usuario->id AND id_entidad=$entidad->id AND (id_rol = 1 OR id_rol =2)"))
  {
		$permiso_editar = true;
  }
  else if ($indicador->id_responsable == $usuario->id OR $indicador->id_responsable_medicion == $usuario->id)
  {
		$permiso_editar = true;
  }
  else
  {
		$permiso_editar = false;
  }
  */

  $valor = new valor();
  $valores = $valor->Find_joined_jjmc($id_medicion,$usuario->id);
  $smarty->assign("valores",$valores);
  
  $valor_referencia_medicion = new valor_referencia_medicion();
  $valor_referencia = new valor_referencia();
  if ($valores_referencia_mediciones = $valor_referencia_medicion->Find_joined("id_medicion = $id_medicion"))
  {
    $smarty->assign("valores_referencia_mediciones", $valores_referencia_mediciones);
  }
  // Si hay valores de referencia pero no se han definido en esta medición los creamos
  elseif ($referencias = $valor_referencia->Find("id_indicador = $indicador->id"))
  {
    foreach($referencias as& $referencia)
    {
      $valor_referencia_medicion->id_valor_referencia = $referencia->id;
      $valor_referencia_medicion->id_medicion = $id_medicion;
      $valor_referencia->save();
    }
    $smarty->assign("valores_referencia_mediciones", $referencias);
  }

	$indisub = new indicador_subunidad();
	$indicador_subunidades = $indisub->find("id_usuario = $usuario->id AND id_indicador = $indicador->id");
	$smarty->assign('indicador_subunidades',$indicador_subunidades);

  $entidad = new entidad();
  $entidad->load("id = $indicador->id_entidad");
  $smarty->assign('entidad', $entidad);
  
  $smarty->assign("usuario", $usuario);
  $smarty->assign("_nombre_pagina", "Medición $medicion->etiqueta - $indicador->nombre");
	$smarty->assign('_javascript', array('medicion_editar'));
  $plantilla = "medicion_editar.tpl";
}
else
{
  $error = "Faltan parámetros para mostrar los datos de la medición";
  header("location:index.php?error=$error");
}
?>
