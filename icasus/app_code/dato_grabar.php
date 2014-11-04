<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: dato_grabar.php
//---------------------------------------------------------------------------------------------------
// Graba un nuevo dato o actualiza uno existente
//---------------------------------------------------------------------------------------------------
global $usuario;
if (
        isset($_REQUEST['tipo_seleccion_responsable'])
        AND ! empty($_REQUEST["codigo"])
        AND ! empty($_REQUEST["nombre"])
        AND ! empty($_REQUEST["id_responsable"])
        AND ! empty($_REQUEST["id_responsable_medicion"])
        AND ! empty($_REQUEST["id_entidad"])
) {
    $dato = new indicador();
    if (isset($_REQUEST["id_dato"])) {
        $id_dato = sanitize($_REQUEST["id_dato"], INT);
        $dato->load("id = $id_dato");
        $es_dato_nuevo = false;
        // Preparamos el aviso para lanzarlo al final
        $aviso = "Se ha actualizado el dato";
    } else {
        $es_dato_nuevo = true;
        $aviso = "Se ha creado un nuevo dato";
    }
    // Campos obligatorios
    $dato->id_entidad = sanitize($_REQUEST['id_entidad'], INT);
    $dato->codigo = sanitize($_REQUEST['codigo'], SQL);
    $dato->nombre = sanitize($_REQUEST['nombre'], SQL);
    $dato->id_responsable = sanitize($_REQUEST["id_responsable"], INT);
    $dato->id_responsable_medicion = sanitize($_REQUEST["id_responsable_medicion"], INT);
    $dato->desagregado = sanitize($_REQUEST['tipo_seleccion_responsable'], INT);
    // Campos opcionales 
    $dato->id_visibilidad = isset($_REQUEST['id_visibilidad']) ? sanitize($_REQUEST['id_visibilidad'], SQL) : NULL;
    $dato->descripcion = isset($_REQUEST['descripcion']) ? sanitize($_REQUEST['descripcion'], SQL) : null;
    $dato->calculo = isset($_REQUEST['calculo']) ? sanitize($_REQUEST['calculo'], SQL) : null;
    $dato->periodicidad = isset($_REQUEST['periodicidad']) ? sanitize($_REQUEST['periodicidad'], SQL) : null;
    $dato->nivel_desagregacion = isset($_REQUEST['nivel_desagregacion']) ? sanitize($_REQUEST['nivel_desagregacion'], SQL) : null;
    $dato->id_tipo_agregacion = isset($_REQUEST['id_tipo_agregacion']) ? sanitize($_REQUEST['id_tipo_agregacion'], INT) : 0;
    $dato->fuente_datos = isset($_REQUEST['fuente_datos']) ? sanitize($_REQUEST['fuente_datos'], SQL) : null;
    $dato->historicos = isset($_REQUEST['historicos']) ? sanitize($_REQUEST['historicos'], SQL) : null;
    $dato->unidad_generadora = isset($_REQUEST['unidad_generadora']) ? sanitize($_REQUEST['unidad_generadora'], SQL) : null;
    $dato->indicadores_relacionados = isset($_REQUEST['indicadores_relacionados']) ? sanitize($_REQUEST['indicadores_relacionados'], SQL) : null;
    $dato->activo = 1;
    $dato->fecha_creacion = date("Y-m-d");

    // Una vez grabado el dato vamos a asignar a los responsables de medicion
    // Esto sólo se hace si se trata de un nuevo dato
    if ($dato->save()) {
        if ($es_dato_nuevo == true) {
            $subunidades = $_REQUEST["subunidades"];
            if (count($subunidades) > 0) {
                foreach ($subunidades as $subunidad) {
                    $indicador_subunidad = new indicador_subunidad();
                    $indicador_subunidad->id_indicador = $dato->id;
                    $indicador_subunidad->id_entidad = $subunidad;

                    // Comprueba si la medición va a ser centralizada o asignada a cada responsable de subunidad
                    // si es para cada responsable de subunidad, se le asigna como responsable de la medición
                    // el reponsable de la unidad. Si no exite este se le asigna como resposable de medición
                    // el responsable de medicion de la unidad superior.
                    if ($dato->desagregado == 0) {
                        $indicador_subunidad->id_usuario = $dato->id_responsable;
                    } else {
                        $usuario_entidad = new usuario_entidad();
                        if ($usuario_entidad->load("id_entidad = $subunidad AND id_rol = 1")) {
                            $indicador_subunidad->id_usuario = $usuario_entidad->id_usuario;
                        } else {
                            $indicador_subunidad->id_usuario = $dato->id_responsable;
                        }
                    }
                    $indicador_subunidad->save();
                }
            }
        } else {
            $indicador_subunidad = new indicador_subunidad();
            while ($indicador_subunidad->load("id_indicador = $id_dato")) {
                $indicador_subunidad->delete();
            }
            if (isset($_REQUEST["subunidades"])) {
                foreach ($_REQUEST["subunidades"] as $id_subunidad) {
                    $indicador_subunidad = new indicador_subunidad();
                    $indicador_subunidad->id_indicador = $id_dato;
                    $indicador_subunidad->id_entidad = $id_subunidad;
                    switch ($dato->desagregado) {
                        case 0:
                            $indicador_subunidad->id_usuario = $dato->id_responsable_medicion;
                            break;
                        case 1:
                            $usuario_entidad = new usuario_entidad();
                            // Cargamos al responsable de la unidad para echarle el muerto 
                            // Luego el podrá echárselo a otro
                            if ($usuario_entidad->load("id_entidad = $id_subunidad AND id_rol = 1")) {
                                $indicador_subunidad->id_usuario = $usuario_entidad->id_usuario;
                            } else {
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
    } else {
        // Error de grabación en la base de datos
        $error = ERR_GRABAR;
        header("Location: index.php?page=dato_listar&id_entidad=$id_entidad&error=$error");
    }
} else {
    // Avisamos de error por falta de parametros
    $error = ERR_PARAM;
    header("Location: index.php?page=dato_listar&id_entidad=$id_entidad&error=$error");
}

