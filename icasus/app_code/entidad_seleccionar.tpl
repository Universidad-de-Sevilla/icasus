<p>Seleccione o comience a teclear el nombre de la entidad a la que se copiar&aacute; el indicador.</p>
<form name='seleccionaentidad' id='seleccionaentidad' action='index.php?page=indicador_copiar' method='post' class='datos'>
	<input type='hidden' name='id_indicador' value='{$id_indicador}' />
	<input type='hidden' name='id_entidad' value='' />
	<select name='id_entidad' class='inp'>
		<option value=''></option>
	{foreach from=$entidades item=entidad}
		<option value='{$entidad.id_entidad}'>{$entidad.nombre}</option>
	{/foreach}
	<input type='submit' class='submit-btn' value='Enviar' />
</form>
