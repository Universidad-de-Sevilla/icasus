<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: medicion_crear_ajax.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Actualiza de manera asincrona las subunidades que se verán afectadas antes de crearse
// una medición
//---------------------------------------------------------------------------------------------------

global $smarty;
global $usuario;
global $plantilla;

$id_indicador = filter_input(INPUT_GET, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
$id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

if (!empty($id_indicador) AND ! empty($id_entidad))
{
    $indicador = new Indicador();
    if ($indicador->permiso_crear_medicion($usuario->id, $id_indicador))
    {
        $indicador_subunidad = new Indicador_subunidad();
        if ($indicador_subunidad->actualizar_subunidades($id_indicador, $id_entidad))
        {
            //deberia escribir en el log un regitro de exito de actualizacion
        }
        else
        {
            //deberia escribir en el log un regitro de error por no poder actualizar
        }
    }
    else
    {
        //deberia escribir en el log un regitro de error por falta de permiso
    }
}
else
{
    //deberia escribir en el log un regitro de error por falta de párametros
}
