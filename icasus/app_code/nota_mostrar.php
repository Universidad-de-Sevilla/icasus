<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: nota_mostrar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Muestra las notas del usuario
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;

$smarty->assign('_nombre_pagina', TXT_USER_NOTAS);
$plantilla = 'nota_mostrar.tpl';

