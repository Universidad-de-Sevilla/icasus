<!-- Cuadro de dialogo oculto para crear nuevo valor de referencia -->
<div class="display_none">
	<div id="crear_referencia" class="dialog_content narrow " title="Nueva referencia">
     <div class="block">
       <form method="post" action="" id="formcrearreferencia" name="formcrearreferencia" class="validate_form">
        <fieldset class="label_side">
          <label>Etiqueta</label>
          <div><b><input  type='text' name='c-etiqueta' value="" class="text required"/></b><div class="required_tag"></div></div>
        </fieldset>
        <fieldset class="label_side">
          <label>Nombre</label>
          <div><b><input  type='text' name='c-nombre' value="" class="text required"/></b><div class="required_tag"</div>
        </fieldset>
        <fieldset class="label_side">
          <label>Visible en gráfica</label>
          <div><b><input  type='radio' name='c-grafica' value="1" class="required" checked/> Sí <input  type='radio' name='c-grafica' value="0" class="required"/>No</b><div class="required_tag"></div></div>
        </fieldset>
        <fieldset class="label_side">
          <label>Activo</label>
          <div><b><input  type='radio' name='c-activo' value="1" checked class="required"/> Sí <input  type='radio' name='c-activo' value="0" class="required"/>No</b><div class="required_tag"></div></div>
        </fieldset>
          <input type="hidden"  name="c-id_indicador" value="{$indicador->id}"/>
          <div class="button_bar clearfix">
            <button class="green" type="button" value="Grabar" name="valor_nuevo_crear" id="valor_nuevo_crear">
            <span>Grabar</span>
            </button>
          </div>
        </form>
     </div>
	</div>
</div>

<!-- Cuadro de dialogo oculto para editar valor de referencia -->
<div class="display_none">
	<div id="editar_referencia" class="dialog_content narrow " title="Editar referencia">
     <div class="block">
        <form method="post" action="" id="formeditarreferencia" name="formeditarreferencia" class="validate_form">
          <fieldset class="label_side">
            <label>Etiqueta</label>
            <div><b><input  type='text' id="e-etiqueta" name='e-etiqueta' value='' class="text required" /></b><div class="required_tag"></div></div>
          </fieldset>
          <fieldset class="label_side">
            <label>Nombre</label>
            <div><b><input  type='text' id="e-nombre" name='e-nombre' value='' class="text required" /></b><div class="required_tag"></div></div>
          </fieldset>
          <fieldset class="label_side">
            <label>Visible en gráfica</label>
            <div><b><input  type='radio' name='e-grafica' id="e-grafica-1" value="1" class="required"/> Sí <input  type='radio' name='e-grafica' id="e-grafica-0"  value="0" class="required"/>No</b><div class="required_tag"></div></div>
          </fieldset>
          <fieldset class="label_side">
            <label>Activo</label>
            <div><b><input  type='radio' name='e-activo' id="e-activo-1" value="1" class="required" /> Sí <input  type='radio' name='e-activo' id="e-activo-0" value="0" class="required"/>No</b><div class="required_tag"></div></div>
          </fieldset>
          <input type="hidden"  name="e-id_indicador" value="{$indicador->id}"/>
          <div class="button_bar clearfix">
            <button class="green" type="button" value="Grabar" name="valor_editar" id="valor_editar">
            <span>Grabar</span>
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>

<div class="box grid_16">
  <div class="button_bar clearfix">
    <a href="index.php?page={$tipo}_mostrar&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}"><img src ="/icons/ff16/chart_curve.png"> Volver al {$tipo}</a>
    <a href='javascript:void(0)' class="dialog_button" data-dialog="crear_referencia" ><img src='/icons/ff16/tag.png' /> Crear nuevos valores de referencia</a> &nbsp;
  </div>
  <div id="dt1" class="no_margin">
    <table class='static'>
      <thead>
        <tr>
        <th>Etiqueta</th><th>Valor de referencia</th><th>Mostrar en gráfica</th><th>Activo</th></tr>
      </thead>
      <tbody>
      {foreach from=$indicador->valores_referencia item=item}
      <tr class="gradeX">
        <td><a href="javascript:void(0)" data-dialog="editar_referencia" class="dialog_button " title="Editar valor de referencia" id="l-etiqueta-{$item->id}" value="{$item->etiqueta}">{$item->etiqueta|htmlentities}</a></td>
        <td><a href="javascript:void(0)" data-dialog="editar_referencia" class="dialog_button " title="Editar valor de referencia" id="l-nombre-{$item->id}" value="{$item->nombre}">{$item->nombre|htmlentities}</a></td>
        <td><a href="javascript:void(0)" data-dialog="editar_referencia" class="dialog_button " title="Editar valor de referencia" id="l-grafica-{$item->id}" value="{$item->grafica}">{$item->grafica}</a></td>
        <td><a href="javascript:void(0)" data-dialog="editar_referencia" class="dialog_button " title="Editar valor de referencia" id="l-activo-{$item->id}" value="{$item->activo}">{$item->activo}</a></td>
      </tr>
      {/foreach}
      </tbody>
    </table>
  </div>
</div>
