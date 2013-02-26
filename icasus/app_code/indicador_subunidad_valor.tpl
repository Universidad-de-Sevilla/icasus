<!-- división modal confirmacion de desactivación de las mediciones completas de una subuniadad para un indicador -->
<div id="modal_activar_una_medicion" class="dialog_content narrow ui-dialog-content ui-widget-content">
<div class="block" style="opacity: 1;" >
<div class="section" style="padding:20px" id="modal_content_activar_una_medicion">
<p>Por favor confirme que quiere <b><span id="prefijo_activar">des</span>activar</b> sólo esta medición.</p>
<p>Esta subunidad no tiene asignada esta medición<p>
<p>Desea asignarla:<br>
<input type="radio" name="asignar" value="0">No <br />
<input type="radio" name="asignar" value="1">No <br />
</p>
</div>
</div>
</div>
<!-- división modal confirmacion de desactivación de las mediciones completas de una subuniadad para un indicador -->
<div id="modal_activar_mediciones" class="dialog_content narrow ui-dialog-content ui-widget-content">
<div class="block" style="opacity: 1;" >
<div class="section" style="padding:20px">
<p>Por favor confirme que quiere <b><span id="prefijo_activar">des</span>activar</b> todas las mediciones para esta subunidad.</p>
</div>
</div>
</div>

{literal}
<style>
.valor_inactivo{
	color:gray
}
.valor_activo{
	color:green;
	font-weight:bold;
}
</style>
{/literal}
<!-- división seleccio nar periodos a consultar -->
<div style="opacity: 1;" class="box grid_16">
	<h2 class="box_head">Rango de fechas</h2>
	<div class="controls">
		<a href="#" class="grabber"></a>
		<a href="#" class="toggle"></a>
	</div>
	<div style="display: block;" class="toggle_container">
		<div style="opacity: 1;" class="block">
				<form method="post" action="">
					<input type="hidden" name="id_indicador" id="id_indicador" value="{$indicador->id}">
					<input type="hidden" name="id_entidad" id="id_entidad" value="{$entidad->id}">
					<div class="columns clearfix">
            <div class="col_50">
              <fieldset class="label">
                <label>Inicio del periódo</label>
                <div>
                  <select id="inicio" name="inicio" class="select_box">
                    <option value="0">Seleccionar ...</option>
									{foreach from=$years item=year}
                      <option value="{$year->periodo_inicio|truncate:4:''}" data-id_indicador="{$indicador->id}">{$year->periodo_inicio|truncate:4:''}</option>
									{/foreach}
                  </select>
                  <div class="required_tag"></div>
                 </div>
              </fieldset>
            </div>
            <div class="col_50" id="end_year">
            </div>
          </div>
				</form>
			<div class="button_bar clearfix">
				<button id="btn_mostrar"
					data-id_indicador="{$indicador->id}"
					data-id_entidad="{$entidad->id}"
					class="green send_right text_only has_text">
					<span>Mostrar</span>
				</button>
			</div>
		</div>
	</div>
</div>
<!-- división muestra valores de subunidades-mediciones -->
<div style="opacity: 1;" class="box grid_16">
	<div style="opacity: 1;" class="block" id="mostrar_valores">	
 <table class="static">
    <thead>
    <tr>
      <th></th><th>Subunidades</th>
      {foreach from=$mediciones item=medicion}
        <th>{$medicion->etiqueta}</th>
      {/foreach}
    </tr>
    </thead>
    <tbody>
    {foreach from=$subunidades_mediciones item=subunidades}
      <tr><td>
				<a class="modal" 
					data-id_indicador="{$indicador->id}"
					data-id_entidad="{$subunidades->id_madre}" 
					data-id_subunidad="{$subunidades->id}" 
					data-subunidad="{$subunidades->nombre}" 
					data-activar="0">
					<img src="/icons/ff16/tick_grey.png" alt="icono desactivar" title="Desactivar todas las mediciones de {$subunidades->nombre} ">
				</a> 
				<a class="modal" 
					data-id_indicador="{$indicador->id}" 
					data-id_entidad="{$subunidades->id_madre}" 
					data-id_subunidad="{$subunidades->id}" 
					data-subunidad="{$subunidades->nombre}" 
					data-activar="1">
				<img src="/icons/ff16/tick.png" alt="icono activar" title="Activar todas las mediciones de {$subunidades->nombre} ">
				</a></td><td>{$subunidades->nombre}</td>
      {foreach from=$subunidades->mediciones item=medicion}
        <td class="{if $medicion->medicion_valor->activo == 0}valor_inactivo{else}valor_activo{/if}">
          <span class="modal_activar_una_medicion" data-etiqueta="{$medicion->etiqueta}" data-id_indicador="{$indicador->id}" data-id_entidad="{$entidad->id}" data-activo="{$medicion->medicion_valor->activo}" data-subunidad="{$subunidades->nombre}" data-id_medicion="{$medicion->id}" data-id_subunidad="{$subunidades->id}" data-asignada="{$medicion->medicion_valor->_saved}">
						{if $medicion->medicion_valor->_saved == 1}  
							{if $medicion->medicion_valor->valor == ''}---{else}{$medicion->medicion_valor->valor}{/if}
						{else}
							.
						{/if}
					</span>
        </td>
      {/foreach}
      </tr>
    {/foreach}
    </tbody>
  </table>
</div>
</div>
</div>

