<?php

/* --------------------------------------------------------------------------
  Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
  Archivo: public/index.php
  Desarrolladores: Juanan Ruiz <juanan@us.es>, Jesús Martin <jjmc@us.es>,
  Joaquín Valonero Zaera (tecnibus1@us.es)
  --------------------------------------------------------------------------
  Descripción: Esta es la página que carga a todas las demás en su seno maternal
  --------------------------------------------------------------------------
 */

// Esto es para que se vean los errores comentar en producción
ini_set('display_errors', '1');
error_reporting(E_ALL & ~E_DEPRECATED);

require_once('../app_code/app_config.php');
require_once('../app_code/app_version.php');
require_once('../../cascara_core/adodb5/adodb.inc.php');
require_once('../../cascara_core/adodb5/adodb-active-record.inc.php');
require_once('../../cascara_core/smarty/Smarty.class.php');

//Fichero de idioma
require_once('../app_code/' . IC_LANG_FILE);

// Carga las clases necesarias automaticamente
spl_autoload_register('__autoload');

function __autoload($class_name)
{
    //Cargamos las entidades (mapean tablas de la bd)
    if (file_exists('../app_code/entity/' . $class_name . '.php'))
    {
        require_once('../app_code/entity/' . $class_name . '.php');
    }

    //Cargamos lógica
    if (file_exists('../app_code/logic/' . $class_name . '.php'))
    {
        require_once('../app_code/logic/' . $class_name . '.php');
    }

    //Cargamos clases de utilidades
    if (file_exists('../app_code/util/' . $class_name . '.php'))
    {
        require_once('../app_code/util/' . $class_name . '.php');
    }
}

// Conectamos a los datos con ADODB y ActiveRecord 
$dsn = 'mysqli://' . IC_DB_LOGIN . ':' . IC_DB_CLAVE . '@' . IC_DB_HOST . '/' . IC_DB_DATABASE;
$adodb = NewADOConnection($dsn);
ADOdb_Active_Record::SetDatabaseAdapter($adodb);

$adodb->Execute("SET NAMES UTF8");

date_default_timezone_set('Europe/Madrid');
setlocale(LC_ALL, 'es-ES');

// Variables globales
$smarty = new Smarty();
$usuario = new Usuario();
$plantilla = '';

// Configuramos parámetros $smarty
$smarty->template_dir = '../app_code/control';
$smarty->compile_dir = '../templates_c';
$smarty->config_dir = '../configs';
$smarty->cache_dir = '../cache';
//Descomentar en producción
//$smarty->setCaching(Smarty::CACHING_LIFETIME_CURRENT);
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

//Página solicitada
$page = "inicio"; //por defecto
if (filter_has_var(INPUT_GET, 'page'))
{
    $page = filter_input(INPUT_GET, 'page', FILTER_SANITIZE_STRING);
}

//Si se ha iniciado sesión y no estamos en mantenimiento
if (isset($_SESSION['usuario']) && IC_TIPO_LOGIN != 'mantenimiento')
{
    //Variable global que almacena el usuario
    $usuario = $_SESSION['usuario'];
    $smarty->assign('_usuario', $usuario);

    $entidad = new Entidad();
    $plan = new Plan();
    $carta = new Carta();
    $proceso = new Proceso();
    $indicador = new Indicador();
    $cuadro = new Cuadro();

    //Unidad actual
    $id_entidad = 1; //por defecto
    if (filter_has_var(INPUT_GET, 'id_entidad'))
    {
        $id_entidad = filter_input(INPUT_GET, 'id_entidad', FILTER_SANITIZE_NUMBER_INT);
    }

    if ($entidad->load("id = $id_entidad"))
    {
        //Cantidad de planes, cartas, procesos, indicadores y cuadros de mando de la unidad
        $planes = $plan->Find("id_entidad = $id_entidad ORDER BY anyo_inicio DESC");
        $smarty->assign('num_planes', count($planes));

        $cartas = $carta->Find("id_entidad = $id_entidad");
        $smarty->assign('num_cartas', count($cartas));

        $procesos = $proceso->Find("id_entidad = $id_entidad ORDER BY codigo");
        $smarty->assign('num_procesos', count($procesos));

        $indicadores = $indicador->Find("id_entidad = $id_entidad AND archivado IS NULL");
        $smarty->assign('num_indicadores', count($indicadores));

        $cuadros = $cuadro->Find("privado = 0 AND id_entidad = $id_entidad");
        $smarty->assign('num_cuadros', count($cuadros));

        //Guardamos el rol del usuario para la entidad actual
        $logicaUsuario = new LogicaUsuario();
        $rol = $logicaUsuario->getRol($usuario, $id_entidad);
        $smarty->assign('_rol', $rol);

        //Control de unidades:
        $usuario_entidad = new Usuario_entidad();
        $control = $usuario_entidad->comprobar_responsable_entidad($usuario->id, $id_entidad);
        $smarty->assign('_control', $control);
    }
    else
    {
        $error = ERR_UNID_MOSTRAR;
        header("location:index.php?page=error&error=$error");
    }

    // Entidades de este usuario
    $smarty->assign('num_entidades_usuario', count($usuario->entidades));

    // Procesos propiedad del usuario
    $procesos_propios = $proceso->Find("id_propietario=$usuario->id");
    $smarty->assign('num_procesos_propios', count($procesos_propios));

    // Indicadores bajo la responsabilidad de este usuario
    $indicadores_propios = $indicador->Find("(id_responsable = $usuario->id OR id_responsable_medicion = $usuario->id) AND archivado IS NULL");
    $smarty->assign("num_indicadores_propios", count($indicadores_propios));

    // Cuadros de mando propios del usuario
    $cuadros_propios = $cuadro->Find("id_usuario = $usuario->id");
    $smarty->assign('num_cuadros_propios', count($cuadros_propios));

    // Objetivos operacionales bajo la responsabilidad de este usuario
    $objop = new ObjetivoOperacional();
    $objops_propios = $objop->Find("id_responsable = $usuario->id");
    $smarty->assign('num_objops_propios', count($objops_propios));
}
//Si no se ha iniciado sesión cargamos la página de login
else
{
    $page = IC_TIPO_LOGIN;
}

//Recorremos los directorios de la aplicación
$directorios = new DirectoryIterator("../app_code/control/");
$nombre_modulo = NULL;
foreach ($directorios as $dir)
{
    if (file_exists("../app_code/control/" . $dir->getFilename() . "/$page.php"))
    {
        $nombre_modulo = $dir->getFilename();
        break;
    }
}

//Carga de la página solicitada
if ($nombre_modulo)
{
    require_once("../app_code/control/" . $nombre_modulo . "/$page.php");
}
else
{
    $smarty->assign('error', ERR_404 . " $page");
    require_once("../app_code/control/errores/error.php");
}

//Comprobamos si hay una petición AJAX
$ajax = false;
if (filter_has_var(INPUT_GET, 'ajax'))
{
    $ajax = filter_input(INPUT_GET, 'ajax', FILTER_VALIDATE_BOOLEAN);
}
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
