<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: cuadromando_departamento.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Prepara los datos para mostrar el formulario que permite crear un nuevo cuadro de mando
//---------------------------------------------------------------------------------------------------
require_once("/var/www/wiki/icasus/lib/phpExcel/PHPExcel.php");
require_once("/var/www/wiki/icasus/lib/phpExcel/PHPExcel/IOFactory.php");
require_once("/var/www/wiki/icasus/lib/phpExcel/PHPExcel/RichText.php");
//$tipo = sanitize($_GET["tipo"],2);
$tipo = 'valor';
$smarty->assign('_nombre_pagina' , "Seguimiento Indicadores de los Departamentos");
$plantilla = 'informes/cuadromando_departamento.tpl';
$ado_entidad = new ado_entidad();
$cod_unidad = $_POST["unidad"];
$periodos = $_POST["periodo"];
$codigos = $_POST["indicador"];
//$periodos = array('2009','2010','2011');
//$codigos = array('AOG-I2','AOG-I1','MS-I2','MS-I1','GE-I1','GE-I2');
$entidades = $ado_entidad->seguimiento_entidad($periodos,$codigos,$cod_unidad,$tipo);
$periods=count($periodos);

$excel = new PHPExcel();
$excel->setActiveSheetIndex(0);
$excel->getActiveSheet()->setTitle("Informe");
$excel->getActiveSheet()->getDefaultRowDimension()->setRowHeight(25);
//Define el marco en negro alrededor de los datos
$styleThinBlackBorderOutline = array(
  'borders' => array(
    'allborders' => array(
      'style' => PHPExcel_Style_Border::BORDER_THIN,
      'color' => array('rgb' => 'FF9900'),
    ),
  ),
);
//Define el marco en negro alrededor de los datos
$styleThinWhiteBorderOutline = array(
  'borders' => array(
    'allborders' => array(
      'style' => PHPExcel_Style_Border::BORDER_THIN,
      'color' => array('rgb' => 'FFFFFF'),
    ),
  ),
);


//creo el array para escribir las columnas 
$lettertonum = array();
$j=1;
for ($i='A'; $i!='AAA'; $i++) 
{   
  $lettertonum[$j]= $i;
  $j = $j + 1;
}
$h=3;
$fila= 1;
$fila2=$fila+1;
$periods=$periods-1;
//cabecera de la tabla de datos
foreach($codigos as $codigo)
{
	$excel->getActiveSheet()->getStyle($lettertonum[$h].$fila)->getFont()->getColor()->setARGB(PHPExcel_Style_Color::COLOR_WHITE);
	$excel->getActiveSheet()->getStyle($lettertonum[$h].$fila)->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
	$excel->getActiveSheet()->getStyle($lettertonum[$h].$fila)->getFill()->getStartColor()->setRGB('FF9900');
	$excel->getActiveSheet()->getStyle($lettertonum[$h].$fila)->applyFromArray($styleThinWhiteBorderOutline);

	$excel->getActiveSheet()->getStyle($lettertonum[$h].$fila)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
	$excel->getActiveSheet()->mergeCells($lettertonum[$h].$fila.':'.$lettertonum[$h+$periods].$fila);
	$excel->getActiveSheet()->setCellValue($lettertonum[$h].$fila,$codigo); 
	$x=$h;
	foreach($periodos as $periodo)
	{
		$excel->getActiveSheet()->getStyle($lettertonum[$x].$fila2)->getFill()->getStartColor()->setRGB('E9E9E9');
		$excel->getActiveSheet()->getStyle($lettertonum[$x].$fila2)->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
		$excel->getActiveSheet()->getStyle($lettertonum[$x].$fila2)->applyFromArray($styleThinBlackBorderOutline);
		$excel->getActiveSheet()->getStyle($lettertonum[$x].$fila2)->getAlignment()->setHorizontal(PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		$excel->getActiveSheet()->setCellValue($lettertonum[$x].$fila2,$periodo);	
		$x=$x+1;
	}
	$h=$h+$periods+1;
}
//datos de la tabla
foreach($entidades as $key=>$entidad)
{
	$newkey = $key+3;
  	$excel->getActiveSheet()->getStyle('B'.$newkey)->getFont()->getColor()->setARGB(PHPExcel_Style_Color::COLOR_WHITE);
  	$excel->getActiveSheet()->getStyle('B'.$newkey)->getFill()->setFillType(PHPExcel_Style_Fill::FILL_SOLID);
  	$excel->getActiveSheet()->getStyle('B'.$newkey)->getFill()->getStartColor()->setRGB('FF9900');
	$excel->getActiveSheet()->getColumnDimension('B')->setWidth(40);
	$excel->getActiveSheet()->setCellValue('B'.$newkey,$entidad->nombre); 
	$m=3;
	foreach($entidad->indicadores as $indicador)
	{
		//print_r($indicador);
		foreach($indicador as $item)
		{
			$excel->getActiveSheet()->getStyle($lettertonum[$m].$newkey)->applyFromArray($styleThinBlackBorderOutline);
			//print_r($item);
			if ($item >0)
			{
				$excel->getActiveSheet()->setCellValue($lettertonum[$m].$newkey,$item);
			}
			$m=$m+1;
		}
	}
}
$excelBinaryWriter = PHPExcel_IOFactory::createWriter($excel, 'Excel5');
$archivo = '/var/www/wiki/icasus/informes/seguimiento_'.$cod_unidad.'.xls';
$excelBinaryWriter->save($archivo);

header('Content-Description: File Transfer');
header('Content-Type: application/octet-stream');
header('Content-Disposition: attachment; filename='.basename($archivo));
header('Content-Transfer-Encoding: binary');
header('Expires: 0');
header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
header('Pragma: public');
header('Content-Length: ' . filesize($archivo));
//ob_clean();
//flush();
readfile($archivo);



?>
