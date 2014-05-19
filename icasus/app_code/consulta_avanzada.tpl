<style>

div.receptor {
  width: 85%;
  min-height: 20px;
  border: 1px dashed #cacaca;
  margin: 5px 20px;
  padding: 3px 5px;
  font-size: 10pt;
}

div.activo {
  border: 1px dashed maroon;
  background: #f2f2f2;
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

.block > .section > ul.mediciones {
  list-style: none;
}

.block > .section > ul.mediciones > li {
  display: inline;
  margin: 10px;
  border: 0;
}

a.medicion{
  border: 1px solid #cacaca;
  padding: 3px 15px;
}

a.actual {
  background: #f2f2f2;
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

          <div class="receptor" data-serie="0"> </div>
          
          <div>
            <select class="operador" data-serie="0">
              {foreach $operaciones as $operacion}
                <option value="{$operacion.0}">{$operacion.1}</option>
              {/foreach}
            </select>
          </div>

          <div class="receptor" data-serie="1"> </div>
          
          <div>
            <select class="operador" data-serie="1">
              {foreach $operaciones as $operacion}
                <option value="{$operacion.0}">{$operacion.1}</option>
              {/foreach}
            </select>
          </div>

          <div class="receptor" data-serie="2"> </div>

          <div>
            <select class="operador" data-serie="2">
              {foreach $operaciones as $operacion}
                <option value="{$operacion.0}">{$operacion.1}</option>
              {/foreach}
            </select>
          </div>

          <div class="receptor" data-serie="3"> </div>

          <div>
            <select class="operador" data-serie="3">
              {foreach $operaciones as $operacion}
                <option value="{$operacion.0}">{$operacion.1}</option>
              {/foreach}
            </select>
          </div>

          <div class="receptor" data-serie="4"> </div>

          <button class="pull-right" id="btn_mostrar_resultado">Mostrar resultado</button>

        </div><!-- .section -->
      </div><!-- .block -->
    </div><!-- .col_50 -->
  </div><!-- .columns .clearfix -->
</div><!-- .box .grid_16 --!>

<!-- La tabla con los resultados obtenidos y los datos de partida -->
<div class = "box grid_6 no_titlebar" id="tablas" style="margin-left: 0.9%; margin-right: 0.9%;">
  <div class="block">
    <div class="section tabla_datos" id="tablar">
    </div>
    <div class="section tabla_datos" id="tabla0">
    </div>
    <div class="section tabla_datos" id="tabla1">
    </div>
    <div class="section tabla_datos" id="tabla2">
    </div>
    <div class="section tabla_datos" id="tabla3">
    </div>
    <div class="section tabla_datos" id="tabla4">
    </div>
  </div>
</div><!-- .box .grid_6 -->

<!-- La gráfica con los resultados obtenidos -->
<div class = "box grid_10 no_titlebar" style="margin-left: 0.9%; margin-right: 0.9%;">
  <div class="block">

    <div class="section">
      <ul class="mediciones">
        <li><a href="#" class="medicion actual">Todos</a></li>
        <li><a href="#" class="medicion">2008</a></li>
        <li><a href="#" class="medicion">2009</a></li>
        <li><a href="#" class="medicion">2010</a></li>
        <li><a href="#" class="medicion">2011</a></li>
        <li><a href="#" class="medicion">2012</a></li>
      <ul>
    </div>

    <div class="section">
      <div id="grafica" style="width:100%;height:400px">
      </div>
    </div>

  </div>
</div><!-- .box .grid_10 -->

{literal}
<script src="theme/danpin/scripts/flot/jquery.flot.min.js" type="text/javascript"></script>		
<!--
<script src="theme/danpin/scripts/flot/jquery.flot.stack.min.js" type="text/javascript"></script>		
<script src="theme/danpin/scripts/flot/jquery.flot.orderBars.js" type="text/javascript"></script>		
-->
<script>
  /* --- Comienza la magia --- */ 
  //Están son las series iniciales que pintamos en pantalla, se agregarán más cuando se llenen
  var contador_series = 5; 
  var datos = []; //Los datos de cada serie ya procesados
  var opciones; //Las opciones para mostrar los gráficos
  var datos_json = []; //Contiene los valores de los indicadores tal como vienen de la petición a la API
  $('.receptor:first').toggleClass('activo');

  /* --- La declaración de eventos --- */
  $('#btn_mostrar_resultado').click(calcularResultado);
  $('.receptor').click(activarReceptor);
  $('.indicador').click(agregarIndicador);
  $('.medicion').click(mostrarMedicion);
  
  /* --- Las funciones --- */
  function agregarIndicador()
  {
    var id_indicador = $(this).attr('id_indicador');
    var serie = $(".activo").data("serie");
    $(".activo").empty();
    $(this).clone().appendTo('.activo').wrap("<div />").after('<b id="borra' + serie +'" class="icon-remove pull-right">X</b>').toggleClass("indicador escogido");
    $('#borra' + serie).bind('click', quitarIndicador);
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
	  $.getJSON("api_publica.php?metodo=get_valores_indicador&id=" + id_indicador, function(data) {
      generaTablaDatos(id_indicador, nombre_indicador, data, serie);
      datos_json[serie] = {'serie': serie, 'nombre': nombre_indicador, 'data':data};
      datos[serie] = prepararDatos(data, serie);
      opciones = prepararOpciones(data);
      $("#grafica").css("height", "400px");
      $.plot($("#grafica"), datos, opciones);
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

  function generaTablaResultados(datos)
  {
    var items = [];
    items.push('<caption>Resultados</caption>');
    items.push('<thead><tr><th>Periodo</th><th>Valor</th></tr></thead>');
    $.each(datos, function(i, dato) {
      if (i%2 == 0) {paridad = "odd";} else {paridad = "even";}
      items.push('<tr class="' + paridad +'"><td>' + dato[0] + '</td><td>' + dato[1] + '</td></tr>');
    });
    $('#tablar').empty();
    $('<table />', {'class': 'static', 
                    'data-id_indicador': 0, 
                    html: items.join('')
                   }).appendTo('#tablar');
  }

  function mostrarMedicion(e)
  {
    e.preventDefault();
    $('.medicion.actual').removeClass('actual'); 
    $(this).addClass('actual');
    var medicion_actual = $(this).text();
    if (medicion_actual === "Todos")
    {
      opciones = {colors: ['maroon', 'darkolivegreen', 'orange', 'green', 'pink', 'yellow', 'brown']};
      $("#grafica").css("height", "400px");
      $.plot($("#grafica"), datos, opciones);
    console.log(opciones);
    }
    else
    {
      var subunidades = [];
      var ejeY = [];
      var datos_flot = [];
      $.each(datos_json, function(s, serie) {
        if (serie.data)
        {
          $.each(serie.data, function(i, dato) {
            if(dato.medicion == medicion_actual && dato.unidad != "Total")
            {
              if (subunidades.indexOf(dato.unidad) < 0) { subunidades.push(dato.unidad); }
            }
          });
        }
      });
      subunidades.sort();
      subunidades.reverse();
      $.each(subunidades, function(s, subunidad) {
        ejeY.push([s, subunidad]);
      });
        
      $.each(datos_json, function(s, serie) {
        if (serie.data)
        {
          var items = [];
          nombre_indicador = serie.nombre;
          $.each(serie.data, function(i, dato) {
            if(dato.medicion == medicion_actual && dato.unidad != "Total")
            {
              // Incrementa el valor orden en función de la serie para que las barras no se solapen
              orden = subunidades.indexOf(dato.unidad) + serie.serie / 5;
              items.push([dato.valor, orden]);
            }
          });
          datos_flot.push({label: nombre_indicador + '(' + medicion_actual + ')', color:s, data: items });
        }
      });

      opciones = {
        series: { bars: {  show: true, barWidth: 0.1, fill: 0.7, align:"center", horizontal: true }},
        legend: { position:"ne" },
        yaxis: { ticks: ejeY },
        colors: ['maroon', 'darkolivegreen', 'orange', 'green', 'pink', 'yellow', 'brown']
      };
      //generaTablaMedicion(medicion_actual);
      alto = opciones.yaxis.ticks.length * 30 + 50 + "px";
      $("#grafica").css("height", alto);
      $.plot($("#grafica"), datos_flot, opciones);
    }
  }

  // Tabla de datos de las mediciones, de momento no funciona ni se usa
  function generaTablaMedicion(medicion_actual)
  {
    var contenido_tabla = [];
    $.each(datos_json, function(s, serie) {
      if (serie.data)
      {
        nombre_indicador = serie.nombre;
        if (s%2 == 0) {paridad = "odd";} else {paridad = "even";}
        contenido_tabla.push('<tr class="' + paridad +'"><td>' + serie.nombre + '</td>');
        $.each(datos_json, function(i, dato) {
          if(dato.medicion == medicion_actual && dato.unidad != "Total")
          {
            contenido_tabla.push('<td>' + dato.valor + '</td>');
          }
        });
      }
    });
    $('#tabla_medicion').empty();
    $('<table />', {'class': 'static', 
                    html: contenido_tabla.join('')
                   }).appendTo('#tabla_medicion');
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
    var opciones = {
      series: { lines: { show: true }, points: { show: true } },
      legend: { position:"ne" },
      xaxis: { tickDecimals: 0 },
      colors: ['maroon', 'darkolivegreen', 'orange', 'green', 'pink', 'yellow', 'brown']
    };
    return opciones;
  };

  function calcularResultado() 
  {
    var resultado = [];
    $('.operador').each(function(indice, operador)
    {
      var operacion = $(operador).find('option:selected').attr('value');
      if ( operacion != 'cotejar')
      {
        var serie = $(operador).data('serie');
        // Si es el primer operando inicializamos el array resultado con sus datos
        if (resultado.length == 0)
        {
          // Recorremos cada una de las mediciones de la serie
          for(i = 0; i < datos[serie].data.length; i++)
          {
              resultado[i] = [ parseInt(datos[serie].data[i][0]), parseFloat(datos[serie].data[i][1]) ];
          }
        }
        // Comprobamos que ninguna de las dos series que operan esté vacia
        if (datos[serie].data.length > 0 && datos[serie + 1].data.length > 0)
        {
          for(i = 0; i < datos[serie].data.length; i++)
          {
            if (operacion == 'cociente')
            {
              resultado[i][1] /=  parseFloat(datos[serie + 1].data[i][1]);
            }
            else if (operacion == 'suma')
            {
              resultado[i][1] +=  parseFloat(datos[serie + 1].data[i][1]);
            }
	    else if (operacion == 'porcentaje')
            {
              	//no funciona el operando *= como queremos, de ahi que se vuelva a dividir
		resultado[i][1] /= parseFloat(datos[serie + 1].data[i][1]/100);
            }
          }
        }
        else
        {
          alert("No puedo calcular con los parámetros actuales");
        }
        console.log(resultado);
      }
    });
    resultados = [{label: 'Resultado', data: resultado}];
    opciones_resultado = { 
      series: { lines: { show: true }, points: { show: true } },
      xaxis: { tickDecimals: 0 }, 
      legend: { position: 'ne' },
      colors: ['blue','black']
    };
    // Generamos la tabla de resultados a partir del array 'resultado'
    generaTablaResultados(resultado)
    // Generamos la grafica con los resultados a partir del objeto 'resultados'
    $.plot($("#grafica"), resultados, opciones_resultado);
  
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
    serie = $(this).closest(".receptor").data("serie");
    //datos[serie] = 0;
    //datos_json[serie] = 0;
    delete datos.serie;
    delete datos_json.serie;
    $(this).closest('.receptor').empty();
    $("#tabla"+serie).empty();
    $("#grafica").css("height", "400px");
    $.plot($("#grafica"), datos, opciones);
  }
  
  // devuelve la posición si un array contiene a otro o -1 si no lo contiene 
  function indexOfArray(val, array)
  {
    var
      hash = {},
      indexes = {},
      i, j;
    for(i = 0; i < array.length; i++)
    {
      hash[array[i]] = i;
    }
    return (hash.hasOwnProperty(val)) ? hash[val] : -1;
  };
  
</script>
{/literal}
