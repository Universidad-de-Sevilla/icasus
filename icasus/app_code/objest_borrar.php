<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: objest_borrar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Borra un objetivo estratégico
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
global $usuario;

if (filter_has_var(INPUT_GET, 'id_objest') && filter_has_var(INPUT_GET, 'id_linea'))
{
    $id_linea = filter_input(INPUT_GET, 'id_linea', FILTER_SANITIZE_NUMBER_INT);
    $id_objest = filter_input(INPUT_GET, 'id_objest', FILTER_SANITIZE_NUMBER_INT);

    $linea = new Linea();
    $linea->load("id = $id_linea");
    $objest = new ObjetivoEstrategico();
    $objest->load("id=$id_objest");
    $objop = new ObjetivoOperacional();
    $objop_objest = $objop->Find("id_objest=$id_objest");
    if (!$objop_objest && $control)
    {
        $exito = MSG_OBJEST_BORRADO . ' ' . $linea->indice . '.' . $objest->indice . '. ' . $objest->nombre;
        $objest->delete();
        header("Location: index.php?page=linea_mostrar&id_linea=$id_linea&id_plan=$linea->id_plan&exito=$exito");
    }
    else
    {
        $aviso = MSG_OBJEST_BORRAR;
        header("Location: index.php?page=objest_mostrar&id_objest=$id_objest&id_linea=$id_linea&aviso=$aviso");
    }
}
else
{
    $error = ERR_PARAM;
    header("Location: index.php?page=error&error=$error");
}
