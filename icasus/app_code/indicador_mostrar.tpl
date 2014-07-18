<div class="box grid_16">
  <div class="toggle_container">
      <div class="button_bar clearfix">
        <a href='index.php?page=medicion_listar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><img 
          src='/icons/ff16/time.png' /> Mostrar mediciones</a> &nbsp; &nbsp;
        <a href='index.php?page=indicador_listar&id_entidad={$indicador->id_entidad}'><img 
          src='/icons/ff16/chart_curve.png' /> Listar todos</a> &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        <a href='index.php?page=indicador_editar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><img 
          src='/icons/ff16/chart_curve_edit.png'  /> Editar</a> &nbsp; 
        <a href='index.php?page=indicador_borrar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}' onClick='return confirmar();'><img 
          src='/icons/ff16/chart_curve_delete.png'  /> Borrar</a> &nbsp;  &nbsp;
        <a href='index.php?page=medicion_responsable&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><img 
          src='/icons/ff16/user_medicion.png' /> Responsables medición</a> &nbsp; &nbsp;
        <a href='index.php?page=indicador_subunidad_valor&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><img 
          src='/icons/ff16/tag_blue.png' /> Edición valores</a> &nbsp; &nbsp; &nbsp;
        <a href='index.php?page=valor_referencia_crear&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><img 
          src='/icons/ff16/tag.png' /> Valores de referencia</a> &nbsp;
      </div>
    <div class="block">
      <div class="columns clearfix">
        <div class="col_40">
          <fieldset class="label">
            <label>Código indicador</label>
            <div>
              {$indicador->codigo}
            </div>
          </fieldset>
        </div>
        <div class="col_60">
          <fieldset class="label">
            <label>Proceso</label>
            <div>
              <a href="index.php?page=proceso_mostrar&id_proceso={$indicador->proceso->id}&id_entidad={$indicador->id_entidad}">{$indicador->proceso->codigo} - {$indicador->proceso->nombre}</a>
            </div>
          </fieldset>
        </div>
      </div>
      <fieldset class="label_side">
        <label>Nombre indicador</label>
        <div>
          {$indicador->nombre}
        </div>
      </fieldset>
      {if $indicador->descripcion != ""}
        <fieldset class="label_side">
          <label>Descripci&oacute;n</label>
          <div>
            {$indicador->descripcion}
          </div>
        </fieldset>
      {/if}
      <fieldset class="label_side">
        <label>Formulaci&oacute;n</label>
        <div> 
          {$indicador->formulacion}
        </div>
      </fieldset>
      {if $indicador->calculo}
        <fieldset class="label_side">
          <label>Cálculo</label>
          <div> 
            {$indicador->calculo}
          </div>
        </fieldset>
      {/if}
      <fieldset class="label_side">
        <label>Responsable de seguimiento</label>
        <div>
          {$indicador->responsable->nombre} {$indicador->responsable->apellidos} 
          {if $indicador->responsable->puesto} - {$indicador->responsable->puesto} {/if}
        </div>
      </fieldset>
      <fieldset class="label_side">
        <label>Responsable de medición</label>
        <div>
          {$indicador->responsable_medicion->nombre} {$indicador->responsable_medicion->apellidos} 
          {if $indicador->responsable_medicion->puesto} - {$indicador->responsable_medicion->puesto} {/if}
        </div>
      </fieldset>
      {if $indicador->fuente_informacion != ""}
        <fieldset class="label_side">
          <label>Fuente de informaci&oacute;n</label>
          <div>{$indicador->fuente_informacion}&nbsp;</div> 
        </fieldset>
      {/if}
      {if $indicador->fuente_datos != ""}
      <fieldset class="label_side">
        <label>Fuente de datos</label>
        <div>{$indicador->fuente_datos}&nbsp;</div> 
      </fieldset>
      {/if}
      {if $indicador->evidencia != ""}
      <fieldset class="label_side">
        <label>Metodo de comprobaci&oacute;n / Evidencia</label>
        <div>{$indicador->evidencia}&nbsp;</div>    
      </fieldset>
      {/if}
      {if $indicador->historicos != ""}
      <fieldset class="label_side">
        <label>Hist&oacute;rico</label>
        <div>{$indicador->historicos}&nbsp;</div>
      </fieldset>
      {/if}
      {if $indicador->interpretacion != ""}
      <fieldset class="label_side">
        <label>Interpretaci&oacute;n</label>
        <div>{$indicador->interpretacion}&nbsp;</div>
      </fieldset>
      {/if}
      {if $indicador->indicadores_relacionados != ""}
      <fieldset class="label_side">
        <label>Indicadores relacionados</label>
        <div>{$indicador->indicadores_relacionados}&nbsp;</div>
      </fieldset>
      {/if}
      <div class="columns clearfix">
        <div class="col_50">
          <fieldset class="label_side">
            <label>Criterios EFQM</label>
            <div>
              {if is_array($indicador->criterios_efqm)}
              <ul>
                {foreach $indicador->criterios_efqm as $indicador_criterio_efqm}
                  <li>{$indicador_criterio_efqm->criterio_efqm->codigo} - {$indicador_criterio_efqm->criterio_efqm->nombre}</li>
                {/foreach}
              </ul>
              {else}
                No se han definido
              {/if}
            </div>
          </fieldset>
        </div>
        <div class="col_50">
          <fieldset class="label_side">
            <label>Cálculo del total</label>
            <div>
              {if $indicador->id_tipo_agregacion == 0}Indefinido{/if}
              {if $indicador->id_tipo_agregacion == 1}Promedio{/if}
              {if $indicador->id_tipo_agregacion == 2}Suma{/if}
              {if $indicador->id_tipo_agregacion == 3}Máximo{/if}
            </div>
          </fieldset>
        </div>
      </div>
      <div class="columns clearfix">
        <div class="col_50">
          <fieldset class="label_side">
            <label>Periodicidad</label>
            <div>{$indicador->periodicidad}&nbsp;</div>
          </fieldset>
        </div>
        <div class="col_50">
          <fieldset class="label_side">
            <label>Visibilidad</label>  
            <div>{$indicador->visibilidad->nombre|htmlentities}&nbsp;</div>
          </fieldset>
        </div>
      </div>
      <div class="columns clearfix">
        <div class="col_50">
          <fieldset class="label_side">
            <label>Nivel de desagregacion</label>
            <div>{$indicador->nivel_desagregacion}&nbsp;</div>
          </fieldset>
        </div>
        <div class="col_50">
          <fieldset class="label_side">
            <label>Unidad generadora</label>
            <div>{$indicador->unidad_generadora}&nbsp;</div>
          </fieldset>
        </div>
      </div>
      <fieldset class="label_side">
        <label>Subunidades afectadas</label>
        <div>
          {if $indicador_subunidades}
            <ul>
            {foreach $indicador_subunidades as $indicador_subunidad}
              <li><a href="index.php?entidad_datos&id_entidad={$indicador_subunidad->entidad->id}">{$indicador_subunidad->entidad->nombre}</a></li>
            {/foreach}
            </ul>
          {else}
            No se han asignado subunidades a este indicador (corregir)
          {/if}
        </div>
      </fieldset>
    </div>
  </div>
