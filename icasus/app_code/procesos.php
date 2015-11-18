<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: proceso_listar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Lista los procesos definidos en esta unidad
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;

$proceso = new Proceso();
$procesos = $proceso->Find_joined("1=1 ORDER BY codigo");
$smarty->assign('procesos', $procesos);

$smarty->assign('_nombre_pagina', TXT_PROCS);
$plantilla = 'procesos.tpl';
