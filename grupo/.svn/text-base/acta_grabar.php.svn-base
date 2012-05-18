<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: acta_crear.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesús Martín (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Crea un acta de un grupo de trabajo
//---------------------------------------------------------------------------------------------------

require_once('function/sanitize.php');
global $smarty;
global $basedatos;
global $plantilla;

$smarty->assign('_javascript' , array('acta_crear'));

// Esto es para prevenir que se cargue el script sin pasar por index.php
if (!is_object($smarty))
{
        header('Location:index.php');
}
//devuelve el valor mas alto del numero de acta
$acta = new acta();
$acta->numero = sanitize($_POST['numero'],2);
$acta->nombre = sanitize($_POST['nombre'],2);
$acta->id_entidad = sanitize($_GET['id_entidad'],2);

if ($acta->save())
{
$log = new log(); // registra la accion en el log
$log->add('crear acta',$acta->id_acta."-".sanitize($_GET['id_entidad'],2),$operario->id_usuario);
header('location: index.php?page=grupo/acta&id_acta='.$acta->id_acta.'&id_entidad='.$acta->id_entidad);
//header('location: index.php?page=grupo/acta&id_acta='.$acta->id_acta.'&id_entidad='.$acta->identidad);
}
else
{
$error = "No se ha podido crear un nuevo acta para esta Entidad";
$smarty->assign('error',$error);
$smarty->display('../error.tpl');
}
?>

