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
                    actualizar_mediciones($indicador);
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

//-----------------------------------------------------------------------------
// FUNCIONES PARA ACTUALIZAR LAS UNIDADES EN LAS QUE SE MIDE UN INDICADOR/DATO
//------------------------------------------------------------------------------
// Genera un valor en blanco para cada una de las unidades asociadas 
// al Indicador/Dato 
function actualizar_mediciones($indicador)
{
    //Año y fecha actuales
    $anyo = date('Y');
    $fecha = date('Y-m-d');
    //Periodicidad Anual
    if ($indicador->periodicidad == 'Anual')
    {
        $mediciones_actualizables = actualizar_mediciones_anuales($indicador, $anyo);
    }
    //Periodicidad Semestral
    else if ($indicador->periodicidad == 'Semestral')
    {
        $mediciones_actualizables = actualizar_mediciones_semestrales($indicador, $anyo, $fecha);
    }
    //Periodicidad Cuatrimestral
    else if ($indicador->periodicidad == 'Cuatrimestral')
    {
        $mediciones_actualizables = actualizar_mediciones_cuatrimestrales($indicador, $anyo, $fecha);
    }
    //Periodicidad Trimestral
    else if ($indicador->periodicidad == 'Trimestral')
    {
        $mediciones_actualizables = actualizar_mediciones_trimestrales($indicador, $anyo, $fecha);
    }
    //Periodicidad mensual
    else
    {
        $mediciones_actualizables = actualizar_mediciones_mensuales($indicador, $anyo, $fecha);
    }
    foreach ($mediciones_actualizables as $medicion)
    {
        //Borramos todos los valores de las mediciones a actualizar
        borrar_valores_medicion($medicion->id);
        //Generamos valores nulos
        generar_valores_medicion($medicion);
    }
}

//Devuelve las mediciones a actualizar en un Indicador/Dato con periodicidad 
//anual para el año que recibe como parámetro
function actualizar_mediciones_anuales($indicador, $anyo)
{
    $medicion = new Medicion();
    return $medicion->Find("id_indicador=$indicador->id AND etiqueta LIKE '$anyo'");
}

//Devuelve las mediciones a actualizar en un Indicador/Dato con periodicidad 
//semestral en el año que recibe como parámetro y en función de la fecha que 
//también recibe como parámetro
function actualizar_mediciones_semestrales($indicador, $anyo, $fecha)
{
    $medicion = new Medicion();
    //Estamos en el segundo Semestre
    if ($fecha > $anyo . "-06-30")
    {
        return $medicion->Find("id_indicador=$indicador->id AND etiqueta LIKE '$anyo.2S'");
    }
    //Estamos en el primer Semestre
    else
    {
        return $medicion->Find("id_indicador=$indicador->id AND etiqueta LIKE '$anyo%'");
    }
}

//Devuelve las mediciones a actualizar en un Indicador/Dato con periodicidad 
//cuatrimestral en el año que recibe como parámetro y en función de la fecha que 
//también recibe como parámetro
function actualizar_mediciones_cuatrimestrales($indicador, $anyo, $fecha)
{
    $medicion = new Medicion();
    //Estamos en el primer Cuatrimestre
    if ($fecha < $anyo . "-05-01")
    {
        return $medicion->Find("id_indicador=$indicador->id AND etiqueta LIKE '$anyo%'");
    }
    //Estamos en el segundo Cuatrimestre
    else if ($fecha >= $anyo . "-05-01" && $fecha < $anyo . "-09-01")
    {
        return $medicion->Find("id_indicador=$indicador->id AND (etiqueta LIKE '$anyo.2C' "
                        . "OR etiqueta LIKE '$anyo.3C')");
    }
    //Estamos en el tercer Cuatrimestre
    else
    {
        return $medicion->Find("id_indicador=$indicador->id AND etiqueta LIKE '$anyo.3C'");
    }
}

