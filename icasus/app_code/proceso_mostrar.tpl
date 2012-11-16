<div class="box grid_16">
  <div class="block">	
    <div class="section clearfix" style="padding:5px;">
      <a href='index.php?page=proceso_editar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}'>
          <img src='/icons/ff16/cog_edit.png' alt='icono' /><span> Editar proceso </span> </a> &nbsp; &nbsp; &nbsp;
      <a href='index.php?page=proceso_listar&id_entidad={$proceso->id_entidad}'>
          <img src='/icons/ff16/cog.png' alt='icono'/><span> Listar procesos </span> </a>&nbsp; &nbsp; &nbsp;
      <a href='index.php?page=proceso_crear&id_entidad={$proceso->id_entidad}'>
          <img src='/icons/ff16/cog_add.png' alt='icono' /><span> Crear proceso</span> </a>&nbsp; &nbsp; &nbsp;
      <a href='index.php?page=indicador_crear&id_entidad={$proceso->id_entidad}'>
          <img src='/icons/ff16/chart_curve_add.png' alt='icono' /><span> Crear indicador</span> </a>&nbsp; &nbsp; &nbsp;
      <a href='index.php?page=archivo_gestionar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}'>
          <img src='/icons/ff16/box.png' alt='icono' /><span> Archivos </span> </a> &nbsp; &nbsp; &nbsp;
      <a href='index.php?page=proceso_borrar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}'
    onClick='return confirmar();'>
        <img src='/icons/ff16/cog_delete.png' alt='icono' /><span> Borrar proceso</span> </a>&nbsp; &nbsp; &nbsp;
    </div>
  </div>
</div>

<div class="box grid_16">
	<div class="toggle_container">
		<div class="block">
			
			  <fieldset class="label_side">
				<label>Proceso madre</label>
				<div>
          {if $proceso_madre->id > 0}
            {$proceso_madre->codigo} - {$proceso_madre->nombre} 
            &nbsp; <a href="index.php?page=proceso_mostrar&id_proceso={$proceso_madre->id}&id_entidad={$proceso->id_entidad}">(mostrar)</a>
          {else}
            Es un proceso madre
          {/if}
				</div>
			  </fieldset> 
			  <fieldset class="label_side">
				<label>Nombre proceso</label>
				<div>
				  <h3>{$proceso->nombre}</h3>
				</div>
			  </fieldset> 
        <div class="columns clearfix">
          <div class="col_33">
            <fieldset>
              <label>C&oacute;digo</label>
              <div> {$proceso->codigo} </div>
            </fieldset> 
          </div>
          <div class="col_33">
            <fieldset>
            <label>Versi&oacute;n</label>
            <div> {$proceso->revision} &nbsp; </div>
            </fieldset>  
          </div>
          <div class="col_33">
            <fieldset>
            <label>Fecha</label>
            <div> {$proceso->fecha_revision|date_format:'%d/%m/%Y'} &nbsp; </div>
            </fieldset>  
          </div>
        </div>
        <div class="columns clearfix">
          <div class="col_50">
            <fieldset>
            <label>Propietario</label>
              <div>
                {$propietario->nombre} {$propietario->apellidos} 
                {if $propietario->puesto} - {$propietario->puesto} {/if}
              </div>
            </fieldset> 
          </div>
          <div class="col_50">
            <fieldset>
              <label>Tipo de proceso</label>
              <div> {$proceso->alcance} </div>
            </fieldset> 
          </div>
        </div>
        {if $proceso->mision}
			  <fieldset class="label_side">
          <label>Misi&oacute;n</label>
          <div> {$proceso->mision} </div>
			  </fieldset>   
        {/if}
        {if $proceso->equipo_de_proceso}
			  <fieldset class="label_side">
          <label>Equipo de proceso</label>
          <div> {$proceso->equipo_de_proceso} </div>
			  </fieldset>      
        {/if}
        {if $proceso->resultados_clave}
			  <fieldset class="label_side">
          <label>Resultados clave</label>
          <div> {$proceso->resultados_clave} </div>
			  </fieldset>
        {/if}
        {if $proceso->entradas or $proceso->salidas}
        <div class="columns clearfix">
          <div class="col_50">
            <fieldset>
              <label>Entradas / Proveedores</label>
              <div> {$proceso->entradas} </div>
            </fieldset>  
          </div>
          <div class="col_50">
            <fieldset>
              <label>Salidas / Clientes</label>
              <div> {$proceso->salidas} </div>
            </fieldset>   
          </div>
        </div>
        {/if}
        {if $proceso->actividades}
			  <fieldset class="label_side">
          <label>Actividades</label>
          <div> {$proceso->actividades} </div>
			  </fieldset> 
        {/if}
        {if $proceso->variables_control}
			  <fieldset class="label_side">
          <label>Variables de control</label>
          <div> {$proceso->variables_control} </div>
			  </fieldset> 
        {/if}
        {if $proceso->documentacion}
			  <fieldset class="label_side">
          <label>Documentaci&oacute;n</label>
          <div> {$proceso->documentacion} </div>
			  </fieldset>
        {/if}
        {if $proceso->mediciones}
			  <fieldset class="label_side">
          <label>Mediciones</label>
          <div> {$proceso->mediciones} </div>
			  </fieldset>   
        {/if}
        {if $proceso->registros}
			  <fieldset class="label_side">
          <label>Registros</label>
          <div> {$proceso->registros} </div>
			  </fieldset>    
        {/if}
		</div>
	</div>
