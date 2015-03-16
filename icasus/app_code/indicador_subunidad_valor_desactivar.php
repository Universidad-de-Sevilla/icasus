<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: indicador_subunidad_valor_desactivar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Muestra un listado de las mediciones establecidas para un indicador
//---------------------------------------------------------------------------------------------------
global $smarty;
global $usuario;
global $plantilla;

//$id_indicador = sanitize($_REQUEST["id_indicador"], INT);
$id_indicador = filter_input(INPUT_GET, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
//$id_entidad = sanitize($_REQUEST["id_entidad"], INT);
$id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
if (isset($id_indicador))
{
    $usuario_entidad = new Usuario_entidad();
    if ($usuario_entidad->load("id_usuario=$usuario->id and id_entidad=$id_entidad and (id_rol=1 or id_rol=2)"))
    {
        $indicador = new Indicador();
        $indicador->load("id = $id_indicador");
        $smarty->assign('indicador', $indicador);

        $entidad = new Entidad();
        $entidad->load("id = $indicador->id_entidad");
        $smarty->assign('entidad', $entidad);

        //devuelve el literal del año de cada medicion para los <th> de la tabla
        $medicion = new Medicion();
        $year = $medicion->find_year_mediciones($id_indicador);
        $smarty->assign('years', $year);

        $mediciones = $medicion->find("id_indicador = $id_indicador ORDER BY periodo_inicio");
        $smarty->assign('mediciones', $mediciones);

        $subunidades_mediciones = $entidad->find_subunidades_mediciones($id_indicador, $entidad->id);
        $smarty->assign('subunidades_mediciones', $subunidades_mediciones);
//print_r($subunidades_mediciones);
        $smarty->assign('_nombre_pagina', TXT_INDIC_SUBUNID_VAL . ": $indicador->nombre");
        $plantilla = 'indicador_subunidad_valor.tpl';
    }
    else
    {
        // El usuario no tiene permisos avisamos error
        $error = ERR_INDIC_EDIT_NO_AUT;
        header("Location:index.php?page=indicador_mostrar&id_indicador=$id_indicador&error=$error");
    }
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=entidad_listar&error=$error");
}
//print_r($subunidades_mediciones);

