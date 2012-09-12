<h3>	 
  <a href='index.php?page=dato_crear&id_entidad={$entidad->id}'><img 
  src='/icons/ff16/table_add.png' />Crear dato</a> &nbsp; &nbsp;
  <a href='index.php?page=indicador_listar&id_entidad={$entidad->id}'><img 
  src='/icons/ff16/chart_curve.png' />Listar Indicadores</a> &nbsp; &nbsp;
  <!--
  <a href='index.php?page=entidad_datos_excel&id_entidad={$entidad->id}'><img 
  src='/icons/ff16/page_excel.png' alt='icono' />Exportar datos</a>&nbsp; &nbsp;
  <a href='index.php?page=dato_publico'><img 
  src='/icons/ff16/chart_curve_world.png' alt='icono' />Mostrar datos públicos</a>
  -->
</h3>
{if $datos}
<div class="box grid_16 single_datatable">
  <div id="dt1" class="no_margin">
	<table class='display datatable'>
	<thead>
		<tr><th>ID</th><th>Código</th><th>Nombre</th><th>Responsable</th></tr>
	</thead>
	<tbody>
		{foreach from=$datos item=dato} 
		  <tr>
			  <td>{$dato->id}</td>
			  <td>{$dato->codigo}</td>
        <td>
          <a href="index.php?page=medicion_listar&id_dato={$dato->id}&id_entidad={$entidad->id}&tipo=dato"><img src="/icons/ff16/time.png" /></a>
          <a href='index.php?page=dato_mostrar&id_dato={$dato->id}&id_entidad={$entidad->id}'>{$dato->nombre}</a>
          <a href='#' title='{$dato->descripcion}'>*</a>
        </td>
			  <td>
          <a href='index.php?page=usuario_datos&id_usuario={$dato->id_responsable}&id_entidad={$entidad->id}'>{$dato->responsable->nombre}
            {$dato->responsable->apellidos}</a>
        </td>
		  </tr>
		{/foreach}
	</tbody>
	</table>
  </div>
</div>  
{else}
	<p class='aviso'>No hay datos definidos para esta entidad.</p>
{/if}
