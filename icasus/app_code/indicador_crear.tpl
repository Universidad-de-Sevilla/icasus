<p><a href="javascript:window.history.back();"><img src="/icons/ff16/arrow_undo.png" /> Cancelar</a></p>

<div class="box grid_16">
	<div class="toggle_container">
		<div class="block">
        <form method="post" action="index.php?page=indicador_grabar" id="formindicador" name="formindicador" class="validate_form">
          <input type="hidden" name="id_entidad" value="{$entidad->id}" />
        
          <div class="columns clearfix">
            <div class="col_40">
              <fieldset class="label">
                <label>Código indicador</label>
                <div><input  type="text" name="codigo" class="required"/><div class="required_tag tooltip hover left" title="Campo requerido"></div> </div>
              </fieldset>
            </div>
            <div class="col_60">
            <fieldset class="label">
              <label>Proceso</label>
              <div>
                <select name="id_proceso" id="id_proceso" class="required select_box">
                  <option value=""></option>
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
            <div><textarea name="nombre"class="required" /></textarea><div class="required_tag tooltip hover left" title="Campo requerido"></div></div>
          </fieldset>
          <fieldset class="label_side">
            <label>Descripci&oacute;n</label>
            <div><textarea  class="inp" name="descripcion"></textarea></div>
          </fieldset>
          <fieldset class="label_side">
            <label>Formulaci&oacute;n</label>
            <div><textarea  class="required" name="formulacion"></textarea><div class="required_tag tooltip hover left" title="Campo requerido"></div></div>
          </fieldset>
          <fieldset class="label_side">
            <label>Cálculo</label>
            <div><textarea  class="" name="calculo" placeholder="Sólo si es un indicador calculado"></textarea></div>
          </fieldset>
          <fieldset class="label_side">
            <label>Responsable de seguimiento</label>
            <div>
              <select name="id_responsable" class="required select_box">
                <option value=""></option>
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
              <select name="id_responsable_medicion" class="required select_box">
                <option value=""></option>
                {foreach $usuarios_entidad as $usuario_entidad}
                  <option value="{$usuario_entidad->usuario->id}">{$usuario_entidad->usuario->nombre} {$usuario_entidad->usuario->apellidos} {if $usuario_entidad->usuario->puesto} - {$usuario_entidad->usuario->puesto} {/if}
                  </option>
                {/foreach}              
              </select><div class="required_tag tooltip hover left" title="Campo requerido"></div>
            </div>
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
            <div>
              <select name="criterios_efqm[]" id="criterios_efqm" class="select_box" >
                <option value=""></option>
                {foreach $criterios_efqm as $criterio_efqm}
                  <option value="{$criterio_efqm->id}">
                    {$criterio_efqm->codigo} - {$criterio_efqm->nombre|htmlentities}
                  </option>
                {/foreach}
              </select>
              <select name="criterios_efqm[]" id="criterios_efqm" class="select_box">
                <option value=""></option>
                 {foreach $criterios_efqm as $criterio_efqm}
                  <option value="{$criterio_efqm->id}">
                    {$criterio_efqm->codigo} - {$criterio_efqm->nombre|htmlentities}
                  </option>
                {/foreach}
              </select>
            </div>
          </fieldset>
          <div class="columns clearfix">
            <div class="col_50">
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
            <div class="col_50">
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
          </div>
          <div class="columns clearfix">
            <div class="col_50">
              <fieldset class="label">
                <label>Nivel de desagregacion</label>
                <div><input  type="text" name="nivel_desagregacion" /></div>
              </fieldset>
            </div>
            <div class="col_50">
              <fieldset class="label">
                <label>Unidad generadora</label>
                <div><input  type="text" name="unidad_generadora" /></div>
              </fieldset>
            </div>
          </div>
          <fieldset class="label_side">
            <label>Subunidades afectadas</label>
            <div>
              <input type="checkbox" name="subunidades[]" value="{$entidad->id}" checked /> {$entidad->nombre}<hr />
              {foreach $subunidades as $subunidad}
                <input type="checkbox" name="subunidades[]" value="{$subunidad->id}" checked /> {$subunidad->nombre}<br />
              {/foreach}
            </div>
          </fieldset>
					<fieldset class="label_side">
            <label>Tipo de medición</label>
            <div>
              <p><input type="radio" name="tipo_seleccion_responsable" value="0"  class="required"> Centralizada por la unidad superior. </p>
              <p><input type="radio" name="tipo_seleccion_responsable" value="1"  > Delegada a los responsables de las subunidades</p>
              <div class="required_tag tooltip hover left" title="Campo requerido"></div>
            </div>
          </fieldset>
          <div class="button_bar clearfix">
            <button class="green" type="submit" value="Grabar" name="indicador_submit">
              <span>Grabar</span>
            </button>
          </div>    
        </form>
    </div>
  </div>
</div>
