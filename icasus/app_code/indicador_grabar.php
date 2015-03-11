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
//if (
//        !empty($_REQUEST["codigo"])
//        AND ! empty($_REQUEST["nombre"])
//        AND ! empty($_REQUEST["id_responsable"])
//        AND ! empty($_REQUEST["id_responsable_medicion"])
//        AND ! empty($_REQUEST["formulacion"])
//        AND ! empty($_REQUEST["id_proceso"])
//        AND ! empty($_REQUEST["id_entidad"])
//        AND isset($_REQUEST["tipo_seleccion_responsable"])
//)
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
//    if (isset($_REQUEST["id_indicador"]))
    if (filter_has_var(INPUT_GET, 'id_indicador'))
    {
//        $id_indicador = sanitize($_REQUEST["id_indicador"], INT);
        $id_indicador = filter_input(INPUT_GET, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
        $indicador->load("id = $id_indicador");
        $aviso = MSG_INDIC_ACTUALIZADO;
    }
    else
    {
        $aviso = MSG_INDIC_CREADO;
        $indicador->activo = 1;
    }
    // Campos obligatorios
//    $indicador->id_proceso = sanitize($_REQUEST['id_proceso'], INT);
    $indicador->id_proceso = filter_input(INPUT_POST, 'id_proceso', FILTER_SANITIZE_NUMBER_INT);
//    $indicador->id_responsable = sanitize($_REQUEST['id_responsable'], INT);
    $indicador->id_responsable = filter_input(INPUT_POST, 'id_responsable', FILTER_SANITIZE_NUMBER_INT);
//    $indicador->id_responsable_medicion = sanitize($_REQUEST['id_responsable_medicion'], INT);
    $indicador->id_responsable_medicion = filter_input(INPUT_POST, 'id_responsable_medicion', FILTER_SANITIZE_NUMBER_INT);
//    $indicador->id_entidad = sanitize($_REQUEST['id_entidad'], INT);
    $indicador->id_entidad = filter_input(INPUT_POST, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
//    $indicador->codigo = sanitize($_REQUEST['codigo'], SQL);
    $indicador->codigo = filter_input(INPUT_POST, 'codigo', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
//    $indicador->nombre = sanitize($_REQUEST['nombre'], SQL);
    $indicador->nombre = filter_input(INPUT_POST, 'nombre', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
//    $indicador->formulacion = sanitize($_REQUEST['formulacion'], SQL);
    $indicador->formulacion = filter_input(INPUT_POST, 'formulacion', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
//    $indicador->id_visibilidad = sanitize($_REQUEST['id_visibilidad'], SQL);
    $indicador->id_visibilidad = filter_input(INPUT_POST, 'id_visibilidad', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
//    $tipo_seleccion_responsable = $_REQUEST["tipo_seleccion_responsable"];
    $tipo_seleccion_responsable = filter_input(INPUT_POST, 'tipo_seleccion_responsable');
    // Campos opcionales 
//    $indicador->descripcion = isset($_REQUEST['descripcion']) ? sanitize($_REQUEST['descripcion'], SQL) : null;
    $indicador->descripcion = filter_has_var(INPUT_POST, 'descripcion') ? filter_input(INPUT_POST, 'descripcion', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
//    $indicador->periodicidad = isset($_REQUEST['periodicidad']) ? sanitize($_REQUEST['periodicidad'], SQL) : null;
    $indicador->periodicidad = filter_has_var(INPUT_POST, 'periodicidad') ? filter_input(INPUT_POST, 'periodicidad', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
//    $indicador->calculo = isset($_REQUEST['calculo']) ? sanitize($_REQUEST['calculo'], SQL) : null;
    $indicador->calculo = filter_has_var(INPUT_POST, 'calculo') ? filter_input(INPUT_POST, 'calculo', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
//    $indicador->fuente_informacion = isset($_REQUEST['fuente_informacion']) ? sanitize($_REQUEST['fuente_informacion'], SQL) : null;
    $indicador->fuente_informacion = filter_has_var(INPUT_POST, 'fuente_informacion') ? filter_input(INPUT_POST, 'fuente_informacion', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
//    $indicador->nivel_desagregacion = isset($_REQUEST['nivel_desagregacion']) ? sanitize($_REQUEST['nivel_desagregacion'], SQL) : null;
    $indicador->nivel_desagregacion = filter_has_var(INPUT_POST, 'nivel_desagregacion') ? filter_input(INPUT_POST, 'nivel_desagregacion', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
//    $indicador->fuente_datos = isset($_REQUEST['fuente_datos']) ? sanitize($_REQUEST['fuente_datos'], SQL) : null;
    $indicador->fuente_datos = filter_has_var(INPUT_POST, 'fuente_datos') ? filter_input(INPUT_POST, 'fuente_datos', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
//    $indicador->desagregado = isset($_REQUEST['tipo_seleccion_responsable']) ? sanitize($_REQUEST['tipo_seleccion_responsable'], SQL) : null;
    $indicador->desagregado = filter_has_var(INPUT_POST, 'tipo_seleccion_responsable') ? filter_input(INPUT_POST, 'tipo_seleccion_responsable', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
//    $indicador->evidencia = isset($_REQUEST['evidencia']) ? sanitize($_REQUEST['evidencia'], SQL) : null;
    $indicador->evidencia = filter_has_var(INPUT_POST, 'evidencia') ? filter_input(INPUT_POST, 'evidencia', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
//    $indicador->historicos = isset($_REQUEST['historicos']) ? sanitize($_REQUEST['historicos'], SQL) : null;
    $indicador->historicos = filter_has_var(INPUT_POST, 'historicos') ? filter_input(INPUT_POST, 'historicos', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
//    $indicador->unidad_generadora = isset($_REQUEST['unidad_generadora']) ? sanitize($_REQUEST['unidad_generadora'], SQL) : null;
    $indicador->unidad_generadora = filter_has_var(INPUT_POST, 'unidad_generadora') ? filter_input(INPUT_POST, 'unidad_generadora', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
//    $indicador->interpretacion = isset($_REQUEST['interpretacion']) ? sanitize($_REQUEST['interpretacion'], SQL) : null;
    $indicador->interpretacion = filter_has_var(INPUT_POST, 'interpretacion') ? filter_input(INPUT_POST, 'interpretacion', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
//    $indicador->indicadores_relacionados = isset($_REQUEST['indicadores_relacionados']) ? sanitize($_REQUEST['indicadores_relacionados'], SQL) : null;
    $indicador->indicadores_relacionados = filter_has_var(INPUT_POST, 'indicadores_relacionados') ? filter_input(INPUT_POST, 'indicadores_relacionados', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
//    $indicador->id_tipo_agregacion = isset($_REQUEST['id_tipo_agregacion']) ? sanitize($_REQUEST['id_tipo_agregacion'], INT) : 0;
    $indicador->id_tipo_agregacion = filter_has_var(INPUT_POST, 'id_tipo_agregacion') ? filter_input(INPUT_POST, 'indicadores_relacionados', FILTER_SANITIZE_NUMBER_INT) : 0;
    $indicador->fecha_creacion = date("Y-m-d");
    if ($indicador->save())
    {
        // Si el indicador es nuevo grabamos subunidades
        if (!isset($id_indicador))
        {
//            $subunidades = isset($_REQUEST["subunidades"]) ? $_REQUEST["subunidades"] : array();
            $post_array = filter_input_array(INPUT_POST);
//            $subunidades = filter_has_var(INPUT_POST, 'subunidades') ? filter_input(INPUT_POST, 'subunidades') : array();
            $subunidades = filter_has_var(INPUT_POST, 'subunidades') ? $post_array['subunidades'] : array();
            if (count($subunidades) > 0)
            {
                foreach ($subunidades as $subunidad)
                {
                    $indicador_subunidad = new Indicador_subunidad();
                    $indicador_subunidad->id_indicador = $indicador->id;
//                    $indicador_subunidad->id_entidad = $subunidad;
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
//            if (isset($_REQUEST["criterios_efqm"]))
            if (filter_has_var(INPUT_POST, 'criterios_efqm'))
            {
                // Grabamos los criterios EFQM en los que este indicador influye (pueden ser uno o dos)
                $post_array = filter_input_array(INPUT_POST);
//                $criterios_efqm = filter_input(INPUT_POST, 'criterios_efqm');
                $criterios_efqm = $post_array['criterios_efqm'];
//                   foreach ($_REQUEST["criterios_efqm"] as $id_criterio_efqm)
                foreach ($criterios_efqm as $id_criterio_efqm)
                {
                    $criterio_efqm_indicador = new Criterio_efqm_indicador();
                    $criterio_efqm_indicador->id_indicador = $indicador->id;
//                    $criterio_efqm_indicador->id_criterio_efqm = $id_criterio_efqm;
                    $criterio_efqm_indicador->id_criterio_efqm = filter_var($id_criterio_efqm, FILTER_SANITIZE_NUMBER_INT);
                    $criterio_efqm_indicador->save();
                }
            }
        }
        else
        {
            // Si el indicador ya existía hay que currarselo de otra forma
            //Primero borramos los existentes ¿no habrá otra forma más elegante?
            $criterio_efqm_indicador = new Criterio_efqm_indicador();
            while ($criterio_efqm_indicador->load("id_indicador = $indicador->id"))
            {
                $criterio_efqm_indicador->delete();
            }
            // Ahora damos de alta los que vienen en el formulario
//            if (isset($_REQUEST["criterios_efqm"]))
            if (filter_has_var(INPUT_POST, 'criterios_efqm'))
            {
                $post_array = filter_input_array(INPUT_POST);
                // Grabamos los criterios EFQM en los que este indicador influye (pueden ser uno o dos)
//                $criterios_efqm = filter_input(INPUT_POST, 'criterios_efqm');
                $criterios_efqm = $post_array['criterios_efqm'];
//                     foreach ($_REQUEST["criterios_efqm"] as $id_criterio_efqm)
                foreach ($criterios_efqm as $id_criterio_efqm)
                {
                    $criterio_efqm_indicador = new Criterio_efqm_indicador();
                    $criterio_efqm_indicador->id_indicador = $indicador->id;
//                    $criterio_efqm_indicador->id_criterio_efqm = $id_criterio_efqm;
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
//            if (isset($_REQUEST["subunidades"]))
            if (filter_has_var(INPUT_POST, 'subunidades'))
            {
                $post_array = filter_input_array(INPUT_POST);
//                $subunidades = filter_input(INPUT_POST, 'subunidades');
                $subunidades = $post_array['subunidades'];
//                foreach ($_REQUEST["subunidades"] as $id_subunidad)
                foreach ($subunidades as $id_subunidad)
                {
                    $indicador_subunidad = new Indicador_subunidad();
                    $indicador_subunidad->id_indicador = $id_indicador;
//                    $indicador_subunidad->id_entidad = $id_subunidad;
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

