{literal}
    <script type='text/javascript'>
      google.load('visualization', '1', {packages:['table']});
      google.setOnLoadCallback(drawTable);
      function drawTable() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Fecha');
        data.addColumn('number', 'Valor');
        data.addColumn('number', 'Objetivo');
        data.addRows(6);
		{/literal}
		{foreach from=$valores item=valor}
			data.setCell({$valor.valor},0,'{$valor.fecha_recogida|date_format:"%m/%Y"}');
			data.setCell({$valor.valor},1,{$valor.valor});
			data.setCell({$valor.valor},2,{$valor.objetivo});
  		{/foreach}
       {literal}
	   var table = new google.visualization.Table(document.getElementById('table_div'));
       table.draw(data, {showRowNumber: true});
      }
	</script>
{/literal}

{literal}
    <script type="text/javascript">
      google.load('visualization', '1', {'packages':['motionchart'], 'language' : 'es'});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = new google.visualization.DataTable();
        data.addRows(6);
        data.addColumn('date', 'Fecha');
        data.addColumn('number', 'Objetivo');
        data.addColumn('number', 'Valor');
		{/literal}
		{foreach name=indicador from=$valores item=valor}
			data.setValue({$smarty.foreach.indicador.iteration-1},0,'{$indicador.nombre}');
			data.setValue({$smarty.foreach.indicador.iteration-1},1, new Date({$valor.fecha_recogida|date_format:"%Y,1,%m"}));
			data.setValue({$smarty.foreach.indicador.iteration-1},2,{$valor.objetivo});
			data.setValue({$smarty.foreach.indicador.iteration-1},3,{$valor.valor});
  		{/foreach}
       {literal}
		var chart = new google.visualization.MotionChart(document.getElementById('chart_div'));
        chart.draw(data, {width: 600, height:300});
      }
    </script>
{/literal}
<!--data.setValue({$smarty.foreach.indicador.iteration-1},0,'{$valor.fecha_recogida|date_format:"%m/%Y"}');-->
{if $aviso}<p class='aviso'>{$aviso}</p>{/if}
{if $error}<p class='error'>{$error}</p>{/if}
<h3>Datos del indicador</h3>

<div id="chart_div" style="width: 600px; height: 300px;"></div>

<div id='table_div'></div>

<a href='index.php?page=indicador_editar&id_indicador={$indicador.id_indicador}&id_entidad={$indicador.id_entidad}'><img 
	src='theme/usevilla/iconos/chart_bar_edit.gif' alt='icono' />Editar indicador</a> &nbsp; 
<a href='index.php?page=indicador_listar&id_entidad={$indicador.id_entidad}'><img 
	src='theme/usevilla/iconos/chart_bar.gif' alt='icono'/>Listar indicadores</a> &nbsp;
<a href='index.php?page=indicador_crear&id_entidad={$indicador.id_entidad}'><img 
	src='theme/usevilla/iconos/chart_bar_add.gif' alt='icono' />Crear indicador</a> &nbsp; 
<a href='index.php?page=indicador_borrar&id_indicador={$indicador.id_indicador}&id_entidad={$indicador.id_entidad}'><img 
	src='theme/usevilla/iconos/chart_bar_delete.gif' alt='icono' />Borrar indicador</a> &nbsp; 
<table>
	<tr><th colspan='2'>C&oacute;digo proceso</th><th colspan='4'>Proceso</th></tr>
	<tr><td colspan='2'><a href='index.php?page=proceso_mostrar&codigo={$indicador.codigo_proceso}' title='Mostrar 
		proceso'>{$indicador.codigo_proceso}</a></td>  
		<td colspan='4'>{$indicador.proceso}</td></tr>
	<tr><th>Código</th><th>Nombre</th><th colspan='2'>Descripci&oacute;n</th>
		<th colspan='2'>Formulaci&oacute;n</th></tr>
	<tr>
		<td>{$indicador.codigo}</td>
		<td><b>{$indicador.nombre}</b></td>
		<td colspan='2'>{$indicador.descripcion}</td>	
		<td colspan='2'>{$indicador.formulacion}</td>
	</tr>
	<tr><th>Objetivo</th><th>Estándar</th><th colspan='2'>Fuente de obtenci&oacute;n</th><th>Periodicidad</th><th>Responsable</th></tr><tr>
	<td>{$indicador.objetivo}</td>
	<td>{*$indicador.estandar*}</td>
	<td colspan='2'>{$indicador.fuente}</td>	
	<td>{$indicador.periodicidad}</td>	
	<td><a href='index.php?page=usuario_datos&id_usuario={$indicador.id_responsable}'>{$indicador.nombre_responsable}
	{$indicador.apellidos_responsable}</a></td></tr>	
</table>	
<h3>Valores recogidos</h3>
<a href='index.php?page=valor_crear&id_indicador={$indicador.id_indicador}&id_entidad={$indicador.id_entidad}'><img 
	src='theme/usevilla/iconos/tag_blue_add.gif' alt='icono' />Agregar valor</a>
{if $valores}
	<table class='listing' id='sortable'>
		<thead><tr><th>Periodo</th><th>Valor</th><th>Objetivo</th><th>Acciones</th></tr></thead>
		<tbody>
		{foreach from=$valores item=valor}
			<tr>
			<td>{$valor.fecha_recogida|date_format:"%m/%Y"}</td>
			<td>{$valor.valor}</td>
			<td>{$valor.objetivo}</td>
			<td><a href='index.php?page=valor_editar&id_valor={$valor.id_valor}&id_indicador={$indicador.id_indicador}&id_entidad={$indicador.id_entidad}'>Editar</a>
			| <a href='index.php?page=valor_borrar&id_valor={$valor.id_valor}&id_indicador={$indicador.id_indicador}&id_entidad={$indicador.id_entidad}'>Borrar</a></td>
			</tr> 
  		{/foreach}
		</tbody>
	</table>
        <p><img src='{$ruta_imagen}' alt='Representacion grafica del indicador' width="630" height="240"/></p>
{else} 
	<p>A&uacute;n no se han introducido datos en este indicador</p>
{/if}
