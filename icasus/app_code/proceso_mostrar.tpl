<!--
<div id="nav_top" class="clearfix round_top">
	<ul class="clearfix">
    <li> </li>
    <li>    
      <a href='index.php?page=proceso_editar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}'>
          <img src='/icons/ff16/cog_edit.png' alt='icono' /><span> Editar proceso </span>
        </a> 
     </li>  
     <li>  
      <a href='index.php?page=proceso_listar&id_entidad={$proceso->id_entidad}'>
          <img src='/icons/ff16/cog.png' alt='icono'/><span> Listar procesos </span>
        </a>
     </li>
     <li>   
      <a href='index.php?page=proceso_crear&id_entidad={$proceso->id_entidad}'>
          <img src='/icons/ff16/cog_add.png' alt='icono' /><span> Crear proceso</span>
        </a>
     </li>
     <li>    
      <a href='index.php?page=indicador_crear&id_entidad={$proceso->id_entidad}'>
          <img src='/icons/ff16/chart_curve_add.png' alt='icono' /><span> Crear indicador</span>
        </a>
     </li>
     <li>    
      <a href='index.php?page=proceso_borrar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}'
    onClick='return confirmar();'>
        <img src='/icons/ff16/cog_delete.png' alt='icono' /><span> Borrar proceso</span>
        </a>
     </li>    
   </ul>
    
    <div id="mobile_nav">
		<div class="main"></div>
		<div class="side"></div>
	</div>
</div> 
-->
<h3 class="section">
      <a href='index.php?page=proceso_editar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}'>
          <img src='/icons/ff16/cog_edit.png' alt='icono' /><span> Editar proceso </span> </a> &nbsp; &nbsp; &nbsp;
      <a href='index.php?page=proceso_listar&id_entidad={$proceso->id_entidad}'>
          <img src='/icons/ff16/cog.png' alt='icono'/><span> Listar procesos </span> </a>&nbsp; &nbsp; &nbsp;
      <a href='index.php?page=proceso_crear&id_entidad={$proceso->id_entidad}'>
          <img src='/icons/ff16/cog_add.png' alt='icono' /><span> Crear proceso</span> </a>&nbsp; &nbsp; &nbsp;
      <a href='index.php?page=indicador_crear&id_entidad={$proceso->id_entidad}'>
          <img src='/icons/ff16/chart_curve_add.png' alt='icono' /><span> Crear indicador</span> </a>&nbsp; &nbsp; &nbsp;
      <a href='index.php?page=proceso_borrar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}'
    onClick='return confirmar();'>
        <img src='/icons/ff16/cog_delete.png' alt='icono' /><span> Borrar proceso</span> </a>
