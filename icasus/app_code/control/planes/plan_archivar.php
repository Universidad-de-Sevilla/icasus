<?php

//-------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: planes/plan_archivar.php
// Desarrolladores: Ramón M. Gómez (ramongomez@us.es)
//-------------------------------------------------------------------------------
// Archiva o restaura un plan estratégico
//-------------------------------------------------------------------------------

global $usuario;

if (filter_has_var(INPUT_GET, 'id_entidad') && filter_has_var(INPUT_GET, 'id_plan') && filter_has_var(INPUT_GET, 'modulo'))
{
    $id_plan = filter_input(INPUT_GET, 'id_plan', FILTER_SANITIZE_NUMBER_INT);
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $modulo = filter_input(INPUT_GET, 'modulo', FILTER_SANITIZE_STRING);
    $plan = new Plan();
    $plan->load_joined("id=$id_plan");

    // Comprobamos que el usuario es responsable de este plan para permitirle archivar o restaurar
    if ($control || $usuario->id == $plan->entidad->id_responsable)
    {
        if ($modulo === 'archivar')
        {
            $plan->archivado = date("Y-m-d");
            $plan->Save();
            $exito = MSG_PLAN_ARCHIVADO . "$plan";
            header("Location: index.php?page=plan_listar&id_entidad=$id_entidad&exito=$exito");
            exit();
        }
        if ($modulo === 'restaurar')
        {
            $plan->archivado = null;
            $plan->Save();
            $exito = MSG_PLAN_RESTAURADO . "$plan";
            header("Location: index.php?page=plan_listar&id_entidad=$id_entidad&exito=$exito");
            exit();
        }
    }
}
// Parámetros incorrectos
$error = ERR_PARAM;
header("location: index.php?page=error&error=$error");