<h2>{$indicador->codigo} - {$indicador->nombre}</h2>
<form name="medicion" id="medicion" action="index.php?page=medicion_grabar" method="post" class="validate_form">
	<input type="hidden" name="id_indicador" value="{$indicador->id}" />
	<input type="hidden" name="tipo" value="{$tipo}" />
	<div style="opacity: 1;" class="box tabs" id="tab_crear_medicion">
		<ul class="tab_header">
			<li><a href="#medicion" >Medición</a></li>
			<li><a href="#referencia" >Valores de referencia</a></li>
			<li><a href="#subunidades" >Subunidades afectadas</a></li>
		</ul>
		<div style="opacity: 1;" id="medicion" class="block ui-tabs-panel ui-widget-content ui-corner-bottom">
			<p>&nbsp;</p>
			<fieldset>
			<label>Etiqueta</label>
			<div>
			<input type="input" name="etiqueta" id="etiqueta" class="text required" /></p>
			<div class="required_tag"></div>
			</div>
			</fieldset>
			<div class="columns clearfix">
			<div class="col_25">
			<fieldset >
			<label>Inicio del periodo</label>
			<div>
			{html_select_date field_order='DMY' start_year="-10"  end_year="+5" time=$smarty.now  prefix="pi" month_format='%m'}
			</div>
			</fieldset>
			</div>
			<div class="col_25">
			<fieldset >
			<label>Fin del periodo</label>
			<div>
			{html_select_date field_order='DMY' start_year="-10" end_year="+5" time=$smarty.now  prefix="pf" month_format='%m'}
			</div>
			</fieldset>
			</div>
			<div class="col_25">
			<fieldset >
			<label>Inicio de grabación</label>
			<div>
			{html_select_date field_order='DMY' start_year="-10"  end_year="+5" time=$smarty.now prefix="gi" month_format='%m'}
			</div>
			</fieldset>
			</div>
			<div class="col_25">
			<fieldset >
			<label>Fin de grabación</label>
			<div>
			{html_select_date field_order='DMY' start_year="-10" end_year="+5" time=$smarty.now prefix="gf" month_format='%m'}
			</div>
			</fieldset>
			</div>
			</div><!-- fin columns clearfix -->
			<div class="button_bar clearfix">
			<button class="green" type="submit" value="Grabar" name="proceso_submit">
			<span>Grabar</span>
			</button>
			</div>
		</div><!--fin tab medicion -->
		<div style="opacity: 1;" id="referencia" class="block ui-tabs-panel ui-widget-content ui-corner-bottom">
			<p>&nbsp;</p>
			{if $tipo == "indicador"}
			<fieldset >
			{if $valores_referencia}
			{foreach $valores_referencia as $valor_referencia}
			<label>{$valor_referencia->etiqueta}</label>
			<div>
			<input type="input" name="valor_referencia[{$valor_referencia->id}]" class="text"/>
			</div>
			{/foreach}
			{else}
			<div class="alert dismissible alert_blue">
			<img src="images/icons/small/white/alert_2.png" height="24" width="24">
			No se han definido valores de referencia para este indicado.
			</div>
			{/if}
			</fieldset>
			{else}
			<div class="alert dismissible alert_blue">
			<img src="images/icons/small/white/alert_2.png" height="24" width="24">
			Es un dato y no tienen asociados valores de referencia.
			</div>
			{/if}
			<div class="button_bar clearfix">
			<button class="green" type="submit" value="Grabar" name="proceso_submit">
			<span>Grabar</span>
			</button>
			</div>
		</div><!--fin tab referencia -->
		<div style="opacity: 1;" id="subunidades" class="block ui-tabs-panel ui-widget-content ui-corner-bottom">
			<p>&nbsp;</p>
			<fieldset class="label_side">
				<div id="div_subunidades" class="column clearfix" style="display:">
				<div class="col_50">
					{foreach name="subunidad" from=$subunidades item=subunidad}
						{assign var="total" value=$subunidades|@count/2+2}
						{if $smarty.foreach.subunidad.iteration == $total|floor}</div><div class="col_50">{/if}
						<input type="checkbox" name="subunidades[]" data-indicador="{$indicador->id}" value="{$subunidad->id}" class="subunidad"
					{foreach $indicador_subunidades as $indicador_subunidad}
					{if $indicador_subunidad->id_entidad == $subunidad->id} checked{/if}
					{/foreach}
					/> {$subunidad->etiqueta}<br />
					{/foreach}
				</div>
				</div>
			</fieldset>
			<div class="button_bar clearfix">
			<button class="green" type="submit" value="Grabar" name="proceso_submit">
			<span>Grabar</span>
			</button>
			</div>
		</div><!--fin tab subunidades -->
	</div><!--fin id=tab_crear_medicion -->
</form>
{literal}
<script>
$(document).ready(function(){
	$('.subunidad').on('click',function(){
		var indicador = $(this).data('indicador');
		var entidad = $(this).val();
		$.ajax({
			url: "index.php?page=medicion_crear_ajax&ajax=true&id_indicador="+indicador+"r&id_entidad="+entidad
		});
	});
});
</script>
{/literal}
