<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: grupo_datos.php
// Tipo: Controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Muestra los datos de una entidad y los usuarios que tiene
//---------------------------------------------------------------------------------------------------

include_once('function/sanitize.php');
global $smarty;
global $basedatos;
global $plantilla;
global $operario;

$smarty->assign('_javascript' , array('ordenatabla'));

if ($_REQUEST['id_grupo'])
{
	$id_grupo = sanitize($_REQUEST['id_grupo'],2);
	$grupo = new grupo();
        $datos_grupo = $grupo->Find('id='.$id_grupo);
	$smarty->assign('grupo' , $datos_grupo);
	$smarty->assign('usuarios' , $grupo->listar_usuarios($id_grupo));
	$smarty->assign('_nombre_pagina' , 'Grupo: ' . $datos_grupo[0]->nombre);
	$plantilla = "grupo_datos.tpl";
}
else
{
	$error = "No se puede mostrar la entidad por falta de parámetros.";
	$smarty->assign('error',$error);
	$smarty->assign('_nombre_pagina' , 'Error');
	$plantilla = "error.tpl";
}
?>
