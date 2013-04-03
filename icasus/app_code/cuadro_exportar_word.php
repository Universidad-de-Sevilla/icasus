<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: cuadro_exportar_word.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Genera un informe word del cuadro de mando activo 
//---------------------------------------------------------------------------------------------------

global $smarty;
global $basedatos;
global $plantilla;

// Esto es para prevenir que se cargue el script sin pasar por index.php
if (!is_object($smarty))
{
	header('Location:index.php');	
}
if (isset($_REQUEST['id']))
{
	$smarty->assign('_javascript' , array('confirmar_borrado'));
	$id = sanitize($_REQUEST['id'],16);
	$cuadro = new cuadro();
	$cuadro->Load("id = $id");
	$indicadores = $cuadro->carga_indicadores();
/************** generar informe ***************/
 $null = null;
//defino los tips de letra
 $times12 = new Font(13, 'Times new Roman');
 $times9 = new Font(9, 'Times new Roman');
 $arial14 = new Font(14, 'Arial', '#0077aa');
//defino el formato de los parrafos
 $parF = new ParFormat();
//creo el objeto rtf
 $rtf = new Rtf();
//borders
//cabecera de las paginas
 $header = &$rtf->addHeader('all');
 $header->addImage('/var/www/wiki/icasus/theme/usevilla/logo.jpg', $null);
 $header->writeText('<tab>Cuadro de mando '.$cuadro->nombre.'<tab><chdate>', new Font(), new ParFormat('right'));
//Creo la seccion
 $sect = &$rtf->addSection();
//Configuracion de la seccion creada para mostrar en word y tamaño pagina
//$sect->setIndentLeft(5);
 $sect->setPaperWidth(21);
 $sect->setPaperHeight(29.5);
 $marginTop = 2;
 $marginBottom = 2;
 $marginLeft = 3;
 $marginRight = 3;
 $sect->setMargins($marginLeft, $marginTop, $marginRight, $marginBottom);

//empezamos a volcar el cuadro de mando
 foreach ($indicadores as $elemento){
/*
//añmos la tablaa y su margen izq
$table = &$sect->addTable();
//añr filas a la tabla
$table->addRow(1);
$table->addRow(1);
$table->addRow(1);
$table->addRow(1);
$table->addRow(1);
//$table->addColumnsList(array(1));
$table->writeToCell(1,1,'1gagag',new Font(), new ParFormat());
$table->writeToCell(2,1,'2gagag',new Font(), new ParFormat());
$table->writeToCell(2,1,'3gagag',new Font(), new ParFormat());
$table->writeToCell(3,1,'4gagag',new Font(), new ParFormat());
$table->writeToCell(4,1,'5gagag',new Font(), new ParFormat());*/

   $sect->writetext('<br /><br />');
   $sect->writetext('<strong>'.$elemento->codigo.'   '.$elemento->nombre.'  </strong><br /><br />',$arial14, $null);
   $sect->writetext('<strong>Proceso:      </strong>'.$elemento->proceso->nombre.'<br />');
   $sect->writetext('<strong>Descripción:  </strong>'.$elemento->descripcion.'<br />');
   $sect->writetext('<strong>Formulación:  </strong>'.$elemento->formulacion.'<br />');
   $sect->addImage('/var/www/wiki/icasus/theme/usevilla/leyenda500.png',$null);
   $sect->addImage('/var/www/wiki/icasus/'.$elemento->ruta_imagen,$null);
   $sect->writetext('<br /><br />');
 }
 if ($cuadro->comentarios)
 {
   $sect->writeText('<strong>Comentarios:       </strong><br /><tab>'.$cuadro->comentarios.'<br />');
 }
 $footer = &$rtf->addFooter('all');
 $footer->writeText('Informe generado por ICASUS 0.5<tab><tab>pagina <pagenum>',new Font(), new ParFormat('right'));
 $rtf->sendRtf('cuadro_'.$id);
}
else
{
	//Si se llama a esta pagina si un id de cuadro se redirecciona al listado
	header('Location:index.php?page=cuadro_listar');	
}
?>
