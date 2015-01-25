<?php

//------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: cuadro_mostrar.php
//------------------------------------------------------------------------------
// Muestra un cuadro de mando con todos sus paneles
//------------------------------------------------------------------------------
//if (!empty($_REQUEST["id"]))
if (filter_has_var(INPUT_GET, 'id'))
{
//  $id_cuadro = sanitize($_REQUEST["id"], INT);
    $id_cuadro = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);
    $smarty->assign("id_cuadro", $id_cuadro);
    $cuadro = new Cuadro();
    if ($cuadro->load("id = $id_cuadro AND (id_usuario = $usuario->id OR privado = 0)"))
    {
        $smarty->assign("cuadro", $cuadro);

        $panel = new Panel();
        $paneles = $panel->Find_joined("id_cuadro = $id_cuadro ORDER BY orden");
        $smarty->assign("paneles", $paneles);

        $smarty->assign("_nombre_pagina", "$cuadro->nombre");
        $plantilla = "cuadro_mostrar.tpl";
    }
    else
    {
        $error = ERR_CUAD_MANDO;
        header("location:index.php?page=error&error=$error");
    }
}
else
{
    $error = ERR_CUAD_MANDO_PARAM;
    header("location:index.php?page=error&error=$error");
}
