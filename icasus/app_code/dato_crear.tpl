<form method="post" action="index.php?page=dato_grabar" id="formdato" name="formdato">
	<input type="hidden" name="id_entidad" value="{$entidad->id}" />
	<div style="opacity: 1;" class="box tabs" id="tab_crear_dato">
		<ul class="tab_header">
      <li><a href="#dato" >Dato</a></li>
      <li><a href="#otras" >Otras propiedades</a></li>
      <li><a href="#subunidades" >Subunidades afectadas</a></li>
		</ul>

		<div style="opacity: 1;" id="dato" class="block ui-tabs-panel ui-widget-content ui-corner-bottom">
			<p>&nbsp;</p>
      <fieldset class="label_side">
        <label>Identificador</label>
        <div>
          <input type="text" name="codigo" placeholder="Único, fácil de recordar y sin espacios" />
          <div class="required_tag"></div>
        </div>
      </fieldset>

			<fieldset class="label_side">
				<label>Nombre</label>
				<div>
					<input type="text" name="nombre"  />
					<div class="required_tag"></div>
				</div>
			</fieldset>

      <fieldset class="label_side">
        <label>Responsable de seguimiento</label>
        <div>
          <select name="id_responsable" class="required2 select_box">
            <option value="">Seleccionar uno ...</option>
            {foreach $usuarios_entidad as $usuario_entidad}
              <option value="{$usuario_entidad->usuario->id}">
                {$usuario_entidad->usuario->apellidos}, {$usuario_entidad->usuario->nombre} 
                {if $usuario_entidad->usuario->puesto} - {$usuario_entidad->usuario->puesto} {/if}
              </option>
            {/foreach}              
          </select><div class="required_tag tooltip hover left" title="Campo requerido"></div>
        </div>
      </fieldset>
      
      <fieldset class="label_side">
        <label>Responsable de medición</label>
        <div>
          <select name="id_responsable_medicion" class="select_box">
            <option value="">Seleccionar uno ...</option>
            {foreach $usuarios_entidad as $usuario_entidad}
              <option value="{$usuario_entidad->usuario->id}">
                {$usuario_entidad->usuario->apellidos}, {$usuario_entidad->usuario->nombre}
                {if $usuario_entidad->usuario->puesto} - {$usuario_entidad->usuario->puesto|htmlentities} {/if}
              </option>
            {/foreach}              
          </select>
          <div class="required_tag"></div>
        </div>
      </fieldset>

			<div class="button_bar clearfix" id="footer_tabs">
				<button class="dark send_left" type="reset" value="Cancelar" name="proceso_cancel" onclick="history.back()"><span>Cancelar</span></button>          
				<button class="btnNext dark send_right img_icon has_text" type="button"><span>Siguiente</span></button>
			</div>
		</div><!-- fin tab id=dato -->
		 
		<div style="opacity: 1;" id="otras" class="block ui-tabs-panel ui-widget-content ui-corner-bottom">

      <p>&nbsp;</p>
			<fieldset class="label_side">
				<label>Descripci&oacute;n</label>
				<div><textarea  class="autogrow" name="descripcion"></textarea></div>
			</fieldset>

      <fieldset class="label_side">
        <label>Cálculo</label>
        <div><textarea  class="" name="calculo" placeholder="Sólo si es un indicador calculado"></textarea></div>
      </fieldset>

			<fieldset class="label_side">
				<label>Fuente de datos</label>
				<div><input  type="text" name="fuente_datos"/></div>	
			</fieldset>

			<fieldset class="label_side">
				<label>Unidad generadora</label>
				<div><input  type="text" name="unidad_generadora" /></div>
			</fieldset>

			<fieldset class="label_side">
       				<label>Hist&oacute;rico</label>
       				<div><input  type="number" name="historicos" /></div>
     			</fieldset>
			
			<fieldset class="label_side">
				<label>Indicadores/datos relacionados</label>
				<div><input  type="text" name="indicadores_relacionados" /></div>
			</fieldset>

			<div class="columns clearfix">

				<div class="col_50">
					<fieldset class="label">
						<label>Periodicidad</label>
						<div>
							<select name="periodicidad" class="required select_box">
								<option value="Anual" selected>Anual</option>
								<option value="Mensual">Mensual</option>
								<option value="Trimestral">Trimestral</option>
								<option value="Cuatrimestral">Cuatrimestral</option>
								<option value="Semestral">Semestral</option>
							</select>
						</div>
					</fieldset>
				</div>

				<div class="col_50">
					<fieldset class="label">
						<label>Visibilidad</label>	
						<div>
							<select name="id_visibilidad"  class="required select_box">
								{foreach $visibilidades as $visibilidad}
								<option value="{$visibilidad->id}">
								{$visibilidad->nombre}
								</option>
								{/foreach}
							</select>
						</div>
					</fieldset>
				</div>
			</div><!-- fin class="columns clearfix" -->

			<div class="button_bar clearfix" id="footer_tabs">
				<button class="dark send_left" type="reset" value="Cancelar" name="proceso_cancel" onclick="history.back()"><span>Cancelar</span></button>          
				<button class="btnNext dark send_right img_icon has_text" type="button"><span>Siguiente</span></button>
				<button class="btnPrev dark send_right img_icon has_text" type="button"><span>Anterior</span></button>
			</div>
		</div><!-- fin tab id=otros -->

		<div style="opacity: 1;" id="subunidades" class="block ui-tabs-panel ui-widget-content ui-corner-bottom">
			<p>&nbsp;</p>
			<fieldset class="label_side">
				<label>Tipo de medición</label>
				<div>
					<p><input type="radio" name="tipo_seleccion_responsable" value="0" class="medicion"> Medición única en la unidad actual.</p>
					<p><input type="radio" name="tipo_seleccion_responsable" value="1" class="medicion"> Medición desagregada en las subunidades y cumplimentada por los responsables de las subunidades, o persona delegada.</p>
					<p><input type="radio" name="tipo_seleccion_responsable" value="2" class="medicion"> Medición desagregada en las subunidades y cumplimentada de manera centralizada por el responsable de medición del indicador.</p>
				</div>
			</fieldset>

      <fieldset class="label_side" id="total" style="display:none">
        <label>Cálculo del total</label>
        <div>
          <select name="id_tipo_agregacion" id="id_tipo_agregacion">
            <option value="0" selected>Indefinido</option>
            <option value="1">Promedio</option>
            <option value="2">Suma</option>
          </select>
        </div>
      </fieldset>

			<fieldset class="label_side">
				<div>
					<div id="div_unidad" style="display:none">
						<input type="checkbox" name="subunidades[]" value="{$entidad->id}" class="unidad" /> {$entidad->nombre}<hr />
					</div>
					<div id="div_subunidades" class="column clearfix" style="display:none">
					<div class="col_50">
						{foreach name="subunidad" from=$subunidades item="subunidad"}
							{if $smarty.foreach.subunidad.iteration == $subunidades|@count/2+1}</div><div class="col_50">{/if}
							<input type="checkbox" name="subunidades[]" value="{$subunidad->id}" class="subunidad"/> {$subunidad->nombre}<br />
						{/foreach}
					</div>
					</div>
				</div>
			</fieldset>
				<div class="button_bar clearfix" id="footer_tabs">
				<button class="dark send_left" type="reset" value="Cancelar" name="proceso_cancel" onclick="history.back()"><span>Cancelar</span></button>          
				<button class="dark send_right img_icon has_text" type="submit"><span>Grabar</span></button>
				<button class="btnPrev dark send_right img_icon has_text" type="button"><span>Anterior</span></button>
			</div>
