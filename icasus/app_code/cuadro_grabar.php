<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: cuadro_crear.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Crea un nuevo cuadro de mandos para un usuario
//---------------------------------------------------------------------------------------------------
// Comprueba que vienen los datos mínimos
if (isset($_REQUEST['nombre'])) {
    // Guardamos los datos que vienen del formulario
    $cuadro = new Cuadro();
    // Si viene el id es que estamos editando uno existente
    if (isset($_REQUEST['id'])) {
        $id = sanitize($_REQUEST['id'], 16);
        if ($cuadro->load("id = $id AND id_usuario = $usuario->id") == false) {
            $error = ERR_CUAD_MANDO_EDIT;
            header("Location: index.php?page=cuadro_listar&error=error");
        }
    }
    $cuadro->id_usuario = $usuario->id;
    $cuadro->nombre = sanitize($_REQUEST['nombre'], 2);
    $cuadro->privado = sanitize($_REQUEST['privado'], 16);
    $cuadro->comentarios = isset($_REQUEST['comentarios']) ? sanitize($_REQUEST['comentarios'], 2) : '';
    $cuadro->save();
    header("Location: index.php?page=cuadro_mostrar&id=$cuadro->id");
} else {
    // Avisamos de error por falta de parametros
    $error = ERR_PARAM;
    header("Location: index.php?page=cuadro_listar&error=error");
}