</div>

<h2>Mediciones del indicador</h2>
<div class="button_bar clearfix">
  <a href='index.php?page=medicion_listar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><img 
    src='/icons/ff16/time.png' /> Mostrar Mediciones</a>            
</div>

{if $mediciones}
  <div style="background: white; padding:20px 40px; margin:10px; height:300px;">
  <div class="highchart" id="anuales" style="width:100%;" data-id_indicador="{$indicador->id}" data-nombre_indicador="{$indicador->nombre}" data-fecha_inicio="{$indicador->historicos}-01-01" data-fecha_fin="{$smarty.now|date_format:'%Y' - 1}-12-31" data-periodicidad="anual"> </div>
  </div>

  {if $indicador->periodicidad != "Anual"} 
    <div style="background: white; padding:20px 40px; margin:10px;">
      <h3 style="margin: 0 0 20px 0;">Dos últimos años ({$smarty.now|date_format:'%Y' - 1} / {$smarty.now|date_format:'%Y'})</h3>
      <div class="highchart" id="ultimas" data-id_indicador="{$indicador->id}" data-nombre_indicador="{$indicador->nombre}" data-periodicidad="todos" data-fecha_inicio="{$smarty.now|date_format:'%Y' - 2}-01-01" data-fecha_fin="{$smarty.now|date_format:'%Y-%m-%d'}" data-periodicidad="todos"></div>
    </div>
  {/if}
{if $paneles}
  {foreach $paneles as $panel}
    <div class="box grid_{$panel->ancho}" style="float:left;">
      <div class="block alturo" style="height:320px">
        <div class="titulo-panel">
          <strong>{$panel->nombre}</strong> 
          <a class="borrar pull-right ihidden" data-nombre_panel="{$panel->nombre}" href="#"><img src="/icons/ff16/cancel.png" /></a>
          &nbsp; 
          <a class="editar pull-right hidden" data-nombre_panel="{$panel->nombre}" href="#"><img src="/icons/ff16/application_add.png" /></a>
        </div>
        <div class="section">
          <div class="panel {$panel->tipo->clase_css}" id="panel_{$panel->id}" data-idpanel="{$panel->id}" 
            data-id_medicion="{$panel->id_medicion}" data-fecha_inicio="{$panel->fecha_inicio}" 
            data-fecha_fin="{$panel->fecha_fin}" data-ancho="{$panel->ancho}"
            data-periodicidad="{$panel->periodicidad}"></div>
          <div class="leyenda"></div>
        </div>
      </div>
    </div>
  {/foreach}
{/if}
{else}
  <p class="aviso">Todavía no se han recogido valores para este indicador.</p>
{/if}

