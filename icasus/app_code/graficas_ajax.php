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

    //Simplemente ver si hay mediciones para el periodo dado
    $medicion = new Medicion();
    if ($indicador->periodicidad == "Bienal")
    {
        $mediciones = $medicion->Find("id_indicador = $id_indicador AND periodo_inicio >= '$anio_inicio-01-01' AND periodo_fin <= DATE_ADD('$anio_fin-12-31',INTERVAL 2 YEAR) ORDER BY periodo_inicio");
    }
    else
    {
        $mediciones = $medicion->Find("id_indicador = $id_indicador AND periodo_inicio >= '$anio_inicio-01-01' AND periodo_fin <= '$anio_fin-12-31' ORDER BY periodo_inicio");
    }
    if ($mediciones)
    {
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
            $panel->fecha_fin = date('Y') . "-12-31";
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

    //Comprobamos si hay valores para pintar los gráficos en el periodo dado
//    $valor = new Valor();
//    $pinta_grafico = false;
//    if ($mediciones)
//    {
//        foreach ($mediciones as $med)
//        {
//            $valores = $valor->Find_joined_jjmc($med->id, $usuario->id);
//            if ($valores)
//            {
//                foreach ($valores as $val)
//                {
//                    if ($val->valor != null)
//                    {
//                        $pinta_grafico = true;
//                    }
//                }
//            }
//        }
//    }

    $plantilla = 'graficas_ajax.tpl';
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
