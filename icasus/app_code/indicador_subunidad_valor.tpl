<!-- división modal activar uno -->
<div id="modal_activar_uno" class="dialog_content narrow ui-dialog-content ui-widget-content">
	<div class="block" style="opacity: 1;" >
		<div class="section" style="padding:20px">
			<p>Por favor confirme que quiere <b><span id="msg_activacion_uno"></span></b> esta medición.</p>
		</div>
	</div>
</div>
<!-- división modal asignar una unidad a una medición -->
<div id="modal_asignar_una_medicion" class="dialog_content narrow ui-dialog-content ui-widget-content">
	<div class="block" style="opacity: 1;" >
		<div class="section" style="padding:20px">
			<p>Por favor confirmar si quiere asignar esta medición.</p>
			<p>Marque la casilla si además quiere activarla: <input type="checkbox" id="activo" name="activo" value="1" checked="checked">
			</p>
		</div>
	</div>
</div>
<!-- división modal confirmacion de desactivación de las mediciones completas de una subuniadad para un indicador -->
<div id="modal_activar_all" class="dialog_content narrow ui-dialog-content ui-widget-content">
<div class="block" style="opacity: 1;" >
<div class="section" style="padding:20px">
<p>Por favor confirme:<br />
	<input  name="activo_all" type="radio" value="1" checked="checked"> Activar todas las mediciones.<br />
	<input name="activo_all" type="radio" value="0"> Desactivar todas las mediciones.
</p>
</div>
</div>
</div>

<!-- división seleccionar periodos a consultar -->
<div>
  <a href='index.php?page=medicion_listar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><img 
    src='/icons/ff16/time.png' /> Mostrar mediciones</a> &nbsp; &nbsp;
  <a href='index.php?page={$tipo}_mostrar&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'><img 
  src='/icons/ff16/chart_curve.png' /> Volver al {$tipo}</a> &nbsp;
</div>

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
 {include file="indicador_subunidad_valor_mostrar.tpl"}
 </div>
</div>
</div>

