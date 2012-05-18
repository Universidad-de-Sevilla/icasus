<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://forja.rediris.es/project/icasus/)
// Archivo: plan_crear.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es) y Jesus Martin (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Crea las Lineas del Plan Funcional de la Direccion de RR.HH.
//---------------------------------------------------------------------------------------------------
global $smarty;
global $basedatos;
global $operario;
global $nombre_pagina;
global $plantilla;

$smarty->assign('_javascript' , array('admin','calendario','selects'));
$smarty->assign('plan',true);
$id_entidad=sanitize($_GET['id_entidad'],2);

if (isset($_POST["crearlinea"]) && $_POST["crearlinea"]=='crearlinea')
{
	$linea = new linea();
	$linea->id_entidad = sanitize($_GET['id_entidad'],2);
	$linea->idorden = sanitize($_POST["orden"],2);
	//$linea->estado = sanitize($_POST["estado"],2);
	$linea->estado = 1;
	$linea->titulo = sanitize($_POST["titulo"],2);
	$linea->descripcion = sanitize($_POST["descripcion"],2);
	$linea->fechac=date('Y-m-d');
	$linea->fecham='0000-00-00';
	$linea->expediente='0';
	$adodb->execute("SET NAMES utf8");
	$linea->save();
	//leo el registro que acabo de insertar
	$linea->load("id = $adodb->insert_id()");
        //lo paso a smarty
        $smarty->assign('lineacreada',$linea);
        $smarty->assign('okanuncio','<h3>Se ha insertado correctamente la L&iacute;nea Estrat&eacute;gica:</h3>');
	$plantilla='plan_estrategico/verificar.tpl';
        }
        else
        {
        $plantilla='plan_estrategico/linea_crear.tpl';
        }  
?>
