<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://forja.rediris.es/project/icasus/)
// Archivo: accion_crear.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es) y Jesus Martin (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Desactiva elementos del Plan Funcional de la Direccion de RR.HH.
//---------------------------------------------------------------------------------------------------

global $smarty;
global $basedatos;
global $operario;
global $nombre_pagina;
global $plantilla;

$smarty->assign('plan',true);
//variables recibidas por URL y formulario.
$id=sanitize($_GET['id'],2);
$elemento=sanitize($_GET['elemento'],2);
$id_entidad=sanitize($_GET['id_entidad'],2);

if ($elemento=='linea')
{
	if (isset($_POST["borrarlinea"]) && $_POST["borrarlinea"]=='borrarlinea')
        {
	$adodb->execute("UPDATE linea SET estado = 0 WHERE id=$id");
	$adodb->execute("UPDATE objetivo SET estado = 0 WHERE idlinea=$id");
        $adodb->execute("UPDATE (accion RIGHT JOIN objetivo ON accion.idobjetivo = objetivo.id) RIGHT JOIN linea ON objetivo.idlinea = linea.id SET accion.estado = 0
WHERE linea.id=$id");
        header('location:index.php?page=plan_estrategico/plan_listar&id_entidad='.$id_entidad);

	}
	else
	{
	$rs=$adodb->execute("SELECT * FROM linea WHERE id=$id");
	$smarty->assign('linea',$rs->fields);
	$rs=$adodb->getall("SELECT * FROM objetivo WHERE estado=1 AND idlinea='$id'");
	$smarty->assign('objetivo',$rs);
	$rs=$adodb->getall("SELECT linea.id, linea.titulo, objetivo.titulo, accion.titulo AS acciontitulo
	FROM (accion RIGHT JOIN objetivo ON accion.idobjetivo = objetivo.id) RIGHT JOIN linea ON objetivo.idlinea = linea.id
	WHERE accion.estado=1 AND linea.id=$id");
	$smarty->assign('accion',$rs);
	$smarty->assign('linealistado',true);
	$plantilla='plan_estrategico/borrar.tpl';
	} 

}
if ($elemento=='objetivo')
{
	if (isset($_POST["borrarobjetivo"]) && $_POST["borrarobjetivo"]=='borrarobjetivo')
        {
        	$adodb->execute("UPDATE objetivo SET estado = 0 WHERE id=$id");
        	$adodb->execute("UPDATE accion SET estado = 0 WHERE idobjetivo=$id");
        	header('location:index.php?page=plan_estrategico/plan_listar&id_entidad='.$id_entidad);
        }
        else
        {
        	$smarty->assign('objetivolistado',true);
        	$rs=$adodb->getall("SELECT * FROM objetivo WHERE id=$id");
		$smarty->assign('objetivo',$rs);
        	$rs=$adodb->getall("SELECT * FROM accion WHERE estado=1 AND idobjetivo=$id");
	        $smarty->assign('accion',$rs);
	        $plantilla='plan_estrategico/borrar.tpl';
	}
}

if ($elemento=='accion')
{
	if (isset($_POST["borraraccion"]) && $_POST["borraraccion"]=='borraraccion')
	{
       	$adodb->execute("UPDATE accion SET estado = 0 WHERE id=$id");
	header('location:index.php?page=plan_estrategico/plan_listar&id_entidad='.$id_entidad);
	}
	else
	{
		$smarty->assign('accionlistado',true);
        	$rs=$adodb->getall("SELECT * FROM accion WHERE id=$id");
        	$smarty->assign('accion',$rs);
        	$plantilla='plan_estrategico/borrar.tpl';
	}
}
?>
