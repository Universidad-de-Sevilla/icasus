<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: panel_borrar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Borra paneles 
//---------------------------------------------------------------------------------------------------

global $smarty;
global $usuario;
global $plantilla;

if (filter_has_var(INPUT_GET, 'id_panel'))
{
    $id_panel = filter_input(INPUT_GET, 'id_panel', FILTER_SANITIZE_NUMBER_INT);
    $panel = new Panel();
    $panel->load("id=$id_panel");
    $cuadro = new Cuadro();
    $cuadro->load("id=$panel->id_cuadro");
    if ($cuadro->id_usuario == $usuario->id || $control)
    {
        $panel->borrar_panel("id = $id_panel");
    }
    else
    {
        $error = ERR_PERMISOS;
        header("location:index.php?page=cuadro_mostrar&id_cuadro=$panel->id_cuadro&id_entidad=$cuadro->id_entidad&error=$error");
    }
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}	
