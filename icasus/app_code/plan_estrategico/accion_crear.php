<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://forja.rediris.es/project/icasus/)
// Archivo: accion_crear.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es) y Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Crea una Accion para un objetivo de una Linea del Plan Funcional de la Direccion de RR.HH.
//---------------------------------------------------------------------------------------------------
global $smarty;
global $basedatos;
global $operario;
global $nombre_pagina;
global $plantilla;


$smarty->assign('_javascript' , array('admin','calendario','select'));
$smarty-> assign('plan',true);
$id_entidad=sanitize($_GET['id_entidad'],2);
$smarty->assign('id_entidad',$id_entidad);



function cambiafecha($fecha){
        ereg( "([0-9]{1,2})-([0-9]{1,2})-([0-9]{2,4})", $fecha, $mifecha);
        $lafecha=$mifecha[3]."-".$mifecha[2]."-".$mifecha[1];
        return $lafecha;
        }

if (isset($_POST["crearaccion"]) && $_POST["crearaccion"]=='crearaccion')
        {
        $fecha=cambiafecha(sanitize($_POST["fecha"],2));
        //crear un objeto o instanciar la clase
        $accion = new accion();
        $accion->id_entidad=$id_entidad;
        $accion->meta=sanitize($_POST["meta"],2);
        $accion->responsable= sanitize($_POST["responsable"],2);
        $accion->fecha=$fecha;
        $accion->plazo=sanitize($_POST["plazo"],2);
        $accion->idorden=sanitize($_POST["orden"],2);
        $accion->idobjetivo=sanitize($_POST["objetivo"],2);
        $accion->titulo=sanitize($_POST["titulo"],2);
        $accion->descripcion=sanitize($_POST["descripcion"],2);
        $accion->fechac=date('Y-m-d');
        $accion->fecham='0000-00-00';
        $accion->expediente='0';
        $accion->estado='1';
        $adodb->execute("SET NAMES utf8");
        $accion->save();
        //leo el registro que acabo de insertar
        $accion->load('$id=$adodb->insert_id()');
        //Muestra el resultado de la insercion
        $smarty->assign('accioncreada',$accion);
        $smarty->assign('okanuncio','<h3>Se ha insertado correctamente la Acci&oacute;n</h3>');
        $plantilla='plan_estrategico/verificar.tpl';
        }
        else
        {
        $smarty->assign('linea',$adodb->getall("SELECT * FROM linea WHERE estado=1 AND id_entidad=$id_entidad ORDER BY idorden "));
        $smarty->assign('objetivo',$adodb->getall("SELECT * FROM objetivo WHERE estado=1 AND id_entidad=$id_entidad"));
        $plantilla='plan_estrategico/accion_crear.tpl';
        }
?>
