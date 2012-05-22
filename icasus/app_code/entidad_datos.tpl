{if $aviso}<p class='aviso'>{$aviso}</p>{/if}
{if $error}<p class='error'>{$error}</p>{/if}
<h3>Datos de la unidad</h3>
<a href='index.php?page=entidad_editar&id_entidad={$entidad.id_entidad}'><img src='iconos/16x16/chart_organisation.png' />
	Editar unidad</a>
	&nbsp; <a href='index.php?page=indicador_listar&id_entidad={$entidad.id_entidad}'><img src='iconos/16x16/chart_curve.png' />
	Ver indicadores</a> 
	&nbsp; <a href='index.php?page=indicador_copiar&id_entidad={$entidad.id_entidad}'><img 
	src='iconos/16x16/chart_curve_link.png' alt='icono' />Copiar indicador</a>
	&nbsp; <a href='index.php?page=indicador_crear&id_entidad={$entidad.id_entidad}'><img src='iconos/16x16/chart_curve_add.png' />
	Crear indicador</a>
	&nbsp; <a href='index.php?page=proceso_listar&id_entidad={$entidad.id_entidad}'><img src='iconos/16x16/cog.png' />
	Ver procesos</a>

<table>
	<tr><th>Código</th><td>{$entidad.codigo}</td></tr>
	<tr><th>Nombre</th><td>{$entidad.nombre}</td></tr>
	<tr><th>Página web</th><td><a href='{$entidad.web}'>{$entidad.web}</a></td></tr>
	<tr><th>Unidad superior</th><td>{$entidad.padre}</td></tr>
</table>

<h3>Usuarios</h3>
<a href='index.php?page=entidad_poblar&id_entidad={$entidad.id_entidad}'><img src='iconos/16x16/user_add.png' />
	Vincular usuarios</a> 
	&nbsp; <a href='index.php?page=entidad_despoblar&id_entidad={$entidad.id_entidad}'><img src='iconos/16x16/user_delete.png' />
	Desvincular usuarios</a>
<!--
<p>
<form action='index.php?page=entidad_datos' method='post' class='mini' name='busqueda'> 
<input name='criterio' type='text' class='inp' value='{$criterio}'/>
<input name='id_entidad' type='hidden' value='{$entidad.id_entidad}' /> 
<input name='submit' type='submit' class='inp' value='Buscar' /> 
</form></p>
-->
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
<p class='aviso'>No se han vinculado usuarios a esta entidad</p>
{/if}

<h3>Subunidades</h3> 
{if $subentidades}
<table class='listing' id='sortable'>
	<thead>
		<tr><th>Código</th><th>Nombre</th><th>Acciones</th></tr>
	</thead>
	<tbody>
	{foreach from=$subentidades item=subentidad}
		<tr>
			<td>{$subentidad->codigo}</td>
			<td>{$subentidad->nombre}</td>
			<td><a href='index.php?page=entidad_datos&id_entidad={$subentidad->id_entidad}'>Mostrar</a></td>
		</tr>
   	{/foreach}
	</tbody>
</table>
{else}
<p class='aviso'>Esta unidad no tiene subunidades</p>
{/if}
