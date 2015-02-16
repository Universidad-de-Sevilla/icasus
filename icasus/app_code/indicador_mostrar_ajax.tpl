<div style="padding:10px">  
    <p class="label_side">{$smarty.const.TXT_SUBUNID}<b>{$entidad->nombre}</b> {$smarty.const.TXT_SUBUNID_MEDS}:</p>
    {if $mediciones}
        {foreach from=$mediciones item=medicion}
            {$medicion->etiqueta} - {$medicion->medicion_valor}<br/>
        {/foreach}
    {else}
        <p>{$smarty.const.MSG_INDIC_NO_MED}</p>
    {/if}
</div>
<!--
                         <form method="post" action="index.php?page=indicador_mostrar&id_indicador=5087" id="formcrearreferencia" name="formcrearreferencia" class="validate_form">
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
-->
