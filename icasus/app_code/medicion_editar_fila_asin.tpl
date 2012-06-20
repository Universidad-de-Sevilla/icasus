<table>
	<thead><tr><th>Unidad</th><th>Valor</th><th>Fecha recogida</th><th>Usuario que graba</th></tr></thead>
	<tbody>
		{foreach $valores as $valor}
		<tr>
			<td>{$valor->entidad->nombre}</td>
			<td>
			{if $valor->id == $valor_edit}
				<input name="v_{$valor->id}" type="text" value="{$valor->valor}" style="width:50px"><br/> 
				<a href="javascript:void(0)" onclick="javascript:fila_grabar('{$valor->id}','{$medicion->id}')">G</a> - 
				<a href="javascript:void(0)" onclick="javascript:fila_cancelar('{$medicion->id}')">C</a>
			{else}
				<a href="javascript:void(0)" onclick="fila_editar('{$medicion->id}','{$valor->id}')">{$valor->valor}</a>
			{/if}
		</td>
		<td>{$valor->fecha_recogida|date_format:"%d-%m-%Y"}</td>
		<td>{$valor->usuario->nombre} {$valor->usuario->apellidos}</td>
	</tr>
	{/foreach}
	</tbody>
</table>
<img src="index.php?page=grafica_indicador_segregado&id_indicador={$indicador->id}&medicion={$medicion->etiqueta}" width="600" height="550" alt="Valores del indicador recogidos en cada subunidad par    a esta medición" />
