<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://forja.rediris.es/project/icasus/)
// Archivo: plan_crear.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es) y Jesus Martin (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Crea objetivos para las Lineas del Plan Funcional de la Direccion de RR.HH.
//---------------------------------------------------------------------------------------------------
global $smarty;
global $basedatos;
global $operario;
global $nombre_pagina;
global $plantilla;


$smarty-> assign('plan',true);
$id_entidad=$_GET['id_entidad'];

if (isset($_POST["crearobjetivo"]) && $_POST["crearobjetivo"]=='crearobjetivo')
        {
	//crear un objeto o instanciar la clase
        $objetivo = new Objetivo();
        $objetivo->idorden=sanitize($_POST["orden"],2);
        $objetivo->id_entidad=$id_entidad;
        $objetivo->idlinea=sanitize($_POST["linea"],2);
        $objetivo->titulo=sanitize($_POST["titulo"],2);
        $objetivo->descripcion=sanitize($_POST["descripcion"],2);
        $objetivo->fechac=date('Y-m-d');
        $objetivo->fecham='0000-00-00';
	$objetivo->expediente='0';
        $objetivo->estado=1;
        //$objetivo->estado=$estado;
        $adodb->execute("SET NAMES utf8");
        $objetivo->save();
        //leo el registro que acabo de insertar
        $objetivo->load('$id=$adodb->insert_id()');

        //lo paso a smarty 
        $smarty->assign('objetivocreado',$objetivo);
        $smarty->assign('okanuncio','<h3>Se ha insertado correctamente el Objetivo Estrat&eacute;gico:</h3>');
        $plantilla='plan_estrategico/verificar.tpl';
        }
	else
        {
        $listado=$adodb->getall('SELECT * FROM linea WHERE estado= 1 AND id_entidad='.$id_entidad);
        $smarty->assign('linea',$listado);
	$plantilla='plan_estrategico/objetivo_crear.tpl';
        }  
?>
