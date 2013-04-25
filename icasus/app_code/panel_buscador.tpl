{if $modulo == 'indicadores_barra'}
<div class="clearfix">
<ul style="list-style:none">
	{if $indicadores}
		{foreach from=$indicadores item=item}
		<li>
			<input data-id_entidad="{$id_entidad}" data-nombre_indicador="{$item->nombre}" 
					data-id_indicador="{$item->id}"	class="indicador_seleccionado_barra" 
					type="radio" 	name="id_indicador" value="{$item->id}"> 
					{$item->nombre}
	</li>
		{/foreach}
	{else}
		<li><span class="text error">No se han encontrado indicadores</span></li>
	{/if}
</div>
<div class="required_tag tooltip hover left"></div>
{/if}
{if $modulo == 'indicadores_linea'}
<div class="clearfix">
<ul style="list-style:none">
	{if $indicadores}
		{foreach from=$indicadores item=item}
		<li>
			<input data-id_entidad="{$id_entidad}" data-nombre_indicador="{$item->nombre}" 
					data-id_indicador="{$item->id}"	class="indicador_seleccionado_linea" 
					type="radio" 	name="id_indicador" value="{$item->id}"> 
					{$item->nombre}
	</li>
		{/foreach}
	{else}
		<li><span class="text error">No se han encontrado indicadores</span></li>
	{/if}
</div>
<div class="required_tag tooltip hover left"></div>
{/if}

{if $modulo == 'indicador_tarta'}
<div class="clearfix">
<ul style="list-style:none">
	{if $indicadores}
		{foreach from=$indicadores item=item}
		<li><input data-id_entidad="{$id_entidad}" data-id_indicador="{$item->id}"
				class="required indicador_seleccionado_tarta" type="radio" 
				name="id_indicador" value="{$item->id}"> 
				{$item->nombre}</li>
		{/foreach}
	{else}
		<li><span class="text error">No se han encontrado indicadores</span></li>
	{/if}
</div>
<div class="required_tag tooltip hover left"></div>
{/if}

{if $modulo == 'indicador_metrica'}
<div class="clearfix">
<ul style="list-style:none">
	{if $indicadores}
		{foreach from=$indicadores item=item}
		<li><input data-id_entidad="{$id_entidad}" data-id_indicador="{$item->id}"
				class="required indicador_seleccionado_metrica" type="radio" 
				name="id_indicador" value="{$item->id}"> 
				{$item->nombre}</li>
		{/foreach}
	{else}
		<li><span class="text error">No se han encontrado indicadores</span></li>
	{/if}
</div>
<div class="required_tag tooltip hover left"></div>
{/if}

{if $modulo == 'indicador_subunidades'}
<div class="clearfix">
<ul style="list-style:none">
	{if $indicadores}
		{foreach from=$indicadores item=item}
		<li><input data-id_entidad="{$id_entidad}" data-id_indicador="{$item->id}"
				class="required indicador_seleccionado" type="radio" 
				name="id_indicador" value="{$item->id}"> 
				{$item->nombre}</li>
		{/foreach}
	{else}
		<li><span class="text error">No se han encontrado indicadores</span></li>
	{/if}
</div>
<div class="required_tag tooltip hover left"></div>
{/if}

{literal}
<script>
$('.indicador_seleccionado_tarta').on('click',function(){
	var id_indicador = $(this).data('id_indicador');
	$('#mediciones_tarta').html('');
	$.ajax({
		url: "index.php?page="+page+"&ajax=true&modulo=mediciones_tarta&id_indicador="
		+id_indicador,
		success: function(datos){$("#mediciones_tarta").html(datos);}
	});
});
$('.indicador_seleccionado_metrica').on('click',function(){
	var id_indicador = $(this).data('id_indicador');
	$('#subunidades_metrica').html('');
	$('#mediciones_metrica').html('');
	$.ajax({
		url: "index.php?page="+page+"&ajax=true&modulo=subunidades_metrica&id_indicador="
		+id_indicador,
		success: function(datos){$("#subunidades_metrica").html(datos);}
	});
});
$('.indicador_seleccionado').on('click',function(){
	var id_indicador = $(this).data('id_indicador');
	$('#subunidades').html('');
	$.ajax({
		url: "index.php?page="+page+"&ajax=true&modulo=subunidades&id_indicador="
		+id_indicador,
		success: function(datos){$("#subunidades").html(datos);}
	});
}); 
</script>
{/literal}

