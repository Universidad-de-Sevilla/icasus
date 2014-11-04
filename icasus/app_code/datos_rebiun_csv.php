<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: consulta_avanzada.php
//---------------------------------------------------------------------------------------------------
// Consulta a los datos e indicadores, permitiendo hacer operaciones matemáticas sencillas entre ellos.
//  - Genera una tabla de resultados y una gráfica
//  - Permite elegir subunidades
//  - Permite acotar los periodos de medición deseados
//---------------------------------------------------------------------------------------------------
$modulo = sanitize($_REQUEST["modulo"],SQL);
$indicador = new indicador();

require_once ('../../cascara_core/lib/phpExcel/PHPExcel/Writer/Excel5.php');
require_once('../../cascara_core/lib/phpExcel/PHPExcel/IOFactory.php');
require_once('../../cascara_core/lib/phpExcel/PHPExcel/RichText.php');

//Creamos una instancia de la clase
$excel= new PHPExcel();
$excel->setActiveSheetIndex(0);
$excel->getActiveSheet()->setTitle("Datos rebiun - $modulo");  
$styleThinWhiteBorderOutline = array(
  'borders' => array(
    'allborders' => array(
      'style' => PHPExcel_Style_Border::BORDER_THIN,
      'color' => array('rgb' => 'FFFFFF'),
    ),
  ),
);
$styleThinBlackBorderOutline = array(
  'borders' => array(
    'allborders' => array(
      'style' => PHPExcel_Style_Border::BORDER_THIN,
      'color' => array('rgb' => 'FF9900'),
    ),
  ),
);
$styleBackgroundHeader = array(
	'font' => array(
            'bold' => true,
						'color' => array('rgb' => 'FFFFFF')
       ),	
  'fill'=> array(
		'type' => PHPExcel_Style_Fill::FILL_SOLID,
		'startcolor' => array('rgb' => '880000')
	),
  'borders' => array(
    'allborders' => array(
      'style' => PHPExcel_Style_Border::BORDER_THIN,
      'color' => array('rgb' => 'FFFFFF'),
    ),
  )
);
$excel->getActiveSheet()->getStyle('A2:E2')->applyFromArray($styleBackgroundHeader);
switch ($modulo)
{
	case 'detalle':
		$datos = $indicador->rebiun_2012_detalle();
		$excel->getActiveSheet()->getStyle('A2:E2')->applyFromArray($styleBackgroundHeader);
		$excel->getActiveSheet()->setCellValue('A2','Código');
		$excel->getActiveSheet()->setCellValue('B2','Indicador')->getColumnDimension('B')->setAutoSize(true);
		$excel->getActiveSheet()->setCellValue('C2','Subunidad')->getColumnDimension('C')->setAutoSize(true);
		$excel->getActiveSheet()->setCellValue('D2','Medidor');
		$excel->getActiveSheet()->setCellValue('E2','Valor');
		foreach($datos as $key => $datos)
		{
			$key = $key+3;
			$excel->getActiveSheet()->setCellValue('A'.$key,$datos['codigo']);
			$excel->getActiveSheet()->setCellValue('B'.$key,$datos['indicador']);
			$excel->getActiveSheet()->setCellValue('C'.$key,$datos['subunidad']);
			$excel->getActiveSheet()->setCellValue('D'.$key,$datos['medidor']);
			$excel->getActiveSheet()->setCellValue('E'.$key,$datos['valor']);
		}	
	break;
	case 'suma':
		$datos = $indicador->rebiun_2012_suma();
	$excel->getActiveSheet()->getStyle('A2:D2')->applyFromArray($styleBackgroundHeader);
		$excel->getActiveSheet()->setCellValue('A2','Código');
		$excel->getActiveSheet()->setCellValue('B2','Indicador')->getColumnDimension('B')->setAutoSize(true);
		$excel->getActiveSheet()->setCellValue('C2','Etiqueta')->getColumnDimension('C')->setAutoSize(true);
		$excel->getActiveSheet()->setCellValue('D2','Valor');
		foreach($datos as $key => $datos)
		{
			$key = $key+3;
			$excel->getActiveSheet()->setCellValue('A'.$key,$datos['codigo']);
			$excel->getActiveSheet()->setCellValue('B'.$key,$datos['indicador']);
			$excel->getActiveSheet()->setCellValue('C'.$key,$datos['etiqueta']);
			$excel->getActiveSheet()->setCellValue('D'.$key,$datos['valor']);
		}	
	break;
	case 'promedio':
		$datos = $indicador->rebiun_2012_promedio();

		$excel->getActiveSheet()->getStyle('A2:D2')->applyFromArray($styleBackgroundHeader);
		$excel->getActiveSheet()->setCellValue('A2','Código');
		$excel->getActiveSheet()->setCellValue('B2','Indicador')->getColumnDimension('B')->setAutoSize(true);
		$excel->getActiveSheet()->setCellValue('C2','Etiqueta')->getColumnDimension('C')->setAutoSize(true);
		$excel->getActiveSheet()->setCellValue('D2','Valor');
		foreach($datos as $key => $datos)
		{
			$key = $key+3;
			$excel->getActiveSheet()->setCellValue('A'.$key,$datos['codigo']);
			$excel->getActiveSheet()->setCellValue('B'.$key,$datos['indicador']);
			$excel->getActiveSheet()->setCellValue('C'.$key,$datos['etiqueta']);
			$excel->getActiveSheet()->setCellValue('D'.$key,$datos['valor']);
		}	
	break;
}

