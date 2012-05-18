<?php 
// -----------------------------------------------------------------------------------------------
// proyecto: icasus <https://icasus.forja.rediris.es/>
// archivo: usuario_crear.php
// tipo: controlador
// desarrolladores: juanan ruiz (juanan@us.es), jesús martín (jjmc@us.es)
// -----------------------------------------------------------------------------------------------
// descripcion: formulario para dar de alta un usuario en el sistema
// -----------------------------------------------------------------------------------------------
global $smarty;
global $basedatos;
global $plantilla;

$smarty->assign('_javascript' , array('usuario_validar'));
$smarty->assign('_nombre_pagina' , 'Gestión usuarios Icasus');
 
// si vienen los datos necesarios graba en la base de datos un nuevo usuario
if (isset($_POST["nombre"]) && isset($_POST["apellidos"]) && isset($_POST["login"]) && isset($_POST["clave"]) )
{
	$nombre = sanitize($_POST["nombre"],2);
	$apellidos = sanitize($_POST["apellidos"],2);
	$login = sanitize($_POST["login"],2);
	$clave = sanitize($_POST["clave"],2);
	$nif = isset($_POST["nif"])?sanitize($_POST["nif"],2):'';
	$correo = isset($_POST["correo"])?sanitize($_POST["correo"],2):'';
	$telefono =  isset($_POST["telefono"])?sanitize($_POST["telefono"],2):'';
	$usuario = new usuario($basedatos);
	if ($id_usuario = $usuario->crear($login,$clave,$nombre,$apellidos,$nif,$correo,$telefono)) 
	{
		$smarty->assign('aviso' , 'Se ha creado un nuevo usuario en el sistema');
		$smarty->assign('usuario' , $usuario->obtener_datos($id_usuario));
		$plantilla = "usuario_datos.tpl";
	}
	else
	{
		$smarty->assign('error',$usuario->error);
		$smarty->assign('_nombre_pagina' , 'Error');
		$plantilla = 'error.tpl';
	}
}
// si no vienen datos muestra un formulario vacio para crear un nuevo usuario
else
{
	$plantilla = "usuario_crear.tpl";
}
?>
