<?php
//-------------------------------------------------------------------------------------------
// Proyecto: Icasus
// Archivo: login_sso.php
//-------------------------------------------------------------------------------------------
// Controlador que autentica a los usuarios para entrar al sistema usando el SSO de la US 
//-------------------------------------------------------------------------------------------

include_once("../../cascara_core/lib/libopensso-php/OpenSSO.php");
$smarty->assign("_nombre_pagina", "Bienvenido a Icasus");
$usuario_sso = new OpenSSO();

// Este controlador puede hacer tres cosas: autenticar, logout o mostrar la página inicial 
// (que hace de presentación y tiene un enlace para autenticar)

if (isset($_GET["autenticar"]))
{
  if ($usuario_sso->check_and_force_sso())
  { 
    //$dni = $usuario_sso->irispersonaluniqueid;
    $usesrelacion = $usuario_sso->attribute('usesrelacion');
    $acceso_autorizado = false;

		if (is_array($usesrelacion))
		{
      foreach($usesrelacion as $perfil)
      {
        if ($perfil =='PAS' OR $perfil == 'PDI' OR $perfil == 'MISCELANEA')
        {
          $acceso_autorizado = true;
        }
      }
    }
		else
		{
			if ($usesrelacion =='PAS' or $usesrelacion == 'PDI' or $usesrelacion == 'MISCELANEA')
			{
				$acceso_autorizado = true;
			}
		}
    
    // Si algún perfil está autorizado vamos adentro
    // En caso contrario avisamos al usuario (else)
    if ($acceso_autorizado)
    {
      $usuario = new Usuario();
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
        // Si el usuario no existe lo damos de alta con los datos de ldap
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
	$usuario_sso->logout(IC_URL_BASE);
}
else
{
  $smarty->assign("_nombre_pagina", "Bienvenido a Icasus");
	$plantilla = "login_sso.tpl";
}
?>