$archivo = IC_DIR_BASE.'app_code/informe/datos_rebiun_'.$modulo.'.xls'; 
$excelBinaryWriter = PHPExcel_IOFactory::createWriter($excel, 'Excel5');
$excelBinaryWriter->save($archivo);

header("Content-Disposition:attachment;filename=datos_rebiun_$modulo.xls");
header("Content-Type:application/vnd.ms-excel");
header("Content-Transfer-Encoding: binary");
readfile($archivo);
?>
	default :
		$excel->getActiveSheet()->getStyle('A2:D2')->applyFromArray($styleBackgroundHeader);
		$excel->getActiveSheet()->setCellValue('A2','Código');
		$excel->getActiveSheet()->setCellValue('B2','Indicador')->getColumnDimension('B')->setAutoSize(true);
		$excel->getActiveSheet()->setCellValue('C2','Etiqueta')->getColumnDimension('C')->setAutoSize(true);
		$excel->getActiveSheet()->setCellValue('D2','Valor');
		foreach($datos as $key => $datos)
		{
			$key = $key+3;
			$excel->getActiveSheet()->setCellValue('A'.$key,$datos['codigo']);
			$excel->getActiveSheet()->setCellValue('B'.$key,$datos['indicador']);
			$excel->getActiveSheet()->setCellValue('C'.$key,$datos['etiqueta']);
			$excel->getActiveSheet()->setCellValue('D'.$key,$datos['valor']);
		}	
}

$archivo = IC_DIR_BASE.'app_code/informe/datos_rebiun_'.$modulo.'.xls'; 
$excelBinaryWriter = PHPExcel_IOFactory::createWriter($excel, 'Excel5');
$excelBinaryWriter->save($archivo);

header("Content-Disposition:attachment;filename=datos_rebiun_$modulo.xls");
header("Content-Type:application/vnd.ms-excel");
header("Content-Transfer-Encoding: binary");
readfile($archivo);
?>

	default :
		$excel->getActiveSheet()->getStyle('A2:D2')->applyFromArray($styleBackgroundHeader);
		$excel->getActiveSheet()->setCellValue('A2','Código');
		$excel->getActiveSheet()->setCellValue('B2','Indicador')->getColumnDimension('B')->setAutoSize(true);
		$excel->getActiveSheet()->setCellValue('C2','Etiqueta')->getColumnDimension('C')->setAutoSize(true);
		$excel->getActiveSheet()->setCellValue('D2','Valor');
		foreach($datos as $key => $datos)
		{
			$key = $key+3;
			$excel->getActiveSheet()->setCellValue('A'.$key,$datos['codigo']);
			$excel->getActiveSheet()->setCellValue('B'.$key,$datos['indicador']);
			$excel->getActiveSheet()->setCellValue('C'.$key,$datos['etiqueta']);
			$excel->getActiveSheet()->setCellValue('D'.$key,$datos['valor']);
		}	
}

$archivo = IC_DIR_BASE.'app_code/informe/datos_rebiun_'.$modulo.'.xls'; 
$excelBinaryWriter = PHPExcel_IOFactory::createWriter($excel, 'Excel5');
$excelBinaryWriter->save($archivo);

header("Content-Disposition:attachment;filename=datos_rebiun_$modulo.xls");
header("Content-Type:application/vnd.ms-excel");
header("Content-Transfer-Encoding: binary");
readfile($archivo);
?>