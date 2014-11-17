{if $aviso}<p class='aviso'>{$aviso}</p>{/if}
{if $error}<p class='error'>{$error}</p>{/if}
<h2>{$smarty.const.TXT_CREAR_DIM}</h2>

<form action='index.php?page=dimension_crear' method="post" class="datos" name="formcrear">
	<p><label for='nombre'>{$smarty.const.FIELD_NAME}</label> 
	<input name='nombre' type='text' class='inp' /></p>
	<p><input type='submit' name='submitcrear' value='{$smarty.const.TXT_BTN_Aceptar}' /></p>
</form>

<!--
<p>
<form action='index.php?page=dimension_crear' method="post" class="mini" name="formfiltro">
<label for='criterio'>Filtro:</label> 
<input name='criterio' type='text' class='inp' value='{$criterio}'/>
<input type='submit' name='submit-buscar' value='Aceptar' />
</form></p>
-->
<h2>{$smarty.const.TXT_LIST_DIM}</h2>
<table class='listing' id='sortable'>
	<thead>
		<tr><th>{$smarty.const.FIELD_NAME}</th><th>{$smarty.const.FIELD_ACCIONES}</th></tr>
	</thead>
	<tbody>
	{foreach from=$dimensiones item=dimension}
		<tr>
			<td>{$dimension->nombre}</td>
			<td><a href='index.php?page=dimension_editar&id={$dimension->id}'>{$smarty.const.TXT_EDIT}</a>
				<!--| <a href='index.php?page=dimension_borrar&id={$dimension->id}&id_entidad=0'>Borrar</a>--></td>
		</tr>
   {/foreach}
	</tbody>
</table>
