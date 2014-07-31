//carga inicial
  $(document).ready(function(){
    var id;
    $("#crear_referencia").hide();
    $("#editar_referencia").hide();
    $("#display_crear_referencia").click(function(){$("#crear_referencia").toggle('slow');});
    $("#hidden_crear_referencia" ).click(function(){$("#crear_referencia").toggle('slow');});

//editar datos
  $("a.dialog_button").click(function(){
    var tag = $(this).attr('id');
    var ids = tag.split('-');
    id = ids[2];
    $('#e-etiqueta').attr('value',$('#l-etiqueta-'+id).attr('value'));
    $('#e-nombre').attr('value',$('#l-nombre-'+id).attr('value'));
    $('input:radio[name="e-grafica"][value='+$('#l-grafica-'+id).attr('value')+']').attr('checked', true);
    $('input:radio[name="e-activo"][value='+$('#l-activo-'+id).attr('value')+']').attr('checked', true);
    //$("#editar_referencia").toggle('slow');
  });
//captura los valores de los campos y los envia con el formulario
  $("#valor_editar").click(function(){
    var id_indicador = $('[name=e-id_indicador]').val();
    var etiqueta = $('[name=e-etiqueta]').val();
    var nombre = $('[name=e-nombre]').val();
    var grafica = $("input:radio[name=e-grafica]:checked").val();
    var activo = $('input:radio[name=e-activo]:checked').val();
    //$.post('index.php?page=valor_referencia_ajax&ajax=true&modulo=editar',{id_valor:id,id_indicador:id_indicador,etiqueta:etiqueta,nombre:nombre,grafica:grafica,activo:activo},function(){location.reload();});
    $.ajax({
      type: 'post',
      url :'index.php?page=valor_referencia_ajax&ajax=true&modulo=editar',
      data:{'id_valor':id,'id_indicador':id_indicador,'etiqueta':etiqueta,'nombre':nombre,'grafica':grafica,'activo':activo},
      success: function(){
        location.reload();
        }
      });
  });
//editar datos cancelar
  $("#valor_editar_cancelar").click(function(){
    $("#editar_referencia").toggle('slow');
  });
//crear datos
    $('#valor_nuevo_crear').click(function(){
        var id_indicador = $('[name=c-id_indicador]').val();
        var etiqueta = $('[name=c-etiqueta]').val();
        var nombre = $('[name=c-nombre]').val();
        var grafica = $("input:radio[name=c-grafica]:checked").val();
        var activo = $('input:radio[name=c-activo]:checked').val();
      $.post('index.php?page=valor_referencia_ajax&ajax=true&modulo=crear',{id_indicador:id_indicador,etiqueta:etiqueta,nombre:nombre,grafica:grafica,activo:activo},function(){
        location.reload();
      });
    });
//crear datos cancelar
    $('#valor_nuevo_cancelar').click(function(){
      $("#crear_referencia").hide();
    }); 
  });
