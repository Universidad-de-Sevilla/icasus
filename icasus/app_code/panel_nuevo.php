<?php
	//$id_cuadro = sanitize($_REQUEST["id_cuadro"],INT);
	$id_cuadro = 1;
	$id_entidad = 14 ;

	$smarty->assign('id_entidad' , $id_entidad);
	$smarty->assign('id_cuadro' , $id_cuadro);
	$smarty->assign('_nombre_pagina' , "Nuevo panel");
	$plantilla = "panel_nuevo.tpl";
?>
