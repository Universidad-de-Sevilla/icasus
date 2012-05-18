<?php 
//---------------------------------------------------------------------------------------------------
// Proyecto Icasus (http://wiki.us.es/icasus/)
// Archivo: index.php
// Desarrolladores: Juanan Ruiz <juanan@us.es>, Jesús Martin <jjmc@us.es>
//---------------------------------------------------------------------------------------------------
// Descripcion: Esta es la página que carga a todas las demas en su seno maternal 
//---------------------------------------------------------------------------------------------------
// Esto es para que se vean los errores
ini_set('display_errors', '1');
error_reporting(E_ALL);

include_once ('../config.php');
include_once('../lib/adodb5/adodb.inc.php');
include_once('../lib/adodb5/adodb-active-record.inc.php');
include_once('../function/sanitize.php');
require_once('../class/hilo.php');

//id del hilo
$id=sanitize($_GET['id'],2);

// Variables globales
// Utilizaremos ADODB y ActiveRecord en los nuevos modulos del proyecto
$adodb = NewADOConnection('mysql://'.IC_DB_LOGIN.':'.IC_DB_CLAVE.'@'.IC_DB_HOST.'/'.IC_DB_DATABASE);
ADOdb_Active_Record::SetDatabaseAdapter($adodb);

//sumo una nueva visita
$nvisita=new hilo();
$nvisita->load('id='.$id);
echo $nvisita->visitas;
//print_r($visita);
$nvisitas=($nvisita->visitas)+1;
$nvisita->visitas=$nvisitas;
//$nvisita->visitas=$nvisita->visitas+1;
$nvisita->save();

?>
