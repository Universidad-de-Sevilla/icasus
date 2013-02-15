<form name="datos_directos" id="datos_directos" action="index.php?page=datos_rebiun_grabar" method="post" class="validate_form">
  <input type="hidden" name="id_usuario" value="{$id_usuario}" />
	<div style="opacity: 1;" class="box tabs" id="tab_entidades">
		<ul class="tab_header">
      {foreach $entidades as $entidad}
			<li><a href="#{$entidad->etiqueta}" >{$entidad->etiqueta}</a></li>
      {/foreach}
		</ul>
    {foreach $entidades as $entidad}
      <div style="opacity: 1;" id="{$entidad->etiqueta}" class="block ui-tabs-panel ui-widget-content ui-corner-bottom">
        {foreach $mediciones as $medicion}
          {if $smarty.foreach.medicion.iteration % 2 == 1}<div class="columns clearfix">{/if}
          <div class="col_50">
            <fieldset>
              <label>{$medicion->indicador->nombre}</label>
              <div>
              <input type="input" name="valor" id="valor" class="number" /></p>
              <input type="hidden" name="id_medicion" id="id_medicion" value="{$medicion->id}" /></p>
              <input type="hidden" name="id_entidad" value="{$entidad->id}" />
              </div>
            </fieldset>
          </div>
          {if $smarty.foreach.medicion.iteration % 2 == 0}</div><!-- fin columns clearfix -->{/if}
        {/foreach}
        {if $smarty.foreach.medicion.iteration.last}
          <div class="button_bar clearfix">
            <button class="green" type="submit" value="Grabar" name="proceso_submit">
            <span>Grabar</span>
            </button>
          </div>
        {/if}
    {/foreach}
	</div><!--fin id=$entidad->etiqueta -->
</form>

{literal}
<script>
$(document).ready(function(){
	$('.subunidad').on('click',function(){
		var indicador = $(this).data('indicador');
		var entidad = $(this).val();
		$.ajax({
			url: "index.php?page=medicion_crear_ajax&ajax=true&id_indicador="+indicador+"r&id_entidad="+entidad
		});
	});
});
</script>
{/literal}
