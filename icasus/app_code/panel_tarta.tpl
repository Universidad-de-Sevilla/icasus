{if $modulo == 'inicio'}
<fieldset class="label_side top">
	<label>Nombre</label>
	<div>
		<input class="required text error" type="text" name="nombre"></input>
		<div class="required_tag tooltip hover left"></div>
	</div>
</fieldset>

<fieldset class="label_side top">
	<label>Orden</label>
	<div>
		<input class="text" type="text" name="orden"></input>
	</div>
</fieldset>

<fieldset class="label_side top">
	<label>Panel<span></span></label>
	<div class="clearfix">
		<input type="hidden" value="{$panel->id}" name="tipo" class="required text error">
		{$panel->nombre|htmlentities|@ucfirst}
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
	<label>Indicadores<span></span></label>
	<div class="clearfix">
		<div class="col_25">
		<input data-id_entidad="{$id_entidad}"class="text" placeholder="Buscar ..." name="buscar_indicador" id="buscar_indicador" type="text">
		</div>
	</div>
	<div id="listado_indicadores"  class="clearfix">
							<ul style="list-style:none">
							{foreach from=$indicadores item=item}
							<li><input data-id_entidad="{$id_entidad}" data-id_indicador="{$item->id}"
									class="required indicador_seleccionado" type="radio" 
									name="id_indicador" value="{$item->id}"> 
									{$item->nombre}</li>
						{/foreach}
						</ul>
		<div id="paginacion" class="box clearfix">Paginación</div>
		<div class="required_tag tooltip hover left"></div>
	</div>
</fieldset>

<fieldset id="medicion" class="label_side top">
</fieldset>
{/if}
{if $modulo == 'mediciones'}
	<label>Fecha<span></span></label>
	<div class="clearfix">
		<div class="col_50">
	{foreach name=mediciones from=$mediciones item=item}
	{if $smarty.foreach.mediciones.iteration == floor($mediciones|@count/2)+2}</div><div class="col_50 no_border">{/if}
		<input class="required" name="id_medicion_inicio"type="radio" value="{$item->id}"> {$item->etiqueta}<br /> 
	{/foreach}
	</div>
	<div class="required_tag tooltip hover left"></div>
	</div>
{/if}
{literal}
	<script>
		var page = {/literal}"{$panel->clase_css}"{literal};
		$(document).ready(function() {
			$('.indicador_seleccionado').on('click',function(){
				var id_indicador = $(this).data('id_indicador');
				$.ajax({
					url: "index.php?page="+page+"&ajax=true&modulo=mediciones&id_indicador="
					+id_indicador,
					success: function(datos){$("#medicion").html(datos);}
				});
			});
			$('#buscar_indicador').on('keyup',function () {
				var cadena = $(this).val();
				var id_entidad = $(this).data('id_entidad');
				$('#medicion').html('');
				$.ajax({
					url: "index.php?page=panel_buscador&ajax=true&modulo=indicador_medicion&id_entidad="+id_entidad+"&cadena="+cadena,
					success: function(datos)
					{
						$('#listado_indicadores').html(datos);
					}
				}); 
	});
});
</script>
{/literal}

