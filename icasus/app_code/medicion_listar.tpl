<div class="box grid_16 single_datatable">
  <div class="button_bar clearfix">
    <a href="index.php?page=medicion_crear&id_{$tipo}={$indicador->id}"><img src='/icons/ff16/time.png' /> Agregar medición</a> &nbsp; &nbsp;
    <a href='index.php?page=indicador_subunidad_valor&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'><img 
      src='/icons/ff16/tag_blue.png' /> Edición valores </a> &nbsp; &nbsp;
    <a href='index.php?page={$tipo}_mostrar&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'><img src='/icons/ff16/chart_curve.png' /> Volver al {$tipo}</a> &nbsp;
  </div>
  {if $mediciones}
  <div id="dt1" class="no_margin">
    <table class="display datatable" id="listado_mediciones"> 
    <thead>
      <tr>
        <th>Etiqueta</th>
        <th>Fecha inicio periodo</th>
        <th>Fecha fin periodo</th>
        <th>Fecha inicio grabacion</th>
        <th>Fecha fin grabacion</th>
      </tr>
    </thead>
    <tbody>
      {foreach $mediciones as $medicion}
        <tr class="gradeX">
          <td nowrap><a href="index.php?page=medicion_editar&id_medicion={$medicion->id}&tipo={$tipo}">{$medicion->etiqueta}</a></td>
          <td>{$medicion->periodo_inicio}</td>
          <td>{$medicion->periodo_fin}</td>
          <td>{$medicion->grabacion_inicio}</td>
          <td>{$medicion->grabacion_fin}</td>
        </tr>
      {/foreach}
    </tbody>
    </table>
  </div>
  {else}
    <div class="alert alert_blue">
      <img height="24" width="24" src="theme/danpin/images/icons/small/white/alert_2.png">
      Todavía no se han establecido mediciones para este {$tipo}
    </div>
  {/if}
</div>
<div style="opacity: 1;" class="box grid_16">
<div id="container" data-id_indicador="{$indicador->id}" data-nombre_indicador="{$indicador->nombre}" data-fecha_inicio="" data-fecha_fin="" data-periodicidad="anual" style="margin:0px"></div>
	
		<h2 class="box_head">Tabla de valores</h2>
	<div style="opacity: 1;" class="block">	
	<table class="static">
		<thead>
		<tr>
			<th></th>
			{foreach from=$mediciones item=medicion}
				<th>{$medicion->etiqueta}</th>
			{/foreach}
		</tr>
		</thead>
		<tbody>
		{foreach from=$subunidades_mediciones item=subunidades}
			<tr><td>{$subunidades->etiqueta}</td>
			{foreach from=$subunidades->mediciones item=medicion}
				<td>{if $medicion->medicion_valor == '--'} -- {else}{if $medicion->medicion_valor->valor != NULL}{$medicion->medicion_valor->valor|round:"2"}{/if}{/if}</td>
			{/foreach}
			</tr>
		{/foreach}
		</tbody>
	</table>
	</div>
<div class="box grid_16">
  {if $mediciones}
    <!-- <p><img src="index.php?page=grafica_indicador_agregado&id_indicador={$indicador->id}" alt="gráfica completa con los valores medios del indicador" /> -->
    <div style="background: white; padding:20px 40px; margin:10px;">
      <h3 style="margin: 0 0 20px 0;">Histórico anual</h3>
      <div class="panel_flot" id="grafica_anual" data-id_indicador="{$indicador->id}" data-nombre_indicador="{$indicador->nombre}" data-fecha_inicio="{$indicador->historicos}-01-01" data-fecha_fin="{$smarty.now|date_format:'%Y' - 1}-12-31" data-periodicidad="anual"></div>
      <div class="leyenda"></div>
    </div>

    {if $indicador->periodicidad != "Anual"} 
      <div style="background: white; padding:20px 40px; margin:10px;">
        <h3 style="margin: 0 0 20px 0;">Dos últimos años ({$smarty.now|date_format:'%Y' - 1} / {$smarty.now|date_format:'%Y'})</h3>
        <div class="panel_flot" id="grafica_anio_anterior" data-id_indicador="{$indicador->id}" data-nombre_indicador="{$indicador->nombre}" data-periodicidad="todos" data-fecha_inicio="{$smarty.now|date_format:'%Y' - 1}-01-01" data-fecha_fin="{$smarty.now|date_format:'%Y-%m-%d'}" data-periodicidad="mensual"></div>
        <div class="leyenda"></div>
      </div>
      <!--
      <h3>Año en curso</h3>
      <div class="panel_flot" id="grafica_anio_actual" data-id_indicador="{$indicador->id}" data-nombre_indicador="{$indicador->nombre}" data-periodicidad="todos"  data-fecha_inicio="2013-01-01" data-fecha_fin="{$smarty.now|date_format:'%Y' + 1}-{$smarty.now|date_format:'%m-%d'}" data-periodicidad="todos"></div>
      <div class="leyenda"></div>
      -->
    {/if}
    
  {else}
    <p class="aviso">Todavía no se han definido mediciones para este indicador.</p>
  {/if}
  <!-- <p><img src="index.php?page=grafica_indicador_agregado&id_indicador={$indicador->id}" alt="gráfica completa con los valores medios del indicador" /></p> -->
