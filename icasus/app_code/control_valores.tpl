		<table class="display datatable"> 
			<thead>
				<tr><th>Proceso</th><th>Unidad</th><th>Indicador</th><th>Fecha</th><th>Valor</th></tr>
			</thead>
			<tbody>
				{foreach from=$valores item=valor}
					<tr>
						<td>
							{if $valor.cod_proceso == ''}
								Datos
							{else}
								<span style="display:none">{$valor.proceso}</span> {$valor.cod_proceso}
							{/if}
						</td>
						<td>{$valor.unidad}</td>
						<td>
<a href="index.php?page=indicador_mostrar&id_indicador={$valor.id_indicador}&id_entidad={$valor.entidad_del_indicador}" title="Ir al indicador">{$valor.indicador}</a>
						</td>
						<td>{$valor.fecha}</td>
						<td>{if $valor.valor == NULL}<a href="index.php?page=medicion_editar&id_medicion={$valor.id_medicion}&tipo={if $valor.cod_proceso == ''}dato{else}indicador{/if}">NULL</a>{/if}</td>
					</tr>
				{/foreach}
			</tbody>	
		</table>

