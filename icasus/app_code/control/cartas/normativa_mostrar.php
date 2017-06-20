<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: cartas/normativa_mostrar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Muestra la página principal de un Servicio
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
global $usuario;

if (filter_has_var(INPUT_GET, 'id_entidad') AND filter_has_var(INPUT_GET, 'id_normativa'))
{
    $id_normativa = filter_input(INPUT_GET, 'id_normativa', FILTER_SANITIZE_NUMBER_INT);
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

    //Obtenemos los datos de la Normativa
    $normativa = new Normativa();
    if ($normativa->load_joined("id = $id_normativa"))
    {
        $smarty->assign('normativa', $normativa);
    }
    else
    {
        $error = ERR_NORMATIVA_MOSTRAR;
        header("location:index.php?page=error&error=$error");
    }

    //Carta de Servicios
    $carta = $normativa->carta;
    $smarty->assign('carta', $carta);

    //Obtener todas las Normativas para avanzar o retroceder
    $normativas = $normativa->Find("id_carta=$carta->id");
    $smarty->assign("normativas", $normativas);
    $cont = 0;
    foreach ($normativas as $norm)
    {
        if ($id_normativa == $norm->id)
        {
            $indice = $cont;
            $smarty->assign("indice", $indice);
        }
        $cont++;
    }

    $entidad = new Entidad();
    $entidad->load("id = $id_entidad");
    $smarty->assign('entidad', $entidad);

    $smarty->assign('_javascript', array('normativa_mostrar'));
    $smarty->assign('_nombre_pagina', FIELD_NORMATIVA . ": " . $normativa->nombre);
    $plantilla = 'cartas/normativa_mostrar.tpl';
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
