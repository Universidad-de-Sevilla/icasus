<?php
include_once('../config.php');

include_once('../lib/adodb5/adodb.inc.php');
include_once('../lib/adodb5/adodb-active-record.inc.php');

$entidad=$_GET['entidad'];

$db = NewADOConnection('mysql://'.IC_DB_LOGIN.':'.IC_DB_CLAVE.'@'.IC_DB_HOST.'/'.IC_DB_DATABASE);
ADOdb_Active_Record::SetDatabaseAdapter($db);

//consulta para bombre de unidad
$nombre_entidad=$db->execute('SELECT id_entidad, nombre FROM entidad WHERE id_entidad='.$id_entidad);
$nombre_entidad=$nombre_entidad->fields['nombre'];

$rs=$db->getall("SELECT linea.titulo AS lineati, objetivo.titulo AS objetivoti, accion.titulo AS accionti ,linea.idorden AS lineaord,objetivo.idorden AS objetivoord ,accion.idorden AS accionord
FROM indicador RIGHT JOIN (accion RIGHT JOIN (objetivo RIGHT JOIN linea ON objetivo.idlinea = linea.id) ON accion.idobjetivo = objetivo.id) ON indicador.id_accion = accion.id WHERE accion.estado=1 AND accion.id_entidad='".$id_entidad."' ORDER BY lineaord");

header('Content-type: application/msword');
header('Content-Disposition: inline; filename=ejemplo.rtf'); 

/*  Comenzamos a armar el documento  */
$output="{\\rtf1\ansicpg850";
$output.="{\\fs48 Plan Funcional de ".utf8_decode($nombre_entidad)."} \par \par";
$linea_anterior=" ";
$objetivo_anterior=" ";
foreach ($rs as $elem) {
if ($linea_anterior!=$elem[0])
{
$output.="\par {\b ".$elem[3].'.-'.$elem[0]."}";
}

if ($objetivo_anterior!=$elem[1])
{
$output.="\par \pard\li1440\par \pard\li720\b0 {".$elem[3].'.'.$elem[4].'.-'.$elem[1]."} \par ";
}
$output.="\par \pard\li1440 {".$elem[3].'.'.$elem[4].'.'.$elem[5].'.-'.$elem[2]."}\par \pard ";

$linea_anterior=$elem[0];
$objetivo_anterior=$elem[1];
}
//$output.="{\*\shppict {\pict \pngblip cache/indicador29.png }}{\nonshppict {\pict}}";

$output.="}";
echo $output;
?>

