<?php

//------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: medicion_grabar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//------------------------------------------------------------------------------
// Graba una nueva medición de un indicador
//------------------------------------------------------------------------------

global $smarty;
global $usuario;
global $plantilla;

//datos periodo
$periodo_inicio = filter_input(INPUT_POST, 'piYear', FILTER_SANITIZE_NUMBER_INT) . "-" . filter_input(INPUT_POST, 'piMonth', FILTER_SANITIZE_NUMBER_INT) . "-" . filter_input(INPUT_POST, 'piDay', FILTER_SANITIZE_NUMBER_INT);
$periodo_fin = filter_input(INPUT_POST, 'pfYear', FILTER_SANITIZE_NUMBER_INT) . "-" . filter_input(INPUT_POST, 'pfMonth', FILTER_SANITIZE_NUMBER_INT) . "-" . filter_input(INPUT_POST, 'pfDay', FILTER_SANITIZE_NUMBER_INT);
$grabacion_inicio = filter_input(INPUT_POST, 'giYear', FILTER_SANITIZE_NUMBER_INT) . "-" . filter_input(INPUT_POST, 'giMonth', FILTER_SANITIZE_NUMBER_INT) . "-" . filter_input(INPUT_POST, 'giDay', FILTER_SANITIZE_NUMBER_INT);
$grabacion_fin = filter_input(INPUT_POST, 'gfYear', FILTER_SANITIZE_NUMBER_INT) . "-" . filter_input(INPUT_POST, 'gfMonth', FILTER_SANITIZE_NUMBER_INT) . "-" . filter_input(INPUT_POST, 'gfDay', FILTER_SANITIZE_NUMBER_INT);

if (filter_has_var(INPUT_POST, 'id_indicador')and filter_input(INPUT_POST, 'tipo')and $periodo_inicio and $periodo_fin and $grabacion_inicio and $grabacion_fin)
{
    $tipo = filter_input(INPUT_POST, 'tipo', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
    $medicion = new Medicion();

    $medicion->id_indicador = filter_input(INPUT_POST, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
    $medicion->periodo_inicio = $periodo_inicio;
    $medicion->periodo_fin = $periodo_fin;
    $medicion->grabacion_inicio = $grabacion_inicio;
    $medicion->grabacion_fin = $grabacion_fin;

    $medicion->etiqueta = filter_has_var(INPUT_POST, 'etiqueta') ? filter_input(INPUT_POST, 'etiqueta', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
    $medicion->observaciones = filter_has_var(INPUT_POST, 'observaciones') ? filter_input(INPUT_POST, 'observaciones', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : '';
    if ($medicion->save())
    {
        $post_array = filter_input_array(INPUT_POST);
        if (filter_has_var(INPUT_POST, 'valor_referencia'))
        {
            $valores_referencia = $post_array['valor_referencia'];

            foreach ($valores_referencia as $id_valor_referencia => $valor)
            {
                $valor_referencia_medicion = new Valor_referencia_medicion();

                $valor_referencia_medicion->id_valor_referencia = $id_valor_referencia;
                $valor_referencia_medicion->valor = $valor;
                $valor_referencia_medicion->id_medicion = $medicion->id;
                $valor_referencia_medicion->save();
            }
        }
        // Grabamos un valor en blanco a cada una de las unidades asociadas al indicador
        $indicador_subunidad = new Indicador_subunidad();
        $indicadores_subunidades = $indicador_subunidad->Find("id_indicador = $medicion->id_indicador");
        $numero_subunidades = count($indicadores_subunidades);
        foreach ($indicadores_subunidades as $indicador_subunidad)
        {
            $valor = new Valor();
            $valor->id_entidad = $indicador_subunidad->id_entidad;
            $valor->id_medicion = $medicion->id;
            $valor->activo = 1;
            $valor->save();
        }
        $exito = MSG_MED_CREADA . $numero_subunidades;
        header("location:index.php?page=medicion_listar&id_{$tipo}=$medicion->id_indicador&exito=$exito");
    }
    else
    {
        $error = ERR_MED_GRABAR;
        header("location:index.php?page=medicion_listar&id_{$tipo}=$medicion->id_indicador&error=$error");
    }
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?error=$error");
}
