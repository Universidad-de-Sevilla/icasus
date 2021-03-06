<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: indicadores/valores_ajax.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Muestra un listado de las mediciones establecidas para un indicador
//---------------------------------------------------------------------------------------------------

global $smarty;
global $usuario;
global $plantilla;
//Variable para operar con Procesos
$logicaProceso = new LogicaProceso();
//Variable para operar con Indicadores/Datos
$logicaIndicador = new LogicaIndicador();

$modulo = filter_input(INPUT_GET, 'modulo', FILTER_SANITIZE_STRING);

$id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
$entidad = new Entidad();
$entidad->load("id = $id_entidad");
$smarty->assign('entidad', $entidad);

$id_indicador = filter_input(INPUT_GET, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
$indicador = new Indicador();
$indicador->load_joined("id = $id_indicador");
$smarty->assign('indicador', $indicador);

$inicio = filter_input(INPUT_GET, 'inicio', FILTER_SANITIZE_NUMBER_INT);

$fin = filter_input(INPUT_GET, 'fin', FILTER_SANITIZE_NUMBER_INT);

$id_medicion = filter_input(INPUT_GET, 'id_medicion', FILTER_SANITIZE_NUMBER_INT);

$id_subunidad = filter_input(INPUT_GET, 'id_subunidad', FILTER_SANITIZE_NUMBER_INT);

$activo = filter_input(INPUT_GET, 'activo', FILTER_SANITIZE_NUMBER_INT);

//Permisos del proceso
$permiso_proceso = $logicaProceso->comprobar_responsable_proceso($usuario->id, $indicador->proceso);
$smarty->assign('permiso_proceso', $permiso_proceso);

if (isset($id_indicador) AND isset($modulo) AND isset($id_entidad))
{
    if ($control || $indicador->id_responsable == $usuario->id || $permiso_proceso)
    {
        switch ($modulo)
        {
            case 'actualizar_dato':

                $id_valor = filter_input(INPUT_GET, 'id_valor', FILTER_SANITIZE_NUMBER_INT);
                $value = null;
                if (filter_has_var(INPUT_GET, 'valor'))
                {
                    $value = filter_input(INPUT_GET, 'valor', FILTER_VALIDATE_FLOAT);
                }
                $valor = new Valor();
                $valor->Load("id = $id_valor");
                $valor->id_usuario = $usuario->id;
                $valor->valor = $value;
                $valor->valor_parcial = $value;
                $valor->fecha_recogida = date("Y-m-j");
                $valor->save();
                //Chequeamos indicadores dependientes para el cálculo automático
                $medicion = new Medicion();
                $medicion->load("id=$valor->id_medicion");
                $logicaIndicador->actualizar_valor_indicadores_calculados($medicion->id_indicador, $medicion->etiqueta, $valor->id_entidad);
                break;

            case 'asignar_una_medicion':

                $valor = new Valor();
                if (!$valor->load("id_medicion = $id_medicion AND id_entidad = $id_subunidad"))
                {
                    $valor->id_medicion = $id_medicion;
                    $valor->id_entidad = $id_subunidad;
                    $valor->activo = $activo;
                    $valor->save();
                }

                $medicion = new Medicion();
                $cabeceras = $medicion->mediciones_periodos($id_indicador, $inicio, $fin);
                $subunidades_mediciones = $entidad->find_subunidades_mediciones_periodos($id_indicador, $id_entidad, $inicio, $fin);

                break;

            case 'activar_uno':

                $valor = new Valor();
                $valor->load("id_medicion = $id_medicion AND id_entidad = $id_subunidad");
                $valor->activo = $activo;
                $valor->save();

                $medicion = new Medicion();
                $cabeceras = $medicion->mediciones_periodos($id_indicador, $inicio, $fin);
                $subunidades_mediciones = $entidad->find_subunidades_mediciones_periodos($id_indicador, $id_entidad, $inicio, $fin);

                break;

            case 'mostrar_valores':

                $medicion = new Medicion();
                $cabeceras = $medicion->mediciones_periodos($id_indicador, $inicio, $fin);
                $subunidades_mediciones = $entidad->find_subunidades_mediciones_periodos($id_indicador, $id_entidad, $inicio, $fin);

                break;

            case 'seleccionar_años':

                $medicion = new Medicion();
                $years = $medicion->find_year_mediciones($id_indicador);
                $smarty->assign('years', $years);

                $smarty->assign('year_inicio', filter_input(INPUT_GET, 'inicio', FILTER_SANITIZE_NUMBER_INT));
                $cabeceras = '';
                $subunidades_mediciones = '';
                break;

            case 'activar_all':

                $medicion = new Medicion();
                $valores = new Valor();
                $valores->valores_activar_periodos($id_indicador, $id_subunidad, $activo, $inicio, $fin);
                $cabeceras = $medicion->mediciones_periodos($id_indicador, $inicio, $fin);
                $subunidades_mediciones = $entidad->find_subunidades_mediciones_periodos($id_indicador, $id_entidad, $inicio, $fin);

                break;
        }
        $smarty->assign('mediciones', $cabeceras);
        $smarty->assign('subunidades_mediciones', $subunidades_mediciones);
        $smarty->assign("modulo", $modulo);
        $plantilla = 'indicadores/valores_ajax.tpl';
    }
    else
    {
        $error = ERR_PERMISOS;
        header("location:index.php?page=error&error=$error");
    }
}
else
{
    $error = ERR_PARAM;
    header("location:index.php?page=error&error=$error");
}