//Devuelve las mediciones a actualizar en un Indicador/Dato con periodicidad 
//trimestral en el año que recibe como parámetro y en función de la fecha que 
//también recibe como parámetro
function actualizar_mediciones_trimestrales($indicador, $anyo, $fecha)
{
    $medicion = new Medicion();
    //Estamos en el primer Trimestre
    if ($fecha < $anyo . "-04-01")
    {
        return $medicion->Find("id_indicador=$indicador->id AND etiqueta LIKE '$anyo%'");
    }
    //Estamos en el segundo Trimestre
    else if (fecha >= $anyo . "-04-01" && $fecha < $anyo . "-07-01")
    {
        return $medicion->Find("id_indicador=$indicador->id AND (etiqueta LIKE '$anyo.2T' "
                        . "OR etiqueta LIKE '$anyo.3T' "
                        . "OR etiqueta LIKE '$anyo.4T')");
    }
    //Estamos en el tercer Trimestre
    else if (fecha >= $anyo . "-07-01" && $fecha < $anyo . "-10-01")
    {
        return $medicion->Find("id_indicador=$indicador->id AND (etiqueta LIKE '$anyo.3T' "
                        . "OR etiqueta LIKE '$anyo.4T')");
    }
    //Estamos en el cuarto Trimestre
    else
    {
        return $medicion->Find("id_indicador=$indicador->id AND etiqueta LIKE '$anyo.4T'");
    }
}

