<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: entidad_despoblar.php
//---------------------------------------------------------------------------------------------------
// Muestra un listado de usuarios de la unidad para ser desasignados de ella
//---------------------------------------------------------------------------------------------------
global $smarty;
global $plantilla;

$smarty->assign("_javascript", array('ordenatabla');

// Si vienen datos del formulario asignamos los usuarios marcados a la entidad
if (isset($_REQUEST['id_entidad']))
{
	$id_entidad = sanitize($_REQUEST['id_entidad'],INT);
	$entidad = new entidad();
  $entidad = $entidad->load("id = $id_entidad");
  
  if (isset($_REQUEST["id_usuario"]))
  {
    $contador = 0;
    foreach ($_REQUEST['id_usuario'] as $id_usuario)
    {
      $id_usuario = sanitize($id_usuario,INT);
      $entidad->desasignar_usuario($id_entidad,$id_usuario);
      $contador ++;
    }
    $smarty->assign('aviso',"Se han eliminado $contador usuarios de la entidad");	
    $smarty->assign('entidad',$entidades));

    $usuario_entidad = new usuario_entidad;
    $usuarios = $usuario_entidad->Find_usuarios("id_entidad = $id_entidad");
    $smarty->assign('usuarios', $usuarios);

    $nombre_pagina = $entidad->nombre;
    $plantilla = 'entidad_datos.tpl';
  }
  else 
  { 
    $id_entidad = sanitize($_REQUEST['id_entidad'],INT);
    $entidad = new entidad();
    $usuario_entidad = new usuario_entidad;
    $usuarios = $usuario_entidad->Find_usuarios("id_entidad = $id_entidad");
    $smarty->assign('usuarios',$usuarios);
    $smarty->assign('entidad',$entidad->obtener_datos($id_entidad));
    $smarty->assign('_nombre_pagina', $entidad->datos['nombre']);
    $plantilla = 'entidad_despoblar.tpl';
  }
}
else 
{
	$error = "Faltan parámetros para mostrar la página solicitada";
  header("location:index.php?error=$error");
}
?>
