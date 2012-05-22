<?php 
//---------------------------------------------------------------------------------------------------
// Proyecto Icasus (http://wiki.us.es/icasus/)
// Archivo: index.php
// Desarrolladores: Juanan Ruiz <juanan@us.es>, Jesús Martin <jjmc@us.es>
//---------------------------------------------------------------------------------------------------
// Descripcion: Esta es la página que carga a todas las demas en su seno maternal 
//---------------------------------------------------------------------------------------------------
// Esto es para que se vean los errores
//ini_set('display_errors', '1');
//error_reporting(E_ALL);

//header("location:http://leia.sav.us.es/icasus");

include_once ('config.php');
include_once('lib/adodb5/adodb.inc.php');
include_once('lib/adodb5/adodb-active-record.inc.php');
include_once('lib/smarty/Smarty.class.php');
include_once('function/sanitize.php');
include_once('function/caracteres.php');
// TODO: Quizás las dos de abajo podrían ponerse sólo en las que lo necesiten
include_once('lib/phprtflite/rtf/Rtf.php');
include_once('lib/phpExcel/PHPExcel.php');

// Carga las clases necesarias
function __autoload($class_name) 
{
	if (file_exists('class/'.$class_name.'.php'))
	{	
		require_once('class/'.$class_name.'.php');
	}
}

// Variables globales
$smarty = new Smarty();
//$smarty->cache = false; 
$smarty->template_dir = '.'; 
$smarty->compile_dir = 'templates_c'; 
$smarty->config_dir = 'configs'; 
$smarty->cache_dir = 'cache'; 

//Versión actual de icasus
$smarty->assign('_version', '1.0');
$smarty->assign('_revision', '272');
//$smarty->assign('_revision', '249');

// Conexion a la base de datos con la clase basedatos 
// Las constantes vienen de config.php
$basedatos = new basedatos(IC_DB_HOST,IC_DB_LOGIN,IC_DB_CLAVE,IC_DB_DATABASE); 
// Utilizaremos ADODB y ActiveRecord en los nuevos modulos del proyecto
$adodb = NewADOConnection('mysql://'.IC_DB_LOGIN.':'.IC_DB_CLAVE.'@'.IC_DB_HOST.'/'.IC_DB_DATABASE);
ADOdb_Active_Record::SetDatabaseAdapter($adodb);
$plantilla = '';

// Crea una sesión con un identificador encriptado para evitar ataques
$session_key = substr(md5(IC_DIR_BASE), 0, 8);
@session_name('IC_SESSID' . $session_key);
@ini_set('url_rewriter.tags', '');
@ini_set('session.use_trans_sid', 0);
if(!@session_id())
{
    //Trans SID sucks also...
    @ini_set('url_rewriter.tags', '');
    @ini_set('session.use_trans_sid', 0);
	//@ini_set("session.cookie_lifetime", 10);
	//@ini_set("session.gc_maxlifetime",10);
    @session_start();
}
session_start();
// Hay que haber iniciado sesión y haber pedido pagina
if (isset($_GET['page']) && isset($_SESSION['usuario'])) 
{
	$page = sanitize($_GET['page'],2);
	$id_usuario_url = sanitize($_GET['id_usuario'],2);
	// Si viene id_entidad le asignamos su valor, si no, asignamos cero.
	$id_entidad = isset($_REQUEST['id_entidad'])?sanitize($_REQUEST['id_entidad'],16):0;
	$operario = new usuario($basedatos);
	$operario = $_SESSION['usuario'];
	// Al pasar $operario a una variable de sesion pierde la conexion de la base de datos, asi la recuperamos.
	$operario->database = $basedatos;
	$smarty->assign('_operario',$operario->datos);
	// Comprueba si el operario tiene permiso para realizar esta acción
//	if (! $operario->autorizar($page, $id_entidad, $operario->id_usuario))
	if (! $operario->autorizar($page, $id_entidad, $operario->id_usuario, $id_usuario_url))
	{
		$smarty->assign('error', 'No tiene permisos para realizar esta acción');
		$page = "error";
	}
}
else
{
	// Si no se ha pedido ninguna página o no se ha iniciado sesión cargamos la de login  
	$page = 'login';
}

// Carga la página solicitada ($_GET['page']) o la pagina por defecto ('login' en nuestro caso)
if(file_exists($page . '.php'))
{
	require_once($page.'.php');
}
else
{
	$smarty->assign('error' ,  "<b>Error 404</b>: no encontramos la página que ha solicitado."); 
	$plantilla = "error.tpl";
}
// Llama a las tres plantillas que conforman la página html
$smarty->display('theme/'.IC_THEME.'/cabecera.tpl'); 
$smarty->display($plantilla);
$smarty->display('theme/'.IC_THEME.'/piecera.tpl'); 
?>
