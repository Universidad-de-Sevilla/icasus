<h3>Datos del indicador: {$indicador->nombre}</h3>
<a href='index.php?page=medicion_listar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><img 
	src='/icons/ff16/chart_curve.png' /> Gestionar mediciones</a> &nbsp;
<a href='index.php?page=indicador_listar&id_entidad={$indicador->id_entidad}'><img 
	src='/icons/ff16/chart_curve.png' /> Listar todos</a> &nbsp;
<a href='index.php?page=indicador_editar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><img 
	src='/icons/ff16/chart_curve_edit.png'  /> Editar</a> &nbsp; 
<a href='index.php?page=indicador_crear&id_entidad={$indicador->id_entidad}'><img 
	src='/icons/ff16/chart_curve_add.png'  /> Crear</a> &nbsp; 
<a
href='index.php?page=indicador_borrar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}' onClick='return confirmar();'><img 
	src='/icons/ff16/chart_curve_delete.png'  /> Borrar</a> &nbsp; 
<a href='index.php?page=indicador_datos_rtf&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}' title='Generar un informe en word de este indicador'>
<img src='/icons/ff16/page_word.png'  /> Rtf</a> &nbsp;
<a href='index.php?page=indicador_datos_excel&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}' title='Exportar los datos del indicador a Excel'>
<img src='/icons/ff16/page_excel.png'  /> Excel</a>

<table>
	<tr>
		<th>C&oacute;digo proceso</th>
		<th colspan='5'>Proceso</th>
	</tr>
	<tr>
		<td><a href='index.php?page=proceso_mostrar&codigo={$indicador->proceso->codigo}' title='Mostrar 
		proceso'>{$indicador->proceso->codigo}</a></td>  
		<td colspan='5'>{$indicador->proceso->nombre}</td>
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
	
	<tr>
		<th>Objetivo</th>
		<th colspan='2'>Objetivo pactado</th>
		<th>Objetivo carta</th>
		<th colspan='2'>Estándar actual</th>
	</tr>
	<tr>
		<td>{$indicador->objetivo}</td>
		<td colspan='2'>{$indicador->objetivo_estrategico}</td>
		<td>{$indicador->objetivo_carta}</td>
		<td colspan='2'>{*$indicador->estandar*}</td>
	</tr>
	
	<tr>
		<th colspan='3'>Fuente de obtenci&oacute;n</th>
		<th>Periodicidad</th>
		<th colspan='2'>Visibilidad</th>
	</tr>
	<tr>
		<td colspan='3'>{$indicador->fuente}</td>	
		<td>{$indicador->periodicidad}</td>	
		<td colspan='2'>{$indicador->visibilidad->nombre|htmlentities}</td>
	</tr>	
	<tr><th colspan='6'>Responsable</tr>
	<tr><td colspan='6'><a href='index.php?page=usuario_datos&id_usuario={$indicador->responsable->id}'>{$indicador->responsable->nombre}
	{$indicador->responsable->apellidos}</a></td></tr>
</table>

<h3>Valores recogidos</h3>
<a href='index.php?page=valor_crear&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><img 
	src='/icons/ff16/tag_blue_add.png' /> Agregar valor</a>
{if $valores}
	<p><img src='theme/usevilla/leyenda650.png' alt='Leyenda' /><br />
    <img src='{$ruta_imagen}' alt='Representacion grafica del indicador' iwidth="630" iheight="240"/></p>
	
	<table class='listing' id='sortable'>
		<thead><tr><th>Periodo</th><th>Valor</th><th>Cálculo</th><th>Objetivo</th><th>Obj pactado</th>
		<th>Obj carta</th><th>Acciones</th></tr></thead>
		<tbody>
		{foreach from=$valores item=valor}
			<tr>
			<td>{$valor->fecha_recogida|date_format:"%m/%Y"}</td>
			<td>{$valor->valor}
				{if $valor->observaciones}
					<a href='#' title='{$valor->observaciones}'>*</a>
				{/if}
			</td>
			<td>{$valor->calculo}</td>
			<td>{$valor->objetivo}</td>
			<td>{$valor->objetivo_estrategico}</td>
			<td>{$valor->objetivo_carta}</td>
			<td><a href='index.php?page=valor_editar&id_valor={$valor->id}&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>Editar</a>
			- <a
			  href='index.php?page=valor_borrar&id_valor={$valor->id}&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'
			  onClick='return valor_borrar();'>Borrar</a></td>
			</tr> 
  		{/foreach}
		</tbody>
	</table>
{else} 
	<p>A&uacute;n no se han introducido datos en este indicador</p>
{/if}
