<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: acta.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Acceso para cumplimenatr un acta 
//---------------------------------------------------------------------------------------------------
require_once('function/sanitize.php');
//pasamos js
$smarty->assign('_javascript' , array('acta'));
// Esto es para prevenir que se cargue el script sin pasar por index.php
if (!is_object($smarty))
{
        header('Location:index.php');
}
if ( isset($_GET['id_acta']) )
{	//cargar datos del acta
	$id_acta = sanitize($_GET['id_acta'],2);
	$acta = new acta();
	$acta ->load_joined('id_acta='.$id_acta);
	$smarty->assign('_nombre_pagina' , $acta->entidad[0]->nombre);
	$smarty->assign('acta' , $acta);
	$plantilla = 'grupo/menu-css.tpl';
}
else
{
	$error = 'Faltan parametros para acceder a esta pagina';
	$smarty -> assign('error',$error);
	$plantilla = 'error.tpl';
}
?>
