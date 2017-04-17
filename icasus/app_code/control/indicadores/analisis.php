<?php

//------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: indicadores/analisis.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//------------------------------------------------------------------------------
// Muestra los analisis de un indicador
//------------------------------------------------------------------------------

global $smarty;
global $usuario;
global $plantilla;
//Variable para operar con Procesos
$logicaProceso = new LogicaProceso();
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

    //Permisos del proceso
    $permiso_proceso = $logicaProceso->comprobar_responsable_proceso($usuario->id, $proceso);
    $smarty->assign('permiso_proceso', $permiso_proceso);

    //Responsables
    $responsable = false;
    if ($indicador->id_responsable == $usuario->id || $permiso_proceso)
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
    $mediciones = $medicion->Find("id_indicador = $id_indicador ORDER BY periodo_inicio");
    $smarty->assign("mediciones", $mediciones);
    $grafica_historico = false;
    if ($mediciones)
    {
        //Calculamos los años para los que existen mediciones a fin de 
        //ajustar las gráficas
        $years = $medicion->find_year_mediciones($id_indicador);
        $smarty->assign('years', $years);
        if (count($years) > 5)
        {
            $anio_inicio = strtok($years[count($years) - 5]->periodo_inicio, '-');
        }
        else
        {
            $anio_inicio = strtok($years[0]->periodo_inicio, '-');
        }
        $anio_fin = strtok($years[count($years) - 1]->periodo_fin, '-');
        $smarty->assign("anyo", $anio_fin);

        //Comprobamos si hay valores para pintar el gráfico con el histórico
        $mediciones = $medicion->Find("id_indicador = $id_indicador AND periodo_inicio >= '$anio_inicio-01-01' AND periodo_fin <= '$anio_fin-12-31' ORDER BY periodo_inicio");
        $valor = new Valor();
        $val_ref_medicion = new Valor_referencia_medicion();
        $num_mediciones = count($mediciones);
        $i = 0;
        while (!$grafica_historico && $i != $num_mediciones)
        {
            $med = $mediciones[$i];
            $valores = $valor->Find("id_medicion=$med->id");
            $valores_referencia = $val_ref_medicion->Find("id_medicion=$med->id");
            //Valores
            foreach ($valores as $val)
            {
                if ($val->valor != null)
                {
                    $grafica_historico = true;
                    break;
                }
            }
            //Valores de referencia
            foreach ($valores_referencia as $val)
            {
                if ($val->valor != null)
                {
                    $grafica_historico = true;
                    break;
                }
            }
            $i++;
        }

        //Prepara el panel
        $panel = new Panel();
        $panel->ancho = 6;
        $panel->id = 1;
        $panel->nombre = TXT_HISTORICO;
        $panel->fecha_inicio = $anio_inicio . "-01-01";
        $panel->fecha_fin = $anio_fin . "-12-31";
        $panel->periodicidad = "anual";
        if ($indicador->periodicidad == "Bienal")
        {
            $panel->periodicidad = "bienal";
        }
        $smarty->assign("panel", $panel);
        $smarty->assign("grafica_historico", $grafica_historico);

        //Recuperamos el análisis del indicador
        $analisis = new Analisis();
        $analisis->load("id_indicador=$id_indicador AND anyo=$anio_fin");
        $smarty->assign('analisis_actual', $analisis);

        //Tabla de análisis y planes
        $lista_analisis = $analisis->find("id_indicador=$id_indicador");
        $smarty->assign('lista_analisis', $lista_analisis);
    }

    $smarty->assign('_javascript', array('analisis'));
    $smarty->assign('_nombre_pagina', FIELD_INDIC . ": $indicador->nombre");
    $plantilla = 'indicadores/analisis.tpl';
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
