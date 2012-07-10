<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://forja.rediris.es/project/icasus/)
// Archivo: plan_listar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es) y Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Lista las Lineas del Plan Estrategico
//---------------------------------------------------------------------------------------------------
global $smarty;
global $basedatos;
global $operario;
global $nombre_pagina;
global $plantilla;


$smarty-> assign('plan',true);

$id_entidad=$_GET['id_entidad'];

//listado de las lineas
$listado=$adodb->getall('SELECT * FROM linea WHERE id_entidad='.$id_entidad);
$smarty->assign('linea',$listado);

//listado de los objetivos
$listado=$adodb->getall('SELECT * FROM objetivo WHERE id_entidad='.$id_entidad);
$smarty->assign('objetivo',$listado);

//listado de las acciones
$listado=$adodb->getall("SELECT linea.idorden AS lineaorden , objetivo.idorden AS objetivoorden, accion.idorden AS accionorden ,accion.titulo ,accion.fechac , accion.fecham , objetivo.id
FROM (accion LEFT JOIN objetivo ON accion.idobjetivo = objetivo.id) LEFT JOIN linea ON objetivo.idlinea = linea.id
WHERE (((accion.estado)=1)) AND accion.id_entidad='$id_entidad'  ORDER BY idlinea");
$smarty->assign('accion',$listado);



$plantilla = 'plan_listar.tpl';
?>

