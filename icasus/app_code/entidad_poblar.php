<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: entidad_poblar.php
//---------------------------------------------------------------------------------------------------
// Muestra un listado de usuarios para ser asignados a una unidad
// Si los usuario ya vienen señalados se graban en la tabla usuario_unidad
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;

if (isset($_REQUEST["id_entidad"]))
{
  $id_entidad = sanitize($_REQUEST['id_entidad'],INT);
  // Si vienen datos del formulario asignamos los usuarios marcados a la entidad
  if (isset($_REQUEST['id_rol']) AND isset($_REQUEST['id_usuario']))
  {
    $id_rol = sanitize($_REQUEST['id_rol'],INT);
    $contador = 0;
    $usuario_entidad = new usuario_entidad;
    foreach ($_REQUEST['id_usuario'] as $id_usuario)
    {
      $id_usuario = sanitize($id_usuario,INT);
      $usuario_entidad->id_usuario = $id_usuario;
      $usuario_entidad->id_entidad = $id_entidad;
      $usuario_entidad->id_rol = $id_rol;
      if ($usuario_entidad->save())
      {
        $contador ++;
      }
    }
    $aviso = "Se han agregado $contador usuarios a la entidad";
    header("location:index.php?page=entidad_poblar&id_entidad=$id_entidad&aviso=$aviso");
  }
  // Si no vienen datos en el POST mostramos el formulario
  else
  { 
    /*
		if (isset($_REQUEST['criterio']))
    {		
      $criterio = sanitize($_REQUEST['criterio'],SQL);
      $where = "nombre LIKE '%$criterio%' OR apellidos LIKE '%$criterio%' OR correo LIKE '%$criterio%' OR login LIKE '%$criterio%' OR unidad_hominis LIKE '%criterio%' ORDER BY apellidos ";
    }
    else
    {
      // Si no se ha buscado nada listamos todos
      $where = "1 = 1 ORDER BY apellidos";
      $criterio = "";
    }
    $smarty->assign('criterio', $criterio);
   */ 
    $persona = new usuario();
    $where = "1 = 1 ORDER BY apellidos";
    $personas = $persona->Find_sql($where);
    $smarty->assign('personas',$personas);
    
    $rol = new rol();
    $roles = $rol->Find("objeto = 'entidad' ORDER BY orden");
    $smarty->assign('roles',$roles);
    
    $entidad = new entidad();
    $entidad->load("id = $id_entidad");
    $smarty->assign('entidad',$entidad);
    $smarty->assign('_nombre_pagina' , 'Unidad: ' . $entidad->nombre);
    $plantilla = 'entidad_poblar.tpl';
	
		$usuario_entidad = new usuario_entidad;
		$usuarios = $usuario_entidad->Find_usuarios("id_entidad = $id_entidad");
		$smarty->assign('usuarios', $usuarios);
	}
}
else
{
  $error = "No se ha especificado una unidad para asignar usuarios.";
  header("location:index.php?error=$error");
}
?>
