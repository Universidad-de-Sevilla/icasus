{if $aviso}<p class='aviso'>{$aviso}</p>{/if}
{if $error}<p class='error'>{$error}</p>{/if}
<h3>Cuadro indicadores entidad</h3>
<p><a href='index.php?page=indicador_crear&id_entidad={$entidad.id_entidad}'><img src='iconos/16x16/chart_curve_add.png' />
	Crear indicador</a> &nbsp; <a href='index.php?page=entidad_datos&id_entidad={$entidad.id_entidad}'><img
	src='iconos/16x16/chart_organisation.png' /> Ver entidad</a></p>

{if $indicadores}
	<table>
		{foreach from=$indicadores item=indicador}

		{/foreach}
	</table>
	{foreach from=$indicadores item=indicador}
		<div class='marcosimple'>
		<h3><a
		href="index.php?page=indicador_datos&id_indicador={$indicador->id_indicador}">{$indicador->codigo}</a>
		{$indicador->nombre}</h3>
		<strong>Proceso:</strong> {$indicador->proceso->nombre}
		<br /><strong>Formulaci&oacute;n:</strong> {$indicador->formulacion}
		<br /><strong>Descripci&oacute;n:</strong> {$indicador->descripcion}
		<p><img src='theme/usevilla/leyenda500.png' alt='Leyenda' /><br /><img src='{$indicador->ruta_imagen}' alt='grafica del indicador' /></p>
		</div>
	{/foreach}
{else}

	<p class='aviso'>No hay indicadores definidos para esta entidad.</p>
{/if}	

