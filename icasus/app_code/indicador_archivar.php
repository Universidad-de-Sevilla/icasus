<?php

//-------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: indicador_archivar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//-------------------------------------------------------------------------------
// Archiva o restaura un indicador
//-------------------------------------------------------------------------------

global $usuario;
//Variable para operar con Indicadores/Datos
$logicaIndicador = new LogicaIndicador();

if (filter_has_var(INPUT_GET, 'id_entidad') && filter_has_var(INPUT_GET, 'id_indicador') && filter_has_var(INPUT_GET, 'modulo'))
{
    $indicador = new Indicador();
    $id_indicador = filter_input(INPUT_GET, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
    $indicador->load("id=$id_indicador");
    // Comprobamos que el usuario es responsable de este indicador 
    // para permitirle archivar o restaurar
    if ($control || $usuario->id == $indicador->id_responsable)
    {
        $modulo = filter_input(INPUT_GET, 'modulo', FILTER_SANITIZE_STRING);
        $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
        $indicadores_dependientes = $logicaIndicador->calcular_influencias($indicador->id);
        $archivados = true;
        //Comprobamos que las dependencias estén archivadas
        foreach ($indicadores_dependientes as $indic)
        {
            if (!$indic->archivado)
            {
                $archivados = false;
            }
        }
        if (!$archivados)
        {
            $aviso = ERR_INDIC_ARCHIVAR_DEP;
            header("Location: index.php?page=indicador_mostrar&id_indicador=$id_indicador&id_entidad=$id_entidad&aviso=$aviso");
        }
        else
        {
            if ($modulo == 'archivar')
            {
                $indicador->archivado = date("Y-m-d");
                $indicador->Save();
                $exito = MSG_INDIC_ARCHIVADO . "$indicador->nombre";
                header("Location: index.php?page=indicador_mostrar&id_indicador=$indicador->id&id_entidad=$id_entidad&exito=$exito");
            }
            if ($modulo == 'restaurar')
            {
                $indicador->archivado = NULL;
                $indicador->Save();
                $exito = MSG_INDIC_RESTAURADO . "$indicador->nombre";
                header("Location: index.php?page=indicador_mostrar&id_indicador=$indicador->id&id_entidad=$id_entidad&exito=$exito");
            }
        }
    }
    else
    {
        if ($modulo == 'archivar')
        {
            $error = ERR_INDIC_ARCHIVAR_NO_AUT;
        }
        if ($modulo == 'restaurar')
        {
            $error = ERR_INDIC_RESTAURAR_NO_AUT;
        }
        header("Location: index.php?page=indicador_mostrar&id_indicador=$id_indicador&id_entidad=$id_entidad&error=$error");
    }
}
else
{
    $error = ERR_PARAM;
    header("Location: index.php?page=indicador_listar&id_entidad=$id_entidad&error=$error");
}
