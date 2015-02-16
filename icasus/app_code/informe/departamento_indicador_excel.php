<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: cuadromando_crear.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Prepara los datos para mostrar el formulario que permite crear un nuevo cuadro de mando
//---------------------------------------------------------------------------------------------------
//require_once("/var/www/cascara/cascara_core/lib/phpExcel/PHPExcel.php");
require_once("/var/www/wiki/icasus/lib/phpExcel/PHPExcel/IOFactory.php");
require_once("/var/www/wiki/icasus/lib/phpExcel/PHPExcel/RichText.php");

$ado_entidad = new ado_entidad();
$entidades = $ado_entidad->informe_entidad_indicador('UE01-');

//inicio y titulo de la hoja 
$excel = new PHPExcel();

$excel->getActiveSheet()->setTitle(FIELD_INDICS . " " . date("d-m-Y"));
$excel->getActiveSheet()->setCellValue('A1', FIELD_UNID);
$excel->getActiveSheet()->setCellValue('B1', FIELD_INDIC);
$excel->getActiveSheet()->setCellValue('C1', FIELD_VAL);
$excel->getActiveSheet()->setCellValue('D1', FIELD_FECHA);

//Esta variable se usa dentro de cada iteración porque siempre empleamos una fila
//nueva para escribir los datos
$fila = 2;
foreach ($entidades as $entidad)
{
    $excel->getActiveSheet()->setCellValue('A' . $fila, $entidad->nombre);
     $fila++;
    foreach ($entidad->indicadores as $indicador)
    {
        $excel->getActiveSheet()->setCellValue('B' . $fila, $indicador->nombre);
        $fila++;
        foreach ($indicador->valores as $valor)
        {
            $excel->getActiveSheet()->setCellValue('C' . $fila, $valor->valor);
            $excel->getActiveSheet()->setCellValue('D' . $fila, date("d-m-Y", $valor->fecha_entrada));
            $fila++;
        }
        $fila++;
    }
    $fila++;
}
$excel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
$excel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
$excel->getActiveSheet()->getColumnDimension('C')->setAutoSize(true);
$excel->getActiveSheet()->getColumnDimension('D')->setAutoSize(true);

$excel->getActiveSheet()->getStyle('A1:D1')->getFont()->getColor()->setARGB(PHPExcel_Style_Color::COLOR_WHITE);
$excel->getActiveSheet()->getStyle('A1:D1')->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
$excel->getActiveSheet()->getStyle('A1:D1')->getFill()->getStartColor()->setARGB('FF990000');


$excelBinaryWriter = PHPExcel_IOFactory::createWriter($excel, 'Excel5');
$archivo = 'informes/indicadores_dpto.xls';
$excelBinaryWriter->save($archivo);

header('Content-Description: File Transfer');
header('Content-Type: application/octet-stream');
header('Content-Disposition: attachment; filename=' . basename($archivo));
header('Content-Transfer-Encoding: binary');
header('Expires: 0');
header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
header('Pragma: public');
header('Content-Length: ' . filesize($archivo));
ob_clean();
flush();
readfile($archivo);

