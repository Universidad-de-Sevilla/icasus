<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://forja.rediris.es/project/icasus/)
// Archivo: exportar_inf_ejecutivo.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es) y Jesús Martín (jjmc@us.e
//---------------------------------------------------------------------------------------------------
// Descripcion: Exporta a rtf el informe ejecutivo.
//---------------------------------------------------------------------------------------------------

$id_entidad=$_GET['id_entidad'];

$db = NewADOConnection('mysql://'.IC_DB_LOGIN.':'.IC_DB_CLAVE.'@'.IC_DB_HOST.'/'.IC_DB_DATABASE);
ADOdb_Active_Record::SetDatabaseAdapter($db);

//consulta para bombre de unidad
$nombre_entidad=$db->execute('SELECT id_entidad, nombre FROM entidad WHERE id_entidad='.$id_entidad);
$nombre_entidad=$nombre_entidad->fields['nombre'];

$rs=$db->getall("SELECT linea.titulo AS lineati, objetivo.titulo AS objetivoti, accion.titulo AS accionti ,linea.idorden AS lineaord,objetivo.idorden AS objetivoord ,accion.idorden AS accionord, accion.responsable AS accionres, accion.meta AS accionmeta, accion.plazo AS accionplazo
FROM indicador RIGHT JOIN (accion RIGHT JOIN (objetivo RIGHT JOIN linea ON objetivo.idlinea = linea.id) ON accion.idobjetivo = objetivo.id) ON indicador.id_accion = accion.id WHERE accion.estado=1 AND accion.id_entidad='".$id_entidad."' ORDER BY lineaord,objetivoord ");

$null = null;

//defino los tips de letra
$times12 = new Font(13, 'Times new Roman');
$times9 = new Font(9, 'Times new Roman');
$arial14 = new Font(14, 'Arial', '#000066');
//defino el formato de los parrafos
$parF = new ParFormat();
//creo el objeto rtf
$rtf = new Rtf(); 

$header = &$rtf->addHeader('all');
$header->addImage('/var/www/wiki/icasus/theme/usevilla/logo.jpg', $null);
$header->writeText('<tab>Plan Funcional de '.$nombre_entidad.'<tab><chdate>', new Font(), new ParFormat('right'));

$sect = &$rtf->addSection();
$sect->setPaperWidth(21);
$sect->setPaperHeight(29.5);

//$sect->setIndentLeft(5);	
$marginTop = 2;
$marginBottom = 2;
$marginLeft = 3;
$marginRight = 3;
$sect->setMargins($marginLeft, $marginTop, $marginRight, $marginBottom);

$linea_anterior=" ";
$objetivo_anterior=" ";
foreach ($rs as $elem){
	if ($linea_anterior!=$elem[0])
        {
	$valor=utf8_encode($elem[0]);
	$sect->writeTextjjmc('<borrarp><b>'.$elem[3].".- ".$valor.'</b>',$null, $null); 
        }
	if ($objetivo_anterior!=$elem[1])
        {
        $valor=utf8_encode($elem[1]);
        $sect->writeTextjjmc('<tab>'.$elem[3].".".$elem[4].".- ".$valor,$null, $null);
	}
$valor=utf8_encode($elem[2]);
//añmos la tablaa y su margen izq
$table = &$sect->addTable();
$table->setLeftPosition(3);
//añr filas a la tabla
$table->addRow(1);
$table->addRow(-0.1);
$table->addRow(0.8);
$table->addRow(-0.1);
$table->addRow(0.8);
$table->addRow(-0.1);
$table->addRow(0.8);
$table->addRow(-0.1);
$table->addRow(0.5);
$table->addColumnsList(array(3.2,0.1,3,0.1,10));
$table->setVerticalAlignmentOfCells('center', 1, 1, 9, 5);
$table->mergeCells(1, 2, 1, 5);
//datos de la tabla
$elem[6]=utf8_encode($elem[6]);
$elem[7]=utf8_encode($elem[7]);
$elem[8]=utf8_encode($elem[8]);
$table->writeToCell(1,2,'<b>'.$elem[3].".".$elem[4].".".$elem[5].".- </b>".$valor, new Font(), new ParFormat());
$table->writeToCell(3,3,'<b>Responsable :</b>',new Font(), new ParFormat());
$table->writeToCell(5,3,'<b>Meta</b> :',new Font(), new ParFormat());
$table->writeToCell(7,3,'<b>Plazo</b> :',new Font(), new ParFormat());
$table->writeToCell(3,5,' '.$elem[6],new Font(), new ParFormat());
$table->writeToCell(5,5,' '.$elem[7],new Font(), new ParFormat());
$table->writeToCell(7,5,' '.$elem[8],new Font(), new ParFormat());
//bordes de la tabla
$table->setBordersOfCells(new BorderFormat(1, "#ffffff"),1,1,9,5);
$table->setBordersOfCells(new BorderFormat(1, "#0077aa"),1,1,1,5,0,1,0,0);
$table->setBordersOfCells(new BorderFormat(1, "#0077aa"),1,1,9,1,1,0,0,0);
$table->setBordersOfCells(new BorderFormat(1, "#0077aa"),1,5,9,5,0,0,1,0);
$table->setBordersOfCells(new BorderFormat(1, "#0077aa"),1,2,1,2,0,0,1,0);
$table->setBordersOfCells(new BorderFormat(1, "#0077aa"),9,1,9,5,0,0,0,1);
//bordes de las celdas resaltadas
$table->setBordersOfCells(new BorderFormat(1, "#0077aa"),3,3, 3, 3);
$table->setBordersOfCells(new BorderFormat(1, "#0077aa"),5,3, 5, 3);
$table->setBordersOfCells(new BorderFormat(1, "#0077aa"),7,3, 7, 3);
//fondo de las celdas de datos
$table->setBackgroundOfCells('#eeeeee', 3,5, 3, 5);
$table->setBackgroundOfCells('#eeeeee', 5,5, 5, 5);
$table->setBackgroundOfCells('#eeeeee', 7,5, 7, 5);
$sect->writeText(' ', new Font(), new ParFormat()); 
$linea_anterior=$elem[0];
$objetivo_anterior=$elem[1];

}
$footer = &$rtf->addFooter('all');
$footer->writeText('Informe generado por ICASUS 0.5<tab><tab>pagina <pagenum>',new Font(), new ParFormat('right'));

$rtf->sendRtf('Plan_Ejecutivo');  
?>
