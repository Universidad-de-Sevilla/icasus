<?php

//require_once("libopensso-php/OpenSSO.php");
//$usuario_sso = new OpenSSO();

include_once('libopensso/lib/US/OpenSSO/InternalHandler.php');
include_once('libopensso/lib/US/OpenSSO/User.php');

try {
    $usuario_sso = new \US\OpenSSO\User(IC_SSO_METADATA);
} catch (Exception $e) {
    echo "<h2>Error del servidor de autenticaci&oacute;n</h2><p>Vuelva a intentarlo un poco m&aacute;s tarde 
        o env&iacute;e una incidencia a r2h2@us.es</p><p>" . $e->getMessage() . "</p>";
}

$smarty->assign("_nombre_pagina", TXT_BIENVENIDO);

// Este controlador puede hacer tres cosas: autenticar, logout o mostrar la página inicial
// (que hace de presentación y tiene un enlace para autenticar)
if (filter_has_var(INPUT_GET, 'autenticar'))
{
    $url = "https://" . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
//    if ($usuario_sso->check_and_force_sso($url))
    /** @var \US\OpenSSO\User $usuario_sso */
    if ($usuario_sso->enforceAuthentication($url))
    {
        //$dni = $usuario_sso->irispersonaluniqueid;
        $usesrelacion = $usuario_sso->attributeAsArray('usesrelacion');
        $acceso_autorizado = false;

        if (is_array($usesrelacion))
        {
            foreach ($usesrelacion as $perfil)
            {
                if ($perfil == 'PAS' OR $perfil == 'PDI' OR $perfil == 'MISCELANEA' OR $perfil == 'PDIEXTERNO')
                {
                    $acceso_autorizado = true;
                }
            }
        }
        else
        {
            if ($usesrelacion == 'PAS' OR $usesrelacion == 'PDI' OR $usesrelacion == 'MISCELANEA' OR $usesrelacion == 'PDIEXTERNO')
            {
                $acceso_autorizado = true;
            }
        }

        // Si algún perfil está autorizado vamos adentro
        // En caso contrario avisamos al usuario (else)
        if ($acceso_autorizado)
        {
            $usuario = new Usuario();

            if ($usuario->load_joined("login = '" . $usuario_sso->uid . "'"))
            {
                // Si el usuario existe en icasus cargamos sus datos
                $_SESSION['usuario'] = $usuario;
                //$log = new $log;
                //$log->add('login',0,$usuario->id);
                // Si el usuario tiene unidades asignadas
                if ($usuario->entidades)
                {
                    foreach ($usuario->entidades as $entidad)
                    {
                        //Le redirigimos a su unidad principal si la hay
                        if ($entidad->principal)
                        {
                            header("location:index.php?page=entidad_mostrar&id_entidad=" . $entidad->entidad->id);
                            exit();
                        }
                    }
                }
                header("location:index.php");
            }
            else
            {
                // Si el usuario no existe lo damos de alta con los datos de ldap
                $usuario->login = $usuario_sso->uid;
                $usuario->nombre = $usuario_sso->givenname;
                $usuario->nif = $usuario_sso->irispersonaluniqueid;
                $usuario->apellidos = $usuario_sso->sn;
                $usuario->correo = $usuario_sso->mail;
                if ($usuario->save())
                {
                    $_SESSION['usuario'] = $usuario;
                    header("location:index.php");
                }
                else
                {
                    // Ha habido un problema al grabar el nuevo usuario en la base de datos (raro pero posible)
                    $error = ERR_LOGIN_SSO;
                    $smarty->assign('error', $error);
                    header("location:index.php?error=" . $error);
                }
            }
        }
        else
        {
            // No se autoriza el acceso
            $error = ERR_LOGIN_SSO_AUT;
            $smarty->assign('error', $error);
            header("location:index.php?error=" . $error);
        }
    }
}
else if (filter_has_var(INPUT_GET, 'logout'))
{
    session_unset();
    session_destroy();
    $usuario_sso->logout(IC_URL_BASE);
}
else
{
    $plantilla = "login/login_sso.tpl";
}
