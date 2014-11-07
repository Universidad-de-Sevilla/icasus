<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: medicion_responsable.php
//---------------------------------------------------------------------------------------------------
// Permite cambiar la asignación de mediciones a otros usuarios
// Hay que ser responsable de grabación de la subunidad, responsable de grabación del indicador o
// responsable de seguimiento del indicador
//---------------------------------------------------------------------------------------------------
global $smarty;
global $usuario;
global $plantilla;

if (isset($_REQUEST["id_indicador"]))
{
    $id_indicador = sanitize($_REQUEST["id_indicador"], INT);
    $tipo = "indicador";
}
else if (isset($_REQUEST["id_dato"]))
{
    $id_indicador = sanitize($_REQUEST["id_dato"], INT);
    $tipo = "dato";
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?error=$error");
}

$indicador_subunidad = new Indicador_subunidad();
$indicadores_subunidades = $indicador_subunidad->Find_entidades_responsables($id_indicador, $usuario->id);
$smarty->assign("_nombre_pagina", TXT_RESPONSABLES_GRABAR);
$smarty->assign("indicadores_subunidades", $indicadores_subunidades);

$indicador = new Indicador();
$indicador->load("id = $id_indicador");
$smarty->assign('indicador', $indicador);
$entidad = new Entidad();
$entidad->load("id = $indicador->id_entidad");
$smarty->assign('entidad', $entidad);
$smarty->assign('tipo', $tipo);
$plantilla = "medicion_responsable.tpl";

