<form method="post" action="index.php?page=indicador_grabar" id="formindicador" name="formindicador">
<input type="hidden" name="id_entidad" value="{$entidad->id}" />
<div style="opacity: 1;" class="box tabs" id="tab_crear_indicador">
	<ul style="display:none">
	<!-- <ul class="tab_header clearfix ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">-->
		<li class="ui-state-default ui-corner-top ui-tabs-selected ui-state-active"><a id="btn_indicador" href="#indicador" class="atajo">Indicador</a></li>
		<li class="ui-state-default ui-corner-top"><a id="btn_otros" href="#otros" class="atajo">Otros datos</a></li>
		<li class="ui-state-default ui-corner-top"><a id="btn_subunidades" href="#subunidades" class="atajo">Subunidades afectadas</a></li>
	</ul>
	<div class="toggle_container">
		<div style="opacity: 1;" id="indicador" class="block ui-tabs-panel ui-widget-content ui-corner-bottom">
			<ul class="tab_header clearfix ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
				<li class="ui-state-default ui-corner-top ui-tabs-selected ui-state-active"><a href="#" >Indicador</a></li>
				<li class="ui-state-default ui-corner-top"><a href="#" style="color:grey">Otros datos</a></li>
				<li class="ui-state-default ui-corner-top"><a href="#" style="color:grey">Subunidades afectadas</a></li>
			</ul>
			<div class="columns clearfix">
				<div class="col_40">
					<fieldset class="label">
					<label>Código indicador</label>
				<div><input  type="text" name="codigo" class="required2"/><div class="required_tag tooltip hover left" title="Campo requerido"></div> </div>
					</fieldset>
				</div>
				<div class="col_60">
					<fieldset class="label">
					<label>Proceso</label>
					<div>
						<select name="id_proceso" id="id_proceso" class="required2 select_box">
						<option value="">Seleccionar uno ...</option>
						{foreach $procesos as $proceso}
						<option value="{$proceso->id}"> {$proceso->nombre} </option>
						{/foreach}
						</select>
					<div class="required_tag tooltip hover left" title="Campo requerido"></div>
					</div>
					</fieldset>
				</div>
			</div>
			<fieldset class="label_side">
				<label>Nombre indicador</label>
				<div><textarea name="nombre"class="required2" /></textarea><div class="required_tag tooltip hover left" title="Campo requerido"></div></div>
			</fieldset>
			<fieldset class="label_side">
				<label>Formulaci&oacute;n</label>
				<div><textarea  class="required2" name="formulacion"></textarea><div class="required_tag tooltip hover left" title="Campo requerido"></div></div>
			</fieldset>
			          <fieldset class="label_side">
            <label>Responsable de seguimiento</label>
            <div>
              <select name="id_responsable" class="required2 select_box">
                <option value="">Seleccionar uno ...</option>
                {foreach $usuarios_entidad as $usuario_entidad}
                  <option value="{$usuario_entidad->usuario->id}">{$usuario_entidad->usuario->nombre} {$usuario_entidad->usuario->apellidos} {if $usuario_entidad->usuario->puesto} - {$usuario_entidad->usuario->puesto} {/if}
                  </option>
                {/foreach}              
              </select><div class="required_tag tooltip hover left" title="Campo requerido"></div>
            </div>
          </fieldset>
          <fieldset class="label_side">
            <label>Responsable de medición</label>
            <div>
              <select name="id_responsable_medicion" class="required2 select_box">
                <option value="">Seleccionar uno ...</option>
                {foreach $usuarios_entidad as $usuario_entidad}
                  <option value="{$usuario_entidad->usuario->id}">{$usuario_entidad->usuario->nombre} {$usuario_entidad->usuario->apellidos} {if $usuario_entidad->usuario->puesto} - {$usuario_entidad->usuario->puesto} {/if}
                  </option>
                {/foreach}              
              </select><div class="required_tag tooltip hover left" title="Campo requerido"></div>
            </div>
          </fieldset> 
			<div class="button_bar clearfix" id="footer_tabs">
					<button class="btnNext dark send_right img_icon has_text" type="button"><span>Siguiente</span></button>
			</div>
            	</div><!-- fin tab 1 --> 

		<div style="opacity: 1;" id="otros" class="block ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide">
			<ul class="tab_header clearfix ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
				<li class="ui-state-default ui-corner-top "><a href="#" style="color:grey">Indicador</a></li>
				<li class="ui-state-default ui-corner-top ui-tabs-selected ui-state-active"><a href="#" >Otros datos</a></li>
				<li class="ui-state-default ui-corner-top"><a style="color:grey" href="#" >Subunidades afectadas</a></li>
			</ul>
			<fieldset class="label_side">
				<label>Descripci&oacute;n</label>
				<div><textarea  class="inp" name="descripcion"></textarea></div>
			</fieldset>
<fieldset class="label_side">
				<label>Cálculo</label>
				<div><textarea  class="" name="calculo" placeholder="Sólo si es un indicador calculado"></textarea></div>
		</fieldset>
