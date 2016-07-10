<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: panel_editar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Controlador principal para editar paneles
//---------------------------------------------------------------------------------------------------

if (filter_has_var(INPUT_GET, 'id_panel') && filter_has_var(INPUT_GET, 'id_cuadro'))
{
    $id_panel = filter_input(INPUT_GET, 'id_panel', FILTER_SANITIZE_NUMBER_INT);
    $panel = new Panel();
    $panel->Load(("id = $id_panel"));
    $smarty->assign('panel', $panel);

    $id_cuadro = filter_input(INPUT_GET, 'id_cuadro', FILTER_SANITIZE_NUMBER_INT);
    $cuadro = new Cuadro();
    $cuadro->Load("id=$id_cuadro");
    $smarty->assign("cuadro", $cuadro);

    $entidad = new Entidad();
    $entidad->load("id=$cuadro->id_entidad");
    $smarty->assign("entidad", $entidad);

    //Validar orden del panel dentro del cuadro de mando
    $ordenes = array();
    $paneles = $panel->Find("id_cuadro=$id_cuadro");
    foreach ($paneles as $pl)
    {
        if ($pl->orden != $panel->orden)
        {
            array_push($ordenes, $pl->orden);
        }
    }
    $smarty->assign('elementos', $ordenes);

    //Guardamos los cambios
    if (filter_has_var(INPUT_POST, 'nombre') && filter_has_var(INPUT_POST, 'orden') && filter_has_var(INPUT_POST, 'ancho'))
    {
        $panel->nombre = filter_input(INPUT_POST, 'nombre', FILTER_SANITIZE_STRING);
        $panel->orden = filter_input(INPUT_POST, 'orden', FILTER_SANITIZE_NUMBER_INT);
        $panel->ancho = filter_input(INPUT_POST, 'ancho', FILTER_SANITIZE_NUMBER_INT);
        //Si es un panel de líneas o de tipo tabla simple
        if ($panel->id_paneltipo == 2 || $panel->id_paneltipo == 5)
        {
            $panel->anyos_atras = filter_input(INPUT_POST, 'anyos_atras', FILTER_SANITIZE_NUMBER_INT);
        }
        $panel->Save();
        $exito = MSG_PANEL_EDITADO . ' ' . $panel->nombre;
        $smarty->assign("exito", $exito);
        header("Location: index.php?page=cuadro_mostrar&id_cuadro=$id_cuadro&id_entidad=$cuadro->id_entidad&exito=$exito");
    }
    $smarty->assign('_nombre_pagina', TXT_PANEL_EDITAR . ': ' . $panel->nombre);
    $plantilla = 'panel_editar.tpl';
}
else
{
    // Faltan parametros avisamos error
    $error = ERR_PARAM;
    header("Location: index.php?page=cuadro_listar&id_entidad=$cuadro->id_entidad&error=$error");
}
