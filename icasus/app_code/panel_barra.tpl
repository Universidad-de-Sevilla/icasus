{if $modulo == 'inicio'}
<input type="hidden" name="tipo" value="{$panel->id}">
<input type="hidden" name="inicioYear" value="01">
<input type="hidden" name="inicioMonth" value="01">
<input type="hidden" name="inicioDay" value="01">
<input type="hidden" name="finYear" value="12">
<input type="hidden" name="finMonth" value="12">
<input type="hidden" name="finDay" value="31">
<<<<<<< HEAD
<input type="hidden" name="periodicidad" value="anual">

=======
<input type="hidden" name="id_medicion" value="0">
>>>>>>> barra
<!-- división  -->
<div id="dialog_subunidades" style="display:none">
	<div class="block" style="opacity: 1;" >
		<div id="lista_subunidades" class="section" style="padding:20px">
		</div>
	</div>
</div>
<!--fin dialog -->
<fieldset class="label_side">
	<label>Nombre</label>
	<div>
		<input class="required text" type="text" name="nombre"></input>
		<div class="required_tag tooltip hover left"></div>
	</div>
</fieldset>

<fieldset class="label_side">
	<label>Orden</label>
	<div class="clearfix">
		<div class="col_25">
			<input class="text required" type="text" name="orden"></input>
		</div>
		<div class="required_tag tooltip hover left"></div>
	</div>
</fieldset>

<fieldset class="label_side">
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


<fieldset class="label_side" id="indicador_base">
	<label>Indicador Base<span></span></label>
		<div class="clearfix" >
			<ul id="content_indicador_base" style="list-style:none"></ul>
			<div class="required_tag tooltip hover left"></div>
		</div>
</fieldset>

<fieldset class="label_side" id="content_buscador_indicador_base">
	<label><span></span></label>
	<div class="clearfix">
		<div class="col_25">
			<input data-id_entidad="{$id_entidad}"class="text" placeholder="Buscar Indicador Base" name="buscar_indicador_base" id="buscar_indicador_base" type="text">
		</div>
	</div>
	<div id="listado_indicadores_base" >
	</div>
</fieldset>

<div class="columns clearfix" id="fila_periodicidad" style="display:none">
	<div class="col_50">
		<fieldset class="label_side">
<<<<<<< HEAD
			<label>Año<span></span></label>
=======
			<label>Periodicidad indicador base</label>
>>>>>>> barra
			<div>
			<input type="radio" class="periodicidad" name="periodicidad" data-periodicidad="medicion" value="1" > Medición. 
			<input type="radio" class="periodicidad" name="periodicidad" data-periodicidad="años" value="2" > Años.
			</div>
		</fieldset>

    <fieldset class="label_side" id="div_fecha_fin">
		</fieldset>
	</div>
<<<<<<< HEAD
	</div>

=======
	<div class="col_50">
		<fieldset class="label_side" id="content_periodicidad">
		</fieldset>
	</div>
</div>
>>>>>>> barra

<fieldset class="label_side" id="indicadores_complementarios" style="display:none">
	<label>Indicadores complementarios<span></span></label>
		<div class="clearfix" >
			<ul id="content_indicadores_complementarios" style="list-style:none"></ul>
			<div class="required_tag tooltip hover left"></div>
		</div>
</fieldset>

<fieldset class="label_side content_buscador_indicadores_complementarios " id="content_buscador_indicadores_complementarios" style="display:none">
	<label><span></span></label>
	<div class="clearfix">
		<div class="col_25">
			<input data-id_entidad="{$id_entidad}"class="text" placeholder="Buscar Indicadores Complementarios" name="buscar_indicador_complementario" id="buscar_indicador_complementario" type="text">
		</div>
	</div>
	<div id="listado_indicadores_complementarios" >
	</div>
</fieldset>



<script>

