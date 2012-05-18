<?php 
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://forja.rediris.es/project/icasus/)
// Archivo: plan_informe1.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es) y Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Genera un informe ordenado y agrupado del Plan Estrategico
//---------------------------------------------------------------------------------------------------
global $smarty;
global $basedatos;
global $operario;
global $nombre_pagina;
global $plantilla;

//Muestra el menu de plan
$smarty-> assign('plan',true); 

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

$rs=$adodb->getall("SELECT linea.titulo AS lineati, objetivo.titulo AS objetivoti, accion.titulo AS accionti ,linea.idorden AS lineaord,objetivo.idorden AS objetivoord ,accion.idorden AS accionord
FROM indicador RIGHT JOIN (accion RIGHT JOIN (objetivo RIGHT JOIN linea ON objetivo.idlinea = linea.id) ON accion.idobjetivo = objetivo.id) ON indicador.id_accion = accion.id WHERE  accion.id_entidad= ".$id_entidad);

$smarty->assign('informe',$rs);

//Muestra la salida smarty
$plantilla = 'plan_informe1.tpl';

?>