</div>
              

	<div class="box grid_16">
    <h2 class="box_head grad_grey_dark">Indicadores asociados al proceso</h2>
    <a href="#" class="grabber"></a>
    <a href="#" class="toggle"></a>
		<div class="block">	
      {if $indicadores}
			<table class="static"> 
				<thead>
					<tr><th>Código</th><th>Indicador</th><th>Responsable</th><th>Acciones</th></tr>
				</thead>
				<tbody>
					{foreach from=$indicadores item=indicador} 
					  <tr>
              <td>{$indicador->codigo}</td>
              <td>
                <a href='index.php?page=indicador_mostrar&id_indicador={$indicador->id}&id_entidad={$proceso->id_entidad}'>{$indicador->nombre}</a>
                <a href='#' title='{$indicador->descripcion}'><big>*</big></a>
              </td>
              <td>
                {$indicador->responsable->nombre} {$indicador->responsable->apellidos}
                 <!--<a href='index.php?page=usuario_datos&id_usuario={$indicador->id_responsable}'></a>-->
              </td>
					  </tr>
					{/foreach}
				</tbody>
			</table>
      {else}
        <div class='alert alert_blue'>
          <img height="24" width="24" src="theme/danpin/images/icons/small/white/alert_2.png"> 
          No se ha definido ningún indicador para este proceso.
        </div>
      {/if}
		</div>
	</div>
  
  {if isset($flujograma)}
    <div class="box grid_16">
      <h2 class="box_head grad_grey_dark">Flujograma del proceso</h2>
      <a href="#" class="grabber"></a>
      <a href="#" class="toggle"></a>
      <div class="block">	
        <p align="center"><img src="index.php?page=archivo_descargar&id={$flujograma->id}" alt="Flujograma del Proceso" /></p>
      </div>
    </div> <!-- .box .grid_16 -->
  {/if}

  {if isset($archivos)}
    <div class="box grid_16">
      <h2 class="box_head grad_grey_dark">Archivos asociados al proceso</h2>
      <a href="#" class="grabber"></a>
      <a href="#" class="toggle"></a>
      <div class="block">	
        <table class="static"> 
          <thead>
            <tr><th>Título</th><th>Usuario</th></tr>
          </thead>
          <tbody>
            {foreach from=$archivos item=archivo} 
              <tr>
              <td><a href="index.php?page=archivo_descargar&id={$archivo->id}">{$archivo->titulo|htmlentities}</a> 
              {if $archivo->descripcion != NULL}<a href='#' title='{$archivo->descripcion}'><big>*</big></a>{/if}
              </td>
              <td>{$archivo->usuario->nombre|htmlentities} {$archivo->usuario->apellidos|htmlentities}</td>
              </tr>
            {/foreach}
          </tbody>
        </table>
      </div>
    </div>	
  {/if}
  
  {if $subprocesos}
    <div class="box grid_16">
      <h2 class="box_head grad_grey_dark">Subprocesos</h2>
      <a href="#" class="grabber"></a>
      <a href="#" class="toggle"></a>
      <div class="block">	
          <table class="static"> 
              <thead>
                <tr><th>Subproceso</th><th>Nombre</th><th>Propietario</th><th>Acciones</th></tr>
              </thead>
              <tbody>
                {foreach from=$subprocesos item=subproceso}
                  <tr>
                    <td>{$subproceso->codigo}</td>
                    <td>{$subproceso->nombre}</td>
                    <td>{$subproceso->propietario->nombre} {$subproceso->propietario->apellidos}</td>
                    <td><a href="index.php?page=proceso_mostrar&id_proceso={$subproceso->id}&id_entidad={$subproceso->id_entidad}">Ver</a>
                    - <a href="index.php?page=proceso_editar&id_proceso={$subproceso->id}&id_entidad={$subproceso->id_entidad}">Editar</a>
                    - <a href='index.php?page=proceso_borrar&id_proceso={$subproceso->id}&id_entidad={$subproceso->id_entidad}'
                    onClick='return confirmar();'>Borrar</a></td>
                  </tr>
                {/foreach}
              </tbody>
          </table>
      </div>
    </div>		
  {/if}
