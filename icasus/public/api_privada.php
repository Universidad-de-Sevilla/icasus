<?php

//---------------------------------------------------------------------------------------------------
//  Proyecto: Icasus 
//  Archivo: api_privada.php
//---------------------------------------------------------------------------------------------------
//  Permite añadir datos al sistema desde una url
//---------------------------------------------------------------------------------------------------
// Para limpiar y asegurar la entrada de datos
require_once('../../cascara_core/function/sanitize.php');
// Conexión a datos
require_once('../app_code/app_config.php');

@mysql_connect(IC_DB_HOST, IC_DB_LOGIN, IC_DB_CLAVE);

if (mysql_select_db(IC_DB_DATABASE))
{
    // Capturamos y procesamos los datos de la petición
    if (filter_has_var(INPUT_GET, 'metodo') && filter_has_var(INPUT_GET, 'apikey'))
    {
        $metodo = filter_input(INPUT_GET, 'metodo', FILTER_SANITIZE_STRING);
        $apikey = filter_input(INPUT_GET, 'apikey', FILTER_SANITIZE_STRING);

        if (function_exists($metodo))
        {
            foreach (filter_input_array(INPUT_GET) as $variable => $valor)
            {
                if (!empty($valor))
                {
                    $variable = filter_var($valor, FILTER_SANITIZE_STRING);
                }
            }
            /*
              $id_indicador = sanitize($_REQUEST['id_indicador'],INT);
              $periodo_inicio = sanitize($_REQUEST['periodo_inicio'],SQL);
              $periodo_fin = sanitize($_REQUEST['periodo_fin'],SQL);
              $etiqueta = sanitize($_REQUEST['etiqueta'],SQL);
              $valor = sanitize($_REQUEST['valor'],SQL);

              $metodo($id_indicador, $fecha_inicio, $fecha_fin);
             */
        }
        else
        {
            echo MSG_NO_MET_SOL;
        }
    }
}
else
{
    echo ERR_CON_BD;
}

//------------------------------------------ 
//  Métodos 
//------------------------------------------

function graba_medicion_con_valor($id_indicador, $periodo_inicio, $periodo_fin, $etiqueta, $valor)
{
    global $metodo, $adodb, $medicion_id;

    if (isset($id_indicador, $periodo_inicio, $periodo_fin, $etiqueta, $valor))
    {
        //begin transaction
        $query = "INSERT INTO mediciones (id_indicador, etiqueta, periodo_inicio, periodo_fin) VALUES ($id_indicador, '$etiqueta', $periodo_inicio, $periodo_fin);";
//        $adodb->Execute();
        $adodb->Execute($query);
        $medicion_id = $adodb->getLastID();
//        $query = "";
        //end transaction
    }
    else
    {
        echo MSG_FALTAN_PARAM_MET . ': ' . $metodo;
    }
}
