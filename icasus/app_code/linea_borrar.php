<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: linea_borrar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Borra una línea estratégica
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
global $usuario;

if (filter_has_var(INPUT_GET, 'id_linea') && filter_has_var(INPUT_GET, 'id_entidad'))
{
    $id_linea = filter_input(INPUT_GET, 'id_linea', FILTER_SANITIZE_NUMBER_INT);
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

    //Obtenemos los datos de la línea
    $linea = new Linea();
    if ($linea->load("id = $id_linea"))
    {
        $id_plan = $linea->id_plan;
        $plan = new Plan();
        $plan->load("id=$id_plan");
        $objest = new ObjetivoEstrategico();
        $objest_linea = $objest->Find("id_linea=$id_linea");
        if (!$objest_linea && $control)
        {
            $exito = MSG_LINEA_BORRADA . ' ' . $linea->indice . '. ' . $linea->nombre;
            $linea->delete();
            header("Location: index.php?page=plan_mostrar&id_plan=$id_plan&id_entidad=$id_entidad&exito=$exito");
        }
        else
        {
            $aviso = MSG_LINEA_BORRAR;
            header("Location: index.php?page=linea_mostrar&id_entidad=$id_entidad&id_linea=$id_linea&aviso=$aviso");
        }
    }
    else
    {
        $error = ERR_LINEA_MOSTRAR;
        header("location:index.php?page=error&error=$error");
    }
}
else
{
    $error = ERR_PARAM;
    header("Location: index.php?page=error&error=$error");
}
