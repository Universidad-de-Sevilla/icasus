<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (https://forja.rediris.es/projects/icasus/)
// Archivo: indicador_crear2.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Creación de nuevos indicadores
//---------------------------------------------------------------------------------------------------

global $smarty;
global $basedatos;
global $plantilla;

$smarty->assign('_javascript' , array('indicador_validar'));
$id_entidad = sanitize($_REQUEST['id_entidad'],16);

$entidad = new entidad($basedatos);
$smarty->assign('usuarios',$entidad->listar_usuarios($id_entidad));
$smarty->assign('procesos',$entidad->listar_procesos($id_entidad));
$indicador = new indicador($basedatos);
$smarty->assign('dimensiones',$indicador->listar_dimensiones());
$smarty->assign('entidad', $entidad->obtener_datos($id_entidad));
$smarty->assign('barra_indicadores',$entidad->barra_indicadores()); //para el desplegable de la barra de arriba 
$smarty->assign('_nombre_pagina' , $entidad->datos['nombre']);
$plantilla = 'indicador_crear2.tpl';
?>
