<?php
include_once ('../config.php');
include_once('../lib/adodb5/adodb.inc.php');
include_once('../lib/adodb5/adodb-active-record.inc.php');
include_once('../lib/smarty/Smarty.class.php');
include_once('../function/sanitize.php');


function __autoload($class_name)
{
        if (file_exists('../class/'.$class_name.'.php'))
        {
                require_once('../class/'.$class_name.'.php');
        }
}

// Variables globales
$smarty = new Smarty();
$smarty->template_dir = '../.';
$smarty->compile_dir = '../templates_c';
$smarty->config_dir = '../configs';
$smarty->cache_dir = '../cache';

$adodb = NewADOConnection('mysql://'.IC_DB_LOGIN.':'.IC_DB_CLAVE.'@'.IC_DB_HOST.'/'.IC_DB_DATABASE);
ADOdb_Active_Record::SetDatabaseAdapter($adodb);

//variables recibidas por URL y formulario.
$id_entidad=sanitize($_GET['id_entidad'],2);
$id_linea=sanitize($_GET['id_linea'],2);

//$id_entidad='3';
//$id_linea='1';

//Listar los objetivos de la linea de esta entidad
$objetivo=$adodb->getall("SELECT * FROM objetivo WHERE id_entidad=$id_entidad AND idlinea=$id_linea");

//$objetivo=$adodb->getall("SELECT * FROM objetivo");
//Se envia la lista de objetivos a la plantilla
$smarty->assign('objetivo',$objetivo);
$smarty->display('plan_estrategico/select_dependiente.tpl');
?>