//lista los indicadores para seleccionar los complementarios
$('#buscar_indicador_complementario').on('keyup',function () {
	var cadena = $(this).val();
	var id_entidad = $(this).data('id_entidad');
	$.ajax({
		url: "index.php?page=panel_buscador&ajax=true&modulo=indicadores_barra_complementarios&id_entidad="+id_entidad+"&cadena="+cadena,
		success: function(datos){
			$('#listado_indicadores_complementarios').html(datos);
		},
	}); 
});
//lista los indicadores para seleccionar el indicador base
$('#buscar_indicador_base').on('keyup',function () {
	var cadena = $(this).val();
	var id_entidad = $(this).data('id_entidad');
	$.ajax({
		url: "index.php?page=panel_buscador&ajax=true&modulo=indicador_barra_base&id_entidad="+id_entidad+"&cadena="+cadena,
		success: function(datos){
			$('#listado_indicadores_base').html(datos);
		},
	}); 
});
	//incrementa los indicadores complementarios
	$('#main_container').on('click','.indicador_complementario_seleccionado_barra',function(){
			var id_indicador = $(this).data('id_indicador');
			var nombre_indicador = $(this).data('nombre_indicador');
			$('#content_indicadores_complementarios').append('<li class="ric"><img src="/icons/ff16/cross.png" class="remove_indicador_complementario" style="cursor:pointer">'+
					'<input type="hidden" name="id_indicadores[]" value="'+id_indicador+
					'"> '+nombre_indicador+'</li>');
		});
	//inserta el indicador base, sus selects de mediciones y años
	$('#main_container').on('click','.indicador_base_seleccionado_barra',function(){
		var id_indicador = $(this).data('id_indicador');
		var nombre_indicador = $(this).data('nombre_indicador');
		$('#content_indicador_base').html('<li><img src="/icons/ff16/cross.png" class="remove_indicador_base" style="cursor:pointer">'+
				'<input type="hidden" name="id_indicadores[]" value="'+id_indicador+
				'"> '+nombre_indicador+'</li>');
		$('#listado_indicadores_base').html('');
		$('#content_buscador_indicador_base').hide('slow');
		$('#fila_periodicidad').show('slow');
		$.ajax({
			url: "index.php?page=panel_buscador&ajax=true&modulo=periodicidad&id_indicador="+id_indicador,
			success: function(datos){
				$("#content_periodicidad").html(datos);
				$('#footer_tabs').show();
			}
		});
	});
	//elimina el indicador complementario. Si no quedan complementarios se borra el pie
	$('#main_container').on('click','.remove_indicador_complementario',function(){
			var complementario = $(this).parent('.ric');
			if (complementario.remove())
			{
				$('#footer_tabs').hide('slow');
			}
	});
	//elimina el indicador base seleccionado
	$('#main_container').on('click','.remove_indicador_base',function(){
			$('#content_indicador_base').html('');
			$('#content_buscador_indicador_base').show('slow');
			$('#fila_periodicidad').hide('slow');
	});

$('.periodicidad').on('change',function(){
	var tipo_periodo = $(this).val();
	if (tipo_periodo == 1)
	{
		$('#periodicidad_etiquetas').show('slow');
		$('#periodicidad_años').hide('slow');
	}
	else if (tipo_periodo == 2)
	{
		$('#periodicidad_etiquetas').hide('slow');
		$('#periodicidad_años').show('slow');
	}
	//$('#content_periodicidad').html('');
	$('#indicadores_complementarios').show('slow');
	$('#content_buscador_indicadores_complementarios').show('slow');
});
</script>
{/if}

{if $modulo == 'fecha_fin'}
  <input type="hidden" name="finYear" value="{$fecha_inicio}">
{/if}

{if $modulo == 'subunidades'}
	<div class="clearfix">
		<div class="col_50">
				<input data-id_indicador="{$id_indicador}" class="subunidad_seleccionada"
				name="id_subunidad"type="radio" value="0" data-nombre_indicador="{$nombre_indicador}"data-nombre_subunidad="Total"> Total<br /> 
			{foreach name=subunidades from=$indicador_subunidades item=item}
				{if $smarty.foreach.subunidades.iteration == floor($indicador_subunidades|@count/2)+1 }
					</div><div class="col_50 no_border">
				{/if}
				<input data-id_indicador="{$id_indicador}" class="subunidad_seleccionada"
				name="id_subunidad"type="radio" value="{$item->id_entidad}" data-nombre_indicador="{$nombre_indicador}"data-nombre_subunidad="{$item->entidad->etiqueta}"> 
				{$item->entidad->etiqueta}<br /> 
			{/foreach}
		</div>
		<div class="required_tag tooltip hover left"></div>
	</div>
	{literal}
	<script>
		$('#main_container').on('click','.remove_seleccion',function(e){
			e.preventDefault();
			$(this).parents('.fila_borrar').remove();
			if ($('.remove_seleccion').length == 0){$('#footer_tabs').hide();}
		});
		$('.subunidad_seleccionada').on('click',function(){
			var id_subunidad = $(this).val();	
			var id_indicador = $(this).data('id_indicador');	
			var indicador = $(this).data('nombre_indicador');	
			var subunidad = $(this).data('nombre_subunidad');	
			$('#indicadores_subunidades_seleccionados').append('<tr class="fila_borrar">'+
			'<td>'+
			'<a class="remove_seleccion" href="#">X</a>'+
			'</td>'+
			'<td><input type="hidden" name="id_indicadores[]" value="'+id_indicador+'">'+indicador+
			'</td>'+
			'<td><input type="hidden" name="id_subunidades[]" value="'+id_subunidad+'">'+subunidad+
			'</td></tr>');
			$('#dialog_subunidades').dialog('close');
			$('#footer_tabs').show();
		});
	</script>
	{/literal}
{/if}

{literal}
	<script>
		var page = {/literal}"{$panel->clase_css}"{literal};
		$(document).ready(function() {
			$('select[name="inicioYear"]').on('change',function(){
				var fecha_inicio = $(this).val();
				$.ajax({
				url: "index.php?page="+page+"&ajax=true&modulo=fecha_fin&fecha_inicio="+fecha_inicio,
				success: function(datos){$("#div_fecha_fin").html(datos);}
			});
		});
	});
</script>
{/literal}

