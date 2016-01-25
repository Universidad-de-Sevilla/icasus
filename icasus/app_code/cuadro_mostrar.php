<?php

//------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: cuadro_mostrar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//------------------------------------------------------------------------------
// Muestra un cuadro de mando con todos sus paneles
//------------------------------------------------------------------------------

if (filter_has_var(INPUT_GET, 'id_cuadro') && filter_has_var(INPUT_GET, 'id_entidad'))
{
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $entidad = new Entidad();
    $entidad->load("id=$id_entidad");
    $smarty->assign('entidad', $entidad);

    $id_cuadro = filter_input(INPUT_GET, 'id_cuadro', FILTER_SANITIZE_NUMBER_INT);
    $smarty->assign("id_cuadro", $id_cuadro);
    $cuadro = new Cuadro();
    if ($cuadro->load("id = $id_cuadro AND (id_usuario = $usuario->id OR privado = 0)"))
    {
        $smarty->assign("cuadro", $cuadro);

        //Obtener todos los cuadros para avanzar o retroceder 
        $cuadros = $cuadro->Find("privado = 0 AND id_entidad = $id_entidad");
        $smarty->assign("cuadros", $cuadros);
        $cont = 0;
        foreach ($cuadros as $cuad)
        {
            if ($id_cuadro == $cuad->id)
            {
                $indice = $cont;
                $smarty->assign("indice", $indice);
            }
            $cont++;
        }

        $panel = new Panel();
        $paneles = $panel->Find_joined("id_cuadro = $id_cuadro ORDER BY orden");
        $smarty->assign("paneles", $paneles);

        $smarty->assign('_javascript', array('cuadro_mostrar'));
        $smarty->assign("_nombre_pagina", TXT_CUADRO_MANDO . ': ' . "$cuadro->nombre");
        $plantilla = "cuadro_mostrar.tpl";
    }
    else
    {
        $error = ERR_CUAD_MANDO;
        header("location:index.php?page=cuadros&error=$error");
    }
}
else
{
    $error = ERR_CUAD_MANDO_PARAM;
    header("location:index.php?page=cuadros&error=$error");
}