//Devuelve las mediciones a actualizar en un Indicador/Dato con periodicidad 
//mensual en el año que recibe como parámetro y en función de la fecha que 
//también recibe como parámetro
function actualizar_mediciones_mensuales($indicador, $anyo, $fecha)
{
    $medicion = new Medicion();
    //Estamos en Enero
    if ($fecha < $anyo . "-02-01")
    {
        return $medicion->Find("id_indicador=$indicador->id AND etiqueta LIKE '$anyo%'");
    }
    //Estamos en Febrero
    else if (fecha >= $anyo . "-02-01" && $fecha < $anyo . "-03-01")
    {
        return $medicion->Find("id_indicador=$indicador->id AND (etiqueta LIKE '$anyo.02' "
                        . "OR etiqueta LIKE '$anyo.03' "
                        . "OR etiqueta LIKE '$anyo.04'"
                        . "OR etiqueta LIKE '$anyo.05'"
                        . "OR etiqueta LIKE '$anyo.06'"
                        . "OR etiqueta LIKE '$anyo.07'"
                        . "OR etiqueta LIKE '$anyo.08'"
                        . "OR etiqueta LIKE '$anyo.09'"
                        . "OR etiqueta LIKE '$anyo.10'"
                        . "OR etiqueta LIKE '$anyo.11'"
                        . "OR etiqueta LIKE '$anyo.12')");
    }
    //Estamos en Marzo
    else if (fecha >= $anyo . "-03-01" && $fecha < $anyo . "-04-01")
    {
        return $medicion->Find("id_indicador=$indicador->id AND (etiqueta LIKE '$anyo.03' "
                        . "OR etiqueta LIKE '$anyo.04'"
                        . "OR etiqueta LIKE '$anyo.05'"
                        . "OR etiqueta LIKE '$anyo.06'"
                        . "OR etiqueta LIKE '$anyo.07'"
                        . "OR etiqueta LIKE '$anyo.08'"
                        . "OR etiqueta LIKE '$anyo.09'"
                        . "OR etiqueta LIKE '$anyo.10'"
                        . "OR etiqueta LIKE '$anyo.11'"
                        . "OR etiqueta LIKE '$anyo.12')");
    }
    //Estamos en Abril
    else if (fecha >= $anyo . "-04-01" && $fecha < $anyo . "-05-01")
    {
        return $medicion->Find("id_indicador=$indicador->id AND (etiqueta LIKE '$anyo.04' "
                        . "OR etiqueta LIKE '$anyo.05'"
                        . "OR etiqueta LIKE '$anyo.06'"
                        . "OR etiqueta LIKE '$anyo.07'"
                        . "OR etiqueta LIKE '$anyo.08'"
                        . "OR etiqueta LIKE '$anyo.09'"
                        . "OR etiqueta LIKE '$anyo.10'"
                        . "OR etiqueta LIKE '$anyo.11'"
                        . "OR etiqueta LIKE '$anyo.12')");
    }
    //Estamos en Mayo
    else if (fecha >= $anyo . "-05-01" && $fecha < $anyo . "-06-01")
    {
        return $medicion->Find("id_indicador=$indicador->id AND (etiqueta LIKE '$anyo.05' "
                        . "OR etiqueta LIKE '$anyo.06'"
                        . "OR etiqueta LIKE '$anyo.07'"
                        . "OR etiqueta LIKE '$anyo.08'"
                        . "OR etiqueta LIKE '$anyo.09'"
                        . "OR etiqueta LIKE '$anyo.10'"
                        . "OR etiqueta LIKE '$anyo.11'"
                        . "OR etiqueta LIKE '$anyo.12')");
    }
    //Estamos en Junio
    else if (fecha >= $anyo . "-06-01" && $fecha < $anyo . "-07-01")
    {
        return $medicion->Find("id_indicador=$indicador->id AND (etiqueta LIKE '$anyo.06' "
                        . "OR etiqueta LIKE '$anyo.07'"
                        . "OR etiqueta LIKE '$anyo.08'"
                        . "OR etiqueta LIKE '$anyo.09'"
                        . "OR etiqueta LIKE '$anyo.10'"
                        . "OR etiqueta LIKE '$anyo.11'"
                        . "OR etiqueta LIKE '$anyo.12')");
    }
    //Estamos en Julio
    else if (fecha >= $anyo . "-07-01" && $fecha < $anyo . "-08-01")
    {
        return $medicion->Find("id_indicador=$indicador->id AND (etiqueta LIKE '$anyo.07' "
                        . "OR etiqueta LIKE '$anyo.08'"
                        . "OR etiqueta LIKE '$anyo.09'"
                        . "OR etiqueta LIKE '$anyo.10'"
                        . "OR etiqueta LIKE '$anyo.11'"
                        . "OR etiqueta LIKE '$anyo.12')");
    }
    //Estamos en Agosto
    else if (fecha >= $anyo . "-08-01" && $fecha < $anyo . "-09-01")
    {
        return $medicion->Find("id_indicador=$indicador->id AND (etiqueta LIKE '$anyo.08' "
                        . "OR etiqueta LIKE '$anyo.09'"
                        . "OR etiqueta LIKE '$anyo.10'"
                        . "OR etiqueta LIKE '$anyo.11'"
                        . "OR etiqueta LIKE '$anyo.12')");
    }
    //Estamos en Septiembre
    else if (fecha >= $anyo . "-09-01" && $fecha < $anyo . "-10-01")
    {
        return $medicion->Find("id_indicador=$indicador->id AND (etiqueta LIKE '$anyo.09' "
                        . "OR etiqueta LIKE '$anyo.10'"
                        . "OR etiqueta LIKE '$anyo.11'"
                        . "OR etiqueta LIKE '$anyo.12')");
    }
    //Estamos en Octubre
    else if (fecha >= $anyo . "-10-01" && $fecha < $anyo . "-11-01")
    {
        return $medicion->Find("id_indicador=$indicador->id AND (etiqueta LIKE '$anyo.10' "
                        . "OR etiqueta LIKE '$anyo.11'"
                        . "OR etiqueta LIKE '$anyo.12')");
    }
    //Estamos en Noviembre
    else if (fecha >= $anyo . "-11-01" && $fecha < $anyo . "-12-01")
    {
        return $medicion->Find("id_indicador=$indicador->id AND (etiqueta LIKE '$anyo.11' "
                        . "OR etiqueta LIKE '$anyo.12')");
    }
    //Estamos en Diciembre
    else
    {
        return $medicion->Find("id_indicador=$indicador->id AND etiqueta LIKE '$anyo.12'");
    }
}

//Borra todos los valores de la medición cuyo identificador recibe 
//como parámetro
function borrar_valores_medicion($id)
{
    $valor = new Valor();
    $valores_borrar = $valor->Find("id_medicion=$id");
    foreach ($valores_borrar as $valor_borrar)
    {
        $valor->Load("id=$valor_borrar->id");
        $valor->Delete();
    }
}

// Genera un valor en blanco para cada una de las unidades asociadas 
// al Indicador/Dato en la medición dada
function generar_valores_medicion($medicion)
{
    $indicador_subunidad = new Indicador_subunidad();
    $indicadores_subunidades = $indicador_subunidad->Find("id_indicador = $medicion->id_indicador");
    foreach ($indicadores_subunidades as $indicador_subunidad)
    {
        $valor = new Valor();
        $valor->id_entidad = $indicador_subunidad->id_entidad;
        $valor->id_medicion = $medicion->id;
        $valor->activo = 1;
        $valor->save();
    }
}
