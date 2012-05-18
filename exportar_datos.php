<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: exportar_datos.php
// Tipo: procesa datos e interfaz de usuario
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Prepara datos y genera ficheros cvs para exportar indicadores 
// y valores a otras aplicaciones
//---------------------------------------------------------------------------------------------------

include_once("includes.php");

// Comprueba que el usuario ha iniciado sesion y que vienen las variables necesarias
if ( !isset($_SESSION["usuario"]) OR !isset($_GET["identificador"]) OR !isset($_GET["tipo_datos"])) {
	header ("Location: index.php?aviso=Debe iniciar sesión");
	}

// Variables que vienen de la pagina anterior
$identificador = $_GET["identificador"]; 
$tipo_datos = $_GET["tipo_datos"];

switch ($tipo_datos) {
    case "indicadores":
        $entidad = new entidad($base_datos);
        $entidad->obtener_datos($identificador);
        $datos = $entidad->listar_indicadores();
        break;
    
    case "valores":
        $indicador = new indicador($base_datos);
        $indicador->obtener_datos($identificador);
        $datos = $indicador->listar_valores($identificador);
        break;
    }

$cvs = new cvs($ic_dir_base);
$cvs->exportar_datos($datos, $tipo_datos, $identificador);
//$fichero_cvs = $cvs->obtener_ruta_fichero();
        
$comandos = $ic_cmd_indicadores . $ic_cmd_entidades;
$nombre_pagina = "Exportar datos";

// Comienzo a desplegar codigo html
include_once ("inc_cabecera.php"); 

print ("<h3><img src='iconos/page_white_go.gif'> ".$nombre_pagina."</h3>");
print ("<h4>Los datos se han exportado correctamente: <a href='" . $cvs->obtener_url_fichero() . "'><img src='iconos/page_save.gif'/> descargar fichero</a></h4>" );
print ("<p>El fichero <b>csv</b> generado puede abrirse con <a href='http://es.openoffice.org/'>Open Office</a>, Microsoft Office o cualquier otro programa de ofimática</p>");
include_once ("clase_base_datos.php");
include_once ("inc_pie.php"); 

$base_datos->desconectar();
?>