</div><!-- tab id=subunidades -->    
</form>
{literal}
<script>
$(document).ready(function(){
	//desactivar inicialmente las tabs 1 y 2
	$('#tab_crear_dato').tabs({disabled: [1,2]});
	//mostrar tipo de medición
	$('.medicion').on('click',function(){
		var valor = $(this).attr('value');
		if (valor == 1 || valor == 2)
		{
			$('#total').css('display','block');
			$('#div_unidad').css('display','block');
			$('#div_subunidades').css('display','block');
			$(".subunidad").attr("checked","checked");
		}
		else if(valor == 0)
		{
			$('#total').css('display','none');
			$('#div_unidad').css('display','block');
			$('#div_subunidades').css('display','none');
			$(".subunidad").removeAttr("checked");
			$(".unidad").attr("checked","checked");
		}	
	});
	//validar formulario
	var validator = $('#formdato').validate({
		rules:{
			codigo:{required:true},
			id_responsable:{required:true},
			id_responsable_medicion:{required:true},
			nombre:{required:true}
		},
		ignore: ':hidden',
		messages:{
			codigo:'Debe insertar un código',
			id_responsable:'Debe seleccionar un responsable',  
			nombre:'Debe dar un nombre'
		},
	});
	//Boton previo
	$('button.btnPrev').on('click',function(){
		var actualTab = $('#tab_crear_dato').tabs('option', 'selected');
		$('#tab_crear_dato').tabs('enable',actualTab-1).tabs('select',actualTab-1).tabs('disable',actualTab);
	});
	//Boton next
	$('button.btnNext').on('click',function(){
		var actualTab = $('#tab_crear_dato').tabs('option', 'selected');
		var estaValidado = $('#formdato').valid();
		if (estaValidado == true)
		{	
			$('#tab_crear_dato').tabs('enable',actualTab+1).tabs('select',actualTab+1).tabs('disable',actualTab);
		}
		else
		{
			validator.focusInvalid(); 
		}
		return false;
	});
});
</script>
{/literal}