</h3>
<div class="box grid_16">
	<div class="toggle_container">
		<div class="block">
			<fieldset class="label_side">
				<label>C&oacute;digo</label>
				<div>
					<label for='codigo'>{$proceso->codigo}</label>
				</div>
			</fieldset>
			<fieldset class="label_side">
				<label>Revisi&oacute;n</label>
				<div>
					<label for='revision'>{$proceso->revision}</label>
				</div>
			</fieldset>
			<fieldset class="label_side">
				<label>Fecha</label>
				<div>
					<label for='fecha_revision'>{$proceso->fecha_revision|date_format:"%d/%m/%Y"}</label>
				</div>
			</fieldset>
			<fieldset class="label_side">
				<label>Nombre proceso</label>
				<div>
					<label for='nombre'>{$proceso->nombre}</label>
				</div>
			</fieldset>
			<fieldset class="label_side">
				<label>Propietario</label>
				<div>
					<label for='id_propietario'>{$propietario->nombre} {$propietario->apellidos}</label>
				</div>
			</fieldset>
			<fieldset class="label_side">
				<label>Proceso madre</label>
				<div>
          <label for="proceso_madre">
            {if $proceso_madre->id > 0} {$proceso_madre->codigo} - {$proceso_madre->nombre} {else} Es un Proceso Madre {/if}
          </label>
				</div>
      </fieldset>
			<fieldset class="label_side">
				<label>Misi&oacute;n:</label>
				<div>
					<label for="mision"> {$proceso->mision}</label>					
				</div>
			</fieldset>
			<fieldset class="label_side">
				<label>Equipo de proceso:</label>
				<div>
					<label for="equipo_de_proceso"> {$proceso->equipo_de_proceso}</label>				
				</div>
			</fieldset>
			<fieldset class="label_side">
				<label>Resultados clave:</label>
				<div>
					<label for="resultados_clave"> {$proceso->resultados_clave}</label>			
				</div>
			</fieldset>
			<fieldset class="label_side">
				<label>Entradas</label>
				<div>
					<label for='entradas'>{$proceso->entradas}</label>		
				</div>
			</fieldset>
			<fieldset class="label_side">
				<label>Proveedores</label>
				<div>
					<label for='proveedores'>{$proceso->proveedores}</label>	
				</div>
			</fieldset>
			<fieldset class="label_side">
				<label>Salidas</label>
				<div>
					<label for='salidas'>{$proceso->salidas}</label>	
				</div>
			</fieldset>
			<fieldset class="label_side">
				<label>Clientes</label>
				<div>
					<label for='clientes'>{$proceso->clientes}</label>	
				</div>
			</fieldset>
			<fieldset class="label_side">
				<label>Actividades:</label>
				<div>
					<label for="actividades"> {$proceso->actividades}</label>
				</div>
			</fieldset>
			<fieldset class="label_side">
				<label>Documentaci&oacute;n:</label>
				<div>
					<label for="documentacion"> {$proceso->documentacion}</label>
				</div>
			</fieldset>
			<fieldset class="label_side">
				<label>Mediciones:</label>
				<div>
					<label for="mediciones"> {$proceso->mediciones}</label>
				</div>
			</fieldset>
			<fieldset class="label_side">
				<label>Registros:</label>
				<div>
					<label for="registros"> {$proceso->registros}</label>
				</div>
			</fieldset>
			<fieldset class="label_side">
				<label>Tipo de proceso:</label>
				<div>
					<label for="alcance"> {$proceso->alcance}</label>
				</div>
			</fieldset>
		</div>
	</div>		
</div>		           
              

{if $indicadores}
	<h3>Indicadores asociados</h3>	
	<div class="box grid_16">
		<div class="block">	
			<table class="static"> 
				<thead>
					<tr><th>Código</th><th>Indicador</th><th>Propietario</th><th>Acciones</th></tr>
				</thead>
					
				<tbody>
					{foreach from=$indicadores item=indicador} 
					  <tr>
					  <td>{$indicador->codigo}</td>
					  <td><b>{$indicador->nombre}</b><a href='#' title='{$indicador->descripcion}'><big>*</big></a></td>
					  <td><a href='index.php?page=usuario_datos&id_usuario={$indicador->id_responsable}'>{$indicador->responsable->nombre} {$indicador->responsable->apellidos}</a></td>
					  <td nowrap>
						<a
						href='index.php?page=indicador_mostrar&id_indicador={$indicador->id}&id_entidad={$proceso->id_entidad}'>Mostrar</a> - 
						<a href='index.php?page=indicador_editar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>Editar</a>
						</td>
					  </tr>
					{/foreach}
				</tbody>
			</table>
		</div>
	</div>		
{else}
	<p class='aviso'>No hay indicadores definidos para este proceso.</p>
{/if}
{if $subprocesos}
	<div class="flat_area grid_16">
		<h2>Subprocesos</h2>
	</div>
    <div class="box grid_16">
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
			            <td><a href="index.php?page=proceso_mostrar&id_proceso={$subproceso->id_proceso}&id_entidad={$subproceso->id_entidad}">Ver</a>
			            - <a href="index.php?page=proceso_editar&id_proceso={$subproceso->id_proceso}&id_entidad={$subproceso->id_entidad}">Editar</a>
			            - <a href='index.php?page=proceso_borrar&id_proceso={$subproceso->id_proceso}&id_entidad={$subproceso->id_entidad}'
			            onClick='return confirmar();'>Borrar</a></td>
			
			            </tr>
			        {/foreach}
			    </tbody>
			</table>
		</div>
	</div>		
{else}
<p class='aviso'>No se ha definido ningún subproceso para este proceso </p>
{/if}
