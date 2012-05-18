<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: acta_grabar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Edición de entidades existentes
//---------------------------------------------------------------------------------------------------

require_once('function/sanitize.php');
global $smarty;
global $plantilla;

// Esto es para prevenir que se cargue el script sin pasar por index.php
if (!is_object($smarty))
{
        header('Location:index.php');
}
// Si vienen todos los datos necesarios del formulario grabamos
if (isset($_GET['id_entidad']) AND isset($_GET['id_acta']) )
{
	//fecha para el acta
	$acta = new acta();
	$acta -> Load('id_acta='.sanitize($_GET['id_acta'],2) );
	$acta ->fin = time();
	$acta ->save();
	if ($acta->save())
	{
		header('location:index.php?page=grupo/acta_listar&id_entidad='.sanitize($_GET['id_entidad'],2) );
	}
	else
	{
	$error = 'No se ha cerrado el acta';
	$smarty -> assign('error',$error); 
	$plantilla = 'error.tpl';
	}	

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

