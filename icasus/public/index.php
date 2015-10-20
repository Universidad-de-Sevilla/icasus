<?php

//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: index.php
// Desarrolladores: Juanan Ruiz <juanan@us.es>, Jesús Martin <jjmc@us.es>, 
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Descripción: Esta es la página que carga a todas las demás en su seno maternal 
//--------------------------------------------------------------------------
// Esto es para que se vean los errores
ini_set('display_errors', '1');
error_reporting(E_ALL & ~E_DEPRECATED);

include_once('../app_code/app_config.php');
include_once('../app_code/app_version.php');
include_once('../../cascara_core/lib/adodb5/adodb.inc.php');
include_once('../../cascara_core/lib/adodb5/adodb-active-record.inc.php');
include_once('../../cascara_core/lib/smarty/Smarty.class.php');
include_once('../../cascara_core/function/caracteres.php');

//Retirar cuando todo este bien con la función filter_input de PHP
include_once('../../cascara_core/function/sanitize.php');

//Fichero de idioma
include_once('../app_code/' . IC_LANG_FILE);

// Carga las clases necesarias automaticamente
spl_autoload_register('__autoload');

function __autoload($class_name)
{
    if (file_exists('../class/' . $class_name . '.php'))
    {
        require_once('../class/' . $class_name . '.php');
    }
}

// Conectamos a los datos con ADODB y ActiveRecord 
$dsn = 'mysql://' . IC_DB_LOGIN . ':' . IC_DB_CLAVE . '@' . IC_DB_HOST . '/' . IC_DB_DATABASE;
$adodb = NewADOConnection($dsn);
ADOdb_Active_Record::SetDatabaseAdapter($adodb);

$adodb->Execute("SET NAMES UTF8");

date_default_timezone_set('Europe/Madrid');
setlocale(LC_ALL, 'es-ES');

// Variables globales
$smarty = new Smarty();
$usuario = new Usuario();
$plantilla = '';
$redirige = '';

// Configuramos parámetros $smarty
$smarty->template_dir = '../app_code';
$smarty->compile_dir = '../templates_c';
$smarty->config_dir = '../configs';
$smarty->cache_dir = '../cache';
//$smarty->cache = false;
// Crea una sesión con un identificador encriptado para evitar ataques
$session_key = substr(md5(IC_DIR_BASE), 0, 8);
session_name('IC_SESSID' . $session_key);
ini_set('url_rewriter.tags', '');
ini_set('session.use_trans_sid', 0);
if (!session_id())
{
    //Trans SID sucks also...
    ini_set('url_rewriter.tags', '');
    ini_set('session.use_trans_sid', 0);
    //@ini_set("session.cookie_lifetime", 10);
    //@ini_set("session.gc_maxlifetime",10);
    session_start();
}

$page = filter_input(INPUT_GET, 'page', FILTER_SANITIZE_URL);
if ($page == null || $page == false)
{
    $page = "inicio";
}

if (isset($_SESSION['usuario']))
{
    $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);

    if ($id_entidad == null || $id_entidad == false)
    {
        $id_entidad = 1;
    }
    else
    {
        //Cantidad de procesos, indicadores y datos
        $proceso = new Proceso();
        $procesos = $proceso->Find("id_entidad = $id_entidad ORDER BY codigo");
        $smarty->assign('num_procesos', count($procesos));

        $indicador = new Indicador();
        $indicadores = $indicador->Find("id_entidad = $id_entidad AND id_proceso IS NOT NULL");
        $smarty->assign('num_indicadores', count($indicadores));

        $dato = new Indicador();
        $datos = $dato->Find("id_entidad = $id_entidad AND id_proceso IS NULL");
        $smarty->assign('num_datos', count($datos));
    }

    $usuario = $_SESSION['usuario'];

    //Control de unidades:
    $usuario_entidad = new Usuario_entidad();
    $control = $usuario_entidad->comprobar_responsable_entidad($usuario->id, $id_entidad);

    //Guardamos el rol del usuario para la entidad actual
    $logicaUsuario = new LogicaUsuario();
    $rol = $logicaUsuario->getRol($usuario, $id_entidad);

    $smarty->assign('_rol', $rol);
    $smarty->assign('_control', $control);
    $smarty->assign('_usuario', $usuario);
}
else
{
    // Si no se ha iniciado sesión cargamos la página de login  
    $page = IC_TIPO_LOGIN;
}

// Carga la página solicitada
if (file_exists("../app_code/$page.php"))
{
    require_once("../app_code/$page.php");
}
else
{
    $smarty->assign('error', ERR_404 . " $page");
    require_once("../app_code/error.php");
}

//Comprobamos si hay una petición AJAX
$ajax = filter_input(INPUT_GET, 'ajax', FILTER_VALIDATE_BOOLEAN);
//Si es asi sólo recargaremos la sección afectada
if ($ajax)
{
    $template = $plantilla;
}
else
{
    $smarty->assign("plantilla", $plantilla);
    $template = 'index.tpl';
}
$smarty->display($template);
