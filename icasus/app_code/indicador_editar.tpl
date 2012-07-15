<h3>
  <a href='javascript:window.history.back();'><img src='/icons/ff16/arrow_undo.png' /> Cancelar</a> &nbsp; &nbsp; &nbsp;
  <a href='index.php?page=indicador_borrar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}' onClick='return confirmar();'><img 
    src='/icons/ff16/chart_curve_delete.png' /> Borrar indicador</a>
</h3>
<div class="box grid_16">
	<div class="toggle_container">
		<div class="block">
      <form method="post" action="index.php?page=indicador_grabar" id="formindicador" name="formindicador" class="datos">
        <input type='hidden' name='id_indicador' value='{$indicador->id}' />
        <input type='hidden' name='id_entidad' value='{$indicador->id_entidad}' />
          <fieldset class="label_side">
            <label>Proceso</label>
            <div>
              <select name="id_proceso" id="id_proceso" class="inp">
                {foreach $procesos as $proceso}
                  <option value='{$proceso->id}' {if $indicador->id_proceso == $proceso->id}selected{/if}>
                    {$proceso->nombre}
                  </option>
                {/foreach}
              </select>
					    <div class="required_tag tooltip hover left" title="Campo requerido"></div>
            </div>
          </fieldset>
					<fieldset class="label_side">
            <label>Responsable de seguimiento</label>
            <div>
              <select name="id_responsable">
                <option value=""></option>
                {foreach $usuarios_entidades as $usuario_entidad}
                  <option value='{$usuario_entidad->usuario->id}' {if $indicador->id_responsable == $usuario_entidad->usuario->id}selected{/if}>{$usuario_entidad->usuario->nombre} {$usuario_entidad->usuario->apellidos} {if $usuario_entidad->usuario->puesto} - {$usuario_entidad->usuario->puesto} {/if}
                  </option>
                {/foreach}              
              </select>
					    <div class="required_tag tooltip hover left" title="Campo requerido"></div>
            </div>
          </fieldset>

          <fieldset class="label_side">
            <label>Responsable de medici&oacute;n</label>
            <div>
              <select name="id_responsable_medicion">
                <option value=""></option>
                {foreach $usuarios_entidades as $usuario_entidad}
                  <option value='{$usuario_entidad->usuario->id}' {if $indicador->id_responsable_medicion == $usuario_entidad->usuario->id}selected{/if}>{$usuario_entidad->usuario->nombre} {$usuario_entidad->usuario->apellidos} {if $usuario_entidad->usuario->puesto} - {$usuario_entidad->usuario->puesto} {/if}
                  </option>
                {/foreach}              
              </select>
					    <div class="required_tag tooltip hover left" title="Campo requerido"></div>
            </div>
          </fieldset>
          <fieldset class="label_side">
            <label>Código indicador</label>
            <div>
              <input type='text' name='codigo' id='codigo'value='{$indicador->codigo}' />
					    <div class="required_tag tooltip hover left" title="Campo requerido"></div>
            </div>
          </fieldset>
          <fieldset class="label_side">
            <label>Nombre indicador</label>
            <div>
              <input type='text' name='nombre' class='text' id='nombre'value='{$indicador->nombre}' />
					    <div class="required_tag tooltip hover left" title="Campo requerido"></div>
            </div>
          </fieldset>
          <fieldset class="label_side">
            <label>Descripci&oacute;n</label>
            <div>
              <textarea rows="3" class='inp' name='descripcion' id='descripcion'>{$indicador->descripcion}</textarea>
            </div>
          </fieldset>
          <fieldset class="label_side">
            <label>Formulaci&oacute;n</label>
            <div> 
              <textarea rows="3" class='inp' name='formulacion' id='formulacion'>{$indicador->formulacion}</textarea>
					    <div class="required_tag tooltip hover left" title="Campo requerido"></div>
            </div>
          </fieldset>
          <fieldset class="label_side">
            <label>Valor de referencia</label>
            <div><input type='text' name='valor_referencia' id='valor_referencia'value='{$indicador->valor_referencia}' /></div>
          </fieldset>
          <fieldset class="label_side">
            <label>Fuente de informaci&oacute;n</label>
            <div><input type='text' name='fuente_informacion' id='fuente_informacion'value='{$indicador->fuente_informacion}' /></div>	
          </fieldset>
          <fieldset class="label_side">
            <label>Fuente de datos</label>
            <div><input type='text' name='fuente_datos' id='fuente_datos'value='{$indicador->fuente_datos}' /></div>	
          </fieldset>
          <fieldset class="label_side">
            <label>Unidad generadora</label>
            <div><input type='text' name='unidad_generadora' id='unidad_generadora'value='{$indicador->unidad_generadora}' /></div>
          </fieldset>
          <fieldset class="label_side">
            <label>Metodo de comprobaci&oacute;n / Evidencia</label>
            <div><input type='text' name='evidencia' id='evidencia'value='{$indicador->evidencia}' /></div>		
          </fieldset>
          <fieldset class="label_side">
            <label>Hist&oacute;rico</label>
            <div><input type='text' name='historicos' id='historicos'value='{$indicador->historicos}' /></div>
          </fieldset>

          <fieldset class="label_side">
            <label>Interpretaci&oacute;n</label>
            <div><input type='text' name='interpretacion' id='interpretacion'value='{$indicador->interpretacion}' /></div>
          </fieldset>
          <fieldset class="label_side">
            <label>Indicadores relacionados</label>
            <div><input type='text' name='indicadores_relacionados' id='indicadores_relacionados'value='{$indicador->indicadores_relacionados}' /></div>
          </fieldset>
          <fieldset class="label_side">
            <label>Criterios EFQM</label>
            <div>
              <select name="criterios_efqm[]" id="criterios_efqm" class="inp">
                <option value=''></option>
                {foreach $criterios_efqm as $criterio_efqm}
                  <option value='{$criterio_efqm->id}' 
                  {if $indicador->criterios_efqm}
                      {if $indicador->criterios_efqm[0]->criterio_efqm->id == $criterio_efqm->id}selected{/if}
                  {/if}
                  >{$criterio_efqm->codigo} - {$criterio_efqm->nombre}
                  </option>
                {/foreach}
              </select>
              <select name="criterios_efqm[]" id="criterios_efqm" class="inp">
                <option value=''></option>
                {foreach $criterios_efqm as $criterio_efqm}
                  <option value='{$criterio_efqm->id}' 
                  {if $indicador->criterios_efqm}
                      {if $indicador->criterios_efqm[1]->criterio_efqm->id == $criterio_efqm->id}selected{/if}
                  {/if}
                  >{$criterio_efqm->codigo} - {$criterio_efqm->nombre}
                  </option>
                {/foreach}
              </select>
            </div>
          <fieldset class="label_side">
            <label>Periodicidad</label>
            <div>{$indicador->periodicidad}</div>
          </fieldset>
          <fieldset class="label_side">
            <label>Visibilidad</label>	
            <div>
              <select name="id_visibilidad" id="id_visibilidad">
                {foreach $visibilidades as $visibilidad}
                  <option value='{$visibilidad->id}' {if $visibilidad->id == $indicador->visibilidad->id}selected{/if}>
                    {$visibilidad->nombre|htmlentities}
                  </option>
                {/foreach}
              </select>
            </div>
              
          </fieldset>
          <fieldset class="label_side">
            <label>Valores de referencia</label>
            <div>&nbsp;</div>
          </fieldset>
          <fieldset class="label_side">
            <label>Nivel de desagregacion</label>
            <div><input type='text' name='nivel_desagregacion' id='nivel_desagregacion'value='{$indicador->nivel_desagregacion}' /></div>
          </fieldset>
          <fieldset class="label_side">
            <label>Subunidades afectadas</label>
            <div>
              <input type="checkbox" name="subunidades[]" checked /> {$entidad->nombre}<hr />
              {foreach $subunidades as $subunidad}
                <input type="checkbox" name="subunidades[]" value="{$subunidad->id}" /> {$subunidad->nombre}<br />
              {/foreach}
            </div>
          </fieldset>
          <fieldset class="label_side">
            <div>
              <input type="submit" class="btn" value="Grabar" name="indicador_submit" />
            </div>
          </fieldset>
      </form>
    </div>
  </div>
  </div>
