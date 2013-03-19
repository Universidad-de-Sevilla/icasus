<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: medicion_listar.php
//---------------------------------------------------------------------------------------------------
// Muestra un listado de las mediciones establecidas para un indicador
//---------------------------------------------------------------------------------------------------
global $smarty;
global $usuario;
global $plantilla;
//parametros que son comunes a todos los módulos
$modulo = sanitize($_REQUEST["modulo"],SQL);
$id_entidad = sanitize($_REQUEST["id_entidad"],INT);
$entidad = new entidad();
$entidad->load("id = $id_entidad");
$smarty->assign('entidad', $entidad);

$id_indicador = sanitize($_REQUEST["id_indicador"],INT);
$indicador = new indicador();
$indicador->load("id = $id_indicador");
$smarty->assign('indicador', $indicador);

$inicio = sanitize($_REQUEST["inicio"],SQL);
$fin = sanitize($_REQUEST["fin"],SQL);
$id_medicion = sanitize($_REQUEST["id_medicion"],INT);
$id_subunidad = sanitize($_REQUEST["id_subunidad"],INT);
$activo = sanitize($_REQUEST["activo"],INT);

if(isset($id_indicador) AND isset($modulo) AND isset($id_entidad))
{
	$usuario_entidad = new usuario_entidad();
	if ($usuario_entidad->load("id_usuario=$usuario->id and id_entidad=$id_entidad and (id_rol=1 or id_rol=2)"))
	{
		switch ($modulo)
		{
			case 'actualizar_dato':
			echo 'ssss';	
				$id_valor = sanitize($_REQUEST["id_valor"],INT);
				$value = sanitize($_REQUEST["valor"],SQL);
				$valor = new valor();
				$valor->Load("id = $id_valor");
				$valor->id_usuario = $usuario->id;
				$valor->valor = $value;
				$valor->valor_parcial = $value;
				$valor->fecha_recogida = date();
				$valor->save();
			break;

			case 'asignar_una_medicion':

				$valor = new valor();
				$valor->id_medicion = $id_medicion;	
				$valor->id_entidad = $id_subunidad;	
				$valor->activo = $activo;
				$valor->save();
				$medicion= new medicion();
				if ($_REQUEST["inicio"] == 0)
				{
					$cabeceras = $medicion->find("id_indicador = $id_indicador ORDER BY periodo_inicio");
					$subunidades_mediciones = $entidad->find_subunidades_mediciones($id_indicador,$entidad->id);
				}
				else
				{
					$cabeceras = $medicion->mediciones_periodos($id_indicador,$inicio,$fin);
					$subunidades_mediciones = $entidad->find_subunidades_mediciones_periodos($id_indicador,$id_entidad,$inicio,$fin);
				}
			break;
			case 'activar_uno':
				$valor = new valor();
				$valor->load("id_medicion = $id_medicion AND id_entidad = $id_subunidad");
				$valor->activo = $activo;
				$valor->save();

				$medicion= new medicion();
				if ($_REQUEST["inicio"] == 0)
				{
					$cabeceras = $medicion->find("id_indicador = $id_indicador ORDER BY periodo_inicio");
					$subunidades_mediciones = $entidad->find_subunidades_mediciones($id_indicador,$entidad->id);
				}
				else
				{
					$cabeceras = $medicion->mediciones_periodos($id_indicador,$inicio,$fin);
					$subunidades_mediciones = $entidad->find_subunidades_mediciones_periodos($id_indicador,$id_entidad,$inicio,$fin);
				}
			break;
			case 'mostrar_valores':
				$medicion= new medicion();
				if ($_REQUEST["inicio"] == 0)
					{
						$cabeceras = $medicion->find("id_indicador = $id_indicador ORDER BY periodo_inicio");
						$subunidades_mediciones = $entidad->find_subunidades_mediciones($id_indicador,$entidad->id);
					}
					else
					{
						$cabeceras = $medicion->mediciones_periodos($id_indicador,$inicio,$fin);
						$subunidades_mediciones = $entidad->find_subunidades_mediciones_periodos($id_indicador,$id_entidad,$inicio,$fin);
					}
			break;
			case 'seleccionar_años':
				$medicion= new medicion();
				$years = $medicion->find_year_mediciones($id_indicador);
				$smarty->assign('years',$years);
				$smarty->assign('year_inicio',sanitize($_REQUEST["inicio"], SQL));
				break;
			
			case 'activar_all':
				$medicion= new medicion();
				if ($_REQUEST["inicio"] == 0)
				{
					$valores = new valor();
					$valores->valores_activar($id_indicador,$id_subunidad,$activo);
					$cabeceras = $medicion->find("id_indicador = $id_indicador ORDER BY periodo_inicio");
					$subunidades_mediciones = $entidad->find_subunidades_mediciones($id_indicador,$entidad->id);
				}
				else
				{
					$valores = new valor();
					$v = $valores->valores_activar_periodos($id_indicador,$id_subunidad,$activo,$inicio,$fin);
					$cabeceras = $medicion->mediciones_periodos($id_indicador,$inicio,$fin);
					$subunidades_mediciones = $entidad->find_subunidades_mediciones_periodos($id_indicador,$id_entidad,$inicio,$fin);
}
			break;
		 }
		$smarty->assign('mediciones',$cabeceras);
		$smarty->assign('subunidades_mediciones',$subunidades_mediciones);
		$smarty->assign("modulo",$modulo);
		$plantilla = 'indicador_subunidad_valor_ajax.tpl';
	}
	else
	{
		//escribe un error de falta de permisos en log para poder tener registro del error ya que ajax no lo muestra al estar en segundo plano
	}
}
else
{
	//escribe un error de falta de parámetroe en log para poder tener registro del error ya que ajax no lo muestra al estar en segundo plano
}
?>
