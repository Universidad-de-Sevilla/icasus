{literal}
<script>
//carga inicial
  $(document).ready(function(){
    var id;
    $("#crear_referencia").hide();
    $("#editar_referencia").hide();
    $("#display_crear_referencia").click(function(){$("#crear_referencia").toggle('slow');});
    $("#hidden_crear_referencia" ).click(function(){$("#crear_referencia").toggle('slow');});

//editar datos
  $("a.boton_editar_referencia").click(function(){
    var tag = $(this).attr('id');
    var ids = tag.split('-');
    id = ids[2];
    $('#e-etiqueta').attr('value',$('#l-etiqueta-'+id).attr('value'));
    $('#e-nombre').attr('value',$('#l-nombre-'+id).attr('value'));
    $('input:radio[name="e-grafica"][value='+$('#l-grafica-'+id).attr('value')+']').attr('checked', true);
    $('input:radio[name="e-activo"][value='+$('#l-activo-'+id).attr('value')+']').attr('checked', true);
    $("#editar_referencia").toggle('slow');
  });
//captura los valores de los campos y los envia con el formulario
  $("#valor_editar").click(function(){
    var id_indicador = $('[name=e-id_indicador]').val();
    var etiqueta = $('[name=e-etiqueta]').val();
    var nombre = $('[name=e-nombre]').val();
    var grafica = $("input:radio[name=e-grafica]:checked").val();
    var activo = $('input:radio[name=e-activo]:checked').val();
    $.post('index.php?page=valor_referencia_ajax&ajax=true&modulo=editar',{id_valor:id,id_indicador:id_indicador,etiqueta:etiqueta,nombre:nombre,grafica:grafica,activo:activo},function(){location.reload();});
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
</script>
{/literal}
<h3 class="section">
  <a href='javascript:window.history.back();'><img src='/icons/ff16/arrow_undo.png' /> Cancelar</a>
  <a href='javascript:void(0)' id="display_crear_referencia"><img src='/icons/ff16/tag.png' /> Crear nuevos valores de referencia</a> &nbsp;
</h3>

<div id="crear_referencia">
  <h3>Nueva referencia</h3>
  <div class="box grid_16">
    <div class="toggle_container">
      <div class="block">
        <form method="post" action="" id="formcrearreferencia" name="formcrearreferencia" class="datos">
          <fieldset class="label_side">
            <label>Etiqueta</label>
            <div><b><input  type='text' name='c-etiqueta' value=""/></b></div>
          </fieldset>
          <fieldset class="label_side">
            <label>Nombre</label>
            <div><b><input  type='text' name='c-nombre' value=""/></b></div>
          </fieldset>
          <fieldset class="label_side">
            <label>Visible en gráfica</label>
            <div><b><input  type='radio' name='c-grafica' value="1" checked/> Sí <input  type='radio' name='c-grafica' value="0"/>No</b></div>
          </fieldset>
          <fieldset class="label_side">
            <label>Activo</label>
            <div><b><input  type='radio' name='c-activo' value="1" checked/> Sí <input  type='radio' name='c-activo' value="0"/>No</b></div>
          </fieldset>
          <fieldset class="label_side">
            <div>
            <input type="hidden"  name="c-id_indicador" value="{$indicador->id}"/>
            <input type="button" value="Grabar" name="valor_nuevo_crear" id="valor_nuevo_crear"/>
            <input type="button" value="Cancelar" name="valor_nuevo_cancelar" id="valor_nuevo_cancelar"/>
            </div>
          </fieldset>
        </form>
      </div>
    </div>
  </div>
</div>

<div id="editar_referencia">
  <h3>Editar referencia</h3>
  <div class="box grid_16">
    <div class="toggle_container">
      <div class="block">
        <form method="post" action="" id="formeditarreferencia" name="formeditarreferencia" class="datos">
          <fieldset class="label_side">
            <label>Etiqueta</label>
            <div><b><input  type='text' id="e-etiqueta" name='e-etiqueta' value='' /></b></div>
          </fieldset>
          <fieldset class="label_side">
            <label>Nombre</label>
            <div><b><input  type='text' id="e-nombre" name='e-nombre' value='' /></b></div>
          </fieldset>
          <fieldset class="label_side">
            <label>Visible en gráfica</label>
            <div><b><input  type='radio' name='e-grafica' id="e-grafica-1" value="1" /> Sí <input  type='radio' name='e-grafica' id="e-grafica-0"  value="0"/>No</b></div>
          </fieldset>
          <fieldset class="label_side">
            <label>Activo</label>
            <div><b><input  type='radio' name='e-activo' id="e-activo-1" value="1" /> Sí <input  type='radio' name='e-activo' id="e-activo-0" value="0"/>No</b></div>
          </fieldset>
          <fieldset class="label_side">
            <div>
            <input type="hidden"  name="e-id_indicador" value="{$indicador->id}"/>
            <input type="button" value="Grabar" name="valor_editar" id="valor_editar"/>
            <input type="button" value="Cancelar" name="valor_editar_cancelar" id="valor_editar_cancelar"/>
            </div>
          </fieldset>
        </form>
      </div>
    </div>
  </div>
</div>

<div class="box grid_16 single_datatable">
  <div id="dt1" class="no_margin">
    <table class='display datatable'>
      <thead>
        <tr>
        <th>Etiqueta</th><th>Valor de referencia</th><th>Mostrar en gráfica</th><th>Activo</th></tr>
      </thead>
      <tbody>
      {foreach from=$indicador->valores_referencia item=item}
      <tr>
        <td><a href="javascript:void(0)" class="boton_editar_referencia" title="Editar valor de referencia" id="l-etiqueta-{$item->id}" value="{$item->etiqueta}">{$item->etiqueta}</a></td>
        <td><a href="javascript:void(0)" class="boton_editar_referencia" title="Editar valor de referencia" id="l-nombre-{$item->id}" value="{$item->nombre}">{$item->nombre}</a></td>
        <td><a href="javascript:void(0)" class="boton_editar_referencia" title="Editar valor de referencia" id="l-grafica-{$item->id}" value="{$item->grafica}">{$item->grafica}</a></td>
        <td><a href="javascript:void(0)" class="boton_editar_referencia" title="Editar valor de referencia" id="l-activo-{$item->id}" value="{$item->activo}">{$item->activo}</a></td>
      </tr>
      {/foreach}
      </tbody>
    </table>
  </div>
</div>
