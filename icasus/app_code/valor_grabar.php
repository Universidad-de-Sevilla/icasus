<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: valor_grabar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Graba en la base de dato el nuevo valor con los datos que vienen del formulario 
//---------------------------------------------------------------------------------------------------

global $smarty;
global $_usuario;
global $plantilla;

// Comprueba si vienen los datos necesarios para grabar un nuevo valor
if (filter_has_var(INPUT_POST, 'id_indicador') && filter_has_var(INPUT_POST, 'dato_valor') && filter_has_var(INPUT_POST, 'id_entidad') && filter_has_var(INPUT_POST, 'Date_Month') && filter_has_var(INPUT_POST, 'Date_Year'))
{
    $id_entidad = filter_input(INPUT_POST, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $id_indicador = filter_input(INPUT_POST, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
    $year = filter_input(INPUT_POST, 'Date_Year', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
    $month = filter_input(INPUT_POST, 'Date_Month', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
    // Fijamos el día, si fuera variable sería: $day = sanitize($_POST['Date_Day'],2);
    $day = 28;
    $valor = new ado_valor();
    if (filter_has_var(INPUT_POST, 'id_valor'))
    {
        $id_valor = filter_input(INPUT_POST, 'id_valor', FILTER_SANITIZE_NUMBER_INT);
        $valor->load("id_valor = $id_valor");
    }
    $valor->id_indicador = $id_indicador;
    $valor->valor = filter_input(INPUT_POST, 'dato_valor', FILTER_SANITIZE_NUMBER_FLOAT, FILTER_FLAG_ALLOW_FRACTION);
    $valor->objetivo = filter_has_var(INPUT_POST, 'objetivo') ? filter_input(INPUT_POST, 'objetivo', FILTER_SANITIZE_NUMBER_FLOAT, FILTER_FLAG_ALLOW_FRACTION) : 0;
    $valor->objetivo_carta = filter_has_var(INPUT_POST, 'objetivo_carta') ? filter_input(INPUT_POST, 'objetivo_carta', FILTER_SANITIZE_NUMBER_FLOAT, FILTER_FLAG_ALLOW_FRACTION) : 0;
    $valor->objetivo_estrategico = filter_has_var(INPUT_POST, 'objetivo_estrategico') ? filter_input(INPUT_POST, 'objetivo_estrategico', FILTER_SANITIZE_NUMBER_FLOAT, FILTER_FLAG_ALLOW_FRACTION) : 0;
    $valor->calculo = filter_has_var(INPUT_POST, 'calculo') ? filter_input(INPUT_POST, 'calculo') : null;
    $valor->observaciones = filter_has_var(INPUT_POST, 'observaciones') ? filter_input(INPUT_POST, 'observaciones') : null;
    $valor->fecha_recogida = mktime(0, 0, 0, $month, $day, $year);
    $valor->fecha_entrada = time();
    $valor->id_usuario = $_usuario->id_usuario;

    if ($valor->save())
    {
        // Se ha grabado bien, reenviamos al indicador
        $log = new Log(); // registra la accion en el log
        $log->add('nuevo valor', $id_indicador, $_usuario->id_usuario);
        $aviso = MSG_VAL_GRABAR;
        header("Location: index.php?page=indicador_datos&id_indicador=$id_indicador&id_entidad=$id_entidad&aviso=$aviso");
    }
    else
    {
        $error = ERR_VAL_GRABAR;
        header("Location: index.php?page=indicador_datos&id_indicador=$id_indicador&id_entidad=$id_entidad&error=$error");
    }
}
else // error: faltan datos 
{
    $smarty->assign('error', ERR_PARAM);
    $smarty->assign('_nombre_pagina', ERR);
    $plantilla = 'error.tpl';
}

