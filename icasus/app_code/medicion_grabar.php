<?php

//------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: medicion_grabar.php
//------------------------------------------------------------------------------
// Graba una nueva medición de un indicador
//------------------------------------------------------------------------------
global $smarty;
global $usuario;
global $plantilla;

//datos periodo
//$periodo_inicio = sanitize($_REQUEST["piYear"], INT) . "-" . sanitize($_REQUEST["piMonth"], INT) . "-" . sanitize($_REQUEST["piDay"], INT);
$periodo_inicio = filter_input(INPUT_POST, 'piYear', FILTER_SANITIZE_NUMBER_INT) . "-" . filter_input(INPUT_POST, 'piMonth', FILTER_SANITIZE_NUMBER_INT) . "-" . filter_input(INPUT_POST, 'piDay', FILTER_SANITIZE_NUMBER_INT);
//$periodo_fin = sanitize($_REQUEST["pfYear"], INT) . "-" . sanitize($_REQUEST["pfMonth"], INT) . "-" . sanitize($_REQUEST["pfDay"], INT);
$periodo_fin = filter_input(INPUT_POST, 'pfYear', FILTER_SANITIZE_NUMBER_INT) . "-" . filter_input(INPUT_POST, 'pfMonth', FILTER_SANITIZE_NUMBER_INT) . "-" . filter_input(INPUT_POST, 'pfDay', FILTER_SANITIZE_NUMBER_INT);
//$grabacion_inicio = sanitize($_REQUEST["giYear"], INT) . "-" . sanitize($_REQUEST["giMonth"], INT) . "-" . sanitize($_REQUEST["giDay"], INT);
$grabacion_inicio = filter_input(INPUT_POST, 'giYear', FILTER_SANITIZE_NUMBER_INT) . "-" . filter_input(INPUT_POST, 'giMonth', FILTER_SANITIZE_NUMBER_INT) . "-" . filter_input(INPUT_POST, 'giDay', FILTER_SANITIZE_NUMBER_INT);
//$grabacion_fin = sanitize($_REQUEST["gfYear"], INT) . "-" . sanitize($_REQUEST["gfMonth"], INT) . "-" . sanitize($_REQUEST["gfDay"], INT);
$grabacion_fin = filter_input(INPUT_POST, 'gfYear', FILTER_SANITIZE_NUMBER_INT) . "-" . filter_input(INPUT_POST, 'gfMonth', FILTER_SANITIZE_NUMBER_INT) . "-" . filter_input(INPUT_POST, 'gfDay', FILTER_SANITIZE_NUMBER_INT);

//if (isset($_REQUEST["id_indicador"], $_REQUEST["tipo"], $periodo_inicio, $periodo_fin, $grabacion_inicio, $grabacion_fin))
if (filter_has_var(INPUT_POST, 'id_indicador')and filter_input(INPUT_POST, 'tipo')and $periodo_inicio and $periodo_fin and $grabacion_inicio and $grabacion_fin)
{
//    $tipo = sanitize($_REQUEST["tipo"], SQL);
    $tipo = filter_input(INPUT_POST, 'tipo', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
    $medicion = new Medicion();
//    $medicion->id_indicador = sanitize($_REQUEST["id_indicador"], INT);
    $medicion->id_indicador = filter_input(INPUT_POST, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
    $medicion->periodo_inicio = $periodo_inicio;
    $medicion->periodo_fin = $periodo_fin;
    $medicion->grabacion_inicio = $grabacion_inicio;
    $medicion->grabacion_fin = $grabacion_fin;
//    $medicion->etiqueta = empty($_REQUEST["etiqueta"]) ? null : sanitize($_REQUEST["etiqueta"], SQL);
    $medicion->etiqueta = filter_has_var(INPUT_POST, 'etiqueta') ? filter_input(INPUT_POST, 'etiqueta', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")) : null;
    if ($medicion->save())
    {
//        if (isset($_REQUEST["valor_referencia"]))
        if (filter_has_var(INPUT_POST, 'valor_referencia'))
        {
            $valores_referencia = filter_input(INPUT_POST, 'valor_referencia');
//            foreach ($_REQUEST["valor_referencia"] as $id_valor_referencia => $valor)
            foreach ($valores_referencia as $id_valor_referencia => $valor)
            {
                $valor_referencia_medicion = new Valor_referencia_medicion();
//        $valor_referencia_medicion->load("id = $id_valor_referencia");
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
        $aviso = MSG_MED_CREADA . $numero_subunidades;
        header("location:index.php?page=medicion_listar&id_{$tipo}=$medicion->id_indicador&aviso=$aviso");
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