{if $paneles}
  {foreach $paneles as $panel}
    <div class="box grid_{$panel->ancho}" style="float:left;">
      <div class="block alturo" style="height:320px">
        <div class="titulo-panel">
          <strong>{$panel->nombre}</strong> 
          <a class="borrar pull-right ihidden" data-nombre_panel="{$panel->nombre}" href="#"><img src="/icons/ff16/cancel.png" /></a>
          &nbsp; 
          <a class="editar pull-right hidden" data-nombre_panel="{$panel->nombre}" href="#"><img src="/icons/ff16/application_add.png" /></a>
        </div>
        <div class="section">
          <div class="panel {$panel->tipo->clase_css}" id="panel_{$panel->id}" data-idpanel="{$panel->id}" 
            data-id_medicion="{$panel->id_medicion}" data-fecha_inicio="{$panel->fecha_inicio}" 
            data-fecha_fin="{$panel->fecha_fin}" data-ancho="{$panel->ancho}"
            data-periodicidad="{$panel->periodicidad}"></div>
          <div class="leyenda"></div>
        </div>
      </div>
    </div>
  {/foreach}
{/if}

<script src="theme/danpin/scripts/flot/jquery.flot.min.js" type="text/javascript"></script>   
<script src="theme/danpin/scripts/flot/jquery.flot.time.js" type="text/javascript"></script>
<script src="js/highcharts.js" type="text/javascript"></script>
<script src="js/highchartStruct.js" type="text/javascript"></script>

<script src="js/graficos_ficha_indicador.js" type="text/javascript"></script>

<script type="text/javascript">
$(document).ready(function() {
  // Para cada contenedor de clase higchart vamos a pintar el gráfico
  $('.highchart').each(function() {
    var idPanel = $(this).attr('id');
    var idIndicador = $(this).data("id_indicador");
    var nomIndicador = $(this).data("nombre_indicador");
    var periodicidad = $(this).data("periodicidad");
    var fecha_inicio = $(this).data("fecha_inicio");
    var fecha_fin = $(this).data("fecha_fin");
    var milisegundosAnio = 31540000000;
    var serie = [];
    var chartSerie = new highchartSerie();
console.log("api_publica.php?metodo=get_valores_con_timestamp&id=" + idIndicador + "&fecha_inicio=" + fecha_inicio + "&fecha_fin=" + fecha_fin + "&periodicidad=" + periodicidad);
    $.ajax({
      url: "api_publica.php?metodo=get_valores_con_timestamp&id=" + idIndicador + "&fecha_inicio=" + fecha_inicio + "&fecha_fin=" + fecha_fin + "&periodicidad=" + periodicidad,
      type: "GET",
      dataType: "json",
      success: onDataReceived
    });

    function onDataReceived(datos) {
      var categories = new Set();
      var map = [];

      //Guarda los datos en forma de Map
      //Año/Medición -> Unidad -> Valor
      datos.forEach(function(d){
        var medicion;
        var unidad;
        var valor;
        medicion=d.periodo_fin;
        valor = parseFloat(d.valor);
        unidad = d.etiqueta_mini?d.etiqueta_mini:d.unidad;
        !parseInt(d.id_unidad)?categories.add(unidad):false;

	if(!d.etiqueta_mini)
		chartSerie.add(d);

        if(map[medicion]){
          map[medicion][unidad]=valor;
        }else{
          map[medicion]=new Object();
          map[medicion][unidad]=valor;
        }
      });
	console.log(chartSerie.getLinealSerie());
      categories.data.forEach(function (category) {
        var data = [];
        for(var key in map){
          if(map[key][category])
            data.push([parseInt(key),map[key][category]]);
          else
            data.push([parseInt(key),null]);
        }
        serie.push({
          name:category,
          type:'line',
          data:data,
        });
      });
    var chart1 = new Highcharts.Chart({
      chart: {
        type: 'line',
        height: 300,
        renderTo: idPanel,
      },
      title: {
        text: nomIndicador + '(' + fecha_inicio + " a " + fecha_fin + ")",
        style: { "color": "grey", "fontSize": "12px"}
      },
      xAxis: {
        type: 'category',
      },
      yAxis: {
        title: {
          text: ''
        }
      },
      plotOptions: {
        series: {
          dataLabels: {
            enabled: true
          }
        }
      },
      series: chartSerie.getLinealSerie()
    });
    }
  });
});

</script>
