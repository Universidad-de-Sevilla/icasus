{if $error}<p class='error'>{$error}</p>{/if} 
{if $aviso}<p class='aviso'>{$aviso}</p>{/if} 
<h3>Datos del usuario</h3>
<a href='index.php?page=usuario_editar&id_usuario={$usuario.id_usuario}&id_entidad={$id_operario}'><img src='theme/usevilla/iconos/user_edit.gif' /> Editar usuario</a>

<table>
<thead></thead>
<tbody>
	<tr><th>Nombre</th><td>{$usuario.nombre}</td></tr>
	<tr><th>Apellidos</th><td>{$usuario.apellidos}</td></tr>
	<tr><th>Login</th><td>{$usuario.login}</td></tr>
	<tr><th>Correo</th><td>{$usuario.correo}</td></tr>
	<tr><th>Tel&eacute;fono</th><td>{$usuario.telefono}</td></tr>
</tbody>
</table>

<h3>Unidades asignadas</h3>
<table>
<thead>
	<th>Unidad</th><th>Rol</th>
</thead>
<tbody>
	{foreach from=$entidades item=entidad}
	<tr><td><a href="index.php?page=entidad_datos&id_entidad={$entidad.id_entidad}">{$entidad.nombre}</a></td> <td>{$entidad.rol}</td></tr>
	{/foreach}
</tbody>
</table>
