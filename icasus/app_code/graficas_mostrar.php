<?php

//-------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: graficas_mostrar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//-------------------------------------------------------------------------------
// Muestra los gráficos de indicadores/datos con los valores
//-------------------------------------------------------------------------------

global $smarty;
global $usuario;
global $plantilla;
//Variable para operar con Indicadores/Datos
$logicaIndicador = new LogicaIndicador();

if (filter_has_var(INPUT_GET, 'id_indicador'))
{
    $id_indicador = filter_input(INPUT_GET, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
    $tipo = "indicador";
}
else if (filter_has_var(INPUT_GET, 'id_dato'))
{
    $id_indicador = filter_input(INPUT_GET, 'id_dato', FILTER_SANITIZE_NUMBER_INT);
    $tipo = "dato";
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}

$indicador = new Indicador();
$indicador->load("id = $id_indicador");
$smarty->assign('indicador', $indicador);

//Avanzar entre indicadores/datos
if ($tipo == "indicador")
{
    //Proceso del indicador
    $proceso = new Proceso();
    $proceso->load_joined("id = $indicador->id_proceso");
    $smarty->assign('proceso', $proceso);
    //Obtener todos los indicadores del proceso para avanzar o retroceder
    if ($indicador->archivado)
    {
        $indicadores = $indicador->Find("id_entidad = $id_entidad AND id_proceso=$proceso->id AND archivado is NOT NULL");
    }
    else
    {
        $indicadores = $indicador->Find("id_entidad = $id_entidad AND id_proceso=$proceso->id AND archivado is NULL");
    }
    $smarty->assign('_nombre_pagina', FIELD_INDIC . ": $indicador->nombre");
}
else
{
    //Obtener todos los datos para avanzar o retroceder
    if ($indicador->archivado)
    {
        $indicadores = $indicador->Find("id_entidad = $id_entidad AND id_proceso IS NULL AND archivado is NOT NULL");
    }
    else
    {
        $indicadores = $indicador->Find("id_entidad = $id_entidad AND id_proceso IS NULL AND archivado is NULL");
    }
    $smarty->assign('_nombre_pagina', FIELD_DATO . ": $indicador->nombre");
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

$entidad = new Entidad();
$entidad->load("id = $indicador->id_entidad");
$smarty->assign('entidad', $entidad);
$smarty->assign('tipo', $tipo);

//Simplemente ver si hay mediciones
$medicion = new Medicion();
$mediciones = $medicion->Find("id_indicador = $id_indicador ORDER BY periodo_inicio");
$smarty->assign("mediciones", $mediciones);
if ($mediciones)
{
    //Prepara el panel de Valores/Subunidad
    $panel_res = new Panel();
    $panel_res->ancho = 12;
    $panel_res->nombre = TXT_VALS_SUBUNID;
    $panel_res->periodicidad = "anual";
    $smarty->assign("panel_res", $panel_res);

    //Prepara el resto de paneles
    $paneles = array();
    $panel = new Panel();
    $panel->tipo = new Panel_tipo();
    $panel->ancho = 12;
    if ($indicador->periodicidad != "Anual" && $indicador->periodicidad != "Bienal")
    {
        // Prepara el panel intraanual
        $anio_inicio = date('Y') - 2;
        $panel->id = 2;
        $panel->tipo->clase_css = "lineal";
        $panel->ancho = 6;
        $panel->nombre = TXT_DOS_ULT_ANYO;
        $panel->fecha_inicio = $anio_inicio . "-01-01";
        $panel->fecha_fin = date("Y-m-d");
        $panel->periodicidad = "todos";
        $paneles[] = clone($panel);
    }
    // Prepara el panel anual o bienal
    $anio_inicio = $indicador->historicos;
    $anio_fin = date('Y');
    if ($indicador->periodicidad == "Bienal")
    {
        $anio_fin = date('Y') + 2;
    }
    $panel->id = 1;
    $panel->tipo->clase_css = "lineal";
    $panel->nombre = TXT_HISTORICO;
    $panel->fecha_inicio = $indicador->historicos . "-01-01";
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
$smarty->assign('_javascript', array('graficas_mostrar'));
$plantilla = 'graficas_mostrar.tpl';
