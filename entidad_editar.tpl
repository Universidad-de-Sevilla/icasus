{if $aviso}<p class='aviso'>{$aviso}</p>{/if}
{if $error}<p class='error'>{$error}</p>{/if}
<h3>Editando unidad</h3>
<form method='post' action='index.php?page=entidad_editar' name='formentidad' id='formentidad' class="datos">
	<input type='hidden' name='id_entidad' id='id_entidad' value='{$entidad.id_entidad}' />

	<p><label for='nombre'>Nombre unidad</label> &nbsp; <span class='grey'>(requerido)</span>
	<input type='text' name='nombre' id='nombre' class='inp' value='{$entidad.nombre}' /></p>
	
	<p><label for='codigo'>C&oacute;digo</label> &nbsp; 
	<input type='text' name='codigo' id='codigo' class='inp' value='{$entidad.codigo}' /></p>

	<p><label for='id_padre'>Unidad superior</label> &nbsp; 
	<select name='id_padre' id='id_padre' class='inp'>
	{foreach from=$entidades item=padre}
		<option value='{$padre.id_entidad}' {if $entidad.id_padre == $padre.id_entidad}selected{/if}>{$padre.nombre}
		</option>
	{/foreach}
	</select></p>
	
	<p><label for='web'>Página web</label> &nbsp; 
	<input type='text' name='web' id='web' class='inp' value='{$entidad.web}' /></p>
	
	<p><input type='button' class='submit-btn' value='Grabar' name='entidad_submit' 
	onclick='javascript:entidad_validar();' /></p>
</form>
