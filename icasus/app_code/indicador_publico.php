<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: cuadromando_crear.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Crea un nuevo cuadro de mandos para un usuario
//--------------------------------------------------------------------------------------------------- 

global $smarty;
global $plantilla;
global $_usuario;

// Esto es para prevenir que se cargue el script sin pasar por index.php
if (!is_object($smarty))
{
    header('Location:index.php');
}

$entidad = new ado_indicador();
$indicadores = $entidad->indicador_publico();
//print_r($indicadores);
$smarty->assign('indicadores', $indicadores);

$smarty->assign('_nombre_pagina', TXT_INDIC_PUBLIC);
$plantilla = 'indicador_publico.tpl';


