<?php
//-------------------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: login_sso.php
//-------------------------------------------------------------------------------------------
// Controlador que autentica a los usuarios para entrar al sistema usando el SSO de la US 
//-------------------------------------------------------------------------------------------

//include_once("../../cascara_core/lib/libopensso-php-0.4.2/OpenSSO.php");
include_once("../../cascara_core/lib/libopensso-php-viejita/OpenSSO.php");
// Este controlador puede hacer tres cosas: autenticar, logout o mostrar la página inicial

$usuario_ldap = new OpenSSO(TRUE);

  $smarty->assign("_nombre_pagina", "Bienvenido a Icasus");

if (isset($_GET["autenticar"]))
{
  // A este nivel se decide si usamos entorno de producción o preproducción
  //$usuario_sso = new \US\OpenSSO\User(CC_SSO_URL);
  $usuario_sso = new OpenSSO(TRUE);
  if ($usuario_sso->check_and_force_sso())
  { 
    //$dni = $usuario_sso->irispersonaluniqueid;
    $usesrelacion = $usuario_sso->attribute('usesrelacion');
    $acceso_autorizado = false;

    // Recorremos el array que contiene los distintos tipos de perfiles que puede tener una persona en el ldap de la US
    foreach($usesrelacion as $perfil)
    {
      if ($perfil =='PAS' OR $perfil == 'PDI' OR $perfil == 'MISCELANEA')
      {
        $acceso_autorizado = true;
      }
    }
    
    // Vamos adentro
    if ($acceso_autorizado)
    {
      $usuario = new usuario();
      if ($usuario->load_joined("login = '" . $usuario_sso->attribute('uid') . "'"))
      {
        // Si el usuario existe en icasus cargamos sus datos
        $_SESSION['usuario'] = $usuario;
        //$log = new $log;
        //$log->add('login',0,$usuario->id);
        header("location:index.php");
      }
      else
      {
        // Si el usuario no existe en su caso lo damos de alta con los datos de ldap
        $usuario->login = $usuario_sso->attribute('uid');
        $usuario->nombre = $usuario_sso->attribute('givenname');
        $usuario->nif = $usuario_sso->attribute('irispersonaluniqueid');
        $usuario->apellidos = $usuario_sso->attribute('sn');
        $usuario->correo = $usuario_sso->attribute('mail');
        if($usuario->save())
        {
          $_SESSION['usuario'] = $usuario;
          header("location:index.php");
        }
        else
        {
          // Ha habido un problema al grabar el nuevo usuario en la base de datos (raro pero posible)
          $error="El usuario pertenece al colectivo que tiene permiso para utilizar esta herramienta pero no se ha podido dar de alta en la herramienta. Contactar con icasus@us.es";
          $smarty->assign('error',$error);
          header("location:index.php?error=" . $error);
        }
      }
    } 
    else
    {
      // No se autoriza el acceso
      $error="La relacion de este usuario con la Universidad no es la definida para utilizar esta herramienta. Contactar con icasus@us.es";
      $smarty->assign('error',$error);
      header("location:index.php?error=" . $error);
    }
  }
}
else if (isset($_GET["logout"]))
{
	session_unset();
	header("location:https://sso.us.es/opensso/UI/Logout?goto=". IC_URL_BASE);
}
else
{
  $smarty->assign("_nombre_pagina", "Bienvenido a Icasus");
	$plantilla = "login_sso.tpl";
}
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/*
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
	header("location:https://sso.us.es/opensso/UI/Logout?goto=". IC_URL_BASE);
}
else
{
	$plantilla = "login_sso.tpl";
}
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*/

?>
