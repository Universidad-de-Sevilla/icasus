<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: indicador_borrar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Borra un indicador
//---------------------------------------------------------------------------------------------------

if (filter_has_var(INPUT_GET, 'id_entidad') && filter_has_var(INPUT_GET, 'id_indicador'))
{
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $id_indicador = filter_input(INPUT_GET, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
    $indicador = new Indicador();
    $indicador->load_joined("id = $id_indicador");
    if ($control || $usuario->id == $indicador->id_responsable OR $usuario->id == $indicador->id_responsable_medicion)
    {
        $medicion = new Medicion();
        $mediciones = $medicion->Find("id_indicador = $id_indicador");
        if ($mediciones)
        {
            $error = ERR_INDIC_BORRAR_MED;
            header("Location: index.php?page=indicador_listar&id_entidad=$id_entidad&error=$error");
        }
        else
        {
            //Si es calculado borramos sus dependencias de 
            //la tabla de indicadores dependencias
            if ($indicador->calculo)
            {
                borrar_dependencias($id_indicador);
            }
            $indicador->delete();
            $aviso = MSG_INDIC_BORRADO;
            header("Location: index.php?page=indicador_listar&id_entidad=$id_entidad&aviso=$aviso");
        }
    }
    else
    {
        $error = ERR_INDIC_BORRAR_NO_AUT;
        header("Location: index.php?page=indicador_listar&id_entidad=$id_entidad&error=$error");
    }
}
else
{ // falta id_indicador o id_entidad
    $error = ERR_PARAM;
    header("Location: index.php?page=indicador_listar&id_entidad=$id_entidad&error=$error");
}

//Función que borra los indicadores/datos de los que depende el indicador/dato 
//calculado cuyo identificador recibe como parámatro
function borrar_dependencias($id)
{
    $indicador_dependencia = new Indicador_dependencia();
    while ($indicador_dependencia->load("id_calculado = $id"))
    {
        $indicador_dependencia->delete();
    }
}
