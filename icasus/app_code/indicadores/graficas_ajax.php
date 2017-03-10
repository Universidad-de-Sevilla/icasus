<?php

//-------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: graficas_ajax.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//-------------------------------------------------------------------------------
// Descripcion: Muestra los gráficos de indicadores con sus valores 
// para un periodo dado
//-------------------------------------------------------------------------------

global $smarty;
global $usuario;
global $plantilla;

if (filter_has_var(INPUT_GET, 'modulo'))
{
    $modulo = filter_input(INPUT_GET, 'modulo', FILTER_SANITIZE_STRING);

    //Seleccionar años
    if ($modulo == 'seleccionar_anyos')
    {
        if (filter_has_var(INPUT_GET, 'id_indicador') && filter_has_var(INPUT_GET, 'inicio'))
        {
            $id_indicador = filter_input(INPUT_GET, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
            $medicion = new Medicion();
            $years = $medicion->find_year_mediciones($id_indicador);
            $smarty->assign('years', $years);
            $smarty->assign('year_inicio', filter_input(INPUT_GET, 'inicio', FILTER_SANITIZE_NUMBER_INT));
        }
    }

    //Mostrar gráficas
    if ($modulo == 'mostrar')
    {
        if (filter_has_var(INPUT_GET, 'id_indicador') && filter_has_var(INPUT_GET, 'inicio') && filter_has_var(INPUT_GET, 'fin'))
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

            $anio_inicio = filter_input(INPUT_GET, 'inicio', FILTER_SANITIZE_NUMBER_INT);
            $anio_fin = filter_input(INPUT_GET, 'fin', FILTER_SANITIZE_NUMBER_INT);

            //Simplemente ver si hay mediciones
            $medicion = new Medicion();
            $mediciones = $medicion->Find("id_indicador = $id_indicador AND periodo_inicio >= '$anio_inicio-01-01' AND periodo_fin <= '$anio_fin-12-31' ORDER BY periodo_inicio");
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
                    if ($anio_fin - 1 >= $anio_inicio)
                    {
                        $anio_inicio_intranual = $anio_fin - 1;
                    }
                    else
                    {
                        $anio_inicio_intranual = $anio_inicio;
                    }
                }

                //Comprobamos si hay valores para pintar los gráficos de valores e histórico
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
                $panel->nombre = TXT_HISTORICO;
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
        }
    }
    $smarty->assign("modulo", $modulo);
    $plantilla = 'indicadores/graficas_ajax.tpl';
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
