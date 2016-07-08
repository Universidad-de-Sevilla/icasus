<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: dato_borrar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Borra un dato
//---------------------------------------------------------------------------------------------------

global $usuario;
//Variable para operar con Indicadores/Datos
$logicaIndicador = new LogicaIndicador();

if (filter_has_var(INPUT_GET, 'id_dato') && filter_has_var(INPUT_GET, 'id_entidad'))
{
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $id_dato = filter_input(INPUT_GET, 'id_dato', FILTER_SANITIZE_NUMBER_INT);
    $dato = new Indicador();
    $dato->load_joined("id = $id_dato");
    // Comprobamos que el usuario es responsable de este dato para permitirle borrar
    if ($control || $usuario->id == $dato->id_responsable)
    {
        $medicion = new Medicion();
        $mediciones = $medicion->Find("id_indicador = $id_dato");
        $indicadores_dependientes = $logicaIndicador->calcular_influencias($dato->id);
        $objetivo_indicador = new ObjetivoIndicador();
        //Si está asociado a un objetivo operacional no podemos borrarlo
        if ($objetivo_indicador->load("id_indicador=$id_dato"))
        {
            $aviso = ERR_DATO_BORRAR_OBJOP;
            header("Location: index.php?page=dato_mostrar&id_dato=$id_dato&id_entidad=$id_entidad&aviso=$aviso");
        }
        //Si tiene mediciones no se puede borrar 
        //hasta borrar las mediciones
        else if ($mediciones)
        {
            $aviso = ERR_DATO_BORRAR_MED;
            header("Location: index.php?page=dato_mostrar&id_dato=$id_dato&id_entidad=$id_entidad&aviso=$aviso");
        }
        //Si otros Indicadores/Datos dependen de él tampoco podremos borrar
        else if (count($indicadores_dependientes) != 0)
        {
            $aviso = ERR_DATO_BORRAR_DEP;
            header("Location: index.php?page=dato_mostrar&id_dato=$id_dato&id_entidad=$id_entidad&aviso=$aviso");
        }
        else
        {
            //Si es calculado borramos sus dependencias de 
            //la tabla de indicadores dependencias
            if ($dato->calculo)
            {
                $logicaIndicador->borrar_dependencias($id_dato);
            }
            $dato->delete();
            //Borramos también las Unidades vinculadas al Dato
            $logicaIndicador->borrar_unidades($id_dato);
            $exito = MSG_DATO_BORRADO . "$dato->nombre";
            header("Location: index.php?page=dato_listar&id_entidad=$id_entidad&exito=$exito");
        }
    }
    else
    {
        $error = ERR_DATO_BORRAR_NO_AUT;
        header("Location: index.php?page=dato_mostrar&id_dato=$id_dato&id_entidad=$id_entidad&error=$error");
    }
}
else
{ // falta id_dato o id_entidad
    $error = ERR_PARAM;
    header("Location: index.php?page=dato_listar&id_entidad=$id_entidad&error=$error");
}
