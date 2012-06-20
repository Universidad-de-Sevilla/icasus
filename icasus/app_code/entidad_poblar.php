<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: entidad_poblar.php
//---------------------------------------------------------------------------------------------------
// Descripcion: Muestra un listado de usuarios para ser asignados a una unidad
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;

$id_entidad = sanitize($_REQUEST['id_entidad'],16);
$entidad = new entidad();
$entidad->load("id = $id_entidad");
$smarty->assign('entidad',$entidad);
$smarty->assign('_nombre_pagina' , $entidad->nombre);
// Si vienen datos del formulario asignamos los usuarios marcados a la entidad
if (isset($_POST['id_rol']) && isset($_POST['id_usuario']))
{
	$id_rol = sanitize($_POST['id_rol'],INT);
	$contador = 0;
  $usuario_entidad = new usuario_entidad;
	foreach ($_POST['id_usuario'] as $id_usuario)
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
  $miembro = new usuario();
  $miembros = $miembro->Find_joined("id_entidad = $id_entidad");
	$smarty->assign('usuarios',$usuarios);
	$smarty->assign('aviso',"Se han agregado $contador usuarios a la entidad");	
	$plantilla = 'entidad_datos.tpl';
}
// Si no vienen datos en el POST mostramos el formulario
else
{ 
	if (isset($_REQUEST['criterio']))
	{		
		$criterio = sanitize($_REQUEST['criterio'],2);
		$smarty->assign('criterio', $criterio);
		$where = " WHERE nombre LIKE '%$criterio%' OR apellidos LIKE '%$criterio%' 
			OR correo LIKE '%$criterio%' OR login LIKE '%$criterio%' ";
	}
	else
	{
		// Si no se ha buscado nada listamos todos
		$where = " WHERE 1 = 1 ";
	}
	$usuario = new usuario($basedatos);
	$smarty->assign('lista_usuarios',$usuario->listar($where));
	$smarty->assign('roles',$entidad->listar_roles());
	$plantilla = 'entidad_poblar.tpl';
}
?>
