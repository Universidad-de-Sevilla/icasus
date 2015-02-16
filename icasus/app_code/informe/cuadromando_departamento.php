<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: cuadromando_departamento.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Prepara los datos para mostrar el formulario que permite crear un nuevo cuadro de mando
//---------------------------------------------------------------------------------------------------
//$tipo = sanitize($_GET["tipo"], 2);

$tipo = filter_input(INPUT_GET, 'tipo', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));

$smarty->assign('_nombre_pagina', TXT_INDIC_SEG_DEPART);
$plantilla = 'informes/cuadromando_departamento.tpl';
$ado_entidad = new ado_entidad();
$periodos = array('2009', '2010', '2011');
$codigos = array('AOG-I2', 'AOG-I1', 'MS-I2', 'MS-I1', 'GE-I1', 'GE-I2');
$entidades = $ado_entidad->seguimiento_entidad($periodos, $codigos, 'UE01', $tipo);
//ºprint_r($entidades);
$smarty->assign('tipo', $tipo);
$smarty->assign('colspan', count($periodos));
$smarty->assign('codigos', $codigos);
$smarty->assign('entidades', $entidades);

