<?php
global $smarty;
global $plantilla;
$smarty->assign('_javascript' , array('login_validar'));
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
		$usuario = new usuario();
		if ($usuario->load_joined("login = '$login' AND clave = '$clave'")) 
		{
			$_SESSION['usuario'] = $usuario;
			// Registra la entrada en el log
			$log = new log();
		  $log->add('login',0,$usuario->id);	
			// Reenvia a la lista de entidades
			header("location:index.php?page=entidad_listar");
		}
		else 
		{
			$error="Usuario o clave incorrectos.";
			$smarty->assign('error',$error);
			$plantilla = 'login_basico.tpl';
		}
	}
	else 
	{
		// Si falta algun parametro volvemos al formulario y avisamos
		$error = "Indique su nombre de usuario y clave.";
		$smarty->assign('error',$error);
		$plantilla = 'login_basico.tpl';
	}
}
else
{	
	// Si no venía del formulario lo mostramos sin más
	session_unset();
	$smarty->assign('_usuario',false);	
	$plantilla = 'login_basico.tpl';
}
?>
