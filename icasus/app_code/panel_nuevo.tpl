<form method="post" action="index.php?page=panel_grabar" id="panel_nuevo" name="panel_nuevo">
	<input type="hidden" name="id_entidad" value="{$id_entidad}" id="id_entidad">
	<input type="hidden" name="id_cuadro" value="{$id_cuadro}" id="id_cuadro">
<div style="opacity: 1;" class="box tabs" id="tab_crear_panel">
		<ul class="tab_header">
			<li>
				<a  class="tipo" data-tipo="panel_tarta"href="#datos_panel"><img src="http://localhost/icasus/icons/ff32/chart_pie.png"style="padding-top:5px"><br /> Tarta</a>
			</li>
			<li>
				<a class="tipo" data-tipo="panel_linea"href="#datos_panel"><img src="http://localhost/icasus/icons/ff32/chart_curve.png"style="padding-top:5px"><br /> Líneas</a>
			</li>
			<li>
				<a class="tipo" data-tipo="panel_barra"href="#datos_panel"><img src="http://localhost/icasus/icons/ff32/chart_bar.png"style="padding-top:5px"><br /> Barras</a>
			</li>
			<li>
				<a class="tipo" data-tipo="panel_metrica"href="#datos_panel"><img src="http://localhost/icasus/icons/ff32/date.png"style="padding-top:5px"><br /> Métrica</a>
			</li>
			<li>
				<a class="tipo" data-tipo="panel_tabla" href="#datos_panel"><img src="http://localhost/icasus/icons/ff32/table.png" style="padding-top:5px"><br /> Tabla</a>
			</li>
			<li>
				<a class="tipo" data-tipo="panel_informacion" href="#datos_panel"><img src="http://localhost/icasus/icons/ff32/information.png"style="padding-top:5px" ><br /> Ayuda</a>
			</li>
		</ul>
		<div style="opacity: 1;" id="datos_panel" class="block ui-tabs-panel ui-widget-content ui-corner-bottom">
			<p>&nbsp;</p>
			<div id="datos" class="columns clearfix">

			</div>
			<div class="button_bar clearfix" id="footer_tabs" style="display:none">
				<button class="dark send_right img_icon has_text" type="submit">
					<span>Grabar</span>
				</button>
				<button class="btnPrev dark send_right img_icon has_text" type="button">
					<span>Cancelar</span>
				</button>
			</div>
		</div><!-- fin tab 1 --> 
	</div><!-- id tab_crear_panel -->
</form>
{literal}
<script>
var id_entidad = $('#id_entidad').val();
$(function() {
	$('#panel_nuevo').validate();
	$('#tab_crear_panel').tabs({selected:5});
	$('.tipo').on('click',function(){
		var tipo = $(this).data('tipo');
		if (tipo != 'panel_informacion')
		{
			$('#footer_tabs').show();
		}
		else
		{
			$('#footer_tabs').hide();
		}
		$.ajax({
			url: "index.php?page="+tipo+"&ajax=true&modulo=inicio&id_entidad="+id_entidad,
				success: function(datos){$("#datos").html(datos);}
		});
	});
});
 </script>
{/literal}

