{if $aviso}<p class='aviso'>{$aviso}</p>{/if}
{if $error}<p class='error'>{$error}</p>{/if}
<h2>Diccionario de indicadores</h2>
<p><a href="index.php?page=indicador_listar&id_entidad={$id_entidad}"><img 
	src='iconos/16x16/chart_curve.png' alt='icono' /> Mis Indicadores</a> &nbsp;

</p>
{if $indicadores}
<form id='copia' name='copia' method='post' class='datos' action='index.php?page=indicador_copiar'>
	<input type='submit' name='enviar' value='Copiar indicadores' />
	<input type='hidden' name='id_entidad' value='{$id_entidad}' />
	<table class='listing' id='sortable'>
	<thead>
		<tr><th></th><th>C&oacute;digo</th><th>Indicador</th><th>Descripci&oacute;n</th><th>Formulaci&oacute;n</th></tr>
	</thead>
	<tbody>
		{foreach from=$indicadores item=indicador} 
		  <tr><td><input type='checkbox' name='indicadores[]' value='{$indicador.id_indicador}' /></td>
		  <td>{$indicador.codigo}</td>
		  <td>{$indicador.nombre_indicador}</td>
		  <td>{$indicador.descripcion}</td>
		  <td>{$indicador.formulacion}</td>
		  </tr>
		{/foreach}
	</tbody>
	</table>
	<input type='submit' name='enviar' value='Copiar indicadores' />
</form>
{else}
	<p class='aviso'>No hay indicadores definidos en la unidad superior.</p>
{/if}
