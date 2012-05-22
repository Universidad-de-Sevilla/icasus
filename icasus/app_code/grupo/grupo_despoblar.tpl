{if $aviso}<p class='aviso'>{$aviso}</p>{/if}
<h2>Bajas de usuarios</h2>
<p>&nbsp;</p>
<form action='index.php?page=grupo/grupo_despoblar' method='post' class='formdiv' name='formdiv'>
	<input type='hidden' name='id_entidad' value='{$entidad.id_entidad}' />
	<input type='submit' name='enviar' value='Desasignar usuarios marcados' />
	<table class='listing' id='sortable'>
		<thead>
			<tr><th></th><th>Nombre</th><th>Apellidos</th><th>Correo</th></tr>
		</thead>
		<tbody>
		{foreach from=$usuarios item=usuario}
			<tr>
				<td><input type='checkbox' name='id_usuario[]' value='{$usuario.id_usuario}' /></td>
				<td>{$usuario.nombre}</td>
				<td>{$usuario.apellidos}</td>
				<td><a href='mailto:{$usuario.correo}'>{$usuario.correo}</a></td>
			</tr>
	   {/foreach}
		</tbody>
	</table>
	<input type='submit' name='enviar' value='Desasignar usuarios marcados' />
</form>
