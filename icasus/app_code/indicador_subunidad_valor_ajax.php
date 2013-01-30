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
$modulo = sanitize($_REQUEST["modulo"],SQL);
$id_entidad = sanitize($_REQUEST["id_entidad"],INT);
$entidad = new entidad();
$entidad->load("id = $id_entidad");
$smarty->assign('entidad', $entidad);
$id_indicador = sanitize($_REQUEST["id_indicador"],INT);
$indicador = new indicador();
$indicador->load("id = $id_indicador");
$smarty->assign('indicador', $indicador);
if(isset($id_indicador) AND isset($modulo) AND isset($id_entidad))
{
	$usuario_entidad = new usuario_entidad();
	if ($usuario_entidad->load("id_usuario=$usuario->id and id_entidad=$id_entidad and (id_rol=1 or id_rol=2)"))
	{
		switch ($modulo)
		{
			case 'activar_individualmente':
				if(isset($_REQUEST["id_subunidad"]) AND isset($_REQUEST["id_medicion"]))
				{
					$id_subunidad = sanitize($_REQUEST["id_subunidad"],INT);
					$id_medicion = sanitize($_REQUEST["id_medicion"],INT);
					$asignada = sanitize($_REQUEST["asignada"],INT);
					$inicio = sanitize($_REQUEST["inicio"],SQL);
					$fin = sanitize($_REQUEST["fin"],SQL);
					if ($asignada == 1)
					{
						$valor = new valor();
						$valor->load("id_medicion = $id_medicion AND id_entidad = $id_subunidad");
						if ($valor->activo == 1)
						{
							$valor->activo = 0;
						}
						else
						{
							$valor->activo = 1;
						}
						$valor->save();
					}
					else
					{
						$valor= new valor();
						$valor->id_medicion = $id_medicion;
						$valor->id_entidad = $id_subunidad;
						$valor->activo = 1;
						$valor->save();
					}
					if ($_REQUEST["inicio"] == 0)
					{
						$medicion= new medicion();
						$cabeceras = $medicion->find("id_indicador = $id_indicador ORDER BY periodo_inicio");
						$smarty->assign('mediciones',$cabeceras);
						$subunidades_mediciones = $entidad->find_subunidades_mediciones($id_indicador,$entidad->id);
						$smarty->assign('subunidades_mediciones',$subunidades_mediciones);
					}
					else
					{
						$inicio = sanitize($_REQUEST["inicio"],INT);
						$fin = sanitize($_REQUEST["fin"],INT);
						$medicion= new medicion();
						$cabeceras = $medicion->mediciones_periodos($id_indicador,$inicio,$fin);
						$smarty->assign('mediciones',$cabeceras);
						$subunidades_mediciones = $entidad->find_subunidades_mediciones_periodos($id_indicador,$id_entidad,$inicio,$fin);
						$smarty->assign('subunidades_mediciones',$subunidades_mediciones);
					}
				}
				else
				{
					//escribe un error de falta de parametros en log para poder tener registro del error 
					//ya que ajax no lo muestra al estar en segundo plano
				}
			break;
			case 'seleccionar_años':
				$medicion= new medicion();
				$years = $medicion->find_year_mediciones($id_indicador);
				$smarty->assign('years',$years);
				$smarty->assign('year_inicio',sanitize($_REQUEST["inicio"], SQL));
				break;
			case 'mostrar_valores':
				if ($_REQUEST["inicio"] == 0)
				{
					//ejecuta la accion de activar/desactivar los valores de las mediciones de la subunidad en el indicador
					if (isset($_REQUEST["activar"]) AND isset($_REQUEST["id_subunidad"]))
					{
						$id_subunidad = sanitize($_REQUEST["id_subunidad"],INT);
						$activar = sanitize($_REQUEST["activar"],INT);
						$valores = new valor();
						$valores->valores_activar($id_indicador,$id_subunidad,$activar);
					}
					else
					{
						//escribe un error de falta de parametros en log para poder tener registro del error 
						//ya que ajax no lo muestra al estar en segundo plano
					}
					$medicion= new medicion();
					$cabeceras = $medicion->find("id_indicador = $id_indicador ORDER BY periodo_inicio");
					$smarty->assign('mediciones',$cabeceras);
					$subunidades_mediciones = $entidad->find_subunidades_mediciones($id_indicador,$entidad->id);
					$smarty->assign('subunidades_mediciones',$subunidades_mediciones);
				}
				else
				{
					$inicio = sanitize($_REQUEST["inicio"],INT);
					$fin = sanitize($_REQUEST["fin"],INT);
					//ejecuta la accion de activar/desactivar los valores de las mediciones seleccionadas por inicio y fin del indicador
					if (isset($_REQUEST["activar"]) AND isset($_REQUEST["id_subunidad"]))
					{
						$id_subunidad = sanitize($_REQUEST["id_subunidad"],INT);
						$activar = sanitize($_REQUEST["activar"],INT);
						$valores = new valor();
						$v = $valores->valores_activar_periodos($id_indicador,$id_subunidad,$activar,$inicio,$fin);
					}
					else
					{
						//escribe un error de falta de parametros en log para poder tener registro del error 
						//ya que ajax no lo muestra al estar en segundo plano
					}
					$medicion= new medicion();
					$cabeceras = $medicion->mediciones_periodos($id_indicador,$inicio,$fin);
					$smarty->assign('mediciones',$cabeceras);
					$subunidades_mediciones = $entidad->find_subunidades_mediciones_periodos($id_indicador,$id_entidad,$inicio,$fin);
					$smarty->assign('subunidades_mediciones',$subunidades_mediciones);
				}
			break;
		}
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
