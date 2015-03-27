<?php

//------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: dato_grabar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//------------------------------------------------------------------------------
// Graba un nuevo dato o actualiza uno existente
//------------------------------------------------------------------------------

global $usuario;

$es_dato_nuevo = false;
$aviso = MSG_DATO_ACTUALIZADO;

if (
        filter_has_var(INPUT_POST, 'tipo_seleccion_responsable')
        AND filter_has_var(INPUT_POST, 'codigo')
        AND filter_has_var(INPUT_POST, 'nombre')
        AND filter_has_var(INPUT_POST, 'id_responsable')
        AND filter_has_var(INPUT_POST, 'id_responsable_medicion')
        AND filter_has_var(INPUT_POST, 'id_entidad')
)
{
    $dato = new Indicador();
    if (filter_has_var(INPUT_POST, 'id_dato'))
    {
        $id_dato = filter_input(INPUT_POST, 'id_dato', FILTER_SANITIZE_NUMBER_INT);
        $dato->load("id = $id_dato");
        $es_dato_nuevo = false;
        $aviso = MSG_DATO_ACTUALIZADO;
    }
    else
    {
        $es_dato_nuevo = true;
        $aviso = MSG_DATO_CREADO;
    }
    // Campos obligatorios
    $dato->id_entidad = filter_input(INPUT_POST, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    $dato->codigo = filter_input(INPUT_POST, 'codigo', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
    $dato->nombre = filter_input(INPUT_POST, 'nombre', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
    $dato->id_responsable = filter_input(INPUT_POST, 'id_responsable', FILTER_SANITIZE_NUMBER_INT);
    $dato->id_responsable_medicion = filter_input(INPUT_POST, 'id_responsable_medicion', FILTER_SANITIZE_NUMBER_INT);
    $dato->desagregado = filter_input(INPUT_POST, 'tipo_seleccion_responsable', FILTER_SANITIZE_NUMBER_INT);
    // Campos opcionales 
    $dato->id_visibilidad = filter_has_var(INPUT_POST, 'id_visibilidad') ? filter_input(INPUT_POST, 'id_visibilidad', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
    $dato->descripcion = filter_has_var(INPUT_POST, 'descripcion') ? filter_input(INPUT_POST, 'descripcion', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
    $dato->observaciones = filter_has_var(INPUT_POST, 'observaciones') ? filter_input(INPUT_POST, 'observaciones', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
    $dato->calculo = filter_has_var(INPUT_POST, 'calculo') ? filter_input(INPUT_POST, 'calculo', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
    $dato->periodicidad = filter_has_var(INPUT_POST, 'periodicidad') ? filter_input(INPUT_POST, 'periodicidad', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
    $dato->nivel_desagregacion = filter_has_var(INPUT_POST, 'nivel_desagregacion') ? filter_input(INPUT_POST, 'nivel_desagregacion', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
    $dato->id_tipo_agregacion = filter_has_var(INPUT_POST, 'id_tipo_agregacion') ? filter_input(INPUT_POST, 'id_tipo_agregacion', FILTER_SANITIZE_NUMBER_INT) : 0;
    $dato->fuente_datos = filter_has_var(INPUT_POST, 'fuente_datos') ? filter_input(INPUT_POST, 'fuente_datos', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
    $dato->historicos = filter_has_var(INPUT_POST, 'historicos') ? filter_input(INPUT_POST, 'historicos', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
    $dato->unidad_generadora = filter_has_var(INPUT_POST, 'unidad_generadora') ? filter_input(INPUT_POST, 'unidad_generadora', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
    $dato->indicadores_relacionados = filter_has_var(INPUT_POST, 'indicadores_relacionados') ? filter_input(INPUT_POST, 'indicadores_relacionados', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
    $dato->activo = 1;
    $dato->fecha_creacion = date("Y-m-d");

    // Una vez grabado el dato vamos a asignar a los responsables de medicion
    // Esto sólo se hace si se trata de un nuevo dato
    if ($dato->save())
    {
        if ($es_dato_nuevo == true)
        {
            $post_array = filter_input_array(INPUT_POST);
            $subunidades = $post_array['subunidades'];
            if (count($subunidades) > 0)
            {
                foreach ($subunidades as $subunidad)
                {
                    $indicador_subunidad = new Indicador_subunidad();
                    $indicador_subunidad->id_indicador = $dato->id;
                    $indicador_subunidad->id_entidad = filter_var($subunidad, FILTER_SANITIZE_NUMBER_INT);

                    // Comprueba si la medición va a ser centralizada o asignada a cada responsable de subunidad
                    // si es para cada responsable de subunidad, se le asigna como responsable de la medición
                    // el reponsable de la unidad. Si no exite este se le asigna como resposable de medición
                    // el responsable de medicion de la unidad superior.
                    if ($dato->desagregado == 0)
                    {
                        $indicador_subunidad->id_usuario = $dato->id_responsable;
                    }
                    else
                    {
                        $usuario_entidad = new Usuario_entidad();
                        if ($usuario_entidad->load("id_entidad = $subunidad AND id_rol = 1"))
                        {
                            $indicador_subunidad->id_usuario = $usuario_entidad->id_usuario;
                        }
                        else
                        {
                            $indicador_subunidad->id_usuario = $dato->id_responsable;
                        }
                    }
                    $indicador_subunidad->save();
                }
            }
        }
        else
        {
            $indicador_subunidad = new Indicador_subunidad();
            while ($indicador_subunidad->load("id_indicador = $id_dato"))
            {
                $indicador_subunidad->delete();
            }
            if (filter_has_var(INPUT_POST, 'subunidades'))
            {
                 $post_array = filter_input_array(INPUT_POST);
//                $subunidades = filter_input(INPUT_POST, 'subunidades');
                 $subunidades = $post_array['subunidades'];
                foreach ($subunidades as $id_subunidad)
                {
                    $indicador_subunidad = new Indicador_subunidad();
                    $indicador_subunidad->id_indicador = $id_dato;
//                    $indicador_subunidad->id_entidad = $id_subunidad;
                    $indicador_subunidad->id_entidad = filter_var($id_subunidad, FILTER_SANITIZE_NUMBER_INT);
                    switch ($dato->desagregado)
                    {
                        case 0:
                            $indicador_subunidad->id_usuario = $dato->id_responsable_medicion;
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
                                $indicador_subunidad->id_usuario = $dato->id_responsable_medicion;
                            }
                            break;
                        case 2:
                            $indicador_subunidad->id_usuario = $dato->id_responsable_medicion;
                            break;
                        default:
                            $indicador_subunidad->id_usuario = $dato->id_responsable_medicion;
                    }
                    $indicador_subunidad->save();
                }
            }
        }
        // Si ha ido bien mostramos la ficha del dato 
        header("Location: index.php?page=dato_mostrar&id_dato=$dato->id&id_entidad=$id_entidad&aviso=$aviso");
    }
    else
    {
        // Error de grabación en la base de datos
        $error = ERR_DATO_GRABAR;
        header("Location: index.php?page=dato_listar&id_entidad=$id_entidad&error=$error");
    }
}
else
{
    // Avisamos de error por falta de parámetros
    $error = ERR_PARAM;
    header("Location: index.php?page=dato_listar&id_entidad=$id_entidad&error=$error");
}

