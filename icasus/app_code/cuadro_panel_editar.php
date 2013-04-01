<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: cuadromando_listar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Lista los cuadros de mando definidos por este usuario
//---------------------------------------------------------------------------------------------------

$cuadro = new cuadro();
$cuadros = $cuadro->find_joined($usuario->id);
$smarty->assign('cuadros',$cuadros);

$plantilla = 'cuadro_listar.tpl';
$smarty->assign('_nombre_pagina' , 'Tus cuadros de mando');
?>