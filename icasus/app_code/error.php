<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: error.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Muestra la página de error
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;

$smarty->assign('_nombre_pagina', ERR);
$plantilla = 'error.tpl';
