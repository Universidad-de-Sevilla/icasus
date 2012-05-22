<?php
//---------------------------------------------------------------------------------------------------
// Proyecto Icasus (http://wiki.us.es/icasus/)
// Archivo: ajax_acta.php
// Desarrolladores: Juanan Ruiz <juanan@us.es>, Jesús Martin <jjmc@us.es>
//---------------------------------------------------------------------------------------------------
// Descripcion: Se utiliza para volver a cargar los datosnque se han grabado de asuntos, acuerdos y tareas
//---------------------------------------------------------------------------------------------------
$acta = new acta();
$acta->load_joined('id_acta  = '.$id_acta);
$smarty->assign('acta',$acta);
?>
