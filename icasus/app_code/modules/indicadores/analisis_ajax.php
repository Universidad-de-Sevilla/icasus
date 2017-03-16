<?php

//------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: analisis_ajax.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//------------------------------------------------------------------------------
// Gestiona los analisis de un indicador
//------------------------------------------------------------------------------

global $smarty;
global $usuario;
global $plantilla;
//Variable para operar con Procesos
$logicaProceso = new LogicaProceso();

$modulo = filter_input(INPUT_GET, 'modulo', FILTER_SANITIZE_STRING);
$smarty->assign('modulo', $modulo);

$id_indicador = filter_input(INPUT_GET, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
$indicador = new Indicador();
$indicador->load_joined("id=$id_indicador");
$smarty->assign('indicador', $indicador);

//Permisos del proceso
$permiso_proceso = $logicaProceso->comprobar_responsable_proceso($usuario->id, $indicador->proceso);

//Responsables
$responsable = false;
if ($indicador->id_responsable == $usuario->id || $permiso_proceso)
{
    $responsable = true;
}
$smarty->assign('responsable', $responsable);

$anyo = filter_input(INPUT_GET, 'anyo', FILTER_SANITIZE_NUMBER_INT);
$smarty->assign('anyo', $anyo);

//Recuperamos el análisis del indicador
$analisis = new Analisis();
$analisis->load("id_indicador=$id_indicador AND anyo=$anyo");
$smarty->assign('analisis_actual', $analisis);
$plantilla = 'indicadores/analisis_ajax.tpl';

if ($modulo === 'actualizar_tabla')
{
    //Tabla de análisis y planes
    $lista_analisis = $analisis->find("id_indicador=$id_indicador");
    $smarty->assign('lista_analisis', $lista_analisis);
}

if ($modulo === 'grabar_analisis')
{
    $analisis->id_indicador = $id_indicador;
    $analisis->anyo = $anyo;
    $analisis->analisis = filter_input(INPUT_POST, 'texto', FILTER_SANITIZE_STRING);
    $analisis->Save();
}

if ($modulo == 'grabar_plan')
{
    $analisis->id_indicador = $id_indicador;
    $analisis->anyo = $anyo;
    $analisis->plan_accion = filter_input(INPUT_POST, 'texto', FILTER_SANITIZE_STRING);
    $analisis->Save();
}

if ($modulo == 'grafica')
{
    //Calculamos los años para los que existen mediciones a fin de 
    //ajustar la gráfica
    $medicion = new Medicion();
    $years = $medicion->find_year_mediciones($id_indicador);
    for ($i = 0; $i < count($years); $i++)
    {
        if (strtok($years[$i]->periodo_fin, '-') == $anyo)
        {
            $posicion = $i;
            break;
        }
    }
    if ($posicion - 4 >= 0)
    {
        $anio_inicio = strtok($years[$posicion - 4]->periodo_inicio, '-');
    }
    else
    {
        $anio_inicio = strtok($years[0]->periodo_inicio, '-');
    }
    $anio_fin = $anyo;

    //Simplemente ver si hay mediciones
    $mediciones = $medicion->Find("id_indicador = $id_indicador AND periodo_inicio >= '$anio_inicio-01-01' AND periodo_fin <= '$anio_fin-12-31' ORDER BY periodo_inicio");
    $grafica_historico = false;
    if ($mediciones)
    {
        //Comprobamos si hay valores para pintar el gráfico con el histórico
        $valor = new Valor();
        $val_ref_medicion = new Valor_referencia_medicion();
        $num_mediciones = count($mediciones);
        $i = 0;
        while (!$grafica_historico && $i != $num_mediciones)
        {
            $med = $mediciones[$i];
            $valores = $valor->Find("id_medicion=$med->id");
            $valores_referencia = $val_ref_medicion->Find("id_medicion=$med->id");
            //Valores
            foreach ($valores as $val)
            {
                if ($val->valor != null)
                {
                    $grafica_historico = true;
                    break;
                }
            }
            //Valores de referencia
            foreach ($valores_referencia as $val)
            {
                if ($val->valor != null)
                {
                    $grafica_historico = true;
                    break;
                }
            }
            $i++;
        }

        //Prepara el panel
        $panel = new Panel();
        $panel->ancho = 6;
        $panel->id = 1;
        $panel->nombre = TXT_HISTORICO;
        $panel->fecha_inicio = $anio_inicio . "-01-01";
        $panel->fecha_fin = $anio_fin . "-12-31";
        $panel->periodicidad = "anual";
        if ($indicador->periodicidad == "Bienal")
        {
            $panel->periodicidad = "bienal";
        }
        $smarty->assign("panel", $panel);
    }
    $smarty->assign("grafica_historico", $grafica_historico);
}
