<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: panel_buscador.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Controlador que busca indicadores en la creación de paneles
//---------------------------------------------------------------------------------------------------

if (filter_has_var(INPUT_GET, 'modulo'))
{
    $modulo = filter_input(INPUT_GET, 'modulo', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));

    if ($modulo == 'periodicidad')
    {
        $id_indicador = filter_input(INPUT_GET, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
        $medicion = new Medicion();
        $mediciones = $medicion->find("id_indicador = $id_indicador ORDER BY etiqueta ASC");
        $smarty->assign('mediciones', $mediciones);

        $anos = $medicion->find("id_indicador = $id_indicador GROUP BY YEAR(periodo_inicio) ORDER BY periodo_inicio ASC");
        $smarty->assign('anos', $anos);
    }
    if ($modulo == 'indicadores_linea')
    {
        $cadena = filter_input(INPUT_GET, 'cadena', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));

        $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

        $indicador = new Indicador();
        $indicadores = $indicador->find("id_entidad = $id_entidad AND nombre LIKE '%$cadena%'");
        $smarty->assign('indicadores', $indicadores);
        $smarty->assign('id_entidad', $id_entidad);
    }
    if ($modulo == 'indicador_barra_base')
    {
        $cadena = filter_input(INPUT_GET, 'cadena', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));

        $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

        $indicador = new Indicador();
        $indicadores = $indicador->find("id_entidad = $id_entidad AND nombre LIKE '%$cadena%'");
        $smarty->assign('indicadores', $indicadores);
        $smarty->assign('id_entidad', $id_entidad);
    }
    if ($modulo == 'indicadores_barra_complementarios')
    {
        $cadena = filter_input(INPUT_GET, 'cadena', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));

        $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

        $indicador = new Indicador();
        $indicadores = $indicador->find("id_entidad = $id_entidad AND nombre LIKE '%$cadena%'");
        $smarty->assign('indicadores', $indicadores);
        $smarty->assign('id_entidad', $id_entidad);
    }
    if ($modulo == 'indicador_tarta')
    {
        $cadena = filter_input(INPUT_GET, 'cadena', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));

        $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

        $indicador = new Indicador();
        $indicadores = $indicador->find("id_entidad = $id_entidad AND nombre LIKE '%$cadena%'");
        $smarty->assign('indicadores', $indicadores);
        $smarty->assign('id_entidad', $id_entidad);
    }
    if ($modulo == 'indicador_metrica')
    {
        $cadena = filter_input(INPUT_GET, 'cadena', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));

        $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

        $indicador = new Indicador();
        $indicadores = $indicador->find("id_entidad = $id_entidad AND nombre LIKE '%$cadena%'");
        $smarty->assign('indicadores', $indicadores);
        $smarty->assign('id_entidad', $id_entidad);
    }
    if ($modulo == 'indicador_subunidades')
    {
        $cadena = filter_input(INPUT_GET, 'cadena', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));

        $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

        $indicador = new Indicador();
        $indicadores = $indicador->find("id_entidad = $id_entidad AND nombre LIKE '%$cadena%'");
        $smarty->assign('indicadores', $indicadores);
        $smarty->assign('id_entidad', $id_entidad);
    }

    $smarty->assign('modulo', $modulo);
    $plantilla = "panel_buscador.tpl";
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
