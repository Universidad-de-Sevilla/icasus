<div class="box grid_16">
	<div class="toggle_container">
    <h2 class="box_head grad_grey_dark">Parámetros del dato</h2>
    <a href="#" class="grabber"></a>
    <a href="#" class="toggle"></a>
		<div class="block">
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
        <a href='index.php?page=medicion_responsable&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'><img 
          src='/icons/ff16/user_medicion.png' /> Responsables medición</a>
      </div>

      <div class="columns clearfix">
        <div class="col_40">
          <fieldset class="label">
            <label>Código dato</label>
            <div>
              {$dato->codigo}
            </div>
          </fieldset>
        </div>
        <div class="col_60">
          <fieldset class="label">
            <label>Nombre dato</label>
            <div>
              {$dato->nombre}
            </div>
          </fieldset>
        </div>
      </div><!-- .colums .clearfix -->
      <fieldset class="label_side">
        <label>Descripci&oacute;n</label>
        <div>
          {$dato->descripcion}
        </div>
      </fieldset>
			<fieldset class="label_side">
        <label>Responsable del dato</label>
        <div>
          {$dato->responsable->nombre} {$dato->responsable->apellidos} {if $dato->responsable->puesto} - {$dato->responsable->puesto} {/if}
        </div>
      </fieldset>
      <fieldset class="label_side">
        <label>Fuente de datos</label>
        <div>{$dato->fuente_datos}&nbsp;</div>	
      </fieldset>
      <fieldset class="label_side">
        <label>Datos relacionados</label>
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
  </div><!-- .block -->
  </div><!-- .toggle_container -->
</div><!-- .box .grid_16 -->

<div class="box grid_16">
	<div class="toggle_container">
    <h2 class="box_head grad_grey_dark">Mediciones del dato</h2>
    <a href="#" class="grabber"></a>
    <a href="#" class="toggle"></a>
    <div class="block">
    <div class="button_bar clearfix">
      <a href='index.php?page=medicion_listar&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'><img 
        src='/icons/ff16/time.png' /> Mostrar Mediciones</a>						
    </div>
    
    {if $mediciones}
      <p><img src="index.php?page=grafica_indicador_agregado&id_indicador={$dato->id}" alt="gráfica completa con los valores medios del dato" /></p>
    {else}
      <p class="aviso">Todavía no se han definido mediciones para este dato.</p>
    {/if}
    </div>
  </div><!-- toggle_container -->
</div><!-- box grid_16 -->
