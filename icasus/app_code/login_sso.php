<?php
global $smarty;
global $plantilla;
//$smarty->assign('_javascript' , array('login_validar'));
$smarty->assign('_nombre_pagina' , 'Bienvenido a Icasus');

//Carga la página de novedades para mostrar en la pantalla inicial
$pagina = new pagina();
$pagina->load("alias = 'noticias'");
$smarty->assign('pagina',$pagina);

if (isset($_GET["autenticar"]))
{ 
	$sso = new OpenSSO();
	$res = $sso->check_and_force_sso();
	if ($res === TRUE)
	{
		$_SESSION['ssodato'] = $sso->all_attributes();
		$autorizado = 0;
		$usesrelacion = $_SESSION["ssodato"]["usesrelacion"];
		if (is_array($usesrelacion))
		{
			foreach($usesrelacion as $item)
			{
				if ($item =='PAS' or $item == 'PDI' or $item == 'MISCELANEA')
				{
					$autorizado = $autorizado + 1;
				}
			}
		}
		else
		{
			if ($usesrelacion =='PAS' or $usesrelacion == 'PDI' or $usesrelacion == 'MISCELANEA')
			{
				$autorizado = 1;
			}
		}
		if ($autorizado >= 1)
		{
				$usuario = new usuario();
				if ($usuario->load_joined("login = '".$_SESSION["ssodato"]["uid"]."'"))
				{
					$_SESSION['usuario'] = $usuario;
					//$log = new $log;
					//$log->add('login',0,$usuario->id);
					header("location:index.php");
				}
				else
				{
					$usuario->login = $_SESSION["ssodato"]["uid"];
					$usuario->nombre = $_SESSION["ssodato"]["givenname"];
					$usuario->nif = $_SESSION["ssodato"]["irispersonaluniqueid"];
					$usuario->apellidos = $_SESSION["ssodato"]["sn"];
					$usuario->correo = $_SESSION["ssodato"]["mail"];
					if($usuario->save())
					{
						$_SESSION['usuario'] = $usuario;
						header("location:index.php");
					}
					else
					{
						$error="El usuario pertenece al colectivo que tiene permiso para utilizar esta herramienta pero no se ha podido dar de alta en la herramienta. Contactar con icasus@us.es";
						$smarty->assign('error',$error);
						header("location:index.php?error=" . $error);
					}
				}
		}
		else
		{
			$error="La relacion de este usuario con la Universidad no es la definida para utilizar esta herramienta. Contactar con icasus@us.es";
			$smarty->assign('error',$error);
			header("location:index.php?error=" . $error);
		}
	}
}
else if (isset($_GET["logout"]))
{
	session_unset();
	header("location:https://opensso.us.es/opensso/UI/Logout?goto=". IC_URL_BASE);
}
else
{
	$plantilla = "login_sso.tpl";
}
?>
