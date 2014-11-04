<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (https://forja.rediris.es/projects/icasus/)
// Archivo: entidad_crear.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Creación de nuevas entidades
//---------------------------------------------------------------------------------------------------

global $smarty;
global $basedatos;
global $plantilla;

$entidad = new entidad($basedatos);

// Si vienen todos los datos necesarios del formulario grabamos
if (isset($_POST['nombre']) && isset($_POST['id_padre'])) {
    $nombre = sanitize($_POST['nombre'], 2);
    $codigo = isset($_POST['codigo']) ? sanitize($_POST['codigo'], 2) : '';
    $web = isset($_POST['web']) ? sanitize($_POST['web'], 2) : '';
    $id_padre = sanitize($_POST['id_padre'], 16);
    //leemos ict del padre y lo hereda la unidad que se está creando
    $entidad_padre = new ado_entidad();
    $entidad_padre->load("id_entidad = $id_padre");
    $ict = $entidad_padre->ict;

    if ($id_entidad = $entidad->crear($nombre, $codigo, $web, $id_padre, $ict, $objeto, $frecuencia)) {
        $smarty->assign('entidad', $entidad->obtener_datos($id_entidad));
        $smarty->assign('aviso', MSG_UNID_CREADA);
        $smarty->assign('_nombre_pagina', $entidad->datos['nombre']);
        $plantilla = "entidad_datos.tpl";
    } else {
        $smarty->assign('error', $entidad->error);
        $smarty->assign('_nombre_pagina', ERR_ERR);
        $plantilla = 'error.tpl';
    }
}
// Si no vienen datos mostramos el formulario
else {
    //$entidades = $entidad->listar(' WHERE id_padre = 1 ');
    $entidades = $entidad->listar(' WHERE 1 = 1 ');
    $smarty->assign('entidades', $entidades);
    $plantilla = "entidad_crear.tpl";
    $smarty->assign('_nombre_pagina', TXT_UNIDS);
}

