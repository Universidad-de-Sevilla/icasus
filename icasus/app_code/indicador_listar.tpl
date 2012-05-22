{if $aviso}<p class='aviso'>{$aviso}</p>{/if}
{if $smarty.get.aviso}<p class='aviso'>{$smarty.get.aviso}</p>{/if}
{if $error}<p class='error'>{$error}</p>{/if}
{if $smarty.get.error}<p class='error'>{$smarty.get.error}</p>{/if}
<h3>Relación de indicadores</h3>
<p>	 
	<a href='index.php?page=indicador_copiar&id_entidad={$entidad.id_entidad}'><img 
	src='iconos/16x16/chart_curve_link.png' alt='icono' />Copiar indicador</a> &nbsp; 
	<a href='index.php?page=indicador_crear&id_entidad={$entidad.id_entidad}'><img 
	src='iconos/16x16/chart_curve_add.png' alt='icono' />Crear indicador</a> &nbsp;
	<a href='index.php?page=entidad_indicadores_excel&id_entidad={$entidad.id_entidad}'><img 
	src='iconos/16x16/page_excel.png' alt='icono' />Exportar indicadores</a>&nbsp;
	<a href='index.php?page=indicador_publico'><img 
	src='iconos/16x16/chart_curve_world.png' alt='icono' />Mostrar indicadores públicos</a>
</p>
{if $indicadores}
	<table class='listing' id='sortable' >
	<thead>
		<tr><th>Proceso</th><th>Código</th><th>Indicador</th>
		<th>F&oacute;rmula</th><th>Responsable</th><th>Acciones</th></tr>
	</thead>
		
	<tbody>
		{foreach from=$indicadores item=indicador} 
		  <tr>
			  <td><a
			  href='index.php?page=proceso_mostrar&id_proceso={$indicador.id_proceso}&id_entidad={$entidad.id_entidad}'>{$indicador.proceso}'</a></td>
			  <td>{$indicador.codigo}</td><td><b>{$indicador.nombre_indicador}</b> <a href='#'
			  title='{$indicador.descripcion}'>*</a></td>
			  <td>{$indicador.formulacion}</td>
			  <td><a href='index.php?page=usuario_datos&id_usuario={$indicador.id_responsable}&id_entidad={$entidad.id_entidad}'>{$indicador.nombre_responsable} 
							{$indicador.apellidos_responsable}</a></td>
			  <td nowrap>
				<a
				href='index.php?page=indicador_datos&id_indicador={$indicador.id_indicador}&id_entidad={$entidad.id_entidad}'>Mostrar</a><br />
				<!--
				<a href='index.php?page=indicador_copiar&id_indicador={$indicador.id_indicador}'>Copiar</a>
				--> 
				<a
				href='index.php?page=valor_crear&id_indicador={$indicador.id_indicador}&id_entidad={$entidad.id_entidad}'>Grabar valor</a>
				<br /> 
				<a href='index.php?page=indicador_editar&id_indicador={$indicador.id_indicador}&id_entidad={$entidad.id_entidad}'>Editar</a>
				<br /> 
				<a href='index.php?page=indicador_borrar&id_indicador={$indicador.id_indicador}&id_entidad={$entidad.id_entidad}' 
				onClick="return confirmar();">Borrar</a>
				</td>
		  </tr>
		{/foreach}
	</tbody>
	</table>
{else}
	<p class='aviso'>No hay indicadores definidos para esta entidad.</p>
{/if}
