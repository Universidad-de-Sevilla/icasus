<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (https://gestionproyectos.us.es/projects/r2h2-icasus)
// Archivo: valor_referencia.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Controlador para gestionar los valores de referencia de indicadores
//---------------------------------------------------------------------------------------------------

global $smarty;
global $usuario;
global $plantilla;

if (filter_has_var(INPUT_GET, 'id_indicador'))
{
    $id_indicador = filter_input(INPUT_GET, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
    $indicador = new Indicador();
    if ($indicador->load_joined("id = $id_indicador"))
    {
        $smarty->assign('indicador', $indicador);
    }
    else
    {
        $error = ERR_INDIC_MOSTRAR;
        header("location:index.php?page=error&error=$error");
    }

    $entidad = new Entidad();
    $entidad->load("id = $indicador->id_entidad");
    $smarty->assign('entidad', $entidad);

    //Obtener todos los indicadores para avanzar o retroceder
    if ($indicador->archivado)
    {
        $indicadores = $indicador->Find("id_entidad = $id_entidad AND archivado is NOT NULL");
    }
    else
    {
        if ($indicador->id_proceso)
        {

            $indicadores = $indicador->Find("id_entidad = $id_entidad AND id_proceso=$indicador->id_proceso AND archivado is NULL");
        }
        else
        {
            $indicadores = $indicador->Find("id_entidad = $id_entidad AND id_proceso IS NULL AND archivado is NULL");
        }
    }
    $smarty->assign("indicadores", $indicadores);
    $cont = 0;
    foreach ($indicadores as $ind)
    {
        if ($id_indicador == $ind->id)
        {
            $indice = $cont;
            $smarty->assign("indice", $indice);
        }
        $cont++;
    }

    //Proceso del indicador
    $proceso = $indicador->proceso;
    $smarty->assign('proceso', $proceso);

    //Responsables
    $responsable = false;
    if ($indicador->id_responsable == $usuario->id || $usuario->id == $proceso->id_propietario)
    {
        $responsable = true;
    }
    $smarty->assign('responsable', $responsable);

    //Comprobamos que existe al menos un valor de referencia 'Límite' o 'Meta'
    //y si no es así avisaremos
    $aviso_ref = true;
    $num_val_ref = count($indicador->valores_referencia);
    $i = 0;
    while ($i < $num_val_ref && $aviso_ref)
    {
        if (strpos($indicador->valores_referencia[$i]->nombre, 'mite') != false ||
                strpos($indicador->valores_referencia[$i]->nombre, 'eta') != false)
        {
            $aviso_ref = false;
        }
        $i++;
    }
    $smarty->assign('aviso_ref', $aviso_ref);

    $valor_ref = new Valor_referencia();
    $valor_referencia_medicion = new Valor_referencia_medicion();

    if (filter_has_var(INPUT_GET, 'borrar'))
    {
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
                        $aviso = ERR_VAL_REF_BORRAR . ' (' . $valor_ref->etiqueta . ')';
                        $smarty->assign("aviso", $aviso);
                        header("Location: index.php?page=valor_referencia&id_indicador=$indicador->id&id_entidad=$indicador->id_entidad&aviso=$aviso");
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
                    $exito = MSG_VALS_REF_BORRADO . ' ' . $contador . ' ' . TXT_VAL_REF;
                    $smarty->assign("exito", $exito);
                    header("Location:index.php?page=valor_referencia&id_indicador=$indicador->id&id_entidad=$indicador->id_entidad&exito=$exito");
                }
            }
        }
        else
        {
            $aviso = MSG_VALS_REF_NO_MARCADOS;
            $smarty->assign("aviso", $aviso);
            header("Location: index.php?page=valor_referencia&id_indicador=$indicador->id&id_entidad=$indicador->id_entidad&aviso=$aviso");
        }
    }

    $smarty->assign('_javascript', array('valor_referencia'));
    $smarty->assign('_nombre_pagina', FIELD_INDIC . ": $indicador->nombre");
    $plantilla = 'indicadores/valor_referencia.tpl';
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