{literal}
<script>
$(function() {
	var id_indicador = $('table').data('id_indicador');
	var id_entidad = $('table').data('id_entidad');
	var id_medicion = 'null';
	var id_subunidad = 'null';
	var subunidad = 'null';
	var inicio = 'null';
	var fin = 'null';
	var activo = 'null';

	$('#main_container').on('click','.no_asignada',function(){
		var subunidad = $(this).parent().parent().data('subunidad');
		var id_medicion = $(this).parent().data('id_medicion');
		var id_subunidad = $(this).parent().parent().data('id_subunidad');
		var inicio = $("#inicio").val();
		if (inicio == 0){var fin = 0;}else{var fin = $("#fin").val();}
		var parametros = "&id_entidad="+id_entidad+"&id_indicador="+id_indicador+"&id_medicion="+id_medicion+"&id_subunidad="+id_subunidad+"&inicio="+inicio+"&fin="+fin+"&activo="+activo; 
		$("#modal_asignar_una_medicion" ).dialog({
			autoOpen: true,modal: true,title:subunidad,
			buttons: [
					{
						text:"Confirmar",
						"class":'green',
						click: function() {
							if ($('#activo:checked').val() == 1){var activo = 1;}else{var activo = 0;}
							parametros = parametros +"&activo="+activo;
							$(this).dialog("close");
							$("#mostrar_valores").html("<div style='padding:30px'><b>Cargando datos ...</b></div>");
							$.ajax({
								url:"index.php?page=indicador_subunidad_valor_ajax&ajax=true&modulo=asignar_una_medicion"+parametros,
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
	$('#main_container').on('change','.activar_uno',function(){
		var activar_uno = $(this);
		var id_subunidad = $(this).parent().parent().data('id_subunidad');
		var id_medicion = $(this).parent().data('id_medicion');
		var subunidad = $(this).parent().parent().data('subunidad');
		var inicio = $("#inicio").val();
		if (inicio == 0){var fin = 0;}else{var fin = $("#fin").val();}
		var parametros = "&id_entidad="+id_entidad+"&id_indicador="+id_indicador+"&id_medicion="+id_medicion+"&id_subunidad="+id_subunidad+"&inicio="+inicio+"&fin="+fin; 
		//var parametros = "&id_subunidad="+id_subunidad+"&id_medicion="+id_medicion+"&inicio="+inicio+"&fin="+fin+"&id_entidad="+id_entidad+"&id_indicador="+id_indicador;
		if(activar_uno.is(':checked')){var activo = 1;$('#msg_activacion_uno').html('activar');}else{var activo = 0;$('#msg_activacion_uno').html('desactivar');}
			parametros = parametros + "&activo=" + activo;
$("#modal_activar_uno" ).dialog({
			autoOpen: true,modal: true,title:subunidad,
			buttons: [
					{
						text:"Confirmar",
						"class":'green',
						click: function() {
														$(this).dialog("close");
							$("#mostrar_valores").html("<div style='padding:30px'><b>Cargando datos ...</b></div>");
							$.ajax({
								url:"index.php?page=indicador_subunidad_valor_ajax&ajax=true&modulo=activar_uno"+parametros,
								success:function(datos){$("#mostrar_valores").html(datos);}
							});
						}
					},
					{
						text:"Cancelar",
						"class":'red text_only has_text',
						click: function() {$(this).dialog("close");if(activo == 1){activar_uno.removeAttr("checked");}else{activar_uno.attr("checked","checked");}}
					}
				]
		})
	});
	$('#main_container').on('click','.activar_all',function(){
		var activar_all = $(this);
		var id_medicion = 'null';
		var id_subunidad = $(this).parent().parent().data('id_subunidad');
		var subunidad = $(this).parent().parent().data('subunidad');
		var inicio = $("#inicio").val();
		if (inicio == 0){var fin = 0;}else{var fin = $("#fin").val();}
		var parametros = "&id_entidad="+id_entidad+"&id_indicador="+id_indicador+"&id_medicion="+id_medicion+"&id_subunidad="+id_subunidad+"&inicio="+inicio+"&fin="+fin; 
		$("#modal_activar_all").dialog({
			autoOpen: true,modal: true,title:subunidad,
			buttons: [
					{
						text:"Confirmar",
						"class":'green',
						click: function() {
							var activo_all = $("input[name='activo_all']:checked").val();
							parametros = parametros + "&activo=" + activo_all;
							$(this).dialog("close");
							$("#mostrar_valores").html("<div style='padding:30px'><b>Cargando datos ...</b></div>");
							$.ajax({
								url:"index.php?page=indicador_subunidad_valor_ajax&ajax=true&modulo=activar_all"+parametros,
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
		if (inicio == 0){var fin = 0;}else{var fin = $("#fin").val();}
		var parametros = "&id_entidad="+id_entidad+"&id_indicador="+id_indicador+"&id_medicion="+id_medicion+"&id_subunidad="+id_subunidad+"&inicio="+inicio+"&fin="+fin+"&activo="+activo; 
		$("#mostrar_valores").html("<div style='padding:30px'><b>Cargando datos ...</b></div>");
					$.ajax({
				url: "index.php?page=indicador_subunidad_valor_ajax&ajax=true&modulo=mostrar_valores"+parametros,
				success: function(datos){$("#mostrar_valores").html(datos);}
			});
	});
	//muestra los años de las mediciones
	$('#inicio').on('change',function(){
		$("#inicio option:selected").each(function () {
      elegido = $(this).val();
			if (elegido == 0){$("#end_year").html(' ');}
			else
			{
				var parametros = "&id_entidad="+id_entidad+"&id_indicador="+id_indicador+"&id_medicion="+id_medicion+"&id_subunidad="+id_subunidad+"&inicio="+elegido+"&fin="+fin+"&activo="+activo; 
				$.ajax({
					url:"index.php?page=indicador_subunidad_valor_ajax&ajax=true&modulo=seleccionar_años"+parametros,
					success: function(datos){$("#end_year").html(datos);}
				});
			}
		}); 
	});
	$('#main_container').on('keyup','.actualizar_dato',function(){
		var actualizar_dato = $(this);
		var id_valor = $(this).data('id_valor');
		var valor = $(this).val();
		//alert(valor);
		var parametros = "&id_entidad="+id_entidad+"&id_indicador="+id_indicador+"&id_medicion="+id_medicion+"&id_subunidad="+id_subunidad+"&inicio="+inicio+"&fin="+fin+"&activo="+activo+"&id_valor="+id_valor+"&valor="+valor;
		$.ajax({
			url: "index.php?page=indicador_subunidad_valor_ajax&ajax=true&modulo=actualizar_dato"+parametros,
			success: function(datos){
				actualizar_dato.css("color","green");
			}
		});
	});

});
 </script>
{/literal}
