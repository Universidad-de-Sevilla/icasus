<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (https://gestionproyectos.us.es/projects/r2h2-icasus)
// Archivo: valor_referencia_crear.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
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
else // falta id_indicador o id_entidad
{
    $smarty->assign('error', ERR_PARAM);
    $smarty->assign('_nombre_pagina', ERR);
    $plantilla = 'error.tpl';
}

$indicador = new Indicador();
$indicador->load_joined("id=$id_indicador");

//Permiso para borrar referencias
$permiso = false;
foreach ($usuario->entidades AS $usuario_entidad)
{
    if (($usuario_entidad->id_rol == 1 OR $usuario_entidad->id_rol == 2) AND $usuario_entidad->id_entidad == $indicador->id_entidad)
    {
        $permiso = true;
    }
}
if ($indicador->id_responsable == $usuario->id
        OR $indicador->id_responsable_medicion == $usuario->id)
{
    $permiso = true;
}
$smarty->assign('permiso', $permiso);

$valor_ref = new Valor_referencia();
$valor_referencia_medicion = new Valor_referencia_medicion();
//Comprobamos si existen valores para borrar
if (filter_has_var(INPUT_POST, 'id_val_ref'))
{
    $post_array = filter_input_array(INPUT_POST);
    $id_valores_ref = $post_array['id_val_ref'];
    if ($id_valores_ref)
    {
        $contador = 0;
        foreach ($id_valores_ref as $id_valor_ref)
        {
            //Borra el valor de referencia
            $id_val_ref = filter_var($id_valor_ref, FILTER_SANITIZE_NUMBER_INT);
            $valor_ref->load("id = $id_val_ref");
            $valor_ref->delete();
            $contador ++;
        }
        $aviso = MSG_VALS_REF_BORRADO . ' ' . $contador . ' ' . TXT_VAL_REF;
        $smarty->assign("aviso", $aviso);
        header("index.php?page=valor_referencia_crear&id_$tipo=$indicador->id&id_entidad=$indicador->id_entidad&aviso=$aviso");
    }
}

$smarty->assign('_javascript', array('valor_referencia_crear'));
$smarty->assign('indicador', $indicador);
$smarty->assign('_nombre_pagina', $indicador->nombre);

$smarty->assign('tipo', $tipo);
$plantilla = 'valor_referencia_crear.tpl';

