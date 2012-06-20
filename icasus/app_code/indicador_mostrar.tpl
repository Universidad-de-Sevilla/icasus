<h3>Datos del indicador: {$indicador->nombre}</h3>
<a href='index.php?page=medicion_listar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><img 
	src='/icons/ff16/chart_curve.png' /> Mostrar mediciones</a> &nbsp;
<a href='index.php?page=indicador_listar&id_entidad={$indicador->id_entidad}'><img 
	src='/icons/ff16/chart_curve.png' /> Listar todos</a> &nbsp;
<a href='index.php?page=indicador_editar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><img 
	src='/icons/ff16/chart_curve_edit.png'  /> Editar</a> &nbsp; 
<a href='index.php?page=indicador_crear&id_entidad={$indicador->id_entidad}'><img 
	src='/icons/ff16/chart_curve_add.png'  /> Crear</a> &nbsp; 
<!--
<a
href='index.php?page=indicador_borrar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}' onClick='return confirmar();'><img 
	src='/icons/ff16/chart_curve_delete.png'  /> Borrar</a> &nbsp; 
<a href='index.php?page=indicador_datos_rtf&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}' title='Generar un informe en word de este indicador'>
<img src='/icons/ff16/page_word.png'  /> Rtf</a> &nbsp;
<a href='index.php?page=indicador_datos_excel&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}' title='Exportar los datos del indicador a Excel'>
<img src='/icons/ff16/page_excel.png'  /> Excel</a>
-->

<table>
	<tr>
		<th colspan='3'>Proceso</th>
		<th colspan='3'>Propietario</th>
	</tr>
	<tr>
		<td colspan='3'><a href='index.php?page=proceso_mostrar&id_proceso={$indicador->proceso->id}&id_entidad={$entidad->id}' title='Mostrar proceso'>{$indicador->proceso->codigo}</a> - {$indicador->proceso->nombre}</td>
		<td colspan='3'>{$indicador->proceso->propietario->nombre} {$indicador->proceso->propietario->apellidos}</td>
	</tr>
	<tr>
		<th>Código indicador</th>
		<th colspan='5'>Nombre</th>
	</tr>
	<tr>
		<td>{$indicador->codigo}</td>
		<td colspan='5'><b>{$indicador->nombre}</b></td>
	</tr>
	<tr><th colspan='6'>Descripci&oacute;n</th></tr>
	<tr><td colspan='6'>{$indicador->descripcion}</td></tr>
	<tr><th colspan='6'>Formulaci&oacute;n</th></tr>
	<tr><td colspan='6'>{$indicador->formulacion}</td></tr>
	<tr><th colspan='6'>Valor de referencia</th></tr>
	<tr><td colspan='6'>{$indicador->valor_referencia}&nbsp;</td> </tr>
	<tr>
		<th colspan='4'>Fuente de informaci&oacute;n</th>
		<th colspan='2'>Fuente de datos</th>
	</tr>
	<tr>
		<td colspan='4'>{$indicador->fuente_informacion}</td>	
		<td colspan='2'>{$indicador->fuente_datos}</td>	
	</tr>
	<tr>
		<th colspan='4'>Unidad generadora</th>
		<th colspan='2'>Nivel de desagregacion</th>
	</tr>
	<tr>
		<td colspan='4'>{if $indicador->unidad_generadora} {$indicador->unidad_generadora}{else}{/if}&nbsp;</td>
		<td colspan='2'>{$indicador->nivel_desagregacion}</td>
	</tr>
	<tr>
		<th colspan='3'>Metodo de comprobaci&oacute;n/Evidencia</th>
		<th colspan='3'>Hist&oacute;rico</th>
	</tr>
	<tr>
		<td colspan='3'>{if $indicador->evidencia} {$indicador->evidencia} {else}&nbsp; {/if}</td>		
		<td colspan='3'>{$indicador->historicos}</td>
	</tr>
	<tr><th colspan='6'>Interpretaci&oacute;n</th></tr>
	<tr><td colspan='6'>{if $indicador->interpretacion} {$indicador->interpretacion} {else}&nbsp;{/if}</td></tr>
	<tr><th colspan='6'>Indicadores relacionados</th></tr>
	<tr><td colspan='6'>{$indicador->indicadores_relacionados}&nbsp;</td></tr>
	<tr><th colspan='6'>EFQM</th></tr>
	<tr><td colspan='6'>
    {if $indicador->criterios_efqm}
      {foreach $indicador->criterios_efqm as $criterio_efqm_indicador} 
        {$criterio_efqm_indicador->criterio_efqm->codigo} - {$criterio_efqm_indicador->criterio_efqm->nombre}<br>
      {/foreach}
    {/if}
    &nbsp;
  </td></tr>
	<tr>
		<th colspan='4'>Responsable de medici&oacute;n</td>
		<th>Periodicidad</td>
		<th>Visibilidad en Icasus</td>	
	</tr>
	<tr>
		<td colspan='4'><a href='index.php?page=usuario_datos&id_usuario={$indicador->responsable->id}'>{$indicador->responsable->nombre}
	{$indicador->responsable->apellidos}</a></td>
		<td>{$indicador->periodicidad}</td>
		<td>{$indicador->visibilidad->nombre|htmlentities}</td>
	</tr>
</table>

<h3>Mediciones</h3>
  <a href='index.php?page=medicion_listar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><img 
    src='/icons/ff16/time.png' /> Mostrar Mediciones</a>
    
	
  <p><img src="index.php?page=grafica_indicador_agregado&id_indicador={$indicador->id}" alt="gráfica completa con los valores medios del indicador" />
