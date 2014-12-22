<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (https://forja.rediris.es/projects/icasus/)
// Archivo: dimension_editar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Edición de nuevas dimensiones
//---------------------------------------------------------------------------------------------------

global $smarty;
global $basedatos;
global $plantilla;

//if (isset($_REQUEST['id']))
if (filter_has_var(INPUT_POST, 'id'))
{
//	$id_dimension = sanitize($_REQUEST['id'],16);
    $id_dimension = filter_input(INPUT_POST, 'id', FILTER_SANITIZE_NUMBER_INT);
    $dimension = new Dimension();
    $dimension->load("id = $id_dimension");

    // Si vienen los datos necesarios del formulario grabamos
//	if (isset($_POST['nombre']))
    if (filter_has_var(INPUT_POST, 'nombre'))
    {
//		$dimension->nombre = sanitize($_POST['nombre'],2);
        //$dimension->codigo = sanitize($_POST['codigo'],2);
        $dimension->nombre = filter_input(INPUT_POST, 'nombre', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
        $adodb->execute("SET NAMES utf8");
        $dimension->save();
        $smarty->assign('aviso', MSG_DIM_EDITADA);

        // Array de dimensiones que pasamos a la vista para ver las existentes
        $dimensiones = $dimension->find('1 = 1 ORDER BY nombre');
        $smarty->assign('dimensiones', $dimensiones);
        $plantilla = "dimension_crear.tpl";
        $smarty->assign('_nombre_pagina', TXT_DIM_REL);
    }
    else
    {
        $smarty->assign('dimension', $dimension);
        $smarty->assign('_nombre_pagina', TXT_DIM_EDIT);
        $plantilla = "dimension_editar.tpl";
    }
}
else
{
    $smarty->assign('error', ERR_PARAM);
    $plantilla = "error.tpl";
}

