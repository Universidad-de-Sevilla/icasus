<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: indicador_grabar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Graba los datos de un indicador nuevo o existente
//---------------------------------------------------------------------------------------------------
global $usuario;
//Variable para operar con Indicadores/Datos
$logicaIndicador = new LogicaIndicador();

if (
        filter_has_var(INPUT_POST, 'codigo')
        AND filter_has_var(INPUT_POST, 'nombre')
        AND filter_has_var(INPUT_POST, 'id_responsable')
        AND filter_has_var(INPUT_POST, 'id_responsable_medicion')
        AND filter_has_var(INPUT_POST, 'formulacion')
        AND filter_has_var(INPUT_POST, 'id_proceso')
        AND filter_has_var(INPUT_POST, 'id_entidad')
        AND filter_has_var(INPUT_POST, 'tipo_seleccion_responsable'))
{
    $indicador = new Indicador();

    if (filter_has_var(INPUT_GET, 'id_indicador'))
    {
        $id_indicador = filter_input(INPUT_GET, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
        $indicador->load("id = $id_indicador");
        $tipo_agregacion_actual = $indicador->id_tipo_agregacion;
        $aviso = MSG_INDIC_ACTUALIZADO;
    }
    else
    {
        $aviso = MSG_INDIC_CREADO;
        $indicador->activo = 1;
    }

    $id_entidad = filter_input(INPUT_POST, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

    // Campos obligatorios
    $indicador->id_proceso = filter_input(INPUT_POST, 'id_proceso', FILTER_SANITIZE_NUMBER_INT);
    $indicador->id_responsable = filter_input(INPUT_POST, 'id_responsable', FILTER_SANITIZE_NUMBER_INT);
    $indicador->id_responsable_medicion = filter_input(INPUT_POST, 'id_responsable_medicion', FILTER_SANITIZE_NUMBER_INT);
    $indicador->id_entidad = $id_entidad;
    $indicador->codigo = filter_input(INPUT_POST, 'codigo', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
    $indicador->nombre = filter_input(INPUT_POST, 'nombre', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
    $indicador->formulacion = filter_input(INPUT_POST, 'formulacion', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
    $indicador->id_visibilidad = filter_input(INPUT_POST, 'id_visibilidad', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
    $tipo_seleccion_responsable = filter_input(INPUT_POST, 'tipo_seleccion_responsable');
    // Campos opcionales 
    $indicador->descripcion = filter_has_var(INPUT_POST, 'descripcion') ? filter_input(INPUT_POST, 'descripcion', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
    $indicador->observaciones = filter_has_var(INPUT_POST, 'observaciones') ? filter_input(INPUT_POST, 'observaciones', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
    $indicador->periodicidad = filter_has_var(INPUT_POST, 'periodicidad') ? filter_input(INPUT_POST, 'periodicidad', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
    $indicador->calculo = filter_has_var(INPUT_POST, 'calculo') ? filter_input(INPUT_POST, 'calculo', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
    $indicador->fuente_informacion = filter_has_var(INPUT_POST, 'fuente_informacion') ? filter_input(INPUT_POST, 'fuente_informacion', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
    $indicador->nivel_desagregacion = filter_has_var(INPUT_POST, 'nivel_desagregacion') ? filter_input(INPUT_POST, 'nivel_desagregacion', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
    $indicador->fuente_datos = filter_has_var(INPUT_POST, 'fuente_datos') ? filter_input(INPUT_POST, 'fuente_datos', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
    $indicador->desagregado = filter_has_var(INPUT_POST, 'tipo_seleccion_responsable') ? filter_input(INPUT_POST, 'tipo_seleccion_responsable', FILTER_SANITIZE_NUMBER_INT) : null;
    $indicador->evidencia = filter_has_var(INPUT_POST, 'evidencia') ? filter_input(INPUT_POST, 'evidencia', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
    $indicador->historicos = filter_has_var(INPUT_POST, 'historicos') ? filter_input(INPUT_POST, 'historicos', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
    $indicador->unidad_generadora = filter_has_var(INPUT_POST, 'unidad_generadora') ? filter_input(INPUT_POST, 'unidad_generadora', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
    $indicador->interpretacion = filter_has_var(INPUT_POST, 'interpretacion') ? filter_input(INPUT_POST, 'interpretacion', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
    $indicador->indicadores_relacionados = filter_has_var(INPUT_POST, 'indicadores_relacionados') ? filter_input(INPUT_POST, 'indicadores_relacionados', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
    $indicador->id_tipo_agregacion = filter_has_var(INPUT_POST, 'id_tipo_agregacion') ? filter_input(INPUT_POST, 'id_tipo_agregacion', FILTER_SANITIZE_NUMBER_INT) : 0;
    if (filter_input(INPUT_POST, 'tipo_seleccion_responsable', FILTER_SANITIZE_NUMBER_INT) == 0)
    {
        $indicador->id_tipo_agregacion = 0;
    }
    $indicador->fecha_creacion = date("Y-m-d");
    if ($indicador->save())
    {
        // Si el indicador es nuevo grabamos subunidades
        if (!isset($id_indicador))
        {
            //Si es calculado guardamos los indicadores/datos de los que depende en 
            //la tabĺa de indicadores_dependencias
            if ($indicador->calculo AND $indicador->calculo != "")
            {
                $logicaIndicador->guardar_dependencias($indicador->id);
            }
            $post_array = filter_input_array(INPUT_POST);
            $subunidades = filter_has_var(INPUT_POST, 'subunidades') ? $post_array['subunidades'] : array();
            if (count($subunidades) > 0)
            {
                foreach ($subunidades as $subunidad)
                {
                    $indicador_subunidad = new Indicador_subunidad();
                    $indicador_subunidad->id_indicador = $indicador->id;
                    $indicador_subunidad->id_entidad = filter_var($subunidad, FILTER_SANITIZE_NUMBER_INT);
                    //comprueba si la medición va a ser centralizada o para cada responsable de subunidad
                    //si es para cada responsable de subunidad, se le asigna como responsable de la medición
                    //el reponsable de la unidad. Si no exite este se le asigna como resposable de medición
                    //el responsable de medicion de la unidad superior.
                    switch ($tipo_seleccion_responsable)
                    {
                        case 0:
                            $indicador_subunidad->id_usuario = $indicador->id_responsable_medicion;
                            break;
                        case 1:
                            $usuario_entidad = new Usuario_entidad();
                            // Cargamos al responsable de la unidad para echarle el muerto 
                            // Luego el podrá echárselo a otro
                            if ($usuario_entidad->load("id_entidad = $subunidad AND id_rol = 1"))
                            {
                                $indicador_subunidad->id_usuario = $usuario_entidad->id_usuario;
                            }
                            else
                            {
                                $indicador_subunidad->id_usuario = $indicador->id_responsable_medicion;
                            }
                            break;
                        case 2:
                            $indicador_subunidad->id_usuario = $indicador->id_responsable_medicion;
                            break;
                        default:
                            $indicador_subunidad->id_usuario = $indicador->id_responsable_medicion;
                    }
                    $indicador_subunidad->save();
                }
            }
            if (filter_has_var(INPUT_POST, 'criterios_efqm'))
            {
                // Grabamos los criterios EFQM en los que este indicador influye (pueden ser uno o dos)
                $post_array = filter_input_array(INPUT_POST);
                $criterios_efqm = $post_array['criterios_efqm'];
                foreach ($criterios_efqm as $id_criterio_efqm)
                {
                    $criterio_efqm_indicador = new Criterio_efqm_indicador();
                    $criterio_efqm_indicador->id_indicador = $indicador->id;
                    $criterio_efqm_indicador->id_criterio_efqm = filter_var($id_criterio_efqm, FILTER_SANITIZE_NUMBER_INT);
                    $criterio_efqm_indicador->save();
                }
            }
        }
        //El indicador ya existe (edición)
        else
        {
            //Si es calculado guardamos los indicadores/datos de los que depende en 
            //la tabĺa de indicadores_dependencias pero antes borramos 
            //las anteriores dependencias por si estas cambian en la edición
            $logicaIndicador->borrar_dependencias($id_indicador);
            if ($indicador->calculo AND $indicador->calculo != "")
            {
                $logicaIndicador->guardar_dependencias($id_indicador);
            }
            //Primero borramos los existentes ¿no habrá otra forma más elegante?
            $criterio_efqm_indicador = new Criterio_efqm_indicador();
            while ($criterio_efqm_indicador->load("id_indicador = $indicador->id"))
            {
                $criterio_efqm_indicador->delete();
            }
            // Ahora damos de alta los que vienen en el formulario
            if (filter_has_var(INPUT_POST, 'criterios_efqm'))
            {
                $post_array = filter_input_array(INPUT_POST);
                // Grabamos los criterios EFQM en los que este indicador influye (pueden ser uno o dos)
                $criterios_efqm = $post_array['criterios_efqm'];
                foreach ($criterios_efqm as $id_criterio_efqm)
                {
                    $criterio_efqm_indicador = new Criterio_efqm_indicador();
                    $criterio_efqm_indicador->id_indicador = $indicador->id;
                    $criterio_efqm_indicador->id_criterio_efqm = filter_var($id_criterio_efqm, FILTER_SANITIZE_NUMBER_INT);
                    $criterio_efqm_indicador->save();
                }
            }
            //lo mismo pero para las subunidades afectadas
            $indicador_subunidad = new Indicador_subunidad();
            while ($indicador_subunidad->load("id_indicador = $id_indicador"))
            {
                $indicador_subunidad->delete();
            }
            if (filter_has_var(INPUT_POST, 'subunidades'))
            {
                $post_array = filter_input_array(INPUT_POST);
                $subunidades = $post_array['subunidades'];
                foreach ($subunidades as $id_subunidad)
                {
                    $indicador_subunidad = new Indicador_subunidad();
                    $indicador_subunidad->id_indicador = $id_indicador;
                    $indicador_subunidad->id_entidad = filter_var($id_subunidad, FILTER_SANITIZE_NUMBER_INT);
                    switch ($indicador->desagregado)
                    {
                        case 0:
                            $indicador_subunidad->id_usuario = $indicador->id_responsable_medicion;
                            break;
                        case 1:
                            $usuario_entidad = new Usuario_entidad();
                            // Cargamos al responsable de la unidad para echarle el muerto 
                            // Luego el podrá echárselo a otro
                            if ($usuario_entidad->load("id_entidad = $id_subunidad AND id_rol = 1"))
                            {
                                $indicador_subunidad->id_usuario = $usuario_entidad->id_usuario;
                            }
                            else
                            {
                                $indicador_subunidad->id_usuario = $indicador->id_responsable_medicion;
                            }
                            break;
                        case 2:
                            $indicador_subunidad->id_usuario = $indicador->id_responsable_medicion;
                            break;
                        default:
                            $indicador_subunidad->id_usuario = $indicador->id_responsable_medicion;
                    }
                    $indicador_subunidad->save();
                }
                //Actualizamos las mediciones en función de la fecha si 
                //cambiamos tipo de agregación
                if (($tipo_agregacion_actual == 0 && $indicador->id_tipo_agregacion != 0) ||
                        ($tipo_agregacion_actual != 0 && $indicador->id_tipo_agregacion == 0))
                {
                    $logicaIndicador->actualizar_mediciones($indicador);
                }
            }
        }
        header("Location: index.php?page=indicador_mostrar&id_indicador=$indicador->id&id_entidad=$id_entidad&aviso=$aviso");
    }
    else
    {
        $error = ERR_INDIC_GRABAR;
        header("Location: index.php?page=indicador_listar&id_entidad=$id_entidad&error=$error");
    }
}
else
{
    // Avisamos de error por falta de parametros
    $error = ERR_PARAM;
    header("Location: index.php?page=indicador_listar&id_entidad=$id_entidad&error=$error");
}