<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: medicion_mostrar.php
//---------------------------------------------------------------------------------------------------
// Muestra los datos asociados a una medicion
//---------------------------------------------------------------------------------------------------
global $smarty;
global $usuario;
global $plantilla;

$modulo = sanitize($_REQUEST["modulo"],SQL);
$medicion = new medicion();
$indicador = new indicador();
$valor = new valor();
$valor_referencia_medicion = new valor_referencia_medicion();
$indisub = new indicador_subunidad();

//valores que se definen como filas ====================================================================
if ($modulo == 'grabarfila')
{
	$valor = sanitize($_REQUEST["valor"],2);        
	$id_valor = sanitize($_REQUEST["id2"],2);       
	$valor->load("id = $id_valor");                     
	$valor->puede_grabarse($valor->id,$usuario->id);        
	if ($valor->puede_grabarse($valor->id,$usuario->id))    
	{
		$valor->id_usuario = $usuario->id;                
		$valor->valor = $valor;                           
		$valor->fecha_recogida = date("Y-m-d");           
		$valor->save();}
	}
if ($modulo == 'editarfila')
{
	$id_medicion = sanitize($_REQUEST["id_medicion"], INT);
	$id_valor = sanitize($_REQUEST["id_valor"], INT);
	$smarty->assign("valor_edit",$id_valor);
	$medicion->load("id = $id_medicion");
	$smarty->assign("medicion",$medicion);
	$indicador->load("id = $medicion->id_indicador");
	$smarty->assign("indicador",$indicador);
	$valores = $valor->Find_joined_jjmc($id_medicion,$usuario->id);
	$smarty->assign("valores",$valores);
	$indisubs = $indisub->find("id_usuario = $usuario->id AND id_indicador = $indicador->id");
	$smarty->assign("usuario", $usuario);
	$smarty->assign('indisubs',$indisubs);
	$smarty->assign("modulo","editarfila");              
	$plantilla = 'medicion_editar_ajax.tpl';
}
if ($modulo == 'cancelarfila')
{
	$id_medicion = sanitize($_REQUEST["id_medicion"], INT);
	$medicion->load("id = $id_medicion");
	$smarty->assign("medicion",$medicion);
	$indicador->load("id = $medicion->id_indicador");
	$smarty->assign("indicador",$indicador);
	$valores = $valor->Find_joined_jjmc($id_medicion,$usuario->id);
	$smarty->assign("valores",$valores);
	$indisubs = $indisub->find("id_usuario = $usuario->id AND id_indicador = $indicador->id");
	$smarty->assign('indisubs',$indisubs);
	$smarty->assign("usuario", $usuario);
	$smarty->assign("medicion_edit",$id_medicion);
	$smarty->assign("modulo","cancelarfila");              
	$plantilla = 'medicion_editar_ajax.tpl';
}
//etiquetas y fechas  =======================================================================
if ($modulo == 'grabaretiqueta')
{
	$valor = sanitize($_POST["valor"],SQL);
	$contenedor = sanitize($_POST["contenedor"],SQL);
	$id_medicion = sanitize($_POST["id_medicion"],INT);
	$medicion->load("id = $id_medicion");
	if ($contenedor == 'et')
	{$medicion->etiqueta = $valor;}
	elseif ($contenedor == 'pi')
	{$medicion->periodo_inicio = $valor;}
	elseif ($contenedor == 'pf')
	{$medicion->periodo_fin = $valor;}
	elseif ($contenedor == 'gi')
	{$medicion->grabacion_inicio = $valor;}
	elseif ($contenedor == 'gf')
	{$medicion->grabacion_fin = $valor;}
	$medicion->save();
}
if ($modulo == 'editaretiqueta')
{
	$id_medicion = sanitize($_REQUEST["id_medicion"], INT);
	$contenedor = sanitize($_REQUEST["contenedor"], SQL);
	$smarty->assign("contenedor",$contenedor);      
	$medicion->load("id = $id_medicion");           
	$smarty->assign("medicion",$medicion);          
	if ($contenedor == 'pi' OR $contenedor == 'pf' OR $contenedor == 'gi' OR $contenedor == 'gf')   
	{
	$smarty->assign("modulo","editarfecha");              
	}
	else 
	{
	$smarty->assign("modulo","editaretiqueta");              
	}
	$plantilla = 'medicion_editar_ajax.tpl';
}
if ($modulo == 'cancelaretiqueta')
{
	$id_medicion = sanitize($_REQUEST["id_medicion"], INT);
	$contenedor = sanitize($_REQUEST["contenedor"], SQL);
	$medicion->load("id = $id_medicion");                  
	$smarty->assign('medicion',$medicion);                 
	$smarty->assign('contenedor',$contenedor);      
	$smarty->assign("modulo","cancelaretiqueta");              
	$plantilla = 'medicion_editar_ajax.tpl';
}
//valor de referencia ===========================================================================
if ($modulo == 'grabarvalorreferencia')
{
	$id_referencia = sanitize($_REQUEST["id_referencia"],2);
  $valor = sanitize($_REQUEST["valor"],2);
  $valor_referencia_medicion->load("id =$id_referencia");
  $valor_referencia_medicion->valor = $valor;
  $valor_referencia_medicion->save();
}

if ($modulo == 'cancelarvalorreferencia')
{
	$id_referencia = sanitize($_REQUEST["id"], INT);
  $valor_referencia_medicion->load("id = $id_referencia");
  $smarty->assign("valor_referencia_medicion", $valor_referencia_medicion);
	$smarty->assign("modulo","cancelarvalorreferencia");              
	$plantilla = 'medicion_editar_ajax.tpl';
}

if ($modulo == 'editarvalorreferencia')
{
	$id_referencia = sanitize($_REQUEST["id_referencia"], INT);
	$valor_referencia_medicion->load("id = $id_referencia");               
	$smarty->assign("referencia",$valor_referencia_medicion);              
	$smarty->assign("modulo","editarvalorreferencia");              
	$smarty->assign("modulo","editarvalorreferencia");              
	$plantilla = 'medicion_editar_ajax.tpl';
}
?>