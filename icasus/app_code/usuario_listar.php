<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: usuario_listar.php
//---------------------------------------------------------------------------------------------------
// Muestra un listado de usuarios del sistema completo o resultado de una búsqueda
//---------------------------------------------------------------------------------------------------
global $smarty;
global $plantilla;

$smarty->assign('_javascript', array('ordenatabla'));
$smarty->assign('_nombre_pagina', 'Lista de usuarios');

$usuario = new usuario();
if (isset($_REQUEST['criterio']))
{
  $criterio = sanitize($_REQUEST['criterio'],SQL);
  $smarty->assign('criterio', $criterio);
  $where = "nombre LIKE '%$criterio%' OR apellidos LIKE '%$criterio%' OR correo LIKE '%$criterio%' OR login LIKE '%$criterio%' ";
}
else
{
  $where = "1 = 1 ";
}
$usuarios = $usuario->Find($where);

$smarty->assign('usuarios',$usuarios);
$plantilla = 'usuario_listar.tpl';
?>
