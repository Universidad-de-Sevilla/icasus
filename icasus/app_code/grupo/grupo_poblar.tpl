<form action='index.php?page=grupo/grupo_poblar&id_entidad={$entidad.id_entidad}' method='post' class='mini' name='busqueda'>
<label for='criterio'>Filtro: </label> 
<input name='criterio' type='text' class='inp' value='{$criterio}'/>
<!-- <input name='submit' type='submit' value='Filtrar' /> -->
</form></p>

<form action='index.php?page=grupo/grupo_poblar' method='post' id='formpoblar' name='formpoblar' class='datos'>
	<input type='hidden' name='id_entidad' value='{$entidad.id_entidad}' />
	<p><input type='submit' name='enviar' value='Asignar usuarios' /></p>
	<p><label for='id_rol'>Rol</label> &nbsp; 
	<select name='id_rol' id='id_rol' class='inp'>
	{foreach from=$roles item='rol'}
		<option value="{$rol.id_rol}">{$rol.nombre}</option>
	{/foreach }
	</select></p>
	<table class='listing' id='sortable'>
		<thead>
			<tr><th></th><th>Nombre</th><th>Apellidos</th><th>Correo</th></tr>
		</thead>
		<tbody>
		{foreach from=$lista_usuarios item=usuario}
			<tr>
				<td><input type='checkbox' name='id_usuario[]' value='{$usuario.id_usuario}' /></td>
				<td>{$usuario.nombre}</td>
				<td>{$usuario.apellidos}</td>
				<td>{$usuario.correo}</td>
			</tr>
	   {/foreach}
		</tbody>
	</table>
	<input type='submit' name='enviar' value='Asignar usuarios' />
</form>
