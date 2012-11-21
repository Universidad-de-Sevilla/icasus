<style>

div.receptor {
  width: 85%;
  min-height: 20px;
  border: 1px dashed silver;
  margin: 5px 20px;
  padding: 3px 5px;
  font-size: 10pt;
}

div.activo {
  border: 1px dashed #666;
  background: #f0f0f0;
}

div.operador {
  margin: 5px 20px;
  padding: 3px 5px;
}

.pull-right {
  float: right;
}

.tabla_datos caption {
font-size: 15px;
text-align: left;
color: #444;
padding: 5px 5px;
margin-bottom: 1px;
border: 1px solid maroon;
}

</style>

<div class="box grid_16 single_datatable">
  <h2 class="box_head grad_grey_dark">Parámetros de la consulta</h2>
  <a href="#" class="grabber"></a>
  <a href="#" class="toggle"></a>

  <div class ="columns clearfix">
    <!-- El buscador de datos e indicadores -->
    <div class="col_50 no_border">
      <div class="block no_border">
        <div class="section">
          <div id="dt1">
            <table class="display datatable"> 
            <thead> 
             <tr>  
              <th>Código</th>
              <th>Nombre</th>
             </tr> 
            </thead> 
              <tbody>
                {foreach $indicadores as $indicador}
                  <tr class="gradeX">
                    <td>{$indicador->codigo}</td>
                    <td><a href="#" class="indicador" id_indicador="{$indicador->id}">{$indicador->nombre}</a></td>
                  </tr>
                {/foreach}
              </tbody>
            </table>
          </div><!-- #dt1 -->
        </div><!-- .section -->
      </div><!-- .block -->
    </div><!-- .col_50 -->

    <!-- El receptor de datos e indicadores que los mezcla con las operaciones -->
    <div class="col_50">
      <div class="block">
        <div class="section">

          <div class="receptor" data-serie="0">
          </div>
          <div>
            <select class="operador" data-serie="0">
              {foreach $operaciones as $operacion}
                <option value="{$operacion.0}">{$operacion.1}</option>
              {/foreach}
            </select>
          </div>
          <div class="receptor" data-serie="1">
          </div>
          
          <div>
            <select class="operador" data-serie="1">
              {foreach $operaciones as $operacion}
                <option value="{$operacion.0}">{$operacion.1}</option>
              {/foreach}
            </select>
          </div>
          <div class="receptor" data-serie="2">
          </div>

          <button class="pull-right" id="btn_mostrar_resultado">Mostrar resultado</button>

        </div><!-- .section -->
      </div><!-- .block -->
    </div><!-- .col_50 -->
  </div><!-- .columns .clearfix -->
</div><!-- .box .grid_16 --!>

<!-- La tabla con los resultados obtenidos y los datos de partida -->
<div class = "box grid_7 no_titlebar" id="tablas">
  <div class="block">
    <div class="section tabla_datos" id="tabla0">
    </div>
    <div class="section tabla_datos" id="tabla1">
    </div>
    <div class="section tabla_datos" id="tabla2">
    </div>
  </div>
</div><!-- .box .grid_8 -->

<!-- La gráfica con los resultados obtenidos -->
<div class = "box grid_8 no_titlebar">
  <div class="block">
    <div class="section">
      <div id="grafica" style="width:100%;height:300px">
      </div>
    </div>
  </div>
</div><!-- .box .grid_8 -->

