{if $modulo == 'indicador_medicion'}
<div class="clearfix">
<ul style="list-style:none">
							{foreach from=$indicadores item=item}
							<li><input data-id_entidad="{$id_entidad}" data-id_indicador="{$item->id}"
									class="required indicador_seleccionado" type="radio" 
									name="id_indicador" value="{$item->id}"> 
									{$item->nombre}</li>
						{/foreach}
</div>
<div class="required_tag tooltip hover left"></div>
<div id="paginacion" class="box clearfix">Paginación</div>
{literal}
<script>
$('.indicador_seleccionado').on('click',function(){
	var id_indicador = $(this).data('id_indicador');
	$.ajax({
		url: "index.php?page="+page+"&ajax=true&modulo=mediciones&id_indicador="
		+id_indicador,
		success: function(datos){$("#medicion").html(datos);}
	});
});
</script>
{/literal}
{/if}
{if $modulo == 'indicador_subunidades'}
<div class="clearfix">
<ul style="list-style:none">
							{foreach from=$indicadores item=item}
							<li><input data-id_entidad="{$id_entidad}" data-id_indicador="{$item->id}"
									class="required indicador_seleccionado" type="radio" 
									name="id_indicador" value="{$item->id}"> 
									{$item->nombre}</li>
						{/foreach}
</div>
<div class="required_tag tooltip hover left"></div>
<div id="paginacion" class="box clearfix">Paginación</div>
{literal}
<script>
$('.indicador_seleccionado').on('click',function(){
	var id_indicador = $(this).data('id_indicador');
	$('#subunidades').html('');
	$('#mediciones').html('');
	$.ajax({
		url: "index.php?page="+page+"&ajax=true&modulo=subunidades&id_indicador="
		+id_indicador,
		success: function(datos){$("#subunidades").html(datos);}
	});
});
</script>
{/literal}
{/if}
