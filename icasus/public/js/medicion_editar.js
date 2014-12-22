// -------------------------------------------------------
// Proyecto Icasus
// Funciones de la plantilla medicion_editar.tpl
// -------------------------------------------------------

function fila_editar(medicion,id_valor)
{
  $('#valors').load("index.php?page=medicion_editar_ajax&modulo=editarfila&ajax=true&id_medicion="+medicion+"&id_valor="+id_valor);
}

function fila_grabar(id_valor,medicion)
{
  var value = $('[name=v_'+id_valor+']').val();
  value = value.replace(',','.');
  if (value !== '')
  {
    if (isNaN(value)=== false)
    {
      $.ajax({
        type: "POST",
        url: "index.php?page=medicion_editar_ajax&modulo=grabarfila&ajax=true",
        data: {"id_valor":id_valor, "valor":value},
        success: function(response){
          $('#valors').load("index.php?page=medicion_editar_ajax&modulo=cancelarfila&ajax=true&id_medicion="+medicion);
        }
      });
      /*
       * $.post("index.php?page=medicion_editar_ajax&modulo=grabarfila&ajax=true",{id_valor:id_valor, valor:value},function(){
        $('#valors').load("index.php?page=medicion_editar_ajax&modulo=cancelarfila&ajax=true&id_medicion="+medicion);
      });
      */
    }
    else if (value === "---")
    {
      $.post("index.php?page=medicion_editar_ajax&modulo=anularvalor&ajax=true",{id_valor:id_valor},function(){
        $('#valors').load("index.php?page=medicion_editar_ajax&modulo=cancelarfila&ajax=true&id_medicion="+medicion);
      });
    }
    else
    {
    alert('Está intentando introducir un dato que no es reconocido como número.');
    }
  }
  else
  {
    alert('Está intentando introducir un valor vacio.\nPuede restituir el valor anterior pulsando el icono "X" (cancelar). \nPuede dejarlo en blanco (nulo) introduciendo tres guiones seguidos (---)');
  }
}

function fila_cancelar(medicion)
{
  $('#valors').load("index.php?page=medicion_editar_ajax&modulo=cancelarfila&ajax=true&id_medicion="+medicion);
}

function etiqueta_editar(medicion,content)
{
  $('#'+content).load("index.php?page=medicion_editar_ajax&modulo=editaretiqueta&ajax=true&id_medicion="+medicion+"&contenedor="+content);
}

function etiqueta_editar_grabar(content,medicion,tag)
{
  var value = $("[name="+tag+"]").val();
  $.post("index.php?page=medicion_editar_ajax&modulo=grabaretiqueta&ajax=true",{id_medicion:medicion,contenedor:content,valor:value},function(){
    $('#'+content).load("index.php?page=medicion_editar_ajax&modulo=cancelaretiqueta&ajax=true&id_medicion="+medicion+"&contenedor="+content);
  });
}

function etiqueta_editar_cancelar(content,medicion)
{
  $('#'+content).load("index.php?page=medicion_editar_ajax&modulo=cancelaretiqueta&ajax=true&id_medicion="+medicion+"&contenedor="+content);
}

function fecha_editar(medicion,content)
{
  $('#'+content).load("index.php?page=medicion_editar_ajax&modulo=editaretiqueta&ajax=true&id_medicion="+medicion+"&contenedor="+content);
}

function fecha_grabar(medicion,content)
{

  var dia = $("[name="+content+"Day]").val();
  var mes = $("[name="+content+"Month]").val();
  var year = $("[name="+content+"Year]").val();
  var value = year+"-"+mes+"-"+dia;
  $.post("index.php?page=medicion_editar_ajax&modulo=grabaretiqueta&ajax=true",{id_medicion:medicion,contenedor:content,valor:value},function(){
    $('#'+content).load("index.php?page=medicion_editar_ajax&modulo=cancelaretiqueta&ajax=true&id_medicion="+medicion+"&contenedor="+content);
  });
}

function fecha_cancelar(content,medicion)
{
  $('#'+content).load("index.php?page=medicion_editar_ajax&modulo=cancelaretiqueta&ajax=true&id_medicion="+medicion+"&contenedor="+content);
}

function referencia_editar(id)
{
  $('#referencia_'+id).load("index.php?page=medicion_editar_ajax&modulo=editarvalorreferencia&ajax=true&id_referencia="+id);
}

function referencia_grabar(id)
{
  var value = $("[name=input_referencia_"+id+"]").val();
  value = value.replace(',','.');

  if (value !== '')
  {
    if (isNaN(value) === false)
    {
      $.post("index.php?page=medicion_editar_ajax&modulo=grabarvalorreferencia&ajax=true",{id_referencia:id,valor:value},function(){
      $('#referencia_'+id).load("index.php?page=medicion_editar_ajax&modulo=cancelarvalorreferencia&ajax=true&id="+id);
      });
    }
    else if (value === "---")
    {
      $.post("index.php?page=medicion_editar_ajax&modulo=anularvalorreferencia&ajax=true",{id_referencia:id},function(){
        $('#referencia_'+id).load("index.php?page=medicion_editar_ajax&modulo=cancelarvalorreferencia&ajax=true&id="+id);
      });
    }
    else
    {
      alert('Está intentando introducir un dato que no es reconocido como número.');
    }
  }
  else
  {
    alert('Está intentando introducir un valor vacio.\n\nPuede restituir el valor con [cancelar].');
  }
}

function referencia_cancelar(id)
{
  $('#referencia_'+id).load("index.php?page=medicion_editar_ajax&modulo=cancelarvalorreferencia&ajax=true&id="+id);
}

