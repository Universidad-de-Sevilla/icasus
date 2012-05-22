<?php
global $basedatos;
global $smarty;
global $plantilla;
$smarty->assign('_javascript' , array('login_validar','ordenatabla'));
$smarty->assign('_nombre_pagina' , 'Bienvenido a Icasus');

//Carga la página de novedades para mostrar en la pantalla inicial
$pagina = new pagina();
$pagina->load("alias = 'noticias'");
$smarty->assign('pagina',$pagina);
 
// Comprueba que viene del formulario
if (isset($_POST['acceso']))
{
	// Comprueba que vengan los datos
	if (isset($_POST["login"]) && isset($_POST["clave"]))
	{
		$login = sanitize($_POST["login"],2);
		$clave = sanitize($_POST["clave"],2);
		$operario = new usuario($basedatos);
		if ($id_operario = $operario->comprobar_login($login, $clave)) 
		{
			$operario->obtener_datos($id_operario);
			$smarty->assign('_operario',$operario->datos);
			session_start();
			$_SESSION["id_usuario"] = $operario->datos['id_usuario'];
			$_SESSION['usuario'] = $operario;
			// Registra la entrada en el log
			$log = new log();
		    $log->add('login',0,$id_operario);	
			// Reenvia a la lista de entidades
			header("location:index.php?page=entidad_listar");
		}
		else 
		{
			$aviso="Usuario o clave incorrectos.";
			$smarty->assign('aviso',$aviso);
			$plantilla = 'login.tpl';
		}
	}
	else 
	{
		// Si falta algun parametro volvemos al formulario y avisamos
		$aviso = "Indique su nombre de usuario y clave.";
		$smarty->assign('aviso',$aviso);
		$plantilla = 'login.tpl';
	}
}
else
{	
	// Si no venía del formulario lo mostramos sin más
	session_unset();
	$smarty->assign('_operario',false);	
	$plantilla = 'login.tpl';
}
?>
