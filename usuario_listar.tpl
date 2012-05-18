{if $aviso}<p class='aviso'>{$aviso}</p>{/if}
{if $error}<p class='error'>{$error}</p>{/if}
<p>
<form action='index.php?page=usuario_listar' method="post" class="mini" name="formfiltro">
<input type='hidden' name='id_entidad' value='0' />
<label for='criterio'>Filtro:</label> 
<input name='criterio' type='text' class='inp' value='{$criterio}'/>
<!--<input type='submit' name='submit-buscar' value='Aceptar' />-->
</form></p>
<table class='listing' id='sortable'>
	<thead>
		<tr><th>Nombre</th><th>Apellidos</th><th>Correo</th><th>Teléfono</th><th>Acciones</th></tr>
	</thead>
	<tbody>
	{foreach from=$lista_usuarios item=usuario}
		<tr>
			<td>{$usuario.nombre}</td>
			<td>{$usuario.apellidos}</td>
			<td><a href='mailto:{$usuario.correo}'>{$usuario.correo}</a></td>
			<td>{$usuario.telefono}</td>
			<td><a href='index.php?page=usuario_datos&id_usuario={$usuario.id_usuario}&id_entidad={$entidad.id_entidad}'>Detalle</a>
				| <a href='index.php?page=usuario_borrar&id_usuario={$usuario.id_usuario}&id_entidad=0'>Borrar</a></td>
		</tr>
   {/foreach}
	</tbody>
</table>
