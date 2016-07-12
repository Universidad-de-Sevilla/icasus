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

if (filter_has_var(INPUT_GET, 'id_objest') && filter_has_var(INPUT_GET, 'id_entidad'))
{
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $id_objest = filter_input(INPUT_GET, 'id_objest', FILTER_SANITIZE_NUMBER_INT);

    //Obtenemos los datos del objetivo estratégico
    $objest = new ObjetivoEstrategico();
    if ($objest->load("id = $id_objest"))
    {
        $id_linea = $objest->id_linea;
        $linea = new Linea();
        $linea->load("id = $id_linea");
        $objop = new ObjetivoOperacional();
        $objop_objest = $objop->Find("id_objest=$id_objest");
        if (!$objop_objest && $control)
        {
            $exito = MSG_OBJEST_BORRADO . ' ' . $linea->indice . '.' . $objest->indice . '. ' . $objest->nombre;
            $objest->delete();
            //Borrado de ejecuciones anuales
            $ejecucion = new Ejecucion();
            while ($ejecucion->load("id_objest = $id_objest"))
            {
                $ejecucion->delete();
            }
            header("Location: index.php?page=linea_mostrar&id_linea=$id_linea&id_entidad=$id_entidad&exito=$exito");
        }
        else
        {
            $aviso = MSG_OBJEST_BORRAR;
            header("Location: index.php?page=objest_mostrar&id_objest=$id_objest&id_entidad=$id_entidad&aviso=$aviso");
        }
    }
    else
    {
        $error = ERR_OBJEST_MOSTRAR;
        header("location:index.php?page=error&error=$error");
    }
}
else
{
    $error = ERR_PARAM;
    header("Location: index.php?page=error&error=$error");
}
