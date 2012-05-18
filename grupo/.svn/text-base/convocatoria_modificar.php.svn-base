<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: convocatoria_modificar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Modifica datos de la convocaotoria
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
if (isset($_POST['graba']) and $_POST['graba'] == 'convocatoria')
{
	//fecha
	$day = sanitize($_POST['fechaDay'],2);
        $month = sanitize($_POST['fechaMonth'],2);
        $year = sanitize($_POST['fechaYear'],2);
	//hora
	$hour = sanitize($_POST['Time_Hour'],2);
        $minutes = sanitize($_POST['Time_Minute'],2);

	//datos
	$acta = new acta();
	$acta ->load('id_acta='.sanitize($_POST['id_acta'],2));
        $acta ->lugar = sanitize($_POST['lugar'],2);
        $acta ->fecha = mktime($hour, $minutes, 0, $month, $day, $year);
	//graba los datos	
	$acta ->save();
	//redirecciona correctamente si graba
      	if ($acta->save())
        {
                header('location:index.php?page=grupo/acta_editar&id_acta='.sanitize($_POST['id_acta'],2));
        }
        else
        {
        $error = 'No se ha grabado la convocatoria';
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

