<div class="box grid_16 single_datatable">
  <div class="button_bar clearfix">
    <a href="index.php?page=medicion_crear&id_{$tipo}={$indicador->id}"><img src='/icons/ff16/time.png' /> Agregar medición</a> &nbsp; &nbsp;
    <a href='index.php?page=indicador_subunidad_valor&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'><img
      src='/icons/ff16/tag_blue.png' /> Edición valores </a> &nbsp; &nbsp;
    <a href='index.php?page={$tipo}_mostrar&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'><img src='/icons/ff16/chart_curve.png' /> Volver al {$tipo}</a> &nbsp;
  </div>
  {if $mediciones}
    <div id="container" data-id_indicador="{$indicador->id}" data-nombre_indicador="{$indicador->nombre}" data-fecha_inicio="" data-fecha_fin="" data-periodicidad="anual" style="margin:0px"></div>

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
    <!--
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
      -->
    {/if}
    {if isset($paneles)}
      {foreach $paneles as $panel}
        <div class="box grid_{$panel->ancho}" style="float:left;">
          <div class="block alturo" style="height:320px">
            <!--
            <div class="titulo-panel">
              <strong>{$panel->nombre}</strong>
            </div>
            -->
              <div class="highchart {$panel->tipo->clase_css}" id="panel_{$panel->id}" data-id_indicador="{$indicador->id}" data-nombre_indicador="{$indicador->nombre} "data-idpanel="{$panel->id}" data-id_medicion="{$panel->id_medicion}" data-fecha_inicio="{$panel->fecha_inicio}" data-fecha_fin="{$panel->fecha_fin}" data-ancho="{$panel->ancho}" data-periodicidad="{$panel->periodicidad}"></div>
          </div>
        </div>
      {/foreach}
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
<script src="js/highchartStruct.js" type="text/javascript"></script>
<script src="js/exporting.js"></script>

<script>
  // Variables
  var idIndicador = $("#container").data("id_indicador");
  var nomIndicador = $("#container").data("nombre_indicador");
  var chartSerie = new highchartSerie();
  var totales = [];
  // Consulta a la base de dato
  $.ajax({
    url: "api_publica.php?metodo=get_valores_con_timestamp&id="+idIndicador,
    type: "GET",
    dataType: "json",
    success: onDataReceived
  });
  // Guardado de datos en highchartstruct y totales para las medias
  function onDataReceived(datos) {
    var categories = new Set();
    datos.forEach(function(d){
      if(d.etiqueta_mini){
        chartSerie.add(d);
      }else if(d.id_unidad == '0'){
        totales[d.medicion] = parseFloat(d.valor);
      }
    });
  };

  // Pinta y configura el gráfico
  $(document).ajaxComplete(function(){
    var serie = chartSerie.getBarSerie();
    serie[serie.length-1].visible = true;
    serie[serie.length-1].selected = true;
    var chart1 = new Highcharts.Chart({
      chart: {
  type: 'column',
        height: 400,
        renderTo: 'container'
      },
      title: {
        text: nomIndicador
      },
      tooltip: {
        shared: false
      },
      exporting: {
        enabled: true
      },
      xAxis: {
        type: 'category'
      },
      yAxis: {
        title: {
          text: ''
        }
      },
      plotOptions: {
        series: {
          events: {
              //Pintamos la media al hacer click en él.
            legendItemClick: function(event) {
              if(this.visible){
                chart1.yAxis[0].removePlotLine(this.name);
              }else{
                chart1.yAxis[0].addPlotLine({
                  label: {
                    text: Math.round(totales[this.name]*100)/100,
                    x:-28,
                    y:5,
                    style:{
                      color:this.color
                    }
                  },
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
      series: serie
    });
    // Pinta la media del último grupo de datos (último periodo)
    chart1.getSelectedSeries().forEach( function (selected){
      chart1.yAxis[0].addPlotLine({
        label: {
          text: Math.round(totales[selected.name]*100)/100,
          x:-28,
          y:5,
          style:{
            color:selected.color
          }
        },
        value: totales[selected.name],
        color: selected.color,
        width: 2,
        id: selected.name
      });
    });
  });

  // Pinta las gráficas con los totales anuales e intraanuales
  $('.highchart').each(function() {
    var idPanel = $(this).attr('id');
    var idIndicador = $(this).data("id_indicador");
    var nomIndicador = $(this).data("nombre_indicador");
    var periodicidad = $(this).data("periodicidad");
    var fecha_inicio = $(this).data("fecha_inicio");
    var fecha_fin = $(this).data("fecha_fin");
    var milisegundosAnio = 31540000000;
    //var dataseries = [];
    var chartSerie = new highchartSerie(); // contenedor para los datos del gráfico
    if (periodicidad == "anual") {
      chartSerie.categoryType = "año";
    }
    else {
      chartSerie.categoryType = "medicion";
    }
    var urlApi = "api_publica.php?metodo=get_valores_con_timestamp&id=" + idIndicador + "&fecha_inicio=" + fecha_inicio + "&fecha_fin=" + fecha_fin + "&periodicidad=" + periodicidad;

    $.ajax({
      url: urlApi,
      type: "GET",
      dataType: "json",
      success: onDataReceived
    });

    function onDataReceived(datos) {
      datos.forEach(function(dato){
        // Agrega los que no tienen etiqueta_mini (total y referencias)
        // descarta las mediciones de unidades (no sirven aquí)
        if(!dato.etiqueta_mini && (dato.valor != null)){
          chartSerie.add(dato);
        }
      });

      // Pide las series de datos a chartSerie
      // A saber: Totales y Valores de referencia
      dataseries = chartSerie.getLinealSerie();
      // Si no es anual ocultamos valores de referencia
      if (chartSerie.categoryType != "año") {
        dataseries.forEach(function (dataserie, index) {
          if (index != 0) {
            dataserie.visible = false;
          }
        });
      }

      var chart1 = new Highcharts.Chart({
        chart: {
          type: 'line',
          height: 300,
          renderTo: idPanel
        },
        title: {
          text: nomIndicador + '(' + fecha_inicio + " a " + fecha_fin + ")",
          style: { "color": "grey", "fontSize": "12px"}
        },
        exporting: {
          enabled: true
        },
        xAxis: {
          type: 'category'
        },
        yAxis: {
          title: {
            text: 'valores'
          }
        },
        plotOptions: {
          series: {
            dataLabels: {
              enabled: false,
              formatter: function() { return this.y?((Math.round(this.y*100))/100):null }
            }
          }
        },
        series: dataseries
      });
    }
  });
</script>
