<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: objop_borrar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Borra un objetivo operacional
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
global $usuario;

if (filter_has_var(INPUT_GET, 'id_objop') && filter_has_var(INPUT_GET, 'id_entidad'))
{
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $id_objop = filter_input(INPUT_GET, 'id_objop', FILTER_SANITIZE_NUMBER_INT);

    //Obtenemos los datos del objetivo operacional
    $objop = new ObjetivoOperacional();
    if ($objop->load_joined("id = $id_objop"))
    {
        $objest = $objop->objest;
        if ($control || $objop->id_responsable == $usuario->id)
        {
            $exito = MSG_OBJOP_BORRADO . ' ' . $objest->linea->indice . '.' . $objest->indice . '.' . $objop->indice . '. ' . $objop->nombre;
            $objop->delete();
            //Borrado de ejecuciones anuales
            $ejecucion = new Ejecucion();
            while ($ejecucion->load("id_objop = $id_objop"))
            {
                $ejecucion->delete();
            }
            //Borrado de unidades asociadas
            $objetivo_unidad = new ObjetivoUnidad();
            while ($objetivo_unidad->load("id_objop = $id_objop"))
            {
                $objetivo_unidad->delete();
            }
            //Borrado de indicadores asociados
            $objetivo_indicador = new ObjetivoIndicador();
            while ($objetivo_indicador->load("id_objop = $id_objop"))
            {
                $objetivo_indicador->delete();
            }
            header("Location: index.php?page=objest_mostrar&id_objest=$objest->id&id_entidad=$id_entidad&exito=$exito");
        }
        else
        {
            $aviso = MSG_OBJOP_BORRAR;
            header("Location: index.php?page=objop_mostrar&id_objop=$id_objop&id_entidad=$id_entidad&aviso=$aviso");
        }
    }
    else
    {
        $error = ERR_OBJOP_MOSTRAR;
        header("location:index.php?page=error&error=$error");
    }
}
else
{
    $error = ERR_PARAM;
    header("Location: index.php?page=error&error=$error");
}
