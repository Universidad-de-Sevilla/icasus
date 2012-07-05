<?php
global $smarty;
global $plantilla;
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
			header("location:index.php");
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
else if(isset($_GET["logout"]))
{	
	// Si no venía del formulario cerramos sesión y enviamos a inicio
	session_unset();
  header("location:index.php");
}
else
{
  // Si no viene del formulario, ni de logout, mostramos el formulario
  $plantilla = "login_basico.tpl";
}
?>
