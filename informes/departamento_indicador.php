<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus (http://wiki.us.es/icasus/)
// Archivo: cuadromando_crear.php
// Tipo: controlador
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin (jjmc@us.es)
//---------------------------------------------------------------------------------------------------
// Descripcion: Prepara los datos para mostrar el formulario que permite crear un nuevo cuadro de mando
//---------------------------------------------------------------------------------------------------

$smarty->assign('_nombre_pagina' , "Unidades UE01 con sus indicadores, valores y fecha");
$plantilla = 'informes/departamento_indicador.tpl';

$ado_entidad = new ado_entidad();
$entidades = $ado_entidad->informe_entidad_indicador('UE01-');
$smarty->assign('entidades',$entidades);
?>