{literal}
<script>
  /* --- Comienza la magia --- */ 
  //Están son las series iniciales que pintamos en pantalla, se agregarán más cuando se llenen
  var contador_series = 3; 
  var datos = [];
  $('.receptor:first').toggleClass('activo');

  /* --- La declaración de eventos --- */
  $('#btn_mostrar_resultado').click(calcularResultado);
  $('.receptor').click(activarReceptor);
  $('.indicador').click(agregarIndicador);
  $('.icon-arrow-right').click(agregarIndicador);
  $('.icon-remove').click(quitarIndicador);
  //$('.operador').change(calcularResultado);
  
  /* --- Las funciones --- */
  function agregarIndicador()
  {
    var id_indicador = $(this).attr('id_indicador');
    var serie = $(".activo").data("serie");
    $(".activo").empty();
    $(this).clone().appendTo('.activo').wrap("<div />").after('<b class="icon-remove pull-right">X</b>').toggleClass("indicador escogido");
    $('.icon-remove').bind('click', quitarIndicador);
    $.getJSON('api_publica.php?metodo=get_subunidades_indicador&id=' + id_indicador, function(data) {
      var items = [];
      items.push('<option id="total">Total</option>');
      $.each(data, function(i, subunidad) {
        items.push('<option id="' + subunidad.id + '">' + subunidad.etiqueta + '</option>');
      });
      $('<select/>', {
        'class': 'subunidades',
        html: items.join('')
      }).bind('change', mostrarIndicadorSubunidad).appendTo('.activo');
    });
    // Después de añadir el indicador activamos el siguiente receptor
    // Si era el último creamos uno nuevo
    //if ($(".activo").nextAll(".receptor:first") == 0)
    //{
      //crearReceptor();
    //}
    //else 
    //{
      //$(".activo").nextAll(".receptor:first").trigger("click");
    //}
    mostrarIndicador(serie);
    return false;
  }
  
  function mostrarIndicador(serie) {
    var id_indicador = $('.activo').find('.escogido').attr('id_indicador');
    var nombre_indicador = $('.activo').find('.escogido').text();
	  $.ajax({
      url: "api_publica.php?metodo=get_valores_indicador&id=" + id_indicador,
      success: function(datos_json)
      {
        var datos_json = $.parseJSON(datos_json);
        generaTablaDatos(id_indicador, nombre_indicador, datos_json, serie);
        datos[serie] = prepararDatos(datos_json, serie);
        opciones = prepararOpciones(datos_json);
        $.plot($("#grafica"), datos, opciones);
      }
		}); 
	}
  
  function mostrarIndicadorSubunidad() 
  {
    var serie = $(".activo").data("serie");
    mostrarIndicador(serie);
  }

  function generaTablaDatos(id_indicador, nombre_indicador, datos, serie)
  {
    var items = [];
    var subunidad_actual = $('.activo').find('.subunidades').find("option:selected").text();
    items.push('<caption>' + nombre_indicador + ' (' + subunidad_actual + ')</caption>');
    items.push('<thead><tr><th>Periodo</th><th>Valor</th></tr></thead>');
    $.each(datos, function(i, dato) {
      if(dato.unidad == subunidad_actual)
      {
        if (i%2 == 0) {paridad = "odd";} else {paridad = "even";}
        items.push('<tr class="' + paridad +'"><td>' + dato.medicion + '</td><td>' + dato.valor + '</td></tr>');
      }
    });
    $('#tabla'+serie).empty();
    $('<table />', {'class': 'static', 
                    'data-id_indicador': id_indicador, 
                    html: items.join('')
                   }).appendTo('#tabla'+serie);
    
  }

  function prepararDatos(datos,serie)
  {
    var items = [];
    var subunidad_actual = $('.activo').find('.subunidades').find("option:selected").text();
    var nombre_indicador = $('.activo').find('.escogido').text();
    $.each(datos, function(i, dato) {
      if(dato.unidad == subunidad_actual)
      {
        items.push([dato.medicion, dato.valor]);
      }
    });
    datos_flot = {label: nombre_indicador + '(' + subunidad_actual + ')', color:serie, data: items };
    return datos_flot;
  }

  function prepararOpciones(datos)
  {
    var items = [];
    var subunidad_actual = $('.activo').find('.subunidades').find("option:selected").text();
    $.each(datos, function(i, dato) {
      if(dato.unidad == subunidad_actual)
      {
        items.push([dato.medicion, dato.medicion.toString()]);
      }
    });
    var opciones = {
      series: { lines: { show: true }, points: { show: true } },
      legend: { position:"ne" },
      xaxis: { ticks: items },
      colors: ['maroon', 'darkviolet', 'orange', 'darkolivegreen']
    };
    /*
      series: { bars: { show: true, barWidth: 0.5, fill: 0.9 }},
    */
    return opciones;
  };

  function calcularResultado() 
  {
    var resultado = [];
    //var resultados = [];
    $('.operador').each(function(indice, operador)
    {
      var operacion = $(operador).find('option:selected').attr('value');
      if ( operacion != 'cotejar')
      {
        var serie = $(operador).data('serie');
        if (datos[serie].data.length > 0 && datos[serie + 1].data.length > 0)
        {
          for(i = 0; i < datos[serie].data.length; i++)
          {
            if (operacion == 'cociente')
            {
              resultado[i] = [ parseInt(datos[serie].data[i][0]), parseFloat(datos[serie].data[i][1]) / parseFloat(datos[serie + 1].data[i][1]) ];
            }
            else if (operacion == 'suma')
            {
              resultado[i] = [ parseInt(datos[serie].data[i][0]), parseFloat(datos[serie].data[i][1]) + parseFloat(datos[serie + 1].data[i][1]) ];
            }
          }
        }
      }
    });
    console.log(resultado);
    resultados = [{label: 'Resultado', color:'darkolivegreen', data: resultado}];
    opciones_res = { xaxis: { tickDecimals: 0 }, legend: { position: 'ne' } };
    
    console.log(resultados);
    $.plot($("#grafica"), resultados, opciones_res);
  
	}
  
  function crearReceptor()
  {
    alert('Pendiente de implementar');
  }
  
  function activarReceptor()
  {
    $('.receptor').removeClass('activo');  
    $(this).toggleClass('activo');  
  }
  
  function quitarIndicador()
  {
    $(this).closest('.receptor').empty();
  }

</script>
{/literal}
