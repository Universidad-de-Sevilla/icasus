<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: indicador_datos_excel.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Muestra todos los parametros de un indicador y la gráfica de los valores introducidos
//---------------------------------------------------------------------------------------------------
global $basedatos;

//$id_entidad = sanitize($_GET['id_entidad'],2);
$id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
//nombre de la entidad
$entidad = new ado_entidad();
$entidad->load("id_entidad = $id_entidad");

$indicador = new ado_indicador();
$indicadores = $indicador->Find_joined("id_entidad = $id_entidad");
//print_r($indicadores);
//print_r($entidad);
require_once ('lib/phpExcel/PHPExcel/Writer/Excel5.php');
require_once('lib/phpExcel/PHPExcel/IOFactory.php');
require_once('lib/phpExcel/PHPExcel/RichText.php');
require_once('function/limpiar_nombre.php');

$excel = new PHPExcel();

$excel->setActiveSheetIndex(0);
$excel->getActiveSheet()->setTitle($entidad->codigo);
//Nombre de unidad en varias celdas
$excel->getActiveSheet()->mergeCells('B3:F3');
$excel->getActiveSheet()->setCellValue('B3', $entidad->nombre);

$excel->getActiveSheet()->getStyle('B3:F3')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
$excel->getActiveSheet()->getStyle('B3:F3')->getFill()->getStartColor()->setARGB('FFE9E9E9');
$excel->getActiveSheet()->getStyle('B3:F3')->getFont()->setBold(true);
//Titulos de las columnas
$excel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
$excel->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
$excel->getActiveSheet()->getColumnDimension('D')->setWidth(65);
$excel->getActiveSheet()->getColumnDimension('E')->setAutoSize(true);
$excel->getActiveSheet()->getColumnDimension('G')->setAutoSize(true);
$excel->getActiveSheet()->getColumnDimension('I')->setAutoSize(true);

$excel->getActiveSheet()->setCellValue('B5', FIELD_COD);
$excel->getActiveSheet()->setCellValue('C5', FIELD_INDIC);
$excel->getActiveSheet()->setCellValue('D5', FIELD_DESC);
$excel->getActiveSheet()->setCellValue('E5', FIELD_FORM);
$excel->getActiveSheet()->setCellValue('F5', FIELD_UMBRAL);
$excel->getActiveSheet()->setCellValue('G5', FIELD_RESP);
$excel->getActiveSheet()->setCellValue('H5', FIELD_PERIOD);
$excel->getActiveSheet()->setCellValue('I5', FIELD_FUENTE);
$excel->getActiveSheet()->setCellValue('J5', FIELD_OBJ);
$excel->getActiveSheet()->setCellValue('K5', FIELD_PROC);
$excel->getActiveSheet()->setCellValue('L5', FIELD_CREAC);
$excel->getActiveSheet()->setCellValue('M5', FIELD_MOD);

$excel->getActiveSheet()->getStyle('B5:M5')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
$excel->getActiveSheet()->getStyle('B5:M5')->getFill()->getStartColor()->setARGB('FF990000');
$excel->getActiveSheet()->getStyle('B5:M5')->getFont()->getColor()->setARGB(PHPExcel_Style_Color::COLOR_WHITE);

//Datos
$indice = 6;
foreach ($indicadores as $indicador)
{
    $excel->getActiveSheet()->setCellValue('B' . $indice, $indicador->codigo);
    $excel->getActiveSheet()->setCellValue('C' . $indice, $indicador->nombre);
    $excel->getActiveSheet()->setCellValue('D' . $indice, $indicador->descripcion);
    $excel->getActiveSheet()->setCellValue('E' . $indice, $indicador->formulacion);
    $excel->getActiveSheet()->setCellValue('F' . $indice, $indicador->umbral);
    $excel->getActiveSheet()->setCellValue('G' . $indice, $indicador->responsable->nombre . " " . $indicador->responsable->apellidos);
    $excel->getActiveSheet()->setCellValue('H' . $indice, $indicador->periodicidad);
    $excel->getActiveSheet()->setCellValue('I' . $indice, $indicador->fuente);
    $excel->getActiveSheet()->setCellValue('J' . $indice, $indicador->objetivo);
    $excel->getActiveSheet()->setCellValue('K' . $indice, $indicador->proceso);
    $excel->getActiveSheet()->setCellValue('L' . $indice, $indicador->fecha_creacion);
    $excel->getActiveSheet()->setCellValue('M' . $indice, $indicador->fecha_modificacion);
    $indice = $indice + 1;
}


//$archivo = "indicadores_entidad_$id_entidad.xls";
$archivo = limpiar_nombre($entidad->nombre);
$archivo = $archivo . ".xls";

$excelBinaryWriter = PHPExcel_IOFactory::createWriter($excel, 'Excel5');
$excelBinaryWriter->save("informes/" . $archivo);



header("Content-Disposition:attachment;filename=" . $archivo);
header("Content-Type:application/vnd.ms-excel");
//header("Content-Length:".filesize($Fichero));
header("Content-Transfer-Encoding: binary");
readfile("informes/" . $archivo);



