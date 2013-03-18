<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: cuadromando_listar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Lista los cuadros de mando definidos por este usuario
//---------------------------------------------------------------------------------------------------

$cuadromando = new cuadromando();
$cuadromandos = $cuadromando->find_joined($usuario->id);
$smarty->assign('cuadromandos',$cuadromandos);

$plantilla = 'cuadromando_listar.tpl';
$smarty->assign('_nombre_pagina' , 'Tus cuadros de mando');
?>
