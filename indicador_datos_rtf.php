<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: indicador_datos_informe.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Muestra todos los parametros de un indicador y la gráfica de los valores introducidos
//---------------------------------------------------------------------------------------------------
global $basedatos;

if (isset($_GET['id_indicador']))
{
	$id_indicador = sanitize($_GET['id_indicador'],16); 
	$indicador = new indicador($basedatos);
	$indicador->obtener_datos($id_indicador);
	$valores = $indicador->listar_valores($id_indicador);
	$entidad = new entidad($basedatos);
	$entidad->obtener_datos($indicador->datos['id_entidad']);
	$_nombre_pagina=utf8_encode($entidad->datos['nombre']); 
include_once('lib/phprtflite/rtf/Rtf.php');

//empezamos el rtf
	$null = null;
//defino los tips de letra
	$arial8 = new Font(8, 'Arial', '#000000');
	$arial8azul = new Font(8, 'Arial', '#0077aa');
//defino el formato de los parrafos
	$parF = new ParFormat('left');
//creo el objeto rtf
	$rtf = new Rtf(); 
//creamos la cabecera
	$header = &$rtf->addHeader('all');
$header->addImage('theme/usevilla/logo.jpg', $null);
$header->writeText('<tab>Indicadores de la Unidad '.utf8_decode($_nombre_pagina).'<tab><chdate>', new Font(), new ParFormat('right'));
//configuración de tamaño y márgenes de la página
$sect = &$rtf->addSection();
$sect->setPaperWidth(21);
$sect->setPaperHeight(29.5);
$marginTop = 2;
$marginBottom = 2;
$marginLeft = 3;
$marginRight = 3;
$sect->setMargins($marginLeft, $marginTop, $marginRight, $marginBottom);
$sect->writeText(' ', $null, $null);
$table = &$sect->addTable();
//Añado 12 filas de altura 1
$table->addRows(13, 0.5);
//Divido las filas en 2 columnas de 2 y 10 de ancho
$table->addColumnsList(array(4,12));
//Relleno la tabla
$table->writeToCell(1,1,'Código del Proceso:',$arial8azul,$null);
$table->writeToCell(1,2,$indicador->datos['codigo_proceso'],$arial8,$null);

$table->writeToCell(2,1,'Nombre del Proceso:',$arial8azul,$null);
$table->writeToCell(2,2,$indicador->datos['proceso'],$arial8,$null);

$table->writeToCell(3,1,'Código del Indicador:',$arial8azul,$null);
$table->writeToCell(3,2,$indicador->datos['codigo'],$arial8,$null);

$table->writeToCell(4,1,'Datos del Indicador:',$arial8azul,$null);
$table->writeToCell(4,2,$indicador->datos['nombre'],$arial8,$null);

$table->writeToCell(5,1,'Descripción:',$arial8azul,$null);
$table->writeToCell(5,2,$indicador->datos['descripcion'],$arial8,$null);

$table->writeToCell(6,1,'Formulación:',$arial8azul,$null);
$table->writeToCell(6,2,$indicador->datos['formulacion'],$arial8,$null);

$table->writeToCell(7,1,'Objetivo:',$arial8azul,$null);
$table->writeToCell(7,2,$indicador->datos['objetivo'],$arial8,$null);

$table->writeToCell(8,1,'Objetivo Pactado:',$arial8azul,$null);
$table->writeToCell(8,2,$indicador->datos['objetivo_estrategico'],$arial8,$null);

$table->writeToCell(9,1,'Objetivo Carta de Servicio:',$arial8azul,$null);
$table->writeToCell(9,2,$indicador->datos['objetivo_carta'],$arial8,$null);

$table->writeToCell(10,1,'Estandar:',$arial8azul,$null);
$table->writeToCell(10,2,'estandar'/*$indicador->datos['estandar']*/,$arial8,$null);

$table->writeToCell(11,1,'Fuente de obtención:',$arial8azul,$null);
$table->writeToCell(11,2,$indicador->datos['fuente'],$arial8,$null);

$table->writeToCell(12,1,'Periodicidad:',$arial8azul,$null);
$table->writeToCell(12,2,$indicador->datos['periodicidad'],$arial8,$null);

$table->writeToCell(13,1,'Responsable:',$arial8azul,$null);
$table->writeToCell(13,2,$indicador->datos['apellidos_responsable'].", ".$indicador->datos['nombre_responsable'],$arial8,$null);
//Gráfica del Indicador
$sect->writeText('Gráfica con los valores del Indicador ', new Font(), $parF);
$sect->addImage(IC_DIR_BASE.'cache/indicador'.$id_indicador.'.png', $null);
//Pie de página
$footer = &$rtf->addFooter('all');
$footer->writeText('Informe generado por ICASUS 0.5<tab><tab>página <pagenum>',new Font(), new ParFormat('right'));

$rtf->sendRtf('Informe_Indicador_'.$id_indicador);
}
else
{
	echo "No se puede generar el informe del indicador por falta de parámetros.";
	
}
?>

