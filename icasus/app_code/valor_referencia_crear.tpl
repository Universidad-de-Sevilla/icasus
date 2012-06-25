{literal}
<script>
$(document).ready(function(){
	$("#crear_referencia").hide();
	$("#display_crear_referencia").click(function(){
		$("#crear_referencia").show();
	});
});
</script>
{/literal}
<h3 class="section">
	<a href='javascript:window.history.back();'><img src='/icons/ff16/arrow_undo.png' /> Cancelar</a>
  <a href='javascript:void(0)' id="display_crear_referencia"><img 
    src='/icons/ff16/tag.png' /> Crear nuevos valores de referencia</a> &nbsp;
</h3>
<div id="crear_referencia">
<div class="box grid_16">
<div class="toggle_container">
<div class="block">
<form method="post" action="index.php?page=valor_referencia_grabar&id_indicador={$indicador->id}" id="formvalorreferencia" name="valorreferencia" class="datos">
<fieldset class="label_side">
<label>Etiqueta</label>
<div><b><input  type='text' name='etiqueta' /></b></div>
</fieldset>
<fieldset class="label_side">
<label>Nombre</label>
<div><b><input  type='text' name='nombre' /></b></div>
</fieldset>
<fieldset class="label_side">
<label>Visible en gráfica</label>
<div><b><input  type='radio' name='grafica' value="1" checked="checked"/> Sí <input  type='radio' name='grafica' value="0"/>No</b></div>
</fieldset>
<fieldset class="label_side">
<div>
<input type="submit" value="Grabar" name="valor_referencia_submit" />
</div>
</fieldset>
</form>	
</div>
</div>
</div>
</div>
<div class="box grid_16 single_datatable">
  <div id="dt1" class="no_margin">
	<table class='display datatable'>
	<thead>
		<tr><th>Etiqueta</th><th>Valor de referencia</th><th>Mostrar en gráfica</th></tr>
	</thead>
		
	<tbody>
		{foreach from=$indicador->valores_referencia item=item} 
		  <tr>
			  <td>{$item->etiqueta}</td>
			  <td>{$item->nombre}</td>
			  <td>{if $item->grafica == 1}Sí{else}No{/if}</td>
		  </tr>
		{/foreach}
	</tbody>
	</table>
  </div>
</div>  
