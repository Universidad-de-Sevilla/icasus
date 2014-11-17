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

{literal}
    <script>
        $(document).ready(function () {
            $('.entrada_valor').on('keyup', function () {
                var entrada = $(this);
                var id_valor = entrada.data('id_valor');
                var id_entidad = entrada.data('id_entidad');
                var id_usuario = entrada.data('id_usuario');
                var valor_parcial = entrada.val();
                $.ajax({
                    type: "GET",
                    data: {ajax: true, valor_parcial: valor_parcial, id_valor: id_valor, id_entidad: id_entidad, id_usuario: id_usuario},
                    url: "index.php?page=datos_rebiun_grabar",
                    success: function (resultado) {
                        if (resultado === valor_parcial)
                        {
                            entrada.css("color", "#02A202");
                            entrada.css("border", "1px solid #02A202");
                            console.log("OK");
                        }
                        else
                        {
                            entrada.css("color", "red");
                            entrada.css("border", "1px solid red");
                        }
                        console.log(id_valor + "-" + id_entidad + "-" + id_usuario + "-" + valor_parcial);
                        console.log(resultado);
                    }
                });
            });
        });
    </script>
{/literal}
