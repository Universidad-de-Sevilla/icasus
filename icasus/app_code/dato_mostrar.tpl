<div class="box grid_16">
	<div class="toggle_container">
      <div class="button_bar clearfix">
        <a href='index.php?page=medicion_listar&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'><img 
          src='/icons/ff16/time.png' /> Mostrar mediciones</a> &nbsp;
        <a href='index.php?page=dato_listar&id_entidad={$dato->id_entidad}'><img 
          src='/icons/ff16/chart_curve.png' /> Listar todos</a> &nbsp;
        <a href='index.php?page=dato_editar&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'><img 
          src='/icons/ff16/chart_curve_edit.png'  /> Editar</a> &nbsp; 
        <a href='index.php?page=dato_crear&id_entidad={$dato->id_entidad}'><img 
          src='/icons/ff16/chart_curve_add.png'  /> Crear</a> &nbsp; 
        <a href='index.php?page=dato_borrar&id_dato={$dato->id}&id_entidad={$dato->id_entidad}' onClick='return confirmar();'><img 
          src='/icons/ff16/chart_curve_delete.png'  /> Borrar</a> &nbsp; 
				<a href='index.php?page=medicion_responsable&id_indicador={$dato->id}&id_entidad={$dato->id_entidad}'><img 
					src='/icons/ff16/user_medicion.png' /> Responsables medición</a>
      </div>
		<div class="block">
      <div class="columns clearfix">
      <fieldset class="label">
        <label>Código dato</label>
        <div>
          {$dato->codigo}
        </div>
      </fieldset>
      <fieldset class="label_side">
        <label>Nombre dato</label>
        <div>
          {$dato->nombre}
        </div>
      </fieldset>
      <fieldset class="label_side">
        <label>Descripci&oacute;n</label>
        <div>
          {$dato->descripcion}
        </div>
      </fieldset>
			<fieldset class="label_side">
        <label>Responsable de seguimiento</label>
        <div>
          {$dato->responsable->nombre} {$dato->responsable->apellidos} {if $dato->responsable->puesto} - {$dato->responsable->puesto} {/if}
        </div>
      </fieldset>
      <fieldset class="label_side">
        <label>Responsable de medición</label>
        <div>
          {$dato->responsable_medicion->nombre} {$dato->responsable_medicion->apellidos} {if $dato->responsable_medicion->puesto} - {$dato->responsable_medicion->puesto} {/if}
        </div>
      </fieldset>
      <fieldset class="label_side">
        <label>Fuente de informaci&oacute;n</label>
        <div>{$dato->fuente_informacion}&nbsp;</div>	
      </fieldset>
      <fieldset class="label_side">
        <label>Fuente de datos</label>
        <div>{$dato->fuente_datos}&nbsp;</div>	
      </fieldset>
      <fieldset class="label_side">
        <label>datoes relacionados</label>
        <div>{$dato->indicadores_relacionados}&nbsp;</div>
      </fieldset>
      <div class="columns clearfix">
        <div class="col_50">
          <fieldset class="label_side">
            <label>Periodicidad</label>
            <div>{$dato->periodicidad}&nbsp;</div>
          </fieldset>
        </div>
        <div class="col_50">
          <fieldset class="label_side">
            <label>Visibilidad</label>	
            <div>{$dato->visibilidad->nombre|htmlentities}&nbsp;</div>
          </fieldset>
        </div>
      </div>
      <div class="columns clearfix">
        <div class="col_50">
          <fieldset class="label_side">
            <label>Nivel de desagregacion</label>
            <div>{$dato->nivel_desagregacion}&nbsp;</div>
          </fieldset>
        </div>
        <div class="col_50">
          <fieldset class="label_side">
            <label>Unidad generadora</label>
            <div>{$dato->unidad_generadora}&nbsp;</div>
          </fieldset>
        </div>
      </div>
      <fieldset class="label_side">
        <label>Subunidades afectadas</label>
        <div>
          {if $dato_subunidades}
            <ul>
            {foreach $dato_subunidades as $dato_subunidad}
              <li><a href="index.php?entidad_datos&id_entidad={$dato_subunidad->entidad->id}">{$dato_subunidad->entidad->nombre}</a></li>
            {/foreach}
            </ul>
          {else}
            No se han asignado subunidades a este dato (corregir)
          {/if}
        </div>
      </fieldset>
    </div>
  </div>
  </div>

  <h2>Mediciones</h2>
    <h3 class="section">
      <a href='index.php?page=medicion_listar&id_indicador={$dato->id}&id_entidad={$dato->id_entidad}'><img 
        src='/icons/ff16/time.png' /> Mostrar Mediciones</a>						
    </h3>
    
    {if $mediciones}
      <p><img src="index.php?page=grafica_indicador_agregado&id_indicador={$dato->id}" alt="gráfica completa con los valores medios del dato" />
    {else}
      <p class="aviso">Todavía no se han definido mediciones para este dato.</p>
    {/if}
