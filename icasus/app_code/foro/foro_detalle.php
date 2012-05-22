<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: foro_detalle.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: consulta detalles  de un hilo del foro
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
global $operario;

//cargo los script para esta pagina
$smarty->assign('_javascript' , array('foro'));

//parametro pasado por URL
$id = sanitize($_GET['id'],2);

if ($_POST)
{
 //parametros del post
 $tipo = sanitize($_GET['foro'],2);
 $asunto = sanitize($_GET['asunto'],2);
 
 $publica = new hilo();
 $publica->id_padre = $id;
 $publica->id_usuario = $operario->id_usuario;
 $publica->fecha_entrada=time();
 $publica->asunto = "";
 $publica->texto = sanitize($_POST['texto'],2);
 $publica->visitas = 0;
 $publica->hijos = 0;
 $publica->tipo = $tipo;
 $publica->asunto = $asunto;
 $publica->save();
 $suma = new hilo();
 $suma -> load("id=$id");
 $suma -> hijos = $suma -> hijos + 1;
 $suma -> save();
 header('location:index.php?page=foro/foro_detalle&id='.$id.'&foro=.'.$tipo);
}
 //hilo padre y cabecera de los post de ese padre
 $padre = new hilo();
 $padre->Load_joined("id=$id");
 $smarty->assign('padre',$padre);
//print_r($padre); 
 //hijos del hilo padre-cabecera de detalle
 //$hijo = new hilo();
 //$hijos = array();
 //$hijos = $hijo->Find("id_padre=$id");
 //$smarty->assign('hijos',$hijos);
	
 //hijos del hilo padre-cabecera de detalle
 $hijo = new hilo();
 $hijos = array();
 $hijos = $hijo->Find_joined("id_padre=$id ORDER BY fecha_entrada DESC");
 $smarty->assign('hijos',$hijos);
 //print_r($hijos);
 $plantilla = 'foro/foro_detalle.tpl';
?>
