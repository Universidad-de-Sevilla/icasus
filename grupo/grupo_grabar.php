<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: grupo_graba.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Edición de entidades existentes
//---------------------------------------------------------------------------------------------------

require_once('function/sanitize.php');
global $smarty;
global $basedatos;
global $plantilla;

// Esto es para prevenir que se cargue el script sin pasar por index.php
if (!is_object($smarty))
{
        header('Location:index.php');
}
// Si vienen todos los datos necesarios del formulario grabamos
if (isset($_POST['graba']) and $_POST['graba'] == 'grupo')
{
	$entidad = new ado_entidad();
	
	$entidad ->codigo = 'ET-'. sanitize($_POST['codigo'],2);
	$entidad ->id_padre = sanitize($_POST['id_padre'],2);
	$entidad ->objeto = sanitize($_POST['objeto'],2);
	$entidad ->nombre = sanitize($_POST['nombre'],2);
	$entidad ->frecuencia = sanitize($_POST['frecuencia'],2);
	$entidad ->inicio = time();
	$entidad ->fecha = time();
	$entidad ->es_organica = 0;
	$entidad ->save();

	$ultimo = $adodb->Insert_ID();
	if ($entidad->save())
	{
		
		$usuario_entidad = new usuario_entidad();
		$usuario_entidad->id_usuario = $operario->id_usuario;
		$usuario_entidad->id_entidad = $ultimo;
		$usuario_entidad->id_rol = 3;
		$usuario_entidad->save();
		
		$log = new log(); // registra la accion en el log
		$log->add('nuevo equipo',$ultimo,$operario->id_usuario);

		$smarty->assign('grupo',$entidad->find('id_entidad='.$ultimo));
		$smarty->assign('aviso' , 'El grupo se ha creado con los datos que aparecen a continuación');
		header('location: index.php?page=grupo/grupo_datos&id_entidad='.$ultimo);
	}
	else
	{
		$smarty->assign('error', 'No se ha podido grabar el grupo');
	}
	$plantilla = "grupo/grupo_datos.tpl";
}
// Si no vienen datos mostramos el formulario
else
{
        // Avisamos de error por falta de parametros
        $error = 'Faltan parámetros necesarios para cargar esta página';
        $smarty->assign('error',$error);
        $plantilla = 'error.tpl';
}
?>

