<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://forja.rediris.es/project/icasus/)
// Archivo: accion_crear.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es) y Jesus Martin (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Modificar un Objetivo para una Linea del Plan Funcional de la Direccion de RR.HH.
//---------------------------------------------------------------------------------------------------

global $smarty;
global $basedatos;
global $operario;
global $nombre_pagina;
global $plantilla;


$smarty-> assign('plan',true);
$id_entidad=sanitize($_GET['id_entidad'],2);
$id=sanitize($_GET['id'],2);

if (isset($_POST["modobjetivo"]) && $_POST["modobjetivo"]=='modobjetivo')
        {
                //crear un objeto o instanciar la clase
                //$linea = new linea();
		$objetivo = new Objetivo();
		$objetivo->load('id='.$id);

                $objetivo->idorden=sanitize($_POST["orden"],2);
                $objetivo->id_entidad=$id_entidad;
                $objetivo->titulo=sanitize($_POST["titulo"],2);
                //$objetivo->estado=$estado;
                $objetivo->estado=1;
                $objetivo->descripcion=sanitize($_POST["descripcion"],2);
                $objetivo->fecham=date('Y-m-j');
                $adodb->execute("SET NAMES utf8");
                $objetivo->save();
        	$objetivo->load('$id=$adodb->insert_id()');
		//leo el registro que acabo de insertar

		$smarty->assign('objetivomodificado',$objetivo);
                $smarty->assign('okanuncio','<h3>Se ha modificado correctamente el Objetivo Estrat&eacute;gico</h3>');
                $plantilla='plan_estrategico/verificar.tpl';
          }
          else
          {
		$rs=$adodb->execute("SELECT * FROM objetivo WHERE id=$id");		
		$smarty->assign('objetivo',$rs->fields);
		$smarty->assign('linea',$adodb->getall("SELECT * FROM linea WHERE estado=1 AND id_entidad=$id_entidad"));
                $plantilla='plan_estrategico/objetivo_modificar.tpl';
          }
?>
