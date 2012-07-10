
{literal}
    <script type="text/javascript">
      google.load('visualization', '1', {'packages':['motionchart'], 'language' : 'es'});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = new google.visualization.DataTable();
        data.addRows(4);
        data.addColumn('string', 'Indicador');
        data.addColumn('date', 'Fecha');
        data.addColumn('number', 'Objetivo');
        data.addColumn('number', 'Valor');
		{/literal}
		{foreach name=indicador from=$indicadores item=indicador}
		data.setValue({$smarty.foreach.indicador.iteration-1},0,'{$indicador->nombre}');

			{foreach name=valor from=$indicador->valores item=valor}
				data.setValue({$smarty.foreach.indicador.iteration-1},1, new Date({$valor.fecha_recogida|date_format:"%Y,1,0"}));
				data.setValue({$smarty.foreach.indicador.iteration-1},2,{$valor.objetivo});
				data.setValue({$smarty.foreach.indicador.iteration-1},3,{$valor.valor});
			{/foreach}

		{/foreach}
       {literal}
		var chart = new google.visualization.MotionChart(document.getElementById('chart_div'));
        chart.draw(data, {width: 600, height:300});
      }
    </script>
{/literal}
