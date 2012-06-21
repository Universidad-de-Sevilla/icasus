<h2>Relación de indicadores</h2>
<p>	 
	<a href='index.php?page=indicador_crear&id_entidad={$entidad->id}'><img 
	src='/icons/ff16/chart_curve_add.png' alt='icono' />Crear indicador</a> &nbsp;
	<a href='index.php?page=entidad_indicadores_excel&id_entidad={$entidad->id}'><img 
	src='/icons/ff16/page_excel.png' alt='icono' />Exportar indicadores</a>&nbsp;
	<a href='index.php?page=indicador_publico'><img 
	src='/icons/ff16/chart_curve_world.png' alt='icono' />Mostrar indicadores públicos</a>
</p>
{if $indicadores}
<div class="box grid_16 single_datatable">
  <div id="dt1" class="no_margin">
	<table class='display datatable'>
	<thead>
		<tr><th>Proceso</th><th>Código</th><th>Indicador</th>
		<th>Responsable</th><th>Acciones</th></tr>
	</thead>
		
	<tbody>
		{foreach from=$indicadores item=indicador} 
		  <tr>
			  <td><a
			  href='index.php?page=proceso_mostrar&id_proceso={$indicador->id_proceso}&id_entidad={$entidad->id}'>{$indicador->proceso->nombre}'</a></td>
			  <td>{$indicador->codigo}</td><td><b>{$indicador->nombre}</b> <a href='#'
			  title='{$indicador->descripcion}'>*</a></td>
			  <td><a href='index.php?page=usuario_datos&id_usuario={$indicador->id_responsable}&id_entidad={$entidad->id}'>{$indicador->responsable->nombre} 
							{$indicador->responsable->apellidos}</a></td>
			  <td nowrap>
				<a
				href='index.php?page=indicador_mostrar&id_indicador={$indicador->id}&id_entidad={$entidad->id}'>Mostrar</a><br />
				<a href='index.php?page=indicador_editar&id_indicador={$indicador->id}&id_entidad={$entidad->id}'>Editar</a>
        <!--
				<br /> 
				<a href='index.php?page=indicador_borrar&id_indicador={$indicador->id}&id_entidad={$entidad->id}' 
				onClick="return confirmar();">Borrar</a>
				--> 
				</td>
		  </tr>
		{/foreach}
	</tbody>
	</table>
  </div>
</div>  
{else}
	<p class='aviso'>No hay indicadores definidos para esta entidad.</p>
{/if}
