<h3> 
  <!--<a href='index.php?page=entidad_editar&id_entidad={$entidad->id}'><img src='/icons/ff16/chart_organisation.png' />
  Editar unidad</a> &nbsp; &nbsp; -->
  <a href='index.php?page=proceso_listar&id_entidad={$entidad->id}'><img src='/icons/ff16/cog.png' />
  Ver procesos</a> &nbsp; &nbsp; &nbsp;
  <a href='index.php?page=indicador_listar&id_entidad={$entidad->id}'><img src='/icons/ff16/chart_curve.png' />
  Ver indicadores</a> &nbsp; &nbsp; 
  <a href='index.php?page=entidad_editar&id_entidad={$entidad->id}'><img src='/icons/ff16/chart_organisation.png' />
  Editar Unidad</a> &nbsp; &nbsp; 
</h3>
<div class="box grid_16">
	<div class="toggle_container">
		<div class="block">
			<fieldset class="label_side">
				<label>Código</label>
				<div class="clearfix">
						<span>{$entidad->codigo}</span>
				</div>
			</fieldset>	
			<fieldset class="label_side">
				<label>Nombre</label>
				<div class="clearfix">
						<span>{$entidad->nombre}</span>
				</div>
			</fieldset>	
			<fieldset class="label_side">
				<label>Página web</label>
				<div class="clearfix">
						<span><a href='{$entidad->web}'>{$entidad->web}</a></span>
				</div>
			</fieldset>	
			<fieldset class="label_side">
				<label>Unidad superior</label>
				<div class="clearfix">
						<span><a href="index.php?page=entidad_datos&id_entidad={$entidad->madre->id}">{$entidad->madre->nombre}</a></span>
				</div>
			</fieldset>	
		</div>
	</div>
</div>

<h2>Usuarios</h2>
			<h3>
				<a href='index.php?page=entidad_poblar&id_entidad={$entidad->id}'><img src='/icons/ff16/user_add.png' />
					Vincular usuarios</a> &nbsp; &nbsp; &nbsp;
					&nbsp; <a href='index.php?page=entidad_despoblar&id_entidad={$entidad->id}'><img src='/icons/ff16/user_delete.png' />
					Desvincular usuarios</a>
			</h3>

{if $usuarios}
	<div class="box grid_16">
		<div class="block">	
			<table class='static'>
				<thead>
					<tr><th>Rol</th><th>Nombre</th><th>Apellidos</th><th>Correo</th><th>Teléfono</th><th>Acciones</th></tr>
				</thead>
				<tbody>
				{foreach from=$usuarios item=usuario}
					<tr>
						<td>{$usuario->rol->nombre}</td>
						<td>{$usuario->usuario->nombre}</td>
						<td>{$usuario->usuario->apellidos}</td>
						<td><a href='mailto:{$usuario->usuario->correo}'>{$usuario->usuario->correo}</a></td>
						<td>{$usuario->usuario->telefono}</td>
						<td><a href='index.php?page=usuario_mostrar&id_usuario={$usuario->usuario->id}&id_entidad={$entidad->id}'>Detalle</a></td>
					</tr>
			   {/foreach}
				</tbody>
			</table>
		</div>
	</div>	
{else}
<div class="alert alert_blue">No se han vinculado usuarios a esta entidad</div>
{/if}

<h2>Subunidades</h2>
{if $subentidades}
	<div class="box grid_16">
		<div class="block">
			<table class="static">
				<thead>
					<tr><th>Código</th><th>Nombre</th><th>Acciones</th></tr>
				</thead>
				<tbody>
				{foreach from=$subentidades item=subentidad}
					<tr class="gradeX">
						<td>{$subentidad->codigo}</td>
						<td>{$subentidad->nombre}</td>
						<td><a href='index.php?page=entidad_datos&id_entidad={$subentidad->id}'>Mostrar</a></td>
					</tr>
			   	{/foreach}
				</tbody>
			</table>
		</div>
	</div>	
{else}
<div class="alert alert_blue">Esta unidad no tiene subunidades</div>
{/if}
