<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: nota_mostrar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Muestra las notas del usuario
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
global $adodb;

$smarty->assign('_nombre_pagina', 'Notas del usuario');

$id_usuario = $operario->id_usuario;

$consulta = "SELECT mis_notas FROM usuario WHERE id_usuario=$id_usuario";
$notas = $adodb->execute($consulta);

//Pasa a la plantilla el contenido del campo mis_notas
$smarty->assign('notas',$notas->fields['mis_notas']);
$plantilla = 'nota_mostrar.tpl';
?>
