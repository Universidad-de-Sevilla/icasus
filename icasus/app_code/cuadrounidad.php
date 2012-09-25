<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: cuadrounidad.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Lista los indicadores de la unidad
//---------------------------------------------------------------------------------------------------

global $smarty;
global $usuario;
global $plantilla;

// Esto es para prevenir que se cargue el script sin pasar por index.php
if (!is_object($smarty))
{
	header('Location:index.php?page=cuadromando_listar');	
}
$id_unidad = sanitize($_GET["id_entidad"],2);

$indicador = new indicador();
$indicadores_propios = $indicador->find("id_entidad = $id_unidad");

$indicador_desagregado = new indicador_subunidad();
$indicadores_desagregados = $indicador_desagregado->indicador_desagregado($id_unidad);

//print_r($indicadores_desagregados);

$smarty->assign('indicadores_propios',$indicadores_propios);
$smarty->assign('indicadores_desagregados',$indicadores_desagregados);

$plantilla = 'cuadrounidad.tpl';
$smarty->assign('_nombre_pagina' , 'Cuadros de mando de la unidad');
?>
