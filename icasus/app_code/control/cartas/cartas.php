<?php

global $smarty;
global $plantilla;
global $carta;

$cartas = $carta->Find_joined("1=1 ORDER BY fecha DESC");
$smarty->assign('cartas', $cartas);
$smarty->assign('_nombre_pagina', TXT_CARTAS_US);
$plantilla = 'cartas/cartas.tpl';
