<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: foro.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: consulta del foro de icasus
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
global $operario;

//cargo los script para esta pagina
$smarty->assign('_javascript' , array('foro'));

//Parametro para diferenciar foro publico o privado
$tipo=sanitize($_GET['foro'],2);

//si se ha introducido una nueva entrada
if ($_POST){
  $formulario=$_POST['formulario'];
  $asunto=sanitize($_POST['asunto'.$formulario],2);
  $texto=sanitize($_POST['texto'.$formulario],2);
  $publicar=new hilo();
  $publicar->id_padre=0;
  $publicar->id_usuario=sanitize($_POST['id_usuario'],2);
  $publicar->fecha_entrada=time();
  $publicar->asunto=$asunto;
  $publicar->texto=$texto;
  $publicar->tipo=sanitize($_POST['tipo_foro'],2);
  $publicar->visitas=0;
  $publicar->hijos=0;
  $publicar->save();
  header('location:index.php?page=foro/foro&foro='.sanitize($_POST['tipo_foro'],2));
}
//Busco los hilos padres
$hilo = new hilo();
$smarty->assign('hilos',$hilo->Find_joined("id_padre=0 AND tipo='".$tipo."'"));
//print_r($hilo->Find_joined("id_padre=0"));	
$plantilla = 'foro/foro.tpl';
?>
