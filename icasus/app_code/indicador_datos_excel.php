<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: indicador_datos_excel.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Muestra todos los parametros de un indicador y la gráfica de los valores introducidos
//---------------------------------------------------------------------------------------------------
global $basedatos;

//if (isset($_GET['id_indicador']))
//{
//	$id_indicador = sanitize($_GET['id_indicador'],16); 
$id_indicador = filter_input(INPUT_GET, 'id_indicador', FILTER_SANITIZE_NUMBER_INT);
$indicador = new Indicador($basedatos);
$indicador->obtener_datos($id_indicador);
$valores = $indicador->listar_valores($id_indicador);
$entidad = new Entidad($basedatos);
$entidad->obtener_datos($indicador->datos['id_entidad']);
$_nombre_pagina = utf8_encode($entidad->datos['nombre']);

//print_r($indicador);
require_once ('lib/phpExcel/PHPExcel/Writer/Excel5.php');
require_once('lib/phpExcel/PHPExcel/IOFactory.php');
require_once('lib/phpExcel/PHPExcel/RichText.php');

$excel = new PHPExcel();

$excel->setActiveSheetIndex(0);
$excel->getActiveSheet()->setTitle($indicador->datos['codigo']);
//Logo y cabecera de la Hoja de Calculo
$objDrawing = new PHPExcel_Worksheet_Drawing();
$objDrawing->setName('logo');
$objDrawing->setDescription('logo');
$objDrawing->setPath('theme/usevilla/marca_use.gif');
$objDrawing->setHeight(72);
$objDrawing->setCoordinates('B1');
$objDrawing->setWorksheet($excel->getActiveSheet());
//Datos de la hola
//$excel->getActiveSheet()->setCellValue('B5', ]);
$excel->getActiveSheet()->mergeCells('D3:F3');
$excel->getActiveSheet()->setCellValue('D3', TXT_INFORME_IC);
$excel->getActiveSheet()->getStyle('D3')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
$excel->getActiveSheet()->setCellValue('F4', date("j/m/Y"));
$excel->getActiveSheet()->getStyle('F4')->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
//une las celdas para el nombre del indicador
$excel->getActiveSheet()->mergeCells('B5:F5');
//Titulos de las columnas
$excel->getActiveSheet()->setCellValue('B5', $indicador->datos['nombre']);
$excel->getActiveSheet()->setCellValue('B7', FIELD_PERIODO);
$excel->getActiveSheet()->setCellValue('C7', FIELD_VAL);
$excel->getActiveSheet()->setCellValue('D7', FIELD_OBJ);
$excel->getActiveSheet()->setCellValue('E7', FIELD_OBJP);
$excel->getActiveSheet()->setCellValue('F7', FIELD_OBJC);
//Colorear fondo del nombre del indicador
$excel->getActiveSheet()->getStyle('B5')->getFont()->getColor()->setARGB(PHPExcel_Style_Color::COLOR_WHITE);
$excel->getActiveSheet()->getStyle('B5:F5')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
$excel->getActiveSheet()->getStyle('B5:F5')->getFill()->getStartColor()->setARGB('FF990000');
//Colorear fondo de cabeceras de la tabla
$excel->getActiveSheet()->getStyle('B7:F7')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
$excel->getActiveSheet()->getStyle('B7:F7')->getFill()->getStartColor()->setARGB('FF990000');
$excel->getActiveSheet()->getStyle('B7:F7')->getFont()->getColor()->setARGB(PHPExcel_Style_Color::COLOR_WHITE);
//Poner automatico el ancho de las columnas
$excel->getActiveSheet()->getColumnDimension('E')->setAutoSize(true);
$excel->getActiveSheet()->getColumnDimension('F')->setAutoSize(true);
//Define el marco en negro alrededor de los datos
$styleThinBlackBorderOutline = array(
    'borders' => array(
        'allborders' => array(
            'style' => PHPExcel_Style_Border::BORDER_THIN,
            'color' => array('argb' => 'FF990000'),
        ),
    ),
);
//escribe la tabla de ,los valores.
for ($i = 0; $i < count($valores); $i++) {
    $j = $i + 8;
    $excel->getActiveSheet()->setCellValue('B' . $j, date("m/Y", $valores[$i]['fecha_recogida']));
    $excel->getActiveSheet()->getStyle('B' . $j)->applyFromArray($styleThinBlackBorderOutline);
    $excel->getActiveSheet()->setCellValue('C' . $j, $valores[$i]['valor']);
    $excel->getActiveSheet()->getStyle('C' . $j)->applyFromArray($styleThinBlackBorderOutline);
    $excel->getActiveSheet()->setCellValue('D' . $j, $valores[$i]['objetivo']);
    $excel->getActiveSheet()->getStyle('D' . $j)->applyFromArray($styleThinBlackBorderOutline);
    $excel->getActiveSheet()->setCellValue('E' . $j, $valores[$i]['objetivo_estrategico']);
    $excel->getActiveSheet()->getStyle('E' . $j)->applyFromArray($styleThinBlackBorderOutline);
    $excel->getActiveSheet()->setCellValue('F' . $j, $valores[$i]['objetivo_carta']);
    $excel->getActiveSheet()->getStyle('F' . $j)->applyFromArray($styleThinBlackBorderOutline);
}
$excelBinaryWriter = PHPExcel_IOFactory::createWriter($excel, 'Excel5');
$excelBinaryWriter->save('informes/indicador' . $id_indicador . '.xls');

header("Content-Disposition:attachment;filename=informes/indicador" . $id_indicador . ".xls");
header("Content-Type:application/vnd.ms-excel");
//header("Content-Length:".filesize($Fichero));
header("Content-Transfer-Encoding: binary");
readfile("informes/indicador" . $id_indicador . ".xls");



