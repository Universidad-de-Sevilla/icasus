<?php
//---------------------------------------------------------------------------------------------------
// Proyecto Icasus (http://wiki.us.es/icasus/)
// Archivo: convocatoria_borrar.php
// Desarrolladores: Juanan Ruiz <juanan@us.es>, Jesús Martin <jjmc@us.es>
//---------------------------------------------------------------------------------------------------
// Descripcion: Borra asuntos 
//---------------------------------------------------------------------------------------------------
// Esto es para que se vean los errores

require_once('function/sanitize.php');
global $smarty;
global $plantilla;
        
// Esto es para prevenir que se cargue el script sin pasar por index.php
if (!is_object($smarty))
{       
        header('Location:index.php');
}   

//id del acuerdo
if (isset($_GET['id_asunto']) AND isset($_GET['id_acta']))
{

	$id_asunto = sanitize($_GET['id_asunto'],2);
	$asunto = new asunto();
	$borrado = $asunto -> delete('id_asunto='.$id_asunto);
	if ($borrado)
	{
		header('location:index.php?page=grupo/acta_editar&id_acta='.sanitize($_GET['id_acta'],2));
	}
	else
	{
	        $error = 'No se ha borrado el asunto';
                $smarty -> assign('error',$error);
                $plantilla = 'error.tpl';
	}
}
else
{
 // Avisamos de error por falta de parametros
        $error = 'Faltan parámetros necesarios para cargar esta página';
        $smarty->assign('error',$error);
        $plantilla = 'error.tpl';

}
?>
