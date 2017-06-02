<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: cartas/cartas.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Lista todas las cartas de servicios
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;

//Cartas
$cartas = $carta->Find_joined("1=1 ORDER BY fecha DESC");
$smarty->assign('cartas', $cartas);

$smarty->assign('_nombre_pagina', TXT_CARTAS_US);
$plantilla = 'cartas/cartas.tpl';
