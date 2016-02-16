<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: indicador_borrar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Borra un indicador
//---------------------------------------------------------------------------------------------------

global $usuario;
//Variable para operar con Indicadores/Datos
$logicaIndicador = new LogicaIndicador();

if (filter_has_var(INPUT_GET, 'id_entidad') && filter_has_var(INPUT_GET, 'id_indicador'))
{
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $id_indicador = filter_input(INPUT_GET, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
    $indicador = new Indicador();
    $indicador->load_joined("id = $id_indicador");
    // Comprobamos que el usuario es responsable de este indicador para permitirle borrar
    if ($control || $usuario->id == $indicador->id_responsable)
    {
        $medicion = new Medicion();
        $mediciones = $medicion->Find("id_indicador = $id_indicador");
        $indicadores_dependientes = $logicaIndicador->calcular_influencias($indicador->id);
        //Si tiene mediciones no se puede borrar 
        //hasta borrar las mediciones
        if ($mediciones)
        {
            $aviso = ERR_INDIC_BORRAR_MED;
            header("Location: index.php?page=indicador_mostrar&id_indicador=$id_indicador&id_entidad=$id_entidad&aviso=$aviso");
        }
        //Si otros indicadores/datos dependen de él tampoco podremos borrar
        else if (count($indicadores_dependientes) != 0)
        {
            $aviso = ERR_INDIC_BORRAR_DEP;
            header("Location: index.php?page=indicador_mostrar&id_indicador=$id_indicador&id_entidad=$id_entidad&aviso=$aviso");
        }
        else
        {
            //Si es calculado borramos sus dependencias de 
            //la tabla de indicadores_dependencias
            if ($indicador->calculo)
            {
                $logicaIndicador->borrar_dependencias($id_indicador);
            }
            $indicador->delete();
            //Borramos despues los criterior EFQM
            $logicaIndicador->borrar_criterios_efqm($id_indicador);
            //Borramos también las Unidades vinculadas al Indicador
            $logicaIndicador->borrar_unidades($id_indicador);
            $exito = MSG_INDIC_BORRADO . "$indicador->nombre";
            header("Location: index.php?page=indicador_listar&id_entidad=$id_entidad&exito=$exito");
        }
    }
    else
    {
        $error = ERR_INDIC_BORRAR_NO_AUT;
        header("Location: index.php?page=indicador_mostrar&id_indicador=$id_indicador&id_entidad=$id_entidad&error=$error");
    }
}
else
{ // falta id_indicador o id_entidad
    $error = ERR_PARAM;
    header("Location: index.php?page=indicador_listar&id_entidad=$id_entidad&error=$error");
}
