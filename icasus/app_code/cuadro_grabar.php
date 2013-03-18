<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: cuadromando_crear.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Crea un nuevo cuadro de mandos para un usuario
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
global $operario;

// Esto es para prevenir que se cargue el script sin pasar por index.php
if (!is_object($smarty))
{
	header('Location:index.php');	
}

// Comprueba que vienen los datos mínimos
if (isset($_POST['nombre']) && isset($_POST['privado'])) 
{
	// Guardamos los datos que vienen del formulario
	$cuadromando = new cuadromando();
	if (isset($_POST['id']))
	{
		// No entiendo porque no es suficiente con esta unica línea
		//$cuadromando->id = sanitize($_POST['id'],16);
		$id = sanitize($_POST['id'],16);
		$cuadromando->load("id = $id");
	}
	$cuadromando->id_usuario = $operario->id_usuario;
	$cuadromando->nombre = sanitize($_POST['nombre'],2);
	$cuadromando->privado = sanitize($_POST['privado'],16);
	$cuadromando->comentarios = isset($_POST['comentarios'])?sanitize($_POST['comentarios'],2):'';
	$cuadromando->save();
	//print_r($cuadromando);
	//print_r($_POST);
	// Guarda los indicadores seleccionados para este cuadro de mando
	if (isset($_POST['id_pon']))
	{
		foreach ($_POST['id_pon'] as $id_indicador)
		{
			$id_indicador = sanitize($id_indicador,16);
			$cuadromando->pon_indicador($id_indicador);
		}
	}
	if (isset($_POST['id_quita']))
	{
		foreach ($_POST['id_quita'] as $id_indicador)
		{
			$id_indicador = sanitize($id_indicador,16);
			$cuadromando->quita_indicador($id_indicador);
		}
	}
	header("Location: index.php?page=cuadromando_mostrar&id=$cuadromando->id");
}
else
{
	// Avisamos de error por falta de parametros
	$error = 'Faltan parámetros necesarios para cargar esta página';
	$smarty->assign('error',$error);
	$plantilla = 'error.tpl';
}

?>
