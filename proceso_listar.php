<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: proceso_listar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Lista los cuadros de mando definidos por este usuario
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
global $id_entidad;

// Esto es para prevenir que se cargue el script sin pasar por index.php
if (!is_object($smarty))
{
	header("Location:index.php?page=proceso_listar?id_entidad=$id_entidad");	
}

$proceso = new proceso();
$procesos = $proceso->Find_joined("id_entidad = $id_entidad");
$smarty->assign('procesos',$procesos);

//Entidades a la antigua usanza
$entidad = new entidad($basedatos);
$smarty->assign('entidad',$entidad->obtener_datos($id_entidad));

/* Esto para cuando todas las entidades sean ado
$entidad = new ado_entidad();
$entidad->load("id_entidad = $id_entidad");
$smarty->assign('entidad', $entidad);
 */

$plantilla = 'proceso_listar.tpl';
$smarty->assign('_javascript' , array('ordenatabla','proceso_borrar'));
$smarty->assign('_nombre_pagina' , $entidad->datos['nombre']);
?>
