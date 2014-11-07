<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: nota_mostrar.php
//---------------------------------------------------------------------------------------------------
// Muestra las notas del usuario
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;

$smarty->assign('_nombre_pagina', TXT_USER_NOTAS);
$plantilla = 'nota_mostrar.tpl';

