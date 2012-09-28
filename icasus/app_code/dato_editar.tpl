<p><a href="javascript:window.history.back();"><img src="/icons/ff16/arrow_undo.png" /> Cancelar</a></p>

<div class="box grid_16">
	<div class="toggle_container">
		<div class="block">
        <form method="post" action="index.php?page=dato_grabar" class="validate_form">
          <input type="hidden" name="id_dato" value="{$dato->id}" />
          <input type="hidden" name="id_entidad" value="{$dato->id_entidad}" />
          <div class="columns clearfix">
            <div class="col_50">
              <fieldset class="label">
                <label>Identificador</label>
                <div>
                  <input  type="text" name="codigo" placeholder="Único, fácil de recordar y sin espacios"
                 class="required" value="{$dato->codigo}" />
                  <div class="required_tag"></div>
                 </div>
              </fieldset>
            </div>
            <div class="col_50">
              <fieldset class="label">
                <label>Responsable del dato</label>
                <div>
                  <select name="id_responsable" class="required select_box">
                    {foreach $usuarios_entidades as $usuario_entidad}
                      <option value="{$usuario_entidad->usuario->id}" 
                        {if $usuario_entidad->usuario->id == $dato->id_responsable}
                          selected
                        {/if}>
                        {$usuario_entidad->usuario->nombre} {$usuario_entidad->usuario->apellidos} 
                        {if $usuario_entidad->usuario->puesto} - {$usuario_entidad->usuario->puesto|htmlentities} {/if}
                      </option>
                    {/foreach}              
                  </select>
                  <div class="required_tag"></div>
                </div>
              </fieldset>
            </div>
          </div>
          <fieldset class="label_side">
            <label>Nombre</label>
            <div>
              <input type="text" name="nombre" class="required" value="{$dato->nombre}" />
              <div class="required_tag"></div>
            </div>
          </fieldset>
          <fieldset class="label_side">
            <label>Descripci&oacute;n</label>
            <div><textarea  class="autogrow" name="descripcion">{$dato->descripcion}</textarea></div>
          </fieldset>
          <fieldset class="label_side">
            <label>Fuente de datos</label>
            <div><input  type="text" name="fuente_datos" value="{$dato->fuente_datos}" /></div>	
          </fieldset>
          <fieldset class="label_side">
            <label>Unidad generadora</label>
            <div><input  type="text" name="unidad_generadora" value="{$dato->unidad_generadora}" /></div>
          </fieldset>
          <fieldset class="label_side">
            <label>Nivel de desagregacion</label>
            <div><input  type="text" name="nivel_desagregacion" value="{$dato->nivel_desagregacion}" /></div>
          </fieldset>
          <fieldset class="label_side">
            <label>Indicadores relacionados</label>
            <div><input  type="text" name="indicadores_relacionados" value="{$dato->indicadores_relacionados}" /></div>
          </fieldset>
          <div class="columns clearfix">
            <div class="col_50">
              <fieldset class="label">
                <label>Periodicidad</label>
                <div>
                  <select name="periodicidad" class="required select_box">
                    <option value="Anual" {if $dato->periodicidad == Anual}selected{/if}>Anual</option>
                    <option value="Mensual" {if $dato->periodicidad == Mensual}selected{/if}>Mensual</option>
                    <option value="Trimestral" {if $dato->periodicidad == Trimestral}selected{/if}>Trimestral</option>
                    <option value="Cuatrimestral" {if $dato->periodicidad == Cuatrimestral}selected{/if}>Cuatrimestral</option>
                    <option value="Semestral" {if $dato->periodicidad == Semestral}selected{/if}>Semestral</option>
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
                      <option value="{$visibilidad->id}" {if $dato->id_visibilidad == $visibilidad->id}selected{/if}>
                        {$visibilidad->nombre|htmlentities}
                      </option>
                    {/foreach}
                  </select>
                </div>
              </fieldset>
            </div>
          </div>
          <div class="button_bar clearfix">
            <button class="green" type="submit" value="Grabar" name="entidad_submit">
              <div class="ui-icon ui-icon-check"></div>
              <span>Grabar</span>
            </button>
            <button class="light send_right" type="reset" value="Cancelar" name="proceso_cancel" onclick="history.back()">
              <div class="ui-icon ui-icon-closethick"></div>
              <span>Cancelar</span>
            </button>          
          </div>    
        </form>
    </div>
  </div>
</div>