</div>

<script src="theme/danpin/scripts/flot/jquery.flot.min.js" type="text/javascript"></script>		
<script src="theme/danpin/scripts/flot/jquery.flot.time.js" type="text/javascript"></script>
<script src="js/graficos_ficha_indicador.js" type="text/javascript"></script>
<script src="js/highcharts.js" type="text/javascript"></script>
<script src="js/set.js" type="text/javascript"></script>

<script src="js/exporting.js"></script>

<script>
$(document).ready(function() {
	var idIndicador = $("#container").data("id_indicador");
	var nomIndicador = $("#container").data("nombre_indicador");
	var serie = [];
	var totales = [];
	$.ajax({
		url: "http://localhost/icasus/api_publica.php?metodo=get_valores_con_timestamp&id="+idIndicador,
		type: "GET",
		dataType: "json",
		success: onDataReceived
	});

	function onDataReceived(datos) {
		var categories = new Set();
		var map = [];
		var medicion;
		var unidad;
		var valor;
		
		//Guarda los datos en forma de Map
		//Año -> Unidad -> Valor
		datos.forEach(function(d){
			medicion=d.medicion;
			valor = parseFloat(d.valor);
			if(unidad = d.etiqueta_mini){
				categories.add(unidad);	
				if(map[medicion]){
					map[medicion][unidad]=valor;
				}else{
					map[medicion]=new Object();
					map[medicion][unidad]=valor;
				}
			}else if(d.id_unidad == "0"){
				totales[medicion] = valor;
			}
		});

		//Recorre el Mapa 
		for(var key in map){
			var data = [];
			categories.data.forEach(function (cat) {
				if(map[key][cat])
					data.push([cat,map[key][cat]]);
				else
					data.push([cat,undefined]);
			});
			serie.push({
				name:key,
				type:'column',
				data:data.sort(),
				visible:false,
			});
		};
		serie.sort();
		serie[serie.length -1].visible = true;
		serie[serie.length -1].selected = true;
	};
	//Pintamos el gráfico
	$(document).ajaxComplete(function(){
		var chart1 = new Highcharts.Chart({
		    chart: {
				height: 400,
		        renderTo: 'container',
		    },
		    title: {
		        text: nomIndicador,
		    },
		    xAxis: {
		        type: 'category'
		    },
		    yAxis: {
		        title: {
		            text: ""
		        }
		    },
			plotOptions: {
		        series: {
		            events: {
		                legendItemClick: function(event) {
							if(this.visible){
								chart1.yAxis[0].removePlotLine(this.name);
							}else{
								chart1.yAxis[0].addPlotLine({
									value: totales[this.name],
									color: this.color,
									width: 2,
									id: this.name
		        				});
							}
		                }
		            }
		        },
				column: {
                    dataLabels: {
                        enabled: true,
						formatter: function() { return this.y?((Math.round(this.y*100))/100):null }
                    }
                }
		    },
		    series: serie,
			exporting: {
		        enabled: true
		    },
			credits: {
		        enabled: false
		    }
		});
		//Pintamos la media
		chart1.getSelectedSeries().forEach( function (selected){
			chart1.yAxis[0].addPlotLine({
				value: totales[selected.name],
				color: selected.color,
				width: 2,
				id: selected.name
			});
		});	
	});
});
</script>

{literal}
<script>
  $(document).ready(function() {
    var table0 = $('#listado_mediciones').dataTable( {
      "bJQueryUI": true,
      "sScrollX": "",
      "bSortClasses": false,
      "aaSorting": [[1,'asc']],
      "bAutoWidth": true,
      "bInfo": true,
      "sScrollX": "101%",
      "bScrollCollapse": true,
      "sPaginationType": "full_numbers",
      "bRetrieve": true,
      "fnInitComplete": function () {
        $("#dt1 .dataTables_length > label > select").uniform();
        $("#dt1 .dataTables_filter input[type=text]").addClass("text");
        $(".datatable").css("visibility","visible");
      }
    });
    table0.fnSort([1,'asc']);
  } );
</script>
{/literal}
