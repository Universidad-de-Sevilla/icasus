<?php

//------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: cuadro_mostrar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//------------------------------------------------------------------------------
// Muestra un cuadro de mando con todos sus paneles
//------------------------------------------------------------------------------

if (filter_has_var(INPUT_GET, 'id_cuadro'))
{
    $id_cuadro = filter_input(INPUT_GET, 'id_cuadro', FILTER_SANITIZE_NUMBER_INT);
    $smarty->assign("id_cuadro", $id_cuadro);
    $cuadro = new Cuadro();
    if ($cuadro->load("id = $id_cuadro AND (id_usuario = $usuario->id OR privado = 0)"))
    {
        $smarty->assign("cuadro", $cuadro);

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
