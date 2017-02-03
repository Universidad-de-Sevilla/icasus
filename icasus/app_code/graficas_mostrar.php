<?php

//-------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: graficas_mostrar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//-------------------------------------------------------------------------------
// Descripcion: Muestra los gráficos de indicadores con sus valores
//-------------------------------------------------------------------------------

global $smarty;
global $usuario;
global $plantilla;
//Variable para operar con Indicadores/Datos
$logicaIndicador = new LogicaIndicador();

if (filter_has_var(INPUT_GET, 'id_indicador'))
{
    $id_indicador = filter_input(INPUT_GET, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
    $indicador = new Indicador();
    if ($indicador->load_joined("id = $id_indicador"))
    {
        $smarty->assign('indicador', $indicador);
    }
    else
    {
        $error = ERR_INDIC_MOSTRAR;
        header("location:index.php?page=error&error=$error");
    }

    $entidad = new Entidad();
    $entidad->load("id = $indicador->id_entidad");
    $smarty->assign('entidad', $entidad);

    //Obtener todos los indicadores para avanzar o retroceder
    if ($indicador->archivado)
    {
        $indicadores = $indicador->Find("id_entidad = $id_entidad AND archivado is NOT NULL");
    }
    else
    {
        if ($indicador->id_proceso)
        {

            $indicadores = $indicador->Find("id_entidad = $id_entidad AND id_proceso=$indicador->id_proceso AND archivado is NULL");
        }
        else
        {
            $indicadores = $indicador->Find("id_entidad = $id_entidad AND id_proceso IS NULL AND archivado is NULL");
        }
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

    //Proceso del indicador
    $proceso = $indicador->proceso;
    $smarty->assign('proceso', $proceso);

    //Responsables
    $responsable = false;
    if ($indicador->id_responsable == $usuario->id)
    {
        $responsable = true;
    }
    $smarty->assign('responsable', $responsable);

    //Vemos si influye en otros Indicadores/Datos
    $indicadores_dependientes = $logicaIndicador->calcular_influencias($id_indicador);
    $smarty->assign('indicadores_dependientes', $indicadores_dependientes);

    //Si es calculado vemos los Indicadores/Datos de los que depende
    $indicadores_influyentes = $logicaIndicador->calcular_dependencias($id_indicador);
    $smarty->assign("indicadores_influyentes", $indicadores_influyentes);

    //Simplemente ver si hay mediciones
    $medicion = new Medicion();
    $years = $medicion->find_year_mediciones($id_indicador);
    $smarty->assign('years', $years);
    $mediciones = $medicion->Find("id_indicador = $id_indicador ORDER BY periodo_inicio");
    $smarty->assign("mediciones", $mediciones);
    if ($mediciones)
    {
        $anio_fin = date('Y');
        if ($anio_fin - 5 > $indicador->historicos)
        {
            $anio_inicio = $anio_fin - 5;
        }
        else
        {
            $anio_inicio = $indicador->historicos;
        }

        //Prepara el panel de Valores/Subunidad
        $panel_res = new Panel();
        $panel_res->ancho = 12;
        $panel_res->nombre = TXT_VALS_SUBUNID;
        $panel_res->fecha_inicio = $anio_inicio . "-01-01";
        $panel_res->fecha_fin = $anio_fin . "-12-31";
        $panel_res->periodicidad = "anual";
        $smarty->assign("panel_res", $panel_res);

        //Prepara el resto de paneles
        $paneles = array();
        $panel = new Panel();
        $panel->tipo = new Panel_tipo();
        $panel->ancho = 12;

        // Prepara el panel intraanual
        if ($indicador->periodicidad != "Anual" && $indicador->periodicidad != "Bienal")
        {
            $panel->id = 2;
            $panel->tipo->clase_css = "lineal";
            $panel->ancho = 6;
            $panel->nombre = TXT_DOS_ULT_ANYO;
            $panel->fecha_inicio = (date('Y') - 2) . "-01-01";
            $panel->fecha_fin = $anio_fin . "-12-31";
            $panel->periodicidad = "todos";
            $paneles[] = clone($panel);
        }
        // Prepara el panel anual o bienal
        if ($indicador->periodicidad == "Bienal")
        {
            $anio_fin = $anio_fin + 2;
        }
        $panel->id = 1;
        $panel->tipo->clase_css = "lineal";
        $panel->nombre = TXT_HISTORICO;
        $panel->fecha_inicio = $anio_inicio . "-01-01";
        $panel->fecha_fin = $anio_fin . "-12-31";
        $panel->periodicidad = "anual";
        if ($indicador->periodicidad == "Bienal")
        {
            $panel->periodicidad = "bienal";
        }
        $paneles[] = clone($panel);
        $smarty->assign("paneles", $paneles);
    }

    //Comprobamos si hay valores para pintar los gráficos
    ///REVISAR FUNCIÓN SALIR ANTES DEL BUCLE
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
                        break;
                    }
                }
            }
        }
    }
    $smarty->assign("pinta_grafico", $pinta_grafico);
    $smarty->assign('_javascript', array('graficas_mostrar'));
    $smarty->assign('_nombre_pagina', FIELD_INDIC . ": $indicador->nombre");
    $plantilla = 'graficas_mostrar.tpl';
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
