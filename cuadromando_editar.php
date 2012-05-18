<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: cuadromando_editar.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Editar un cuadro de mandos existente
//---------------------------------------------------------------------------------------------------

global $smarty;
global $plantilla;
global $operario;

// Esto es para prevenir que se cargue el script sin pasar por index.php
if (!is_object($smarty))
{
	header('Location:index.php');	
}

if (isset($_REQUEST['id']))
{  
	$id = sanitize($_REQUEST['id'],16);
	
	//Carga el objeto cuadromando solicitado
        $cuadromando = new cuadromando();
        $cuadromando->load("id = $id");
        $smarty->assign('cuadromando',$cuadromando);	

	//carga las entidades del usuario con sus indicadores contenidos en el CM
	$entidad = new ado_usuario_entidad();
	$entidades_indicadores_in = $entidad->carga_entidades_indicadores_in_cuadromando('id_usuario = '.$operario->id_usuario.' AND id_entidad < 221',$id);
	$smarty->assign('entidades_in',$entidades_indicadores_in);

	//carga las entidades del usuario con sus indicadores contenidos en el CM
	$entidades_indicadores_out = $entidad->carga_entidades_indicadores_out_cuadromando('id_usuario = '.$operario->id_usuario.' AND id_entidad < 221',$id);
	$smarty->assign('entidades_out',$entidades_indicadores_out);

	$plantilla = 'cuadromando_editar.tpl';

}
else
{
        header("Location: index.php");
}

?>
