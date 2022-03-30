<?php

//-------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: indicadores/graficas_mostrar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//-------------------------------------------------------------------------------
// Descripcion: Muestra los gráficos de indicadores con sus valores
//-------------------------------------------------------------------------------

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
    $grafica_valores = false;
    $grafica_intranual = false;
    $grafica_historico = false;
    if ($mediciones)
    {
        //Comprobamos la periodicidad
        $intranual = false;
        if ($indicador->periodicidad != "Anual" && $indicador->periodicidad != "Bienal")
        {
            $intranual = true;
        }

        //Calculamos los años para los que existen mediciones a fin de 
        //ajustar las gráficas
        $years = $medicion->find_year_mediciones($id_indicador);
        $smarty->assign('years', $years);
        if (count($years) > 5)
        {
            $anio_inicio = strtok($years[count($years) - 5]->periodo_inicio, '-');
            if ($intranual)
            {
                $anio_inicio_intranual = strtok($years[count($years) - 2]->periodo_inicio, '-');
            }
        }
        else
        {
            $anio_inicio = strtok($years[0]->periodo_inicio, '-');
            if ($intranual)
            {
                if (count($years) > 2)
                {
                    $anio_inicio_intranual = strtok($years[count($years) - 2]->periodo_inicio, '-');
                }
                else
                {
                    $anio_inicio_intranual = $anio_inicio;
                }
            }
        }
        $anio_fin = strtok($years[count($years) - 1]->periodo_fin, '-');
        $smarty->assign("anio_inicio", $anio_inicio);
        $smarty->assign("anio_fin", $anio_fin);

        //Comprobamos si hay valores para pintar los gráficos de valores e histórico
        $mediciones = $medicion->Find("id_indicador = $id_indicador AND periodo_inicio >= '$anio_inicio-01-01' AND periodo_fin <= '$anio_fin-12-31' ORDER BY periodo_inicio");
        $valor = new Valor();
        $val_ref_medicion = new Valor_referencia_medicion();
        $num_mediciones = count($mediciones);
        $i = $j = 0;
        while (!$grafica_valores && $i != $num_mediciones)
        {
            $med = $mediciones[$i];
            $valores = $valor->Find("id_medicion=$med->id");
            foreach ($valores as $val)
            {
                if ($val->valor != null)
                {
                    $grafica_valores = true;
                    break;
                }
            }
            $i++;
        }
        //Si hay valores podemos pintar el histórico
        if ($grafica_valores)
        {
            $grafica_historico = true;
        }
        //Si no hay valores comprobamos si hay valores de referencia
        else
        {
            while (!$grafica_historico && $j != $num_mediciones)
            {
                $med = $mediciones[$j];
                $valores_referencia = $val_ref_medicion->Find("id_medicion=$med->id");
                foreach ($valores_referencia as $val)
                {
                    if ($val->valor != null)
                    {
                        $grafica_historico = true;
                        break;
                    }
                }
                $j++;
            }
        }

        //Comprobamos valores para el panel intranual
        if ($intranual)
        {
            //Comprobamos si hay valores para pintar el gráfico intranual
            $mediciones = $medicion->Find("id_indicador = $id_indicador AND periodo_inicio >= '$anio_inicio_intranual-01-01' AND periodo_fin <= '$anio_fin-12-31' ORDER BY periodo_inicio");
            $num_mediciones = count($mediciones);
            $k = 0;
            while (!$grafica_intranual && $k != $num_mediciones)
            {
                $med = $mediciones[$k];
                $valores = $valor->Find("id_medicion=$med->id");
                $valores_referencia = $val_ref_medicion->Find("id_medicion=$med->id");
                //Valores
                foreach ($valores as $val)
                {
                    if ($val->valor != null)
                    {
                        $grafica_intranual = true;
                        break;
                    }
                }
                //Valores de referencia
                foreach ($valores_referencia as $val)
                {
                    if ($val->valor != null)
                    {
                        $grafica_intranual = true;
                        break;
                    }
                }
                $k++;
            }
        }

        //Paneles
        //Prepara el panel de Valores/Subunidad
        $panel_res = new Panel();
        $panel_res->ancho = 12;
        $panel_res->nombre = TXT_VAL_UNID;
        $panel_res->fecha_inicio = $anio_inicio . "-01-01";
        $panel_res->fecha_fin = $anio_fin . "-12-31";
        $panel_res->periodicidad = "anual";
        $smarty->assign("panel_res", $panel_res);

        //Prepara el resto de paneles
        $paneles = array();
        $panel = new Panel();
        $panel->ancho = 12;

        //Prepara el panel anual o bienal
        $panel->id = 1;
        $panel->nombre = FIELD_HISTORICO;
        $panel->fecha_inicio = $anio_inicio . "-01-01";
        $panel->fecha_fin = $anio_fin . "-12-31";
        $panel->periodicidad = "anual";
        if ($indicador->periodicidad == "Bienal")
        {
            $panel->periodicidad = "bienal";
        }
        $paneles[] = clone($panel);

        // Prepara el panel intraanual
        if ($intranual)
        {
            $panel->id = 2;
            $panel->nombre = TXT_INTRANUAL;
            $panel->fecha_inicio = $anio_inicio_intranual . "-01-01";
            $panel->fecha_fin = $anio_fin . "-12-31";
            $panel->periodicidad = "todos";
            $paneles[] = clone($panel);
        }
        $smarty->assign("paneles", $paneles);
    }

    $smarty->assign("grafica_valores", $grafica_valores);
    $smarty->assign("grafica_historico", $grafica_historico);
    $smarty->assign("grafica_intranual", $grafica_intranual);
    $smarty->assign('_javascript', array('graficas_mostrar'));
    $smarty->assign('_nombre_pagina', FIELD_INDIC . ": $indicador->nombre");
    $plantilla = 'indicadores/graficas_mostrar.tpl';
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
