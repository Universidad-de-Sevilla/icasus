<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: medicion_responsable.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Permite cambiar la asignación de mediciones a otros usuarios
// Hay que ser responsable de grabación de la subunidad, responsable de grabación del indicador o
// responsable de seguimiento del indicador
//---------------------------------------------------------------------------------------------------

global $smarty;
global $usuario;
global $plantilla;

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
    header("location:index.php?error=$error");
}

// Comprueba permisos para el usuario: responsable unidad, responsable delegado,
// responsable indicador, responsable medicion
$indicador = new Indicador();
$indicador->load_joined("id = $id_indicador");
$smarty->assign('indicador', $indicador);
$id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
//Responsables
$responsable = false;
if ($indicador->id_responsable == $usuario->id)
{
    $responsable = true;
}
$smarty->assign('responsable', $responsable);
if ($control || $responsable)
{
    $indicador_subunidad = new Indicador_subunidad();
    $indicadores_subunidades = $indicador_subunidad->Find_entidades_responsables($id_indicador, $usuario->id);
    $smarty->assign("_nombre_pagina", TXT_RESPONSABLES_GRABAR . ': ' . $indicador->nombre);
    $smarty->assign("indicadores_subunidades", $indicadores_subunidades);

    $entidad = new Entidad();
    $entidad->load("id = $indicador->id_entidad");
    $smarty->assign('entidad', $entidad);
    $smarty->assign('tipo', $tipo);
    $smarty->assign('_javascript', array('medicion_responsable'));
    $smarty->assign('_nombre_pagina', FIELD_RESP_MED . ": $indicador->nombre");
    $plantilla = "medicion_responsable.tpl";
}
else
{
    // El usuario no tiene permisos avisamos error
    $error = ERR_MED_RESP;
    header("Location:index.php?page=$tipo _mostrar&id_$tipo=$id_indicador&id_entidad=$id_entidad&error=$error");
}
