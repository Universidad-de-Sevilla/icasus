<form action='index.php?page=entidad_poblar' method='post' class='mini' name='busqueda'>
	<input type='hidden' name='id_entidad' value='{$entidad->id}' />
  <label for='criterio'>Nombre, Apellido, UVUS o Unidad: </label> 
  <input name='criterio' type='text' class='inp' value='{$criterio}'/>
  <input name='submit' type='submit' value='Filtrar' />
</form></p>

<form action='index.php?page=entidad_poblar' method='post' name='formpoblar' class='datos'>
	<input type='hidden' name='id_entidad' value='{$entidad->id}' />
	<p><input type='submit' name='enviar' value='Asignar usuarios' /></p>
	<p><label for='id_rol'>Rol</label> &nbsp; 
	<select name='id_rol' id='id_rol' class='inp'>
	{foreach from=$roles item='rol'}
		<option value="{$rol->id}">{$rol->nombre}</option>
	{/foreach }
	</select></p>
	<table class='listing' id='sortable'>
		<thead>
			<tr><th></th><th>Nombre</th><th>Apellidos</th><th>Correo</th><th>Unidad RPT</th><th>Puesto</th></tr>
		</thead>
		<tbody>
		{foreach from=$personas item=persona}
			<tr>
				<td><input type='checkbox' name='id_usuario[]' value='{$persona->id}' /></td>
				<td>{$persona->nombre|upper}</td>
				<td>{$persona->apellidos|upper}</td>
				<td>{$persona->correo}</td>
        <td>{$persona->unidad_hominis}</td>
        <td>{$persona->puesto}</td>
			</tr>
    {/foreach}
		</tbody>
	</table>
	<input type='submit' name='enviar' value='Asignar usuarios' />
</form>