{literal}
<script>
$(function() {
	$('#main_container').on('click','.modal_activar_una_medicion',function(){
		var id_entidad = $(this).data('id_entidad');
		var id_indicador = $(this).data('id_indicador');
		var id_subunidad = $(this).data('id_subunidad');
		var id_medicion = $(this).data('id_medicion');
		var asignada = $(this).data('asignada');
		var etiqueta = $(this).data('etiqueta');
		var subunidad = $(this).data('subunidad');
		var activo = $(this).data('activo');
		var inicio = $("#inicio").val();
		if (inicio == 0){var fin = 0;}else{var fin = $("#fin").val();}
		if (asignada == 1)
		{
			if (activo == 1)
			{
				texto = 'desactivar';
			}
			else
			{
				texto = 'activar';
			}
			$('#modal_content_activar_una_medicion').html('<p>Por favor confirme que quiere <b>'+texto+'</b> sólo esta medición.</p>');
		}
		else
		{
			$('#modal_content_activar_una_medicion').html('<p>No esta asignada.</p><p>Si confirma se asignará "'+etiqueta+'" a la '+subunidad+'.</p>');
		}
		var parametros = "&id_subunidad="+id_subunidad+"&id_medicion="+id_medicion+"&asignada="+asignada+"&inicio="+inicio+"&fin="+fin+"&id_entidad="+id_entidad+"&id_indicador="+id_indicador;
		$("#modal_activar_una_medicion" ).dialog({
			autoOpen: true,modal: true,title:subunidad,
			buttons: [
					{
						text:"Confirmar",
						"class":'green',
						click: function() {
							$(this).dialog("close");
							$("#mostrar_valores").html("<div style='padding:30px'><b>Cargando datos ...</b></div>");
							$.ajax({
								url:"index.php?page=indicador_subunidad_valor_ajax&ajax=true&modulo=activar_individualmente"+parametros,
								success:function(datos){$("#mostrar_valores").html(datos);}
							});
						}
					},
					{
						text:"Cancelar",
						"class":'red text_only has_text',
						click: function() {
							$(this).dialog("close");
						}
					}
				]
		})
	});

	$('#main_container').on('click','.modal',function(){
		var id_entidad = $(this).data('id_entidad');
		var activar = $(this).data('activar');
		var id_subunidad = $(this).data('id_subunidad');
		var subunidad = $(this).data('subunidad');
		var id_indicador = $(this).data('id_indicador');
		var inicio = $("#inicio").val();
		if (inicio == 0){var fin = 0;}else{var fin = $("#fin").val();}
		var parametros = "&inicio="+inicio+"&fin="+fin+"&id_entidad="+id_entidad+"&activar="+activar+"&id_subunidad="+id_subunidad+"&id_indicador="+id_indicador;
		if (activar == 0){prefijo = 'des';}else{prefijo = '';}
		$('#prefijo_activar').text(prefijo);
		$("#modal_activar_mediciones" ).dialog({
			autoOpen: true,modal: true,title:subunidad,
			buttons: [
					{
						text:"Confirmar",
						"class":'green',
						click: function() {
							$(this).dialog("close");
							$("#mostrar_valores").html("<div style='padding:30px'><b>Cargando datos ...</b></div>");
															$.ajax({
								url:"index.php?page=indicador_subunidad_valor_ajax&ajax=true&modulo=mostrar_valores"+parametros,
								success:function(datos){
									$("#mostrar_valores").html(datos);
								}
							});
}
					},
					{
						text:"Cancelar",
						"class":'red text_only has_text',
						click: function() {
							$(this).dialog("close");
						}
					}
				]
		 });
	});
	$('#main_container').on('click','#btn_mostrar',function(){
		var inicio = $("#inicio").val();
		if (inicio == 0)
		{
			$("#mostrar_valores")  .html("<div style='padding:30px'><b>Cargando datos ...</b></div>");
			var id_indicador = $(this).data('id_indicador');
			var id_entidad = $(this).data('id_entidad');
			$.ajax({
				url: "index.php?page=indicador_subunidad_valor_ajax&ajax=true&modulo=mostrar_valores&inicio=0&id_indicador="+id_indicador+"&id_entidad="+id_entidad,
				success: function(datos){$("#mostrar_valores").html(datos);}
			});
		}
		else
		{
			var fin = $("#fin").val();
			$("#mostrar_valores")  .html("<div style='padding:30px'><b>Cargando datos ...</b></div>");
			var id_indicador = $(this).data('id_indicador');
			var id_entidad = $(this).data('id_entidad');
			var parametros = "&inicio="+inicio+"&fin="+fin;
			//alert(id_entidad+'-'+id_indicador);
			$.ajax({
				url: "index.php?page=indicador_subunidad_valor_ajax&ajax=true&modulo=mostrar_valores&id_indicador="+id_indicador+"&id_entidad="+id_entidad+parametros,
				success: function(datos){$("#mostrar_valores").html(datos);}
			});
		}
	});
	//muestra los años de las mediciones
	$('#inicio').on('change',function(){
		$("#inicio option:selected").each(function () {
      elegido = $(this).val();
			if ( elegido == 0)
			{
				$("#end_year").html(' ');
			}
			else
			{
				id_indicador = $(this).data('id_indicador');
				id_entidad = $("#id_entidad").val();
				$.ajax({
					url:"index.php?page=indicador_subunidad_valor_ajax&ajax=true&modulo=seleccionar_años&inicio="+elegido+"&id_indicador="+id_indicador+"&id_entidad="+id_entidad, 
					success: function(datos){$("#end_year").html(datos);}
				});
			}
		}); 
	});
});
 </script>
{/literal}