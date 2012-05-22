<?php 
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://forja.rediris.es/project/icasus/)
// Archivo: informe_ejecutivo.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es) y Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Genera un informe ordenado y agrupado de las Acciones con responsables y metas
//---------------------------------------------------------------------------------------------------
global $smarty;
global $basedatos;
global $operario;
global $nombre_pagina;
global $plantilla;

//Muestra el menu de plan
$smarty-> assign('plan',true);
$smarty-> assign('entidad',false);
//Obtener datos de la unidad
if ($_REQUEST['id_entidad'])
{
        $id_entidad = sanitize($_REQUEST['id_entidad'],2);
        $rs=$adodb->execute("SELECT nombre  FROM entidad WHERE id_entidad=".$id_entidad);
        $smarty->assign('entidad' , $rs->fields['nombre']);        
}
else
{
        $error = "No se puede mostrar por  falta de parámetros.";
        $smarty->assign('error',$error);
        $plantilla = "error.tpl";
}
//Consulta a BD para generar el informe

$rs=$adodb->getall("SELECT linea.titulo AS lineati, objetivo.titulo AS objetivoti, accion.titulo AS accionti ,linea.idorden AS lineaord,objetivo.idorden AS objetivoord ,accion.idorden AS accionord, accion.responsable AS accionres, accion.meta AS accionmeta, accion.plazo AS accionplazo 
FROM indicador RIGHT JOIN (accion RIGHT JOIN (objetivo RIGHT JOIN linea ON objetivo.idlinea = linea.id) ON accion.idobjetivo = objetivo.id) ON indicador.id_accion = accion.id WHERE  accion.estado=1 AND accion.id_entidad='".$id_entidad."' ORDER BY lineaord,objetivoord");
$smarty->assign('informe',$rs);

//Muestra la salida smarty
$plantilla = 'plan_estrategico/informe_ejecutivo.tpl';

?>
