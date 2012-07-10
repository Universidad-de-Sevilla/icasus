{if $aviso}<p class='aviso'>{$aviso}</p>{/if}
{if $error}<p class='error'>{$error}</p>{/if}
<h2>Crear dimensi&oacute;n</h2>

<form action='index.php?page=dimension_crear' method="post" class="datos" name="formcrear">
	<p><label for='nombre'>Nombre</label> 
	<input name='nombre' type='text' class='inp' /></p>
	<p><input type='submit' name='submitcrear' value='Aceptar' /></p>
</form>

<!--
<p>
<form action='index.php?page=dimension_crear' method="post" class="mini" name="formfiltro">
<label for='criterio'>Filtro:</label> 
<input name='criterio' type='text' class='inp' value='{$criterio}'/>
<input type='submit' name='submit-buscar' value='Aceptar' />
</form></p>
-->
<h2>Lista de dimensiones</h2>
<table class='listing' id='sortable'>
	<thead>
		<tr><th>Nombre</th><th>Acciones</th></tr>
	</thead>
	<tbody>
	{foreach from=$dimensiones item=dimension}
		<tr>
			<td>{$dimension->nombre}</td>
			<td><a href='index.php?page=dimension_editar&id={$dimension->id}'>Editar</a>
				<!--| <a href='index.php?page=dimension_borrar&id={$dimension->id}&id_entidad=0'>Borrar</a>--></td>
		</tr>
   {/foreach}
	</tbody>
</table>
