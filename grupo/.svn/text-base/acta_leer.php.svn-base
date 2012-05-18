<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: acta_leer.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Muestra el contenido del acta 
//---------------------------------------------------------------------------------------------------
require_once('function/sanitize.php');
//pasamos js
$smarty->assign('_javascript' , array('acta'));
global $smarty;
global $basedatos;
global $plantilla;
// Esto es para prevenir que se cargue el script sin pasar por index.php
if (!is_object($smarty))
{
        header('Location:index.php');
}
//cargamos los datos del acta
$id_acta=sanitize($_GET['id_acta'],2);
include('ajax_acta.php');
//comprobamos permisos para crear i editar actas
$permiso = new usuario_entidad();
$permiso->load('id_usuario = '.$operario->id_usuario.' AND id_entidad = '.$acta->id_entidad);
if ($permiso->_saved == 1)
{
		$smarty->assign('_nombre_pagina' , $acta->entidad[0]->nombre);
		$plantilla = 'grupo/acta_leer.tpl';
}
else
{
		$error = 'No tiene permiso para leer este documento';
		$smarty -> assign('error',$error);
		$plantilla = 'error.tpl';
}
?>
