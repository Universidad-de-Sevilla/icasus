{if $aviso}<p class='aviso'>{$aviso}</p>{/if}
{if $error}<p class='error'>{$error}</p>{/if}
<h3>Datos del indicador: {$indicador.nombre}</h3>
{if $indicador.id_visibilidad == 2}
<a href='index.php?page=indicador_publico'><img 
	src='iconos/16x16/chart_curve_world.png' /> Listar todos</a> &nbsp;
<a href='index.php?page=indicador_datos_rtf&id_indicador={$indicador.id_indicador}&id_entidad={$indicador.id_entidad}' title='Generar un informe en word de este indicador'>
<img src='iconos/16x16/page_word.png'  /> Rtf</a> &nbsp;
<a href='index.php?page=indicador_datos_excel&id_indicador={$indicador.id_indicador}&id_entidad={$indicador.id_entidad}' title='Exportar los datos del indicador a Excel'>
<img src='iconos/16x16/page_excel.png'  /> Excel</a>

<table>
	<tr>
		<th>C&oacute;digo proceso</th>
		<th colspan='5'>Proceso</th>
	</tr>
	<tr>
		<td>{$indicador.codigo_proceso}</a></td>  
		<td colspan='5'>{$indicador.proceso}</td>
	</tr>
	
	<tr>
		<th>Código indicador</th>
		<th colspan='5'>Nombre</th>
	</tr>
	<tr>
		<td>{$indicador.codigo}</td>
		<td colspan='5'><b>{$indicador.nombre}</b></td>
	</tr>
	
	<tr><th colspan='6'>Descripci&oacute;n</th></tr>
	<tr><td colspan='6'>{$indicador.descripcion}</td></tr>
	
	<tr><th colspan='6'>Formulaci&oacute;n</th></tr>
	<tr><td colspan='6'>{$indicador.formulacion}</td></tr>
	
	<tr>
		<th>Objetivo</th>
		<th colspan='2'>Objetivo pactado</th>
		<th>Objetivo carta</th>
		<th colspan='2'>Estándar actual</th>
	</tr>
	<tr>
		<td>{$indicador.objetivo}</td>
		<td colspan='2'>{$indicador.objetivo_estrategico}</td>
		<td>{$indicador.objetivo_carta}</td>
		<td colspan='2'>{*$indicador.estandar*}</td>
	</tr>
	
	<tr>
		<th colspan='3'>Fuente de obtenci&oacute;n</th>
		<th>Periodicidad</th>
		<th colspan='2'>Visibilidad</th>
	</tr>
	<tr>
		<td colspan='3'>{$indicador.fuente}</td>	
		<td>{$indicador.periodicidad}</td>	
		<td colspan='2'>{$indicador.visibilidad|htmlentities}</td>
	</tr>	
	<tr><th colspan='6'>Responsable</tr>
	<tr><td colspan='6'><a href='index.php?page=usuario_datos&id_usuario={$indicador.id_responsable}'>{$indicador.nombre_responsable}
	{$indicador.apellidos_responsable}</a></td></tr>
</table>

<h3>Valores recogidos</h3>
{if $valores}
	<p><img src='theme/usevilla/leyenda650.png' alt='Leyenda' /><br />
    <img src='{$ruta_imagen}' alt='Representacion grafica del indicador' iwidth="630" iheight="240"/></p>
	
	<table class='listing' id='sortable'>
		<thead><tr><th>Periodo</th><th>Valor</th><th>Cálculo</th><th>Objetivo</th><th>Obj pactado</th>
		<th>Obj carta</th></tr></thead>
		<tbody>
		{foreach from=$valores item=valor}
			<tr>
			<td>{$valor.fecha_recogida|date_format:"%m/%Y"}</td>
			<td>{$valor.valor}
				{if $valor.observaciones}
					<a href='#' title='{$valor.observaciones}'>*</a>
				{/if}
			</td>
			<td>{$valor.calculo}</td>
			<td>{$valor.objetivo}</td>
			<td>{$valor.objetivo_estrategico}</td>
			<td>{$valor.objetivo_carta}</td>
			</tr> 
  		{/foreach}
		</tbody>
	</table>
{else} 
	<p>A&uacute;n no se han introducido datos en este indicador</p>
{/if}
{else}
<p>Este indicador no est&aacute; definido como p&uacute;blico</p>
{/if}
