<?php
//--------------------------------------------------------------------------
// Proyecto: Forpax - Responsable
// Archivo: app_code/robot_hominis.php
//--------------------------------------------------------------------------
// Scripta para realizar un volcado de hominis a la tabla persona
//--------------------------------------------------------------------------
include_once('../app_code/app_config.php');
include_once('../../cascara_core/lib/adodb5/adodb.inc.php');
include_once('../../cascara_core/lib/adodb5/adodb-active-record.inc.php');
require_once("../../cascara_core/lib/phpExcel/PHPExcel/Reader/Excel5.php");
require_once("../class/usuario.php");
//include("../../cascara_core/lib/phpExcel/PHPExcel/IOFactory.php");

$adodb = NewADOConnection('mysql://'.IC_DB_LOGIN.':'.IC_DB_CLAVE.'@'.IC_DB_HOST.'/'.IC_DB_DATABASE);
ADOdb_Active_Record::SetDatabaseAdapter($adodb);


//$objReader = PHPExcel_IOFactory::createReaderForFile("DAT_EXC.xls");
$objReader = new PHPExcel_Reader_Excel5();
$objReader->setReadDataOnly(true);
//$objPHPExcel = $objReader->load("DAT_EXC.xls");
$objPHPExcel = $objReader->load("hominis_files/hominis.xls");
//$celda = $objPHPExcel->getActiveSheet()->getCell('A8')->getValue();

$objWorksheet = $objPHPExcel->getActiveSheet();

$usuario = new usuario();
$db = $usuario->DB();

$query = "DELETE FROM hominis;";
$db->Execute($query);

$query = "";

$primera_fila = true;
foreach ($objWorksheet->getRowIterator() as $row)
{
  if ($primera_fila == false)
  {
    $query .= ";";
  }
  else
  {
    $primera_fila = false;
  }
  $query .= "INSERT INTO hominis ([NIF],[APELLIDOS Y NOMBRE],[CCE],[DESC_CCE],[GRUPO], [NIVEL], [TRJ], [DESC_TRJ], [SIT_ADVA], [DESC_SITADVA], [PLAZA], [DES_PLAZA], [NRPT], [SUBUNIDAD], [UNIDAD], [CENTRO DE DESTINO], [NOMBRE], [APELLIDOS]) VALUES (";
  $cellIterator = $row->getCellIterator();
  $cellIterator->setIterateOnlyExistingCells(false); // This loops all cells, even if it is not set. 
                                                     // By default, only cells that are set will be iterated.
  foreach ($cellIterator as $cell) 
  {
    $celda = $cell->getValue();
    $columna = $cell->getColumn();
    // Hay un par de columnas que necesitan un tratamiento previo
    if ($columna == 'A')
    {
      $celda = str_replace('-', '', $celda);
    }
    elseif ($columna == 'B')
    {
     $apellidos_nombre = explode(', ', $celda); 
     $apellidos = utf8_decode($apellidos_nombre[0]);
     $nombre = utf8_decode($apellidos_nombre[1]);
     $query .= ",";
    }
    else
    {
      $query .= ",";
    }
    $celda = utf8_decode($celda);
    $query .= "'$celda'";
  }
  $query .= ",'$nombre','$apellidos')";
  
}
$query .= ";";
//echo ($query);
if ($db->Execute($query))
{
  //$query4 = "SELECT * FROM persona WHERE persona.unidad IS NOT NULL AND persona.unidad <> '' AND persona.nif NOT IN (SELECT nif FROM hominis);";

 
  // Insertamos nuevas personas en la tabla persona desde la tabla hominis
  $query1 = "INSERT INTO persona ( nif, apellidos, nombre, codigo_cce, descripcion_cce, grupo, nivel, t_r_juridico, situacion_admin, codigo_plaza, puesto_trabajo, codigo_rpt, subunidad, unidad, centro_destino ) SELECT NIF, APELLIDOS, NOMBRE, CCE, DESC_CCE, GRUPO, NIVEL, TRJ, DESC_SITADVA, PLAZA, DES_PLAZA, NRPT, SUBUNIDAD, UNIDAD, [CENTRO DE DESTINO] FROM hominis WHERE (NIF Not In (SELECT nif FROM persona));";
  if ($db->Execute($query1))
  {
    $mensaje .= "Personas nuevas agregadas\n";
  }
  
  // Modificar datos de personas existentes (están en activo pero han cambiado de plaza)
  $query2 = "UPDATE persona SET persona.apellidos = hominis.apellidos, persona.nombre = hominis.nombre, persona.descripcion_cce = hominis.DESC_CCE, persona.codigo_cce = hominis.CCE, persona.grupo = hominis.grupo, persona.nivel = hominis.nivel, persona.puesto_trabajo = hominis.des_plaza, persona.codigo_rpt = hominis.NRPT, persona.subunidad = hominis.subunidad, persona.unidad = hominis.unidad, persona.centro_destino = hominis.[centro de destino], persona.t_r_juridico = hominis.trj, persona.situacion_admin = hominis.desc_sitadva, persona.codigo_plaza = hominis.plaza FROM persona INNER JOIN hominis ON persona.nif = hominis.nif;";
  if ($db->Execute($query2))
  {
    $mensaje .= "Personas existentes modificadas\n";
  }
  
  // Dejamos en blanco los campos relativos a la plaza de personas que cesan actividad
  $query3 = "UPDATE persona SET persona.descripcion_cce = '', persona.codigo_cce = '', persona.grupo = '', persona.nivel = '', persona.puesto_trabajo = '', persona.codigo_rpt = '', persona.subunidad = '', persona.unidad = '', persona.centro_destino = '', persona.t_r_juridico = '', persona.situacion_admin = '', persona.codigo_plaza = '', persona.telefono_trabajo = '', persona.turno = '', persona.validador2 = '', persona.validador1 = '' WHERE (((persona.nif) Not In (SELECT nif FROM hominis)));";
  if ($db->Execute($query3))
  {
    $mensaje .= "Personas cesadas con plazas en blanco\n";
  }
}
else
{
  $mensaje = "No se han podido grabar los datos en la tabla hominis o falló al leer fichero Excel";
}
echo $mensaje;
