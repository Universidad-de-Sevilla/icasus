<p><label for='madre'>Proceso madre: {if $proceso_madre->id > 0} {$proceso_madre->codigo} - {$proceso_madre->nombre} {else} Es un Proceso Madre {/if}</label>
</p>                           
<p>
  <table width="100%">
    <tr>
      <th><label for='codigo'>C&oacute;digo</label> &nbsp; <span class='grey'>(requerido)</span></th>
      <th><label for='revision'>Revisi&oacute;n</label> &nbsp; <span class='grey'>(requerido)</span></th>
      <th><label for='fecha_revision'>Fecha</label> &nbsp; <span class='grey'>(requerido)</span></th>
    </tr>
    <tr>
      <td><label for='codigo'>{$proceso->codigo}</label></td>
      <td><label for='revision'>{$proceso->revision}</label></td>
      <td><label for='fecha_revision'>{$proceso->fecha_revision|date_format:"%d/%m/%Y"}</label></td>
    </tr>
   </table>
  </p>                
  <p>
  <table width="100%">
    <tr>
      <th><label for='nombre'>Nombre proceso</label> &nbsp; <span class='grey'>(requerido)</span></th>
      <th><label for="id_propietario">Propietario</label></th>
    </tr>
    <tr>
      <td><label for='nombre'>{$proceso->nombre}</label></td>
      <td><label for='id_propietario'>{$propietario->nombre} {$propietario->apellidos}</label></td>
    </tr>
  </table>
  </p>
  <p><label for="mision">Misi&oacute;n: {$proceso->mision}</label></p>
  <p><label for="equipo_de_proceso">Equipo de proceso: {$proceso->equipo_de_proceso}</label></p>
  <p><label for="resultados_clave">Resultados clave: {$proceso->resultados_clave}</label></p>
  <p>
  <table width="100%">
    <tr>
      <th><label for='entradas'>Entradas</label></th>
      <th><label for='proveedores'>Proveedores</label></th>
    </tr>
    <tr>
      <td><label for='entradas'>{$proceso->entradas}</label></td>
      <td><label for='proveedores'>{$proceso->proveedores}</label></td>
    </tr>
  </table>
  </p>
  <p>
  <table width="100%">
    <tr>
      <th><label for='salidas'>Salidas</label></th>
      <th><label for='clientes'>Clientes</label></th>
    </tr>
    <tr>
      <td><label for='salidas'>{$proceso->salidas}</label></td>
      <td><label for='clientes'>{$proceso->clientes}</label></td>
    </tr>
  </table>
  </p>
  <p><label for="actividades">Actividades: {$proceso->actividades}</label></p>
  <p><label for="documentacion">Documentaci&oacute;n: {$proceso->documentacion}</label></p>
  <p><label for="mediciones">Mediciones: {$proceso->mediciones}</label></p>
  <p><label for="registros">Registros: {$proceso->registros}</label></p>
  <p><label for="alcance">Tipo de proceso: {$proceso->alcance}</label></p>
<a href='index.php?page=proceso_editar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}'><img 
	src='/icons/ff16/cog_edit.png' alt='icono' /> Editar proceso</a> &nbsp; 
<a href='index.php?page=proceso_listar&id_entidad={$proceso->id_entidad}'><img 
	src='/icons/ff16/cog.png' alt='icono'/> Listar procesos</a> &nbsp;
<a href='index.php?page=proceso_crear&id_entidad={$proceso->id_entidad}'><img 
	src='/icons/ff16/cog_add.png' alt='icono' /> Crear proceso</a> &nbsp; 
<a href='index.php?page=indicador_crear&id_entidad={$proceso->id_entidad}'><img 
	src='/icons/ff16/chart_curve_add.png' alt='icono' /> Crear indicador</a> &nbsp; 
<a href='index.php?page=proceso_borrar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}'
onClick='return confirmar();'><img 
	src='/icons/ff16/cog_delete.png' alt='icono' /> Borrar proceso</a> &nbsp; 

{if $indicadores}
	<h3>Indicadores asociados</h3>	
	<table class='listing' id='sortable'>
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
			href='index.php?page=indicador_datos&id_indicador={$indicador->id}&id_entidad={$proceso->id_entidad}'>Mostrar</a> - 
			<!--
      <a href='index.php?page=indicador_copiar&id_indicador={$indicador->id}'>Copiar</a> 
			<a href='index.php?page=valor_crear&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>Grabar valor</a> <br /> 
			--> 
			<a href='index.php?page=indicador_editar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>Editar</a>
			</td>
		  </tr>
		{/foreach}
	</tbody>
	</table>
{else}
	<p class='aviso'>No hay indicadores definidos para este proceso.</p>
{/if}
{if $subprocesos}
    <h3>Subprocesos</h3>
    <table class='listing' id='sortable'>
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
{else}
<p class='aviso'>No se ha definido ningún subproceso para este proceso </p>
{/if}
