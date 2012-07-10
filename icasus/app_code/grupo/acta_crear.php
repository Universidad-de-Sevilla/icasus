<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: acta_crear.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Crea un acta de un grupo de trabajo
//---------------------------------------------------------------------------------------------------

require_once('function/sanitize.php');
global $smarty;
global $basedatos;
global $plantilla;

$smarty->assign('_javascript' , array('acta_crear'));

// Esto es para prevenir que se cargue el script sin pasar por index.php
if (!is_object($smarty))
{
        header('Location:index.php');
}
//devuelve el valor mas alto del numero de acta
$acta = new acta();
$valor = $acta->ultima_acta($id_entidad);
$smarty->assign('ultima', $valor);

$entidad = new entidad($basedatos);
$entidad->obtener_datos($id_entidad);
$smarty->assign('id_entidad', $entidad->datos['id_entidad']);
$smarty->assign('_nombre_pagina' , $entidad->datos['nombre']);
$plantilla = 'grupo/acta_crear.tpl';
?>

