<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: acta_modificar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Modifica datos del actas
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
if (isset($_POST['graba']) and $_POST['graba'] == 'acta')
{
	//fecha
	//$day = sanitize($_POST['fechaDay'],2);
        //$month = sanitize($_POST['fechaMonth'],2);
        //$year = sanitize($_POST['fechaYear'],2);
	//hora
	//$hour = sanitize($_POST['Time_Hour'],2);
        //$minutes = sanitize($_POST['Time_Minute'],2);

	//datos
	$acta = new acta();
	$acta ->load('id_acta='.sanitize($_POST['id_acta'],2));
	$acta ->numero = sanitize($_POST['numero'],2);
        $acta ->nombre = sanitize($_POST['nombre'],2);
        //$acta ->lugar = sanitize($_POST['lugar'],2);
        //$acta ->fecha = mktime($hour, $minutes, 0, $month, $day, $year);
        //$acta ->descripcion = sanitize($_POST['descripcion'],2);
	
	$acta ->save();
}
header('location:index.php?page=grupo/acta_editar&id_acta='.sanitize($_POST['id_acta'],2));
?>

