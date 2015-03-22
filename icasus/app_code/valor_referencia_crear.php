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

if (filter_has_var(INPUT_GET, 'id_entidad'))
{
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $entidad = new Entidad();
    $entidad->load("id = $id_entidad");
    $smarty->assign('entidad', $entidad);
}

$indicador = new Indicador();
$indicador->load_joined("id=$id_indicador");


$entidad = new Entidad();
$entidad->load("id = $indicador->id_entidad");
$smarty->assign('entidad', $entidad);

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
            $id_val_ref = filter_var($id_valor_ref, FILTER_SANITIZE_NUMBER_INT);
            $valor_ref->load("id = $id_val_ref");
            //Comprobamos si existen valores asignados para las referencias
            $valores_referencia_medicion = $valor_referencia_medicion->Find("id_valor_referencia=$id_val_ref");
            $tiene_valores = false;
            foreach ($valores_referencia_medicion as $val_ref_medicion)
            {
                if ($val_ref_medicion->valor != NULL)
                {
                    $tiene_valores = true;
                }
            }
            //Borra el valor de referencia si no tiene valores en ninguna medición
            if ($tiene_valores)
            {
                $error = ERR_VAL_REF_BORRAR . ' (' . $valor_ref->etiqueta . ')';
                $smarty->assign("error", $error);
                header("Location: index.php?page=valor_referencia_crear&id_$tipo=$indicador->id&id_entidad=$indicador->id_entidad&error=$error");
                exit;
            }
            else
            {
                foreach ($valores_referencia_medicion as $val_ref_medicion)
                {
                    $val_ref_medicion->Delete();
                }
                $valor_ref->Delete();
                $contador ++;
            }
        }
        if ($contador != 0)
        {
            $aviso = MSG_VALS_REF_BORRADO . ' ' . $contador . ' ' . TXT_VAL_REF;
            $smarty->assign("aviso", $aviso);
            header("Location:index.php?page=valor_referencia_crear&id_$tipo=$indicador->id&id_entidad=$indicador->id_entidad&aviso=$aviso");
        }
    }
}

$smarty->assign('_javascript', array('valor_referencia_crear'));
$smarty->assign('indicador', $indicador);
$smarty->assign('_nombre_pagina', $indicador->nombre);

$smarty->assign('tipo', $tipo);
$plantilla = 'valor_referencia_crear.tpl';

