<table>
<thead><tr><th>Unidad</th><th>Valor</th><th>Fecha recogida</th><th>Usuario que graba</th></tr></thead>
<tbody>
{foreach $valores as $valor}
	<tr>
	<td>{$valor->entidad->nombre}</td>
	<td>
	{if $valor->autorizado == 1}
		<a href="javascript:void(0)" onclick="fila_editar('{$medicion_edit}','{$valor->id}')">{$valor->valor}</a>
	{else}
		{$valor->valor}                       
	{/if}
	</td>
	<td>{$valor->fecha_recogida|date_format:"%d-%m-%Y"}</td>
	<td>{$valor->usuario->nombre} {$valor->usuario->apellidos}</td>
	</tr>
{/foreach}
</tbody>
</table>
