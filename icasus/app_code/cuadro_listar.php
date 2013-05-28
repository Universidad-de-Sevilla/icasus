<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: cuadro_listar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Lista los cuadros de mando definidos por este usuario
//---------------------------------------------------------------------------------------------------

$cuadro = new cuadro();
$cuadros = $cuadro->Find("id_usuario = $usuario->id");
$smarty->assign('cuadros_propios',$cuadros);

$cuadros = $cuadro->Find("privado = 0");
$smarty->assign('cuadros_publicos',$cuadros);

$plantilla = 'cuadro_listar.tpl';
$smarty->assign('_nombre_pagina' , 'Cuadros de mando');
?>
