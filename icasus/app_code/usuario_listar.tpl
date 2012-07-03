<div><h1 style="color: #999999; font-weight: normal;">ICASUS - APLICACIÓN WEB PARA LA GESTIÓN DE CALIDAD DE LOS SERVICIOS DE LA UNIVERSIDAD DE SEVILLA</h1>
<h2>B&uacute;squeda de Usuarios</h2>
</div>
<!--
<form action='index.php?page=usuario_listar' method="post" class="mini" name="formfiltro">
  <label for='criterio'>Buscar:</label> 
  <input name='criterio' type='text' class='inp' value='{if $criterio}{$criterio}{/if}'/>
  <input type='submit' name='submit-buscar' value='Aceptar' />
</form>
-->

<div class="box grid_16 single_datatable">
	<div id="dt1" class="no_margin">
		<table class="display datatable"> 
			<thead>
				<tr><th>Nombre</th><th>Apellidos</th><th>Correo</th><th>Teléfono</th><th>Unidad de destino</th><th>Acciones</th></tr>
			</thead>
			<tbody>
			{foreach from=$usuarios item=usuario}
				<tr class="gradeX">
					<td>{$usuario->nombre}</td>
					<td>{$usuario->apellidos}</td>
					<td><a href='mailto:{$usuario->correo}'>{$usuario->correo}</a></td>
					<td>{$usuario->telefono}</td>
		      <td>{$usuario->unidad_hominis}</td>
					<td><a href='index.php?page=usuario_mostrar&id_usuario={$usuario->id}'>Detalle</a>
		      </td>
				</tr>
		   {/foreach}
			</tbody>
		</table>
	</div>
</div>
