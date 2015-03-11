<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: panel_borrar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Borra paneles 
//---------------------------------------------------------------------------------------------------
$id_usuario = $usuario->id;

$id_panel = filter_input(INPUT_GET, 'id_panel', FILTER_SANITIZE_NUMBER_INT);
if (!empty($id_panel))
{
    $panel = new Panel();
    if ($panel->permiso_panel($id_usuario, $id_panel))
    {
        $panel->borrar_panel("id = $id_panel");
    }
    else
    {
        //escribir error de permiso en log
    }
}
else
{
    echo ERR_PARAM;
}	

