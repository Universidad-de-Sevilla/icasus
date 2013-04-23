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
<fieldset>

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
<fieldset class="label_side top">
	<label>Indicadores<span></span></label>
	<div class="clearfix">
					<table id="tabla_indicadores" >
						<thead>
							<tr><th>&nbsp;</th></tr>
						</thead>
						<tbody>
							{foreach from=$indicadores item=item}
							<tr class="gradeX">
								<td>
									<input data-id_entidad="{$id_entidad}" data-id_indicador="{$item->id}"
									class="required indicador_seleccionado" type="radio" 
									name="indicador_seleccionado" value="{$item->id}"> 
									{$item->nombre}
								</td>
							</tr>
						{/foreach}
						</tbody>
						<tfoot>
						</tfoot>
					</table>

		<div class="required_tag tooltip hover left"></div>
	</div>
</fieldset>
<fieldset id="fecha_inicio" class="label_side top">
</fieldset>
<fieldset id="fecha_fin" class="label_side top">
</fieldset>
{/if}
{if $modulo == 'fecha_inicio'}
	<label>Fecha de inicio<span></span></label>
	<div>
			<select data-id_indicador="{$id_indicador}" id="id_medicion_inicio" 
				class="required select_box" name="id_medicion_inicio">
				<option value="">Seleccionar uno ...</option> 
			{foreach from=$mediciones item=item}
				<option data-id_indicador="{$id_indicador}" value="{$item->id}"> {$item->etiqueta}</option> 
			{/foreach}
			</select>
			<div class="required_tag tooltip hover left"></div>
		</div>
{/if}
{if $modulo == 'fecha_fin'}
	<label>Fecha de final<span></span></label>
	<div>
		<select class="required select_box" name="id_medicion_fin">
			{foreach from=$mediciones item=item2}
				<option value="{$item2->id}"> {$item2->etiqueta}</option> 
			{/foreach}
			</select>
			<div class="required_tag tooltip hover left"></div>
		</div>
{/if}
{literal}
	<script>
		var page = {/literal}"{$panel->clase_css}"{literal};
		$(document).ready(function() {
			$('#id_medicion_inicio').on('change',function(){
				var id_indicador = $(this).data('id_indicador');
				var id_medicion = $(this).val();
				$("#fecha_fin").html();
				$.ajax({
					url: "index.php?page="+page+"&ajax=true&modulo=fecha_fin&id_medicion="+id_medicion+"&id_indicador="
					+id_indicador,
					success: function(datos){$("#fecha_fin").html(datos);}
				});
			});
			$('#tabla_indicadores').dataTable();
			$('.indicador_seleccionado').on('click',function(){
				var id_indicador = $(this).data('id_indicador');
				$.ajax({
					url: "index.php?page="+page+"&ajax=true&modulo=fecha_inicio&id_indicador="
					+id_indicador,
					success: function(datos){$("#fecha_inicio").html(datos);$("#fecha_fin").html('');}
				});
			});
});
</script>
{/literal}

