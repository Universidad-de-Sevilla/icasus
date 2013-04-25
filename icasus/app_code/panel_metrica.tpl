{if $modulo == 'inicio'}
<input type="hidden" name="tipo" value="{$panel->id}">
<input type="hidden" name="inicioYear" value="0000">
<input type="hidden" name="finYear" value="0000">
<input type="hidden" name="inicioMonth" value="00">
<input type="hidden" name="finMonth" value="00">
<input type="hidden" name="inicioDay" value="00">
<input type="hidden" name="finDay" value="00">
<fieldset class="label_side top">
	<label>Nombre</label>
	<div>
		<input class="required text" type="text" name="nombre"></input>
		<div class="required_tag tooltip hover left"></div>
	</div>
</fieldset>

<fieldset class="label_side top">
	<label>Orden</label>
<div class="clearfix">
	<div class="col_25">
		<input class="text required" type="text" name="orden"></input>
	</div>
		<div class="required_tag tooltip hover left"></div>
	</div>
</fieldset>

<fieldset class="label_side top">
	<label>Ancho<span></span></label>
	<div class="clearfix">
		<select name="ancho" class="required">
			{section start=2 loop=17 name="size"}
				<option value="{$smarty.section.size.index}"
				{if $smarty.section.size.index == $panel->ancho_pred}selected="selected"{/if} >
				{$smarty.section.size.index}</option>
			{/section}
		</select>
		<div class="required_tag tooltip hover left"></div>
	</div>
</fieldset>

<fieldset class="label_side top fieldset_indicadores">
	<label>Indicador<span></span></label>
	<div class="clearfix">
		<div class="col_25">
		<input data-id_entidad="{$id_entidad}"class="text" placeholder="Buscar ..." name="buscar_indicador" id="buscar_indicador" type="text">
		</div>
	</div>
	<div id="listado_indicadores">
	</div>
</fieldset>

<fieldset id="subunidades_metrica" class="label_side top">
</fieldset>
<fieldset id="mediciones_metrica" class="label_side top">
</fieldset>
{/if}

{if $modulo == 'subunidades_metrica'}
<label>Subunidad<span></span></label>
<div class="clearfix">
	<div class="col_50">
		<input data-id_indicador="{$id_indicador}" class="required subunidad_seleccionada_metrica"
		name="id_subunidad"type="radio" value="0" data-nombre_indicador="{$nombre_indicador}"data-nombre_subunidad="Total"> Total<br /> 
	{foreach name=subunidades from=$indicador_subunidades item=item}
	{if $smarty.foreach.subunidades.iteration == floor($indicador_subunidades|@count/2)+1 }</div><div class="col_50 no_border">{/if}
		<input data-id_indicador="{$id_indicador}" class="required subunidad_seleccionada_metrica"  name="id_subunidad"type="radio" value="{$item->id_entidad}"> {$item->entidad->etiqueta}<br /> 
	{/foreach}
	</div>
	<div class="required_tag tooltip hover left"></div>
</div>
{/if}

{if $modulo == 'mediciones_metrica'}
	<label>Fecha<span></span></label>
	<div class="clearfix">
		<div class="col_50">
	{foreach name=mediciones from=$mediciones item=item}
	{if $smarty.foreach.mediciones.iteration == floor($mediciones|@count/2)+2}</div><div class="col_50 no_border">{/if}
		<input data-id_indicador="{$id_indicador}" class="required" name="id_medicion"type="radio" value="{$item->id}"> {$item->etiqueta}<br /> 
	{/foreach}
	</div>
	<div class="required_tag tooltip hover left"></div>
	</div>
{/if}

{literal}
<script>
var page = {/literal}"{$panel->clase_css}"{literal};
$('.subunidad_seleccionada_metrica').on('click',function(){
	var id_indicador = $(this).data('id_indicador');
	$.ajax({
		url: "index.php?page="+page+"&ajax=true&modulo=mediciones_metrica&id_indicador="
		+id_indicador,
		success: function(datos){$("#mediciones_metrica").html(datos);}
	});
});
$('#buscar_indicador').on('keyup',function () {
	var cadena = $(this).val();
	var id_entidad = $(this).data('id_entidad');
	$('#subunidades').html('');
	$.ajax({
		url: "index.php?page=panel_buscador&ajax=true&modulo=indicador_metrica&id_entidad="+id_entidad+"&cadena="+cadena,
		success: function(datos){$('#listado_indicadores').html(datos);}
	}); 
});
</script>
{/literal}

