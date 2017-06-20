<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: cartas/derecho_mostrar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Muestra la página principal de un Derecho
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
global $usuario;

if (filter_has_var(INPUT_GET, 'id_entidad') AND filter_has_var(INPUT_GET, 'id_derecho'))
{
    $id_derecho = filter_input(INPUT_GET, 'id_derecho', FILTER_SANITIZE_NUMBER_INT);
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

    //Obtenemos los datos del Derecho
    $derecho = new Derecho();
    if ($derecho->load_joined("id = $id_derecho"))
    {
        $smarty->assign('derecho', $derecho);
    }
    else
    {
        $error = ERR_DERECHO_MOSTRAR;
        header("location:index.php?page=error&error=$error");
    }

    //Carta de Servicios
    $carta = $derecho->carta;
    $smarty->assign('carta', $carta);

    //Obtener todas los Derechos para avanzar o retroceder
    $derechos = $derecho->Find("id_carta=$carta->id");
    $smarty->assign("derechos", $derechos);
    $cont = 0;
    foreach ($derechos as $der)
    {
        if ($id_derecho == $der->id)
        {
            $indice = $cont;
            $smarty->assign("indice", $indice);
        }
        $cont++;
    }

    $entidad = new Entidad();
    $entidad->load("id = $id_entidad");
    $smarty->assign('entidad', $entidad);

    $smarty->assign('_javascript', array('derecho_mostrar'));
    $smarty->assign('_nombre_pagina', FIELD_DERECHO . ": " . $derecho->nombre);
    $plantilla = 'cartas/derecho_mostrar.tpl';
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
