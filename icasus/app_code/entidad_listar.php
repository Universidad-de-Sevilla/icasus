<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: entidad.php
// Desarrolladores: Juanan Ruiz (juanan@us.es) y Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Controla todas las acciones relacionadas con las entidades
//---------------------------------------------------------------------------------------------------
global $smarty;
global $operario;
global $plantilla;

$smarty->assign('_javascript', array('ordenatabla'));
$smarty->assign('_nombre_pagina', 'Lista de Unidades');

// Entidades de este usuario
$entidades_operario = $operario->entidades;
print_r($operario);
print_r($entidades_operario);
//$grupos_operario = $operario->obtener_grupos($operario->id_usuario);

//Todas las entidades
if (isset($_REQUEST['criterio']))
{
	$criterio = $_REQUEST['criterio'];
	$where = " WHERE nombre LIKE '%$criterio%' OR codigo LIKE '%$criterio%'";
	$smarty->assign('criterio', $criterio);
    $entidad = new entidad($basedatos);
    $lista_entidades = $entidad->listar($where);
    $smarty->assign('lista_entidades',$lista_entidades);
}
$smarty->assign('entidades_operario',$entidades_operario);
//$smarty->assign('grupos_operario',$grupos_operario);
$plantilla = 'entidad_listar.tpl';
?>
