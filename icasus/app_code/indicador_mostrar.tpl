<h3 class="section">
  <a href='index.php?page=medicion_listar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><img 
    src='/icons/ff16/chart_curve.png' /> Mostrar mediciones</a> &nbsp;
  <a href='index.php?page=indicador_listar&id_entidad={$indicador->id_entidad}'><img 
    src='/icons/ff16/chart_curve.png' /> Listar todos</a> &nbsp;
  <a href='index.php?page=indicador_editar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><img 
    src='/icons/ff16/chart_curve_edit.png'  /> Editar</a> &nbsp; 
  <a href='index.php?page=indicador_crear&id_entidad={$indicador->id_entidad}'><img 
    src='/icons/ff16/chart_curve_add.png'  /> Crear</a> &nbsp; 
  <a href='index.php?page=indicador_borrar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}' onClick='return confirmar();'><img 
    src='/icons/ff16/chart_curve_delete.png'  /> Borrar</a> &nbsp; 
</h3>
								
<div class="box grid_16">
	<div class="toggle_container">
		<div class="block">
      <fieldset class="label_side">
        <label>Proceso</label>
        <div>
          <a href="index.php?proceso_mostrar&id_indicador={$indicador->proceso->id}">{$indicador->proceso->codigo} - 
          {$indicador->proceso->nombre}</a>
        </div>
      </fieldset>
      <fieldset class="label_side">
        <label>Responsable de medici&oacute;n</label>
        <div>
          {$indicador->responsable->nombre} {$indicador->responsable->apellidos} {if $indicador->responsable->puesto} - {$indicador->responsable->puesto} {/if}
        </div>
      </fieldset>
      <fieldset class="label_side">
        <label>Código indicador</label>
        <div>
          {$indicador->codigo}
        </div>
      </fieldset>
      <fieldset class="label_side">
        <label>Nombre indicador</label>
        <div>
          {$indicador->nombre}
        </div>
      </fieldset>
      <fieldset class="label_side">
        <label>Descripci&oacute;n</label>
        <div>
          {$indicador->descripcion}
        </div>
      </fieldset>
      <fieldset class="label_side">
        <label>Formulaci&oacute;n</label>
        <div> 
          {$indicador->formulacion}
        </div>
      </fieldset>
      <fieldset class="label_side">
        <label>Valor de referencia</label>
        <div>{$indicador->valor_referencia}</div>
      </fieldset>
      <fieldset class="label_side">
        <label>Fuente de informaci&oacute;n</label>
        <div>{$indicador->fuente_informacion}</div>	
      </fieldset>
      <fieldset class="label_side">
        <label>Fuente de datos</label>
        <div>{$indicador->fuente_datos}</div>	
      </fieldset>
      <fieldset class="label_side">
        <label>Unidad generadora</label>
        <div>{$indicador->unidad_generadora}</div>
      </fieldset>
      <fieldset class="label_side">
        <label>Metodo de comprobaci&oacute;n / Evidencia</label>
        <div>{$indicador->evidencia}</div>		
      </fieldset>
      <fieldset class="label_side">
        <label>Hist&oacute;rico</label>
        <div>{$indicador->historicos}</div>
      </fieldset>

      <fieldset class="label_side">
        <label>Interpretaci&oacute;n</label>
        <div>{$indicador->interpretacion}</div>
      </fieldset>
      <fieldset class="label_side">
        <label>Indicadores relacionados</label>
        <div>{$indicador->indicadores_relacionados}</div>
      </fieldset>
      <fieldset class="label_side">
        <label>Criterios EFQM</label>
        <div>
          {if $indicador_criterios_efqm}
          <ul>
            {foreach $indicador_criterios_efqm as $criterio_efqm}
              <li>{$criterio_efqm->codigo} - {$criterio_efqm->nombre}</li>
            {/foreach}
          </ul>
          {/if}
        </div>
      <fieldset class="label_side">
        <label>Periodicidad</label>
        <div>{$indicador->periodicidad}</div>
      </fieldset>
      <fieldset class="label_side">
        <label>Visibilidad</label>	
        <div>{$indicador->visibilidad->nombre|htmlentities}</div>
      </fieldset>
      <fieldset class="label_side">
        <label>Valores de referencia</label>
        <div>&nbsp;</div>
      </fieldset>
      <fieldset class="label_side">
        <label>Nivel de desagregacion</label>
        <div>{$indicador->nivel_desagregacion}</div>
      </fieldset>
      <fieldset class="label_side">
        <label>Subunidades afectadas</label>
        <div>
          <ul>
          {foreach $indicador_subunidades as $subunidad}
            <li><a href="index.php?entidad_datos&id_entidad={$subunidad->id}">{$subunidad->nombre}</a></li>
          {/foreach}
          </ul>
        </div>
      </fieldset>
    </div>
  </div>
  </div>

  <h2>Mediciones</h2>
        <h3 class="section">
          <a href='index.php?page=medicion_listar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><img 
            src='/icons/ff16/time.png' /> Mostrar Mediciones</a>						
        </h3>
    
  <p><img src="index.php?page=grafica_indicador_agregado&id_indicador={$indicador->id}" alt="gráfica completa con los valores medios del indicador" />
