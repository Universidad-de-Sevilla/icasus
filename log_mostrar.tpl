<table class="datos">
<thead>
	<tr><th>Fecha/hora</th><th>Evento</th><th>Objeto</th><th>Usuario</th></tr>
</thead>
<tbody>
	{foreach from=$logs item=log}
		<tr>
		<td nowrap>{$log->fecha|date_format:"%H:%M:%S %e/%m/%Y"}</td> 
		<td nowrap>{$log->page}</td> 
		<td nowrap>{$log->id_objeto}</td>
		<td nowrap>{$log->usuario->nombre} {$log->usuario->apellidos}</td>
		</tr>
	{/foreach}
</tbody>	
</table>
