{if $aviso}<p class='aviso'>{$aviso}</p>{/if}
{if $smarty.get.aviso}<p class='aviso'>{$smarty.get.aviso}</p>{/if}
{if $error}<p class='error'>{$error}</p>{/if}
{if $smarty.get.error}<p class='error'>{$smarty.get.error}</p>{/if}

<h3>Entidad: {$entidad.nombre_entidad}</h3>
<h3>Relación de indicadores de subentidades</h3>
{if $indicadores}
	<table class='listing' id='sortable'>
	<thead>
		<tr><th>Unidad</th><th>Proceso</th><th>Código</th><th>Indicador</th>
		<th>Formulaci&oacute;n</th><th>Formulación</th><th>Objetivo</th><th>Periodicidad</th><th>Fuente</th></tr>
	</thead>
		
	<tbody>
		{foreach from=$indicadores item=indicador} 
		  <tr>
			  <td>{$indicador.nombre_entidad}</td>
              <td><a href='index.php?page=proceso_mostrar&id_proceso={$indicador.id_proceso}&id_entidad={$entidad.id_entidad}'>{$indicador.proceso}</a></td>
			  <td>{$indicador.codigo}</td>
              <td><a href='index.php?page=indicador_datos&id_indicador={$indicador.id_indicador}&id_entidad={$entidad.id_entidad}'>{$indicador.nombre_indicador}</a></td>
              <td>{$indicador.formulacion}</td>
			  <td>{$indicador.descripcion}</td>
			  <td>{$indicador.objetivo}</td>
              <td>{$indicador.periodicidad}</td>
              <td>{$indicador.fuente}</td>
		  </tr>
		{/foreach}
	</tbody>
	</table>
{else}
	<p class='aviso'>No hay indicadores definidos para las subentidades de esta entidad.</p>
{/if}
