<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: entidad_despoblar.php
//---------------------------------------------------------------------------------------------------
// Muestra un listado de usuarios de la unidad para ser desasignados de ella
//---------------------------------------------------------------------------------------------------
global $smarty;
global $plantilla;

// Si vienen datos del formulario asignamos los usuarios marcados a la entidad
if (isset($_REQUEST['id_entidad']))
{
$id_entidad = sanitize($_REQUEST['id_entidad'],INT);

$entidad = new entidad();
$entidad->load("id = $id_entidad");
$smarty->assign('entidad',$entidad);
$smarty->assign('_nombre_pagina', $entidad->nombre);

$usuario_entidad = new usuario_entidad;
$usuarios = $usuario_entidad->Find_usuarios("id_entidad = $id_entidad");
$smarty->assign('usuarios',$usuarios);

//print_r($entidad);  

  if (isset($_REQUEST["id_usuario"]))
  {
    $contador = 0;
    foreach ($_REQUEST['id_usuario'] as $id_usuario)
    {
      $id_usuario = sanitize($id_usuario,INT);
      $usuario_entidad->desasignar_usuario($id_entidad,$id_usuario);
      $contador ++;
    }
    $smarty->assign('aviso',"Se han eliminado $contador usuarios de la entidad");	
		header("location:index.php?page=entidad_datos&id_entidad=$id_entidad");
    $plantilla = 'entidad_datos.tpl';
  }
  else 
  { 
    $plantilla = 'entidad_despoblar.tpl';
  }
}
else 
{
	$error = "Faltan parámetros para mostrar la página solicitada";
  header("location:index.php?error=$error");
}
?>
