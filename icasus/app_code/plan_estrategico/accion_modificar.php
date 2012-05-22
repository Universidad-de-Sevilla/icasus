<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://forja.rediris.es/project/icasus/)
// Archivo: accion_crear.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es) y Jesús Martín (jjmc@us.e
//---------------------------------------------------------------------------------------------------
// Descripcion: Modifica una Accion para un objetivo de una Linea del Plan Funcional de la Direccion de RR.HH.
//---------------------------------------------------------------------------------------------------
global $smarty;
global $basedatos;
global $operario;
global $nombre_pagina;
global $plantilla;


$smarty->assign('_javascript' , array('admin','calendario','select'));
$smarty-> assign('plan',true);
$id_entidad=sanitize($_GET['id_entidad'],2);
$id=sanitize($_GET['id'],2);


function cambiafecha($fecha){
        ereg( "([0-9]{1,2})-([0-9]{1,2})-([0-9]{2,4})", $fecha, $mifecha);
        $lafecha=$mifecha[3]."-".$mifecha[2]."-".$mifecha[1];
        return $lafecha;
        }


	
if (isset($_POST["modaccion"]) && $_POST["modaccion"]=='modaccion')
        {
		$fecha = sanitize($_POST["fecha"],2);
		$fecha = cambiafecha($fecha);
                
		$accion = new accion();
                $accion->load('id='.$id);

                //crear un objeto o instanciar la clase
                //$accion = new accion();

		$accion->meta=sanitize($_POST["meta"],2);
		$accion->id_entidad=$id_entidad;
                $accion->responsable=sanitize($_POST["responsable"],2);
                $accion->fecha=cambiafecha($fecha);
                $accion->plazo=sanitize($_POST["plazo"],2);
                $accion->idorden=sanitize($_POST["orden"],2);
                $accion->titulo=sanitize($_POST["titulo"],2);
                $accion->descripcion=sanitize($_POST["descripcion"],2);
                $accion->fecham=date('Y-m-j');
                //$accion->estado=$estado;
                $accion->estado=1;
                $accion->idobjetivo=sanitize($_POST["objetivo"],2);
                $accion->fecha=$fecha;
                $adodb->execute("SET NAMES utf8");
                $accion->save();
                //leo el registro que acabo de insertar
                //lo paso a smarty
                $smarty->assign('accionmodificada',$accion);
		$smarty->assign('okanuncio','<h3>Se ha modificado correctamente la Accion</h3>');
		$plantilla='plan_estrategico/verificar.tpl';
                }
                else
                {
		$rs=$adodb->execute("
		SELECT linea.id AS idlinea, objetivo.id AS idobjetivo, accion.id,
		linea.titulo AS tituloli, objetivo.titulo AS tituloob, accion.titulo,
		accion.estado , accion.fechac , accion.fecham , accion.descripcion,
		accion.meta, accion.plazo, accion.responsable, accion.fecha, accion.id_entidad,accion.idorden
		FROM (accion LEFT JOIN objetivo ON accion.idobjetivo = objetivo.id)
		LEFT JOIN linea ON objetivo.idlinea = linea.id WHERE accion.id ='$id'");
		$smarty->assign('accion',$rs->fields);
		$idlinea=$rs->fields['idlinea'];
                $smarty->assign('linea',$adodb->getall("SELECT * FROM linea WHERE estado=1 AND id_entidad=$id_entidad"));
                $smarty->assign('objetivo',$adodb->getall("SELECT * FROM objetivo WHERE idlinea=$idlinea"));
                $plantilla='plan_estrategico/accion_modificar.tpl';
      }
?>
