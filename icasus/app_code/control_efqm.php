<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: control_efqm.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es) 
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Control de Indicadores EFQM
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
global $usuario;

$modulo = filter_input(INPUT_GET, 'modulo', FILTER_SANITIZE_STRING);
$id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

$entidad = new Entidad();
$entidad->load("id = $id_entidad");

//Criterios EFQM
$criterio = new Criterio_efqm();
$criterios_efqm = $criterio->Find('1=1');
$smarty->assign('criterios_efqm', $criterios_efqm);

//------------------------------------------------------------------------------
//---- Muestra datos en función de los criterios EFQM seleccionados -----------
//------------------------------------------------------------------------------
if ($modulo == 'efqm')
{
    $post_array = filter_input_array(INPUT_POST);
    $criterios = $post_array['efqm'];
    if ($criterios)
    {
        $criterio_efqm_indicador = new Criterio_efqm_indicador();
        $indicadores_efqm = array();
        $criterios_efqm_indicadores = array();
        foreach ($criterios as $id_criterio_efqm)
        {
            $id_efqm = filter_var($id_criterio_efqm, FILTER_SANITIZE_NUMBER_INT);
            //Indicadores/datos sin criterios EFQM
            if ($id_efqm == 0)
            {
                $indicador = new Indicador();
                $query_aux = "select distinct id_indicador from criterios_efqm_indicadores";
                $indicadores_efqm = array_merge($indicadores_efqm, $indicador->Find_joined("id not in ($query_aux) and id_entidad=$id_entidad and archivado is null"));
            }
            else
            {
                $criterios_efqm_indicadores = array_merge($criterios_efqm_indicadores, $criterio_efqm_indicador->Find("id_criterio_efqm=$id_criterio_efqm"));
            }
        }
        foreach ($criterios_efqm_indicadores as $crit_efqm_ind)
        {
            $indicador = new Indicador();
            if ($indicador->load_joined("id=$crit_efqm_ind->id_indicador"))
            {
                if (!in_array($indicador, $indicadores_efqm) && !($indicador->archivado) && $indicador->id_entidad == $id_entidad)
                {
                    array_push($indicadores_efqm, $indicador);
                }
            }
        }
        $smarty->assign("indicadores_efqm", $indicadores_efqm);
    }
}

$smarty->assign("modulo", $modulo);
$smarty->assign("entidad", $entidad);
$smarty->assign('_javascript', array('control_efqm', 'indicador_listar'));
$smarty->assign("_nombre_pagina", TXT_CONTROL . " (EFQM): " . $entidad->nombre);
$plantilla = "control_efqm.tpl";
