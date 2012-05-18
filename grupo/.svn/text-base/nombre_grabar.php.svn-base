<?php
//---------------------------------------------------------------------------------------------------
// Proyecto Icasus (http://wiki.us.es/icasus/)
// Archivo: nombre_grabar.php
// Desarrolladores: Juanan Ruiz <juanan@us.es>, Jesús Martin <jjmc@us.es>
//---------------------------------------------------------------------------------------------------
// Descripcion: Graba los datos editados
//---------------------------------------------------------------------------------------------------
include('ajax.php');
if ($permiso->_saved == 1)
{
		//datos del acta
		$numero = sanitize($_POST['numero'],2);
		$nombre = sanitize($_POST['nombre'],2);
		//graba los datos
		$acta ->numero = $numero;
		$acta ->nombre = $nombre;
		$acta ->save();
		mysql_query('SET NAMES utf8');
		if ($acta->save())
		{
				$smarty->display('nombre.tpl');
		}
		else
		{
				$error = 'No se ha grabado la nota';
				$smarty->assign('error',$error); 
				$smarty->display('../error.tpl');
		} 
}
else
{
		$error= "No tiene permiso para esta operaci&oacute;n";
		$smarty->assign('error',$error);
		$smarty->display('../error.tpl');
}
?>

