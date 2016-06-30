<?php

//-------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: dato_archivar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//-------------------------------------------------------------------------------
// Archiva o restaura un dato
//-------------------------------------------------------------------------------

global $usuario;
//Variable para operar con Indicadores/Datos
$logicaIndicador = new LogicaIndicador();

if (filter_has_var(INPUT_GET, 'id_entidad') && filter_has_var(INPUT_GET, 'id_dato') && filter_has_var(INPUT_GET, 'modulo'))
{
    $dato = new Indicador();
    $id_dato = filter_input(INPUT_GET, 'id_dato', FILTER_SANITIZE_NUMBER_INT);
    $dato->load("id=$id_dato");
    // Comprobamos que el usuario es responsable de este dato 
    // para permitirle archivar o restaurar
    if ($control || $usuario->id == $dato->id_responsable)
    {
        $modulo = filter_input(INPUT_GET, 'modulo', FILTER_SANITIZE_STRING);
        $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
        $indicadores_dependientes = $logicaIndicador->calcular_influencias($id_dato);
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
            $aviso = ERR_DATO_ARCHIVAR_DEP;
            header("Location: index.php?page=dato_mostrar&id_dato=$id_dato&id_entidad=$id_entidad&aviso=$aviso");
        }
        else
        {
            if ($modulo == 'archivar')
            {
                $dato->archivado = date("Y-m-d");
                $dato->Save();
                $exito = MSG_DATO_ARCHIVADO . "$dato->nombre";
                header("Location: index.php?page=dato_mostrar&id_dato=$id_dato&id_entidad=$id_entidad&exito=$exito");
            }
            if ($modulo == 'restaurar')
            {
                $dato->archivado = NULL;
                $dato->Save();
                $exito = MSG_DATO_RESTAURADO . "$dato->nombre";
                header("Location: index.php?page=dato_mostrar&id_dato=$id_dato&id_entidad=$id_entidad&exito=$exito");
            }
        }
    }
    else
    {
        if ($modulo == 'archivar')
        {
            $error = ERR_DATO_ARCHIVAR_NO_AUT;
        }
        if ($modulo == 'restaurar')
        {
            $error = ERR_DATO_RESTAURAR_NO_AUT;
        }
        header("Location: index.php?page=dato_mostrar&id_dato=$id_dato&id_entidad=$id_entidad&error=$error");
    }
}
else
{
    $error = ERR_PARAM;
    header("Location: index.php?page=dato_listar&id_entidad=$id_entidad&error=$error");
}
