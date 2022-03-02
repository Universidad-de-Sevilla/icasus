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
        $cont = 0;
        if ($modulo === 'archivar')
        {
            // Archivar indicadores de control
            foreach ($plan->find_indicadores_control_plan($plan->id) as $indic)
            {
                $indicador = new Indicador();
                if ($indicador->Load("id = {$indic['id']} AND archivado IS NULL"))
                {
                    $indicador->archivado = date("Y-m-d");
                    $indicador->Save();
                    $cont++;
                }
            }
            $plan->archivado = date("Y-m-d");
            $plan->Save();
            $exito = MSG_PLAN_ARCHIVADO . "$plan. " . MSG_INDIC_CONTROL_ARCHIVADOS . "$cont.";
            header("Location: index.php?page=plan_listar&id_entidad=$id_entidad&exito=$exito");
            exit();
        }
        if ($modulo === 'restaurar')
        {
            // Restaurar indicadores de control
            foreach ($plan->find_indicadores_control_plan($plan->id) as $indic) {
                $indicador = new Indicador();
                if ($indicador->Load("id = {$indic['id']} AND archivado = '$plan->archivado'"))
                {
                    $indicador->archivado = null;
                    $indicador->Save();
                    $cont++;
                }
            }
            $plan->archivado = null;
            $plan->Save();
            $exito = MSG_PLAN_RESTAURADO . "$plan. " . MSG_INDIC_CONTROL_RESTAURADOS . "$cont.";
            header("Location: index.php?page=plan_listar&id_entidad=$id_entidad&exito=$exito");
            exit();
        }
    }
}
// Parámetros incorrectos
$error = ERR_PARAM;
header("location: index.php?page=error&error=$error");