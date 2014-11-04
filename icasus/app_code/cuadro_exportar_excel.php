<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: cuadro_exportar_excel.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Genera una hoja de calculo con los indicadores del cuadro en cada hoja. 
//---------------------------------------------------------------------------------------------------

global $smarty;
global $basedatos;
global $plantilla;

// Esto es para prevenir que se cargue el script sin pasar por index.php
if (!is_object($smarty)) {
    header('Location:index.php');
}

$id = filter_input(INPUT_GET | INPUT_POST, 'id', FILTER_SANITIZE_NUMBER_INT);
//if (isset($_REQUEST['id']))
if ($id) {
    $smarty->assign('_javascript', array('confirmar_borrar'));
//	$id = sanitize($_REQUEST['id'],16);
    $cuadro = new cuadro();
    $cuadro->Load("id = $id");
    $smarty->assign('cuadro', $cuadro);
    $indicadores = $cuadro->carga_indicadores();
    $smarty->assign('indicadores', $indicadores);
    $plantilla = 'cuadro_mostrar.tpl';
    $smarty->assign('_nombre_pagina', "Cuadro de Mando: $cuadro->nombre");

//º:print_r($ado_indicador);
//Librerias necesarias
    require_once ('lib/phpExcel/PHPExcel/Writer/Excel5.php');
    require_once('lib/phpExcel/PHPExcel/IOFactory.php');
    require_once('lib/phpExcel/PHPExcel/RichText.php');
//Creamos una instancia de la clase
    $excel = new PHPExcel();

//$i para que cada indicador vaya en hojas distintas.
    $i = 0;
    foreach ($indicadores as $indicador) {
        $excel->setActiveSheetIndex($i);
        $excel->getActiveSheet()->setTitle($indicador->codigo);
        include ('exportar_excel_estilo.php');
        if ($indicador->valores) {
            //$j fila en la que debe empezar a escribir los datos.
            $j = 8;
            foreach ($indicador->valores as $valor) {

                $excel->getActiveSheet()->setCellValue('B' . $j, date("m/Y", $valor['fecha_recogida']));
                $excel->getActiveSheet()->setCellValue('C' . $j, $valor['valor']);
                $excel->getActiveSheet()->setCellValue('D' . $j, $valor['objetivo']);
                $excel->getActiveSheet()->setCellValue('E' . $j, $valor['objetivo_estrategico']);
                $excel->getActiveSheet()->setCellValue('F' . $j, $valor['objetivo_carta']);

                $j = $j + 1;
            }
            //$k determina el rango al que se va a aplicar el forato.
            $k = $j - 1;
            $excel->getActiveSheet()->getStyle('B8:F' . $k)->applyFromArray($styleThinBlackBorderOutline);
            //Descomentar aqui, y comentar abajo, si queremos que solo salgan los indicadores que tenga valores.
            //$i=$i+1;
            //$excel->createSheet();
        } else {

            $excel->getActiveSheet()->setCellValue('B10', 'Este indicador no tiene valores');
        }
        $i = $i + 1;
        $excel->createSheet();
    }

    $excelBinaryWriter = PHPExcel_IOFactory::createWriter($excel, 'Excel5');
    $excelBinaryWriter->save('informes/cuadro' . $id . '.xls');

    header('Content-Disposition:attachment;filename=informes/cuadro' . $id . '.xls');
    header("Content-Type:application/vnd.ms-excel");
    //header("Content-Length:".filesize($Fichero));
    header("Content-Transfer-Encoding: binary");
    readfile('informes/cuadro' . $id . '.xls');
} else {
    //Si se llama a esta pagina si un id de cuadro se redirecciona al listado
    header('Location:index.php?page=cuadro_listar');
}

