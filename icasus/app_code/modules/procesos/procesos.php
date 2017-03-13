<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: procesos.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Lista todos los procesos
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;

// Procesos propiedad del usuario
$proceso = new Proceso();
$procesos_propios = $proceso->Find_joined("id_propietario=$usuario->id");
$smarty->assign('procesos_propios', $procesos_propios);

$procesos = $proceso->Find_joined("1=1 ORDER BY codigo");
$smarty->assign('procesos', $procesos);

$smarty->assign('_javascript', array('proceso_listar'));
$smarty->assign('_nombre_pagina', TXT_PROCS_US);
$plantilla = 'procesos/procesos.tpl';
