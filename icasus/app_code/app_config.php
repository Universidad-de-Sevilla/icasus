<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (https://gestionproyectos.us.es/projects/r2h2-icasus)
// Archivo: app_config.php
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Variables globales para el proyecto icasus
// Modifica este archivo para que se ajuste a tus necesidades concretas.
//---------------------------------------------------------------------------------------------------

// Todas las constantes declaradas en este fichero empiezan 
// por IC (de icasus) para denotar su caracter global a toda la aplicación

//Entorno de desarrollo
//Conexion a la base de datos
define('IC_DB_HOST','localhost');
define('IC_DB_LOGIN','icasus_bbtk');
define('IC_DB_CLAVE','icasusdesarrollo2012');
define('IC_DB_DATABASE','icasus_bbtk');
//La autenticación en desarrollo es de tipo básico
//define('IC_TIPO_LOGIN', 'login_basico');
define('IC_TIPO_LOGIN', 'login_sso');
//Directorios
define('IC_DIR_BASE','/home/jjmc/www/icasus/');

/*
//Entorno de produccion
//Conexion a la base de datos
define('IC_DB_HOST','localhost');
define('IC_DB_LOGIN','icasus');
define('IC_DB_CLAVE','poner_clave');
define('IC_DB_DATABASE','icasus');
//La autenticación en desarrollo es de tipo básico
define('IC_TIPO_LOGIN', 'login_ldap');
//Directorios
define('IC_DIR_BASE','/var/www/icasus/');
*/

// Tema que vamos a utilizar para definir la apariencia del sitio
define('IC_THEME', 'usevilla');


?>
