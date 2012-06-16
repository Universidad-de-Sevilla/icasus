<h3>Datos del usuario</h3>
<a href='index->php?page=usuario_editar&id_usuario={$persona->id_usuario}&id_entidad={$id_operario}'><img src='theme/usevilla/iconos/user_edit.gif' /> Editar usuario</a>

<table>
<thead></thead>
<tbody>
	<tr><th>Nombre</th><td>{$persona->nombre}</td></tr>
	<tr><th>Apellidos</th><td>{$persona->apellidos}</td></tr>
	<tr><th>Login</th><td>{$persona->login}</td></tr>
	<tr><th>Correo</th><td>{$persona->correo}</td></tr>
	<tr><th>Tel&eacute;fono</th><td>{$persona->telefono}</td></tr>
</tbody>
</table>

<h3>Unidades asignadas</h3>
<table>
<thead>
	<th>Unidad</th><th>Rol</th>
</thead>
<tbody>
	{foreach $persona->entidades as $usuario_entidad}
    <tr><td><a href="index.php?page=entidad_datos&id_entidad={$usuario_entidad->id_entidad}">{$usuario_entidad->entidad->nombre}</a></td> <td>{$usuario_entidad->rol->nombre}</td></tr>
	{/foreach}
</tbody>
</table>
