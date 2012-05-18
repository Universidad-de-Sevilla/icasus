<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://forja.rediris.es/project/icasus/)
// Archivo: accion_crear.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es) y Jesus Martin (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Modifica una Linea del Plan Funcional de la Direccion de RR.HH.
//---------------------------------------------------------------------------------------------------


global $smarty;
global $basedatos;
global $operario;
global $nombre_pagina;
global $plantilla;


$smarty-> assign('plan',true);
$id_entidad=sanitize($_GET['id_entidad'],2);
$id=sanitize($_GET['id'],2);

$linea = new linea();
$linea->load('id='.$id);
$smarty->assign('linea',$linea);

if (isset($_POST["modlinea"]) && $_POST["modlinea"]=='modlinea')
        {
                $fecham= date('Y-m-j');

                //crear un objeto o instanciar la clase
                $linea->idorden=sanitize($_POST["orden"],2);
                $linea->id_entidad=$id_entidad;
                $linea->titulo=sanitize($_POST["titulo"],2);
                $linea->estado=1;
                $linea->descripcion=sanitize($_POST["descripcion"],2);
                $linea->fecham=$fecham;
                $adodb->execute("SET NAMES utf8");
                $linea->save();
        	$linea->load('$id=$adodb->insert_id()');
		//leo el registro que acabo de insertar

        	$smarty->assign('lineamodificada',$linea);
                //lo paso a smarty
		$smarty->assign('okanuncio','<h3>Se ha modificado correctamente la L&iacute;nea Estrat&eacute;gica</h3>');

                $plantilla='plan_estrategico/verificar.tpl';
         }
         else
        {
                $plantilla='plan_estrategico/linea_modificar.tpl';
        }
?>
