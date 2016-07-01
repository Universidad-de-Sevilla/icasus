<?php

//------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: analisis.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//------------------------------------------------------------------------------
// Muestra los analisis de un indicador
//------------------------------------------------------------------------------

global $smarty;
global $usuario;
global $plantilla;
//Variable para operar con Indicadores/Datos
$logicaIndicador = new LogicaIndicador();

if (filter_has_var(INPUT_GET, 'id_indicador') && filter_has_var(INPUT_GET, 'id_entidad'))
{
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $entidad = new Entidad();
    $entidad->load("id=$id_entidad");
    $smarty->assign('entidad', $entidad);

    $id_indicador = filter_input(INPUT_GET, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
    $indicador = new Indicador();
    $indicador->load("id=$id_indicador");
    $smarty->assign('indicador', $indicador);
    $tipo = 'indicador';
    $smarty->assign('tipo', $tipo);

    //Responsables
    $responsable = false;
    if ($indicador->id_responsable == $usuario->id)
    {
        $responsable = true;
    }
    $smarty->assign('responsable', $responsable);

    //Proceso del indicador
    $proceso = new Proceso();
    $proceso->load("id = $indicador->id_proceso");
    $smarty->assign('proceso', $proceso);

    //Obtener todos los indicadores para avanzar o retroceder 
    if ($indicador->archivado)
    {
        $indicadores = $indicador->Find("id_entidad = $id_entidad AND id_proceso=$proceso->id AND archivado is NOT NULL");
    }
    else
    {
        $indicadores = $indicador->Find("id_entidad = $id_entidad AND id_proceso=$proceso->id AND archivado is NULL");
    }
    $smarty->assign("indicadores", $indicadores);
    $cont = 0;
    foreach ($indicadores as $ind)
    {
        if ($id_indicador == $ind->id)
        {
            $indice = $cont;
            $smarty->assign("indice", $indice);
        }
        $cont++;
    }

    //Vemos si influye en otros Indicadores/Datos
    $indicadores_dependientes = $logicaIndicador->calcular_influencias($id_indicador);
    $smarty->assign('indicadores_dependientes', $indicadores_dependientes);

    //Si es calculado vemos los Indicadores/Datos de los que depende
    $indicadores_influyentes = $logicaIndicador->calcular_dependencias($id_indicador);
    $smarty->assign("indicadores_influyentes", $indicadores_influyentes);

    //Simplemente ver si hay mediciones
    $medicion = new Medicion();
    $mediciones = $medicion->Find("id_indicador = $id_indicador ORDER BY periodo_inicio");
    $smarty->assign("mediciones", $mediciones);
    if ($mediciones)
    {
        $panel = new Panel();
        $panel->tipo = new Panel_tipo();
        $panel->ancho = 6;
        // Prepara el panel anual
        $anio_inicio = $indicador->historicos;
        $anio_fin = date('Y') - 1;
        $panel->id = 1;
        $panel->tipo->clase_css = "lineal";
        $panel->nombre = TXT_HISTORICO;
        $panel->fecha_inicio = $indicador->historicos . "-01-01";
        $panel->fecha_fin = $anio_fin . "-12-31";
        $panel->periodicidad = "anual";
        $smarty->assign("panel", $panel);
    }

    //Comprobamos si hay valores para pintar los gráficos
    $valor = new Valor();
    $pinta_grafico = false;
    if ($mediciones)
    {
        foreach ($mediciones as $med)
        {
            $valores = $valor->Find_joined_jjmc($med->id, $usuario->id);
            if ($valores)
            {
                foreach ($valores as $val)
                {
                    if ($val->valor != null)
                    {
                        $pinta_grafico = true;
                    }
                }
            }
        }
    }
    $smarty->assign("pinta_grafico", $pinta_grafico);

    //Recuperamos el análisis del indicador
    $analisis = new Analisis();
    $anyo = idate('Y');
    $smarty->assign('anyo', $anyo);
    $analisis->load("id_indicador=$id_indicador AND anyo=$anyo");
    $smarty->assign('analisis_actual', $analisis);

    //Tabla de análisis y planes
    $lista_analisis = $analisis->find("id_indicador=$id_indicador");
    $smarty->assign('lista_analisis', $lista_analisis);

    $smarty->assign('_javascript', array('analisis'));
    $smarty->assign('_nombre_pagina', FIELD_INDIC . ": $indicador->nombre");
    $plantilla = 'analisis.tpl';
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
