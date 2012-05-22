{if $aviso}<p class='aviso'>{$aviso}</p>{/if}
{if $error}<p class='error'>{$error}</p>{/if}
<h3>Datos del Equipo</h3>
<a href='index.php?page=grupo/acta_listar&id_entidad={$entidad.id_entidad}'><img src='iconos/16x16/report_magnify.png' />
	Listar actas</a>

<table>
	<tr><th>Código</th><td>{$entidad.codigo}</td></tr>
	<tr><th>Nombre</th><td>{$entidad.nombre}</td></tr>
	<tr><th>Finalidad</th><td>{$entidad.objeto}</td></tr>
	<tr><th>Frecuencia</th><td>{$entidad.frecuencia}</td></tr>
	<tr><th>Unidad superior</th><td>{$entidad.padre}</td></tr>
</table>

<h3>Usuarios</h3>
{if $usuarios}
<table class='listing' id='sortable'>
	<thead>
		<tr><th>Rol</th><th>Nombre</th><th>Apellidos</th><th>Correo</th><th>Teléfono</th></tr>
	</thead>
	<tbody>
	{foreach from=$usuarios item=usuario}
		<tr>
			<td>{$usuario.rol}</td>
			<td>{$usuario.nombre}</td>
			<td>{$usuario.apellidos}</td>
			<td><a href='mailto:{$usuario.correo}'>{$usuario.correo}</a></td>
			<td>{$usuario.telefono}</td>
		</tr>
   {/foreach}
	</tbody>
</table>
{else}
<p class='aviso'>No se han vinculado usuarios a este equipo</p>
{/if}
