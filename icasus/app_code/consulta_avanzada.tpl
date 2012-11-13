<style>

div.receptor {
  width: 85%;
  min-height: 20px;
  border: 1px dashed silver;
  margin: 5px 20px;
  padding: 3px 5px;
  font-size: 10pt;
}

.activo {
  border: 1px dashed #08c;
  border: 1px dashed goldenrod;
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
font-size: 17px;
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

          <div class="receptor" data-serie="1">
          </div>

          <div class="operador">
            <select>
              {foreach $operaciones as $operacion}
                <option value="{$operacion.0}">{$operacion.1}</option>
              {/foreach}
            </select>
          </div>

          <div class="receptor" data-serie="2">
          </div>
          
          <div class="operador">
            <select>
              {foreach $operaciones as $operacion}
                <option value="{$operacion.0}">{$operacion.1}</option>
              {/foreach}
            </select>
          </div>
          
          <div class="receptor" data-serie="3">
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
    <div class="section tabla_datos" data-serie="1">
    <!--
    <table class="static">
    <caption>Resultado de la consulta</caption>
      <thead>
        <tr> <th>Periodo</th> <th>Valor</th> </tr>
      </thead>
      <tbody>
        <tr> <td>2008</td> <td>130.53</td> </tr>
        <tr> <td>2009</td> <td>133.59</td> </tr>
        <tr> <td>2010</td> <td>103.35</td> </tr>
        <tr> <td>2011</td> <td>113.35</td> </tr>
      </tbody>
    </table>
    -->
    </div>
    <div class="section tabla_datos" data-serie="2">
    </div>
    <div class="section tabla_datos" data-serie="3">
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
  $(function () {
    var contador_contenedor = 3; 
    $('.receptor:first').toggleClass('activo');
  });

  var datos;
  
  /* --- La declaración de eventos --- */
	$('#btn_mostrar_resultado').click(crearResultado);
  $('.receptor').click(activarReceptor);
  $('.indicador').click(agregarIndicador);
  $('.icon-arrow-right').click(agregarIndicador);
  $('.icon-remove').click(quitarIndicador);
  
  /* --- Las funciones --- */
  function agregarIndicador()
  {
    var id_indicador = $(this).attr('id_indicador');
    $(".activo").empty();
    $(this).clone().appendTo('.activo').wrap("<div />").after('<b class="icon-remove pull-right">X</b>').removeClass("indicador").addClass("escogido");
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
      }).appendTo('.activo').addClass('.pull-right').bind('change',mostrarIndicador);
    });
    mostrarIndicador();
    return false;
  }

  function crearResultado() {
    var id_indicador = 5084;
	  $.ajax({
      url: "api_publica.php?metodo=get_valores_indicador&id=" + id_indicador,
      success: function(datos_ajax)
      {
        var datos = $.parseJSON(datos_ajax);
        datos_flot = prepararDatos(datos);
        opciones_flot = prepararOpciones(datos);
        $.plot($("#grafica"), datos_flot, opciones_flot);
      }
		}); 
	}
  
  function mostrarIndicador() {
    var id_indicador = $('.activo').find('.escogido').attr('id_indicador');
    var nombre_indicador = $('.activo').find('.escogido').text();
	  $.ajax({
      url: "api_publica.php?metodo=get_valores_indicador&id=" + id_indicador,
      success: function(datos_ajax)
      {
        var datos = $.parseJSON(datos_ajax);
        datos_flot = prepararDatos(datos);
        opciones_flot = prepararOpciones(datos);
        $.plot($("#grafica"), datos_flot, opciones_flot);
        generaTablaDatos(id_indicador, nombre_indicador, datos);
      }
		}); 
	}
  
  function prepararDatos(datos)
  {
    var items = [];
    var subunidad_actual = $('.activo').find('.subunidades').find("option:selected").text()
    var nombre_indicador = $('.activo').find('.escogido').text();
    $.each(datos, function(i, dato) {
      if(dato.unidad == subunidad_actual)
      {
        items.push([dato.medicion, dato.valor]);
      }
    });
    datos_flot = [{label: nombre_indicador + '(' + subunidad_actual + ')', color:'maroon', data: items }];
    return datos_flot;
  }

  function prepararOpciones(datos)
  {
    var items = [];
    var subunidad_actual = $('.activo').find('.subunidades').find("option:selected").text()
    $.each(datos, function(i, dato) {
      if(dato.unidad == subunidad_actual)
      {
        items.push([dato.medicion, dato.medicion.toString()]);
      }
    });
    var opciones_flot = {
      series: { lines: { show: true }, points: { show: true } },
      legend: { position:"ne" },
      xaxis: { ticks: items }
    };
    /*
      series: { bars: { show: true, barWidth: 0.5, fill: 0.9 }},
    */
    return opciones_flot;
  };
  
  function quitarIndicador()
  {
    $(this).parent().fadeOut(500);
    $(this).parent().remove();
  }

  
  function activarReceptor()
  {
    $('.receptor').removeClass('activo');  
    $(this).toggleClass('activo');  
  }

  function generaTablaDatos(id_indicador, nombre_indicador, datos)
  {
    var items = [];
    var subunidad_actual = $('.activo').find('.subunidades').find("option:selected").text()
    items.push('<caption>' + nombre_indicador + '</caption>');
    items.push('<thead><tr><th>Periodo</th><th>Valor</th></tr></thead>');
    $.each(datos, function(i, dato) {
      if(dato.unidad == subunidad_actual)
      {
        if (i%2 == 0) {paridad = "odd";} else {paridad = "even";}
        items.push('<tr class="' + paridad +'"><td>' + dato.medicion + '</td><td>' + dato.valor + '</td></tr>');
      }
    });
    $('<table />', {'class': 'static', 
                    'data-id_indicador': id_indicador, 
                    html: items.join('')
                   }).appendTo('#tablas');
    
  }
</script>
{/literal}
