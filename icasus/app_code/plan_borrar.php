<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: plan_borrar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Borra un plan estratégico
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
global $usuario;

if (filter_has_var(INPUT_GET, 'id_plan') && filter_has_var(INPUT_GET, 'id_entidad'))
{
    $id_plan = filter_input(INPUT_GET, 'id_plan', FILTER_SANITIZE_NUMBER_INT);
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

    $plan = new Plan();
    $plan->load("id = $id_plan");
    $linea = new Linea();
    $lineas_plan = $linea->Find("id_plan=$id_plan");
    if (!$lineas_plan && $control)
    {
        $exito = MSG_PLAN_BORRADO . " " . $plan->anyo_inicio . "-" . ($plan->anyo_inicio + $plan->duracion);
        $plan->delete();
        header("Location: index.php?page=entidad_mostrar&id_entidad=$id_entidad&exito=$exito");
    }
    else
    {
        $aviso = MSG_PLAN_BORRAR;
        header("Location: index.php?page=plan_mostrar&id_plan=$id_plan&id_entidad=$id_entidad&aviso=$aviso");
    }
}
else
{
    $error = ERR_PARAM;
    header("Location: index.php?page=error&error=$error");
}