<fieldset class="label_side">
            <label>Fuente de informaci&oacute;n</label>
            <div><input  type="text" name="fuente_informacion"/></div>	
          </fieldset>
          <fieldset class="label_side">
            <label>Fuente de datos</label>
            <div><input  type="text" name="fuente_datos"/></div>	
          </fieldset>
          <fieldset class="label_side">
            <label>Metodo de comprobaci&oacute;n / Evidencia</label>
            <div><input  type="text" name="evidencia" /></div>		
          </fieldset>
          <fieldset class="label_side">
            <label>Hist&oacute;rico</label>
            <div><input  type="text" name="historicos" /></div>
          </fieldset>
          <fieldset class="label_side">
            <label>Interpretaci&oacute;n</label>
            <div><input  type="text" name="interpretacion" /></div>
          </fieldset>
          <fieldset class="label_side">
            <label>Indicadores relacionados</label>
            <div><input  type="text" name="indicadores_relacionados" /></div>
          </fieldset>
          <fieldset class="label_side">
            <label>EFQM</label>
            <div class="columns clearfix">
            <div class="col_50">
              <select name="criterios_efqm[]" id="criterios_efqm" class="select_box" >
                <option value="">Elegir uno si procede</option>
                {foreach $criterios_efqm as $criterio_efqm}
                  <option value="{$criterio_efqm->id}">
                    {$criterio_efqm->codigo} - {$criterio_efqm->nombre|htmlentities}
                  </option>
                {/foreach}
              </select>
							</div>
							<div class="col_50">
              <select name="criterios_efqm[]" id="criterios_efqm" class="select_box">
                <option value="">Elegir uno si procede</option>
                 {foreach $criterios_efqm as $criterio_efqm}
                  <option value="{$criterio_efqm->id}">
                    {$criterio_efqm->codigo} - {$criterio_efqm->nombre|htmlentities}
                  </option>
                {/foreach}
              </select>
            </div>
            </div>
          </fieldset>
          <div class="columns clearfix">
            <div class="col_25">
              <fieldset class="label">
                <label>Periodicidad</label>
                <div>
                  <select name="periodicidad" id="periodicidad" class="select_box">
                    <option value="Anual" selected>Anual</option>
                    <option value="Mensual">Mensual</option>
                    <option value="Trimestral">Trimestral</option>
                    <option value="Cuatrimestral">Cuatrimestral</option>
                    <option value="Semestral">Semestral</option>
                  </select>
                </div>
              </fieldset>
            </div>
            <div class="col_25">
              <fieldset class="label">
                <label>Visibilidad</label>	
                <div>
                  <select name="id_visibilidad" id="id_visibilidad" class="required select_box">
                    {foreach $visibilidades as $visibilidad}
                      <option value="{$visibilidad->id}">
                        {$visibilidad->nombre}
                      </option>
                    {/foreach}
                  </select>
                </div>
              </fieldset>
            </div>
            <div class="col_50">
              <fieldset class="label">
                <label>Unidad generadora</label>
                <div><input  type="text" name="unidad_generadora" /></div>
              </fieldset>
            </div>
          </div>
			<div class="button_bar clearfix" id="footer_tabs">
					<button class="btnNext dark send_right img_icon has_text" type="button"><span>Siguiente</span></button>
					<button class="btnPrev dark send_right img_icon has_text" type="button"><span>Anterior</span></button>
			</div>
		</div><!-- fin tab otros datos -->
		<div style="opacity: 1;" id="subunidades" class="block ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide">
			<ul class="tab_header clearfix ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
				<li class="ui-state-default ui-corner-top "><a href="#" style="color:grey">Indicador</a></li>
				<li class="ui-state-default ui-corner-top"><a href="#" style="color:grey">Otros datos</a></li>
				<li class="ui-state-default ui-corner-top ui-tabs-selected ui-state-active"><a href="#" >Subunidades afectadas</a></li>
			</ul>
			<fieldset class="label_side">
				<label>Tipo de medición</label>
				<div>
					<p><input type="radio" name="tipo_seleccion_responsable" value="0"  class="required2"> Centralizada por la unidad superior. Cumplimenta el responsable de medición.</p>
					<p><input type="radio" name="tipo_seleccion_responsable" value="1"  > Delegada a los responsables de las subunidades. Cumplimentan los responsables de centro.</p>
					<p><input type="radio" name="tipo_seleccion_responsable" value="2"  > Delegada a los responsables de las subunidades pero cumplimenta el responsable de medición.</p>
					<div class="required_tag tooltip hover left" title="Campo requerido"></div>
				</div>
			</fieldset>
			<fieldset class="label_side">
				<div>
					<input type="checkbox" name="subunidades[]" value="{$entidad->id}" checked /> {$entidad->nombre}<hr />
					{foreach $subunidades as $subunidad}
						<input type="checkbox" name="subunidades[]" value="{$subunidad->id}" checked /> {$subunidad->nombre}<br />
					{/foreach}
				</div>
			</fieldset>
			<div class="button_bar clearfix" id="footer_tabs">
					<button class="dark send_right img_icon has_text" type="submit"><span>Grabar</span></button>
					<button class="btnPrev dark send_right img_icon has_text" type="button"><span>Anterior</span></button>
			</div>
		</div><!-- fin tab subunidades afectadas --> 
			</div>
</div>
</form>
{literal}
<script>
$(document).ready(function(){
	//validar formulario
	var validator = $('#formindicador').validate({
		rules:{
			codigo:{required:true},
			id_proceso:{required:true},
			nombre:{required:true},
			formulacion:{required:true},
			id_responsable:{required:true},
			id_responsable_medicion:{required:true},
			tipo_seleccion_responsable:{required:true}
		},
		ignore: ':hidden',
		messages:{
			codigo:'no',
			id_proceso:'no',  
			nombre:'no',
			formulacion:'no',
			id_responsable:'no',
			id_responsable_medicion:'no',
			tipo_seleccion_responsable:'no'
		},
	});
	//Boton previo
	$('button.btnPrev').on('click',function(){
		var actualTab = $('#tab_crear_indicador').tabs('option', 'selected');
		$('#tab_crear_indicador').tabs('select',actualTab-1);
	});
	//Boton next
	$('button.btnNext').on('click',function(){
		var  estavalidado = $('#formindicador').valid();
		if (estavalidado == true)
		{	
			var actualTab = $('#tab_crear_indicador').tabs('option', 'selected');
			$('#tab_crear_indicador').tabs('select',actualTab+1);
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
