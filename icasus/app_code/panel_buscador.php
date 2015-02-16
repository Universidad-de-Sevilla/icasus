<?php

//$modulo = sanitize($_REQUEST["modulo"], SQL);
$modulo = filter_input(INPUT_GET, 'modulo', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));

if ($modulo == 'periodicidad')
{
//    $id_indicador = sanitize($_REQUEST["id_indicador"], 2);
    $id_indicador = filter_input(INPUT_GET, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
    $medicion = new Medicion();
    $mediciones = $medicion->find("id_indicador = $id_indicador ORDER BY etiqueta ASC");
    $smarty->assign('mediciones', $mediciones);

    $anos = $medicion->find("id_indicador = $id_indicador GROUP BY YEAR(periodo_inicio) ORDER BY periodo_inicio ASC");
    $smarty->assign('anos', $anos);
}
if ($modulo == 'indicadores_linea')
{
//    $cadena = sanitize($_REQUEST["cadena"], SQL);
    $cadena = filter_input(INPUT_GET, 'cadena', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
//    $id_entidad = sanitize($_REQUEST["id_entidad"], 2);
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

    $indicador = new Indicador();
    $indicadores = $indicador->find("id_entidad = $id_entidad AND nombre LIKE '%$cadena%'");
    $smarty->assign('indicadores', $indicadores);
    $smarty->assign('id_entidad', $id_entidad);
}
if ($modulo == 'indicador_barra_base')
{
//    $cadena = sanitize($_REQUEST["cadena"], SQL);
    $cadena = filter_input(INPUT_GET, 'cadena', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
//    $id_entidad = sanitize($_REQUEST["id_entidad"], 2);
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

    $indicador = new Indicador();
    $indicadores = $indicador->find("id_entidad = $id_entidad AND nombre LIKE '%$cadena%'");
    $smarty->assign('indicadores', $indicadores);
    $smarty->assign('id_entidad', $id_entidad);
}
if ($modulo == 'indicadores_barra_complementarios')
{
//    $cadena = sanitize($_REQUEST["cadena"], SQL);
    $cadena = filter_input(INPUT_GET, 'cadena', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
//    $id_entidad = sanitize($_REQUEST["id_entidad"], 2);
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

    $indicador = new Indicador();
    $indicadores = $indicador->find("id_entidad = $id_entidad AND nombre LIKE '%$cadena%'");
    $smarty->assign('indicadores', $indicadores);
    $smarty->assign('id_entidad', $id_entidad);
}
if ($modulo == 'indicador_tarta')
{
//    $cadena = sanitize($_REQUEST["cadena"], SQL);
    $cadena = filter_input(INPUT_GET, 'cadena', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
//    $id_entidad = sanitize($_REQUEST["id_entidad"], 2);
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

    $indicador = new Indicador();
    $indicadores = $indicador->find("id_entidad = $id_entidad AND nombre LIKE '%$cadena%'");
    $smarty->assign('indicadores', $indicadores);
    $smarty->assign('id_entidad', $id_entidad);
}
if ($modulo == 'indicador_metrica')
{
//    $cadena = sanitize($_REQUEST["cadena"], SQL);
    $cadena = filter_input(INPUT_GET, 'cadena', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
//    $id_entidad = sanitize($_REQUEST["id_entidad"], 2);
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

    $indicador = new Indicador();
    $indicadores = $indicador->find("id_entidad = $id_entidad AND nombre LIKE '%$cadena%'");
    $smarty->assign('indicadores', $indicadores);
    $smarty->assign('id_entidad', $id_entidad);
}
if ($modulo == 'indicador_subunidades')
{
//    $cadena = sanitize($_REQUEST["cadena"], SQL);
    $cadena = filter_input(INPUT_GET, 'cadena', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
//    $id_entidad = sanitize($_REQUEST["id_entidad"], 2);
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

    $indicador = new Indicador();
    $indicadores = $indicador->find("id_entidad = $id_entidad AND nombre LIKE '%$cadena%'");
    $smarty->assign('indicadores', $indicadores);
    $smarty->assign('id_entidad', $id_entidad);
}
$smarty->assign('modulo', $modulo);
$plantilla = "panel_buscador.tpl";

