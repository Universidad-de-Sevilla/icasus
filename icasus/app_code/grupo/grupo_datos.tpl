{if $aviso}<p class='aviso'>{$aviso}</p>{/if}
{if $error}<p class='error'>{$error}</p>{/if}
<h3>Datos del Equipo</h3>
	<a href='index.php?page=grupo/grupo_editar&id_entidad={$entidad.id_entidad}'><img src='iconos/16x16/chart_organisation.png' />
	Editar equipo</a>

<a href='index.php?page=grupo/acta_crear&id_entidad={$entidad.id_entidad}'><img src='iconos/16x16/report_add.png' />
	Crear actas</a>

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
<a href='index.php?page=grupo/grupo_poblar&id_entidad={$entidad.id_entidad}'><img src='iconos/16x16/user_add.png' />
	Vincular usuarios</a> 
	&nbsp; <a href='index.php?page=grupo/grupo_despoblar&id_entidad={$entidad.id_entidad}'><img src='iconos/16x16/user_delete.png' />
	Desvincular usuarios</a>
{if $usuarios}
<table class='listing' id='sortable'>
	<thead>
		<tr><th>Rol</th><th>Nombre</th><th>Apellidos</th><th>Correo</th><th>Teléfono</th><th>Acciones</th></tr>
	</thead>
	<tbody>
	{foreach from=$usuarios item=usuario}
		<tr>
			<td>{$usuario.rol}</td>
			<td>{$usuario.nombre}</td>
			<td>{$usuario.apellidos}</td>
			<td><a href='mailto:{$usuario.correo}'>{$usuario.correo}</a></td>
			<td>{$usuario.telefono}</td>
			<td><a href='index.php?page=usuario_datos&id_usuario={$usuario.id_usuario}&id_entidad={$entidad.id_entidad}'>Detalle</a></td>
		</tr>
   {/foreach}
	</tbody>
</table>
{else}
<p class='aviso'>No se han vinculado usuarios a este equipo</p>
{/if}
