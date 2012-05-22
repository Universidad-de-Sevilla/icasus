<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: acta_editar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Completa un acta de un grupo de trabajo
//---------------------------------------------------------------------------------------------------

require_once('function/sanitize.php');
global $smarty;
global $basedatos;
global $plantilla;

$smarty->assign('_javascript' , array('acta'));

// Esto es para prevenir que se cargue el script sin pasar por index.php
if (!is_object($smarty))
{
    header('Location:index.php');
}

$id_acta=sanitize($_GET['id_acta'],2);
$acta = new acta();
$condicion="id_acta=".$id_acta;
$acta ->load_joined($condicion);
$smarty ->assign('acta',$acta);
$smarty->assign('_nombre_pagina' , 'Equipo: '.$acta->entidad[0]->nombre);
$plantilla = 'grupo/acta_editar.tpl';
?>
