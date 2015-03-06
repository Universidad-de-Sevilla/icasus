<style>
    table.static tbody tr td input {
        margin: 10px 0;
        height: 20px;
        line-height: 20px;
        float:none;
    }
</style>
<div class="button_bar clearfix">
    <a href="index.php?page=dato_listar&id_entidad=14">{$smarty.const.TXT_VOLVER_LIST}</a>
</div>
<form name="datos_directos" id="datos_directos" action="index.php?page=datos_rebiun_grabar" method="post" class="validate_form">
    <input type="hidden" name="id_usuario" value="{$id_usuario}" />
    <div style="opacity: 1;" class="box tabs" id="tab_entidades">
        <ul class="tab_header">
            {foreach $entidades as $entidad}
                <li><a href="#{$entidad->etiqueta|replace:' ':'_'}" >{$entidad->etiqueta}</a></li>
                {/foreach}
        </ul>
        {foreach $entidades as $entidad}
            <div style="opacity: 1;" id="{$entidad->etiqueta|replace:' ':'_'}" class="block ui-tabs-panel ui-widget-content ui-corner-bottom">
                <table class="static">
                    <tbody>
                        {foreach $entidad->valores as $valor}
                            <tr>
                                <td>
                                    <input type="input" name="valor" id="valor" class="entrada_valor number" 
                                           value="{$valor->valor_parcial}"
                                           data-id_valor = "{$valor->id}"
                                           data-id_entidad = "{$entidad->id}"
                                           data-id_usuario = "{$id_usuario}"  
                                           style="width:40px;" />
                                </td>
                                <td><b>{$valor->indicador->nombre}</b> ({$valor->medicion->etiqueta})
                                    <br><span style="font-size:0.9em;">{$valor->indicador->descripcion}</span>
                                </td>
                            </tr>
                        {/foreach}
                    </tbody>
                </table>
            </div><!-- fin div entidad->etiqueta -->
        {/foreach}
        <div class="button_bar clearfix" id="footer_tabs">
            <a href="index.php?page=dato_listar&id_entidad=14">{$smarty.const.TXT_VOLVER_LIST}</a>
        </div>
    </div><!--fin #tab_entidades -->
</form>

<script src="js/datos_rebiun.js" type="text/javascript"></script>

