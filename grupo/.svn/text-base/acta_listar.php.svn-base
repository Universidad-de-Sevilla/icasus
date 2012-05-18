<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: acta_listar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Crea un acta de un grupo de trabajo
//---------------------------------------------------------------------------------------------------

require_once('function/sanitize.php');
global $smarty;
global $plantilla;


// Esto es para prevenir que se cargue el script sin pasar por index.php
if (!is_object($smarty))
{
  header('Location:index.php');
}
//comprueba variabes
$id_usuario = $_SESSION["id_usuario"];
$id_entidad = sanitize($_REQUEST['id_entidad'],2);
//echo $id_usuario.' -- '.$id_entidad;
//comprueba permisos       
$condicion = "id_entidad=".$id_entidad." AND id_usuario =".$id_usuario;
$permisos = new usuario_entidad();
$permiso = $permisos->find($condicion);

//print_r($permiso); //$permiso[0]->id_rol;

if ($_REQUEST['id_entidad'])
{
	//relacionar las actas de esta entidad o grupo de trabajo
	$acta = new acta();
	$condicion = 'id_entidad='.$id_entidad;
	
	$actas = $acta->Find_joined($condicion);
	$smarty->assign('id_entidad',$id_entidad);
	$smarty->assign('actas',$actas);
	$smarty->assign('_nombre_pagina' , $actas[0]->entidad);
	$smarty->assign('rol' ,$permiso[0]->id_rol);
	$plantilla = 'grupo/acta_listar.tpl';
}
else
{
    $error = "No se puede mostrar el equipo falta de parámetros.";
    $smarty->assign('error',$error);
    $smarty->assign('_nombre_pagina' , 'Error');
    $plantilla = "error.tpl";
}

?>
