<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: medicion_listar.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Muestra un listado de las mediciones establecidas para un indicador
//---------------------------------------------------------------------------------------------------
global $smarty;
global $usuario;
global $plantilla;
//parametros que son comunes a todos los módulos
//$modulo = sanitize($_REQUEST["modulo"],SQL);
$modulo = filter_input(INPUT_GET, 'modulo', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
//$id_entidad = sanitize($_REQUEST["id_entidad"],INT);
$id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
$entidad = new Entidad();
$entidad->load("id = $id_entidad");
$smarty->assign('entidad', $entidad);

//$id_indicador = sanitize($_REQUEST["id_indicador"],INT);
$id_indicador = filter_input(INPUT_GET, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
$indicador = new Indicador();
$indicador->load("id = $id_indicador");
$smarty->assign('indicador', $indicador);

//$inicio = sanitize($_REQUEST["inicio"],SQL);
$inicio = filter_input(INPUT_GET, 'inicio', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
//$fin = sanitize($_REQUEST["fin"],SQL);
$fin = filter_input(INPUT_GET, 'fin', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
//$id_medicion = sanitize($_REQUEST["id_medicion"],INT);
$id_medicion = filter_input(INPUT_GET, 'id_medicion', FILTER_SANITIZE_NUMBER_INT);
//$id_subunidad = sanitize($_REQUEST["id_subunidad"],INT);
$id_subunidad = filter_input(INPUT_GET, 'id_subunidad', FILTER_SANITIZE_NUMBER_INT);
//$activo = sanitize($_REQUEST["activo"],INT);
$activo = filter_input(INPUT_GET, 'activo', FILTER_SANITIZE_NUMBER_INT);

if (isset($id_indicador) AND isset($modulo) AND isset($id_entidad))
{
    $usuario_entidad = new Usuario_entidad();
    if ($usuario_entidad->load("id_usuario=$usuario->id and id_entidad=$id_entidad and (id_rol=1 or id_rol=2)"))
    {
        switch ($modulo)
        {
            case 'actualizar_dato':
//				$id_valor = sanitize($_REQUEST["id_valor"],INT);
                $id_valor = filter_input(INPUT_GET, 'id_valor', FILTER_SANITIZE_NUMBER_INT);
//				$value = sanitize($_REQUEST["valor"],SQL);
                $value = filter_input(INPUT_GET, 'valor', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner"));
                $valor = new Valor();
                $valor->Load("id = $id_valor");
                $valor->id_usuario = $usuario->id;
                $valor->valor = $value;
                $valor->valor_parcial = $value;
                $valor->fecha_recogida = date("Y-m-j");
                $valor->save();
                break;

            case 'asignar_una_medicion':

                $valor = new Valor();
                $valor->id_medicion = $id_medicion;
                $valor->id_entidad = $id_subunidad;
                $valor->activo = $activo;
                $valor->save();
                $medicion = new Medicion();
//                if ($_REQUEST["inicio"] == 0)
                if (filter_input(INPUT_GET, 'inicio') == 0)
                {
                    $cabeceras = $medicion->find("id_indicador = $id_indicador ORDER BY periodo_inicio");
                    $subunidades_mediciones = $entidad->find_subunidades_mediciones($id_indicador, $entidad->id);
                }
                else
                {
                    $cabeceras = $medicion->mediciones_periodos($id_indicador, $inicio, $fin);
                    $subunidades_mediciones = $entidad->find_subunidades_mediciones_periodos($id_indicador, $id_entidad, $inicio, $fin);
                }
                break;
            case 'activar_uno':
                $valor = new Valor();
                $valor->load("id_medicion = $id_medicion AND id_entidad = $id_subunidad");
                $valor->activo = $activo;
                $valor->save();

                $medicion = new Medicion();
//                if ($_REQUEST["inicio"] == 0)
                if (filter_input(INPUT_GET, 'inicio') == 0)
                {
                    $cabeceras = $medicion->find("id_indicador = $id_indicador ORDER BY periodo_inicio");
                    $subunidades_mediciones = $entidad->find_subunidades_mediciones($id_indicador, $entidad->id);
                }
                else
                {
                    $cabeceras = $medicion->mediciones_periodos($id_indicador, $inicio, $fin);
                    $subunidades_mediciones = $entidad->find_subunidades_mediciones_periodos($id_indicador, $id_entidad, $inicio, $fin);
                }
                break;
            case 'mostrar_valores':
                $medicion = new Medicion();
//                if ($_REQUEST["inicio"] == 0)
                if (filter_input(INPUT_GET, 'inicio') == 0)
                {
                    $cabeceras = $medicion->find("id_indicador = $id_indicador ORDER BY periodo_inicio");
                    $subunidades_mediciones = $entidad->find_subunidades_mediciones($id_indicador, $entidad->id);
                }
                else
                {
                    $cabeceras = $medicion->mediciones_periodos($id_indicador, $inicio, $fin);
                    $subunidades_mediciones = $entidad->find_subunidades_mediciones_periodos($id_indicador, $id_entidad, $inicio, $fin);
                }
                break;
            case 'seleccionar_años':
                $medicion = new Medicion();
                $years = $medicion->find_year_mediciones($id_indicador);
                $smarty->assign('years', $years);
//                $smarty->assign('year_inicio', sanitize($_REQUEST["inicio"], SQL));
                $smarty->assign('year_inicio', filter_input(INPUT_GET, 'inicio', FILTER_CALLBACK, array("options" => "Util::mysqlCleaner")));
                $cabeceras = '';
                $subunidades_mediciones = '';
                break;

            case 'activar_all':
                $medicion = new Medicion();
//                if ($_REQUEST["inicio"] == 0)
                if (filter_input(INPUT_GET, 'inicio') == 0)
                {
                    $valores = new Valor();
                    $valores->valores_activar($id_indicador, $id_subunidad, $activo);
                    $cabeceras = $medicion->find("id_indicador = $id_indicador ORDER BY periodo_inicio");
                    $subunidades_mediciones = $entidad->find_subunidades_mediciones($id_indicador, $entidad->id);
                }
                else
                {
                    $valores = new Valor();
                    $v = $valores->valores_activar_periodos($id_indicador, $id_subunidad, $activo, $inicio, $fin);
                    $cabeceras = $medicion->mediciones_periodos($id_indicador, $inicio, $fin);
                    $subunidades_mediciones = $entidad->find_subunidades_mediciones_periodos($id_indicador, $id_entidad, $inicio, $fin);
                }
                break;
        }
        $smarty->assign('mediciones', $cabeceras);
        $smarty->assign('subunidades_mediciones', $subunidades_mediciones);
        $smarty->assign("modulo", $modulo);
        $plantilla = 'indicador_subunidad_valor_ajax.tpl';
    }
    else
    {
        //escribe un error de falta de permisos en log para poder tener registro del error ya que ajax no lo muestra al estar en segundo plano
    }
}
else
{
    //escribe un error de falta de parámetroe en log para poder tener registro del error ya que ajax no lo muestra al estar en segundo plano
}

