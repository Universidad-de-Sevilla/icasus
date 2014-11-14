<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: cuadro_editar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Editar un cuadro de mandos existente
//---------------------------------------------------------------------------------------------------
$id_cuadro = filter_input(INPUT_GET | INPUT_POST, 'id_cuadro', FILTER_SANITIZE_NUMBER_INT);
//if (isset($_REQUEST['id_cuadro']))
if ($id_cuadro) {
//	$id_cuadro = sanitize($_REQUEST['id_cuadro'],16);
    $cuadro = new Cuadro();
    $cuadro->load("id = $id_cuadro");
    $smarty->assign('cuadro', $cuadro);
    $smarty->assign('_nombre_pagina', TXT_CUADRO_EDIT);
    $plantilla = 'cuadro_editar.tpl';
} else {
    header("Location: index.php?page=cuadro_listar");
}

