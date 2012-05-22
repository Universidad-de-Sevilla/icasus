<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://forja.rediris.es/project/icasus/)
// Archivo: plan_listar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es) y Jesus Martin (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Listado general de las Lineas, Objetivos y Acciones del Plan Funcional de la Direccion
//---------------------------------------------------------------------------------------------------
global $smarty;
global $basedatos;
global $operario;
global $nombre_pagina;
global $plantilla;

$smarty-> assign('plan',true);
$id_entidad=$_GET['id_entidad'];

//listado de las lineas
$listado=$adodb->getall('SELECT * FROM linea WHERE estado=1 AND id_entidad='.$id_entidad);
$smarty->assign('linea',$listado);

//listado de los objetivos
$listado=$adodb->getall("SELECT * , objetivo.idorden AS ordenobjetivo,linea.idorden AS ordenlinea 
FROM linea RIGHT JOIN objetivo ON linea.id=objetivo.idlinea 
WHERE objetivo.id_entidad='$id_entidad' AND objetivo.estado=1");
$smarty->assign('objetivo',$listado);
$listado=$adodb->getall("SELECT linea.idorden AS lineaorden , objetivo.idorden AS objetivoorden, accion.idorden AS accionorden ,accion.titulo ,accion.fechac , accion.fecham , accion.id
, accion.id_entidad 
FROM (accion LEFT JOIN objetivo ON accion.idobjetivo = objetivo.id) LEFT JOIN linea ON objetivo.idlinea = linea.id
WHERE accion.estado=1 AND accion.id_entidad='$id_entidad'  ORDER BY lineaorden,objetivoorden,accionorden");
$smarty->assign('accion',$listado);

$plantilla = 'plan_estrategico/plan_listar.tpl';
?>

