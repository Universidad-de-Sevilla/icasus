{if $error}<p class='error'>{$error}</p>{/if}
{if $smarty.get.error}<p class='error'>{$smarty.get.error}</p>{/if}
{if $aviso}<p class='aviso'>{$aviso}</p>{/if}
{if $smarty.get.aviso}<p class='aviso'>{$smarty.get.aviso}</p>{/if}
<h3>{$proceso->codigo} - {$proceso->nombre}</h3>
<a href='index.php?page=proceso_editar&id_proceso={$proceso->id_proceso}&id_entidad={$proceso->id_entidad}'><img 
	src='iconos/16x16/cog_edit.png' alt='icono' /> Editar proceso</a> &nbsp; 
<a href='index.php?page=proceso_listar&id_entidad={$proceso->id_entidad}'><img 
	src='iconos/16x16/cog.png' alt='icono'/> Listar procesos</a> &nbsp;
<a href='index.php?page=proceso_crear&id_entidad={$proceso->id_entidad}'><img 
	src='iconos/16x16/cog_add.png' alt='icono' /> Crear proceso</a> &nbsp; 
<a href='index.php?page=indicador_crear&id_entidad={$proceso->id_entidad}'><img 
	src='iconos/16x16/chart_curve_add.png' alt='icono' /> Crear indicador</a> &nbsp; 
<a href='index.php?page=proceso_borrar&id_proceso={$proceso->id_proceso}&id_entidad={$proceso->id_entidad}'
onClick='return confirmar();'><img 
	src='iconos/16x16/cog_delete.png' alt='icono' /> Borrar proceso</a> &nbsp; 

{if $indicadores}
	<h3>Indicadores asociados</h3>	
	<table class='listing' id='sortable'>
	<thead>
		<tr><th>Código</th><th>Indicador</th><th>Formulaci&oacute;n</th>
		<th>Propietario</th><th>Acciones</th></tr>
	</thead>
		
	<tbody>
		{foreach from=$indicadores item=indicador} 
		  <tr>
		  <td>{$indicador->codigo}</td>
		  <td><b>{$indicador->nombre}</b><a href='#' title='{$indicador->descripcion}'><big>*</big></a></td>
		  <td>{$indicador->formulacion}</td>
		  <td><a href='index.php?page=usuario_datos&id_usuario={$indicador->id_responsable}'>{$indicador->responsable->nombre} {$indicador->responsable->apellidos}</a></td>
		  <td nowrap>
			<a
			href='index.php?page=indicador_datos&id_indicador={$indicador->id_indicador}&id_entidad={$proceso->id_entidad}'>Ver</a><br/>
			<!--<a href='index.php?page=indicador_copiar&id_indicador={$indicador->id_indicador}'>Copiar</a> 
			<br />--> 
			<a href='index.php?page=valor_crear&id_indicador={$indicador->id_indicador}&id_entidad={$indicador->id_entidad}'>Grabar valor</a>
			<br /> 
			<a href='index.php?page=indicador_editar&id_indicador={$indicador->id_indicador}&id_entidad={$indicador->id_entidad}'>Editar</a>
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
