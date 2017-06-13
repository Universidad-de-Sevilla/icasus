<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: cartas/carta_ajax.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Gestiona la creación/edición de Normativas de una Carta de Servicios
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;

$modulo = filter_input(INPUT_GET, 'modulo', FILTER_SANITIZE_STRING);
$smarty->assign('modulo', $modulo);
$plantilla = 'cartas/carta_ajax.tpl';

if ($modulo == 'crear_normativa')
{
    $id_carta = filter_input(INPUT_POST, 'id_carta', FILTER_SANITIZE_NUMBER_INT);
    $carta = new Carta();
    $carta->Load("id=$id_carta");
    if ($control)
    {
        $nombre = filter_input(INPUT_POST, 'nombre', FILTER_SANITIZE_STRING);
        $url = filter_input(INPUT_POST, 'url', FILTER_SANITIZE_URL);
        $normativa = new Normativa();
        $normativa->id_carta = $id_carta;
        $normativa->nombre = $nombre;
        $normativa->enlace = $url;
        $normativa->Save();
        $smarty->assign('carta', $carta);
        //Normativas
        $normativas = $normativa->Find("id_carta=$id_carta");
        $smarty->assign('normativas', $normativas);
    }
    else
    {
        $error = ERR_PERMISOS;
        header("Location: index.php?page=carta_mostrar&id_carta=$id_carta&id_entidad=$carta->id_entidad&error=$error");
    }
}

if ($modulo == 'editar_normativa')
{
    $id_normativa = filter_input(INPUT_POST, 'id_normativa', FILTER_SANITIZE_NUMBER_INT);
    $normativa = new Normativa();
    $normativa->load_joined("id=$id_normativa");
    $carta = $normativa->carta;
    if ($control)
    {
        $nombre = filter_input(INPUT_POST, 'nombre', FILTER_SANITIZE_STRING);
        $url = filter_input(INPUT_POST, 'url', FILTER_SANITIZE_URL);
        $normativa->nombre = $nombre;
        $normativa->enlace = $url;
        $normativa->Save();
        $smarty->assign('carta', $carta);
        //Normativas
        $normativas = $normativa->Find("id_carta=$normativa->id_carta");
        $smarty->assign('normativas', $normativas);
    }
    else
    {
        $error = ERR_PERMISOS;
        header("Location: index.php?page=carta_mostrar&id_carta=$normativa->id_carta&id_entidad=$carta->id_entidad&error=$error");
    }
}
