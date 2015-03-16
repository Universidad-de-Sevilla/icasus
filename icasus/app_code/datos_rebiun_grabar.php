<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: datos_rebiun_grabar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------

global $usuario;
global $plantilla;
$plantilla = "datos_rebiun_grabar.tpl";

$autorizado = false;

if (filter_has_var(INPUT_GET, 'id_valor') && filter_has_var(INPUT_GET, 'id_entidad') && filter_has_var(INPUT_GET, 'valor_parcial'))
{
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    //Comprobamos si el usuario es responsable en la unidad donde quiere grabar
    foreach ($usuario->entidades as $usuario_entidad)
    {
        if ($usuario_entidad->id_entidad == $id_entidad && ($usuario_entidad->id_rol == 1 || $usuario_entidad->id_rol == 2))
        {
            $autorizado = true;
        }
    }

    if ($autorizado)
    {
        $valor = new Valor();
        $id_valor = filter_input(INPUT_GET, 'id_valor', FILTER_SANITIZE_NUMBER_INT);
        $valor->load("id = $id_valor");
        $valor_parcial = filter_input(INPUT_GET, 'valor_parcial', FILTER_SANITIZE_NUMBER_FLOAT, FILTER_FLAG_ALLOW_FRACTION);
        $valor->valor_parcial = $valor_parcial;
        $valor->valor = $valor->valor_parcial;
        $valor->id_usuario = $usuario->id;
        $valor->fecha_recogida = date("Y-m-d");
        if ($valor->save())
        {
            $smarty->assign("resultado", $valor->valor_parcial);
        }
    }
}

