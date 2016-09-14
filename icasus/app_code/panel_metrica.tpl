{if $modulo == 'inicio'}
    <input type="hidden" name="tipo" value="{$panel->id}">

    <div class="form-group has-feedback">
        <label for="nombre" class="col-sm-2 control-label">{$smarty.const.FIELD_NOMBRE} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
        <div class="col-sm-8">
            <input type='text' class="form-control" name='nombre' id='nombre' placeholder="{$smarty.const.FIELD_NOMBRE}" required/>
            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
            <div class="help-block with-errors"></div>
        </div>
    </div>
    <div class="form-group has-feedback">
        <label for="orden" class="col-sm-2 control-label">{$smarty.const.FIELD_ORDEN} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
        <div class="col-sm-8">
            <input type="number" value="1" id='orden' name="orden" class="form-control" placeholder="{$smarty.const.FIELD_ORDEN}" min='1' data-elementos='{$elementos|@json_encode}' data-validar_igual="validar_igual" data-validar_igual-error="{$smarty.const.ERR_PANEL_VAL_ORDEN}" required/>
            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
            <div class="help-block with-errors"></div>
        </div>
    </div>
    <div class="form-group has-feedback">
        <label for="ancho" class="col-sm-2 control-label">{$smarty.const.FIELD_ANCHO} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
        <div class="col-sm-8">
            <input type="number" value="{$panel->ancho_pred}" id='ancho' name="ancho" class="form-control" placeholder="{$smarty.const.FIELD_ANCHO}" min='3' max="12" required/>
            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
            <div class="help-block with-errors"></div>
        </div>
    </div>

    <div class="form-group">
        <label for="buscar_indicador" class="col-sm-2 control-label">{$smarty.const.FIELD_INDIC}/{$smarty.const.FIELD_DATO} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
        <div class="col-sm-8">
            <input data-id_entidad="{$id_entidad}" class="form-control" placeholder="{$smarty.const.TXT_BUSCAR}" name="buscar_indicador" id="buscar_indicador" type="text">
        </div> 
    </div>

    <div class="form-group has-feedback hidden" id="listado_indicadores"></div>

    <div class="form-group has-feedback hidden" id="subunidades_metrica"></div>

    <div class="form-group has-feedback hidden" id="mediciones_metrica"></div>
{/if}

{if $modulo == 'subunidades_metrica'}
    <label for="id_subunidad" class="col-sm-2 control-label">{$smarty.const.FIELD_SUBUNID} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
    <div class="col-sm-8" style="overflow-y: auto;height: 30vh;">
        <ul class="list-unstyled">
            <div class="radio">
                <label>
                    <input id="id_subunidad" data-id_indicador="{$id_indicador}" class="subunidad_seleccionada_metrica"
                           name="id_subunidad"type="radio" value="0" data-nombre_indicador="{$nombre_indicador}" data-nombre_subunidad="Total" required>
                    {$smarty.const.FIELD_TOTAL}
                </label>
            </div>
            {foreach name=subunidades from=$indicador_subunidades item=item}
                <li>
                    <div class="radio">
                        <label>
                            <input id="id_subunidad" data-id_indicador="{$id_indicador}" class="subunidad_seleccionada_metrica"  name="id_subunidad" type="radio" value="{$item->id_entidad}" required>
                            {$item->entidad->etiqueta}
                        </label>
                    </div>
                </li>
            {/foreach}
        </ul>
        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
        <div class="help-block with-errors"></div>
    </div>
{/if}

{if $modulo == 'mediciones_metrica'}
    <label for="id_medicion" class="col-sm-2 control-label">{$smarty.const.FIELD_MED} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
    <div class="col-sm-8" style="overflow-y: auto;height: 30vh;">
        <ul class="list-unstyled">
            {foreach name=mediciones from=$mediciones item=item}
                <li>
                    <div class="radio">
                        <label>
                            <input id="id_medicion" data-id_indicador="{$id_indicador}" class="medicion" name="id_medicion" type="radio" value="{$item->id}" required>
                            {$item->etiqueta}
                        </label>
                    </div>
                </li>
            {/foreach}
        </ul>
        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
        <div class="help-block with-errors"></div>
    </div>
{/if}

{literal}
    <script>
        var page = {/literal}"{$panel->clase_css}"{literal};
        $('.medicion').on('click', function () {
            $('#footer_tabs').removeClass('hidden');
        });
        $('.subunidad_seleccionada_metrica').on('click', function () {
            var id_indicador = $(this).data('id_indicador');
            $("#mediciones_metrica").removeClass('hidden');
            $.ajax({
                url: "index.php?page=" + page + "&ajax=true&modulo=mediciones_metrica&id_indicador="
                        + id_indicador,
                success: function (datos) {
                    $("#mediciones_metrica").html(datos);
                }
            });
        });
        $('#buscar_indicador').on('keyup', function () {
            $('#listado_indicadores').removeClass('hidden');
            var cadena = $(this).val();
            var id_entidad = $(this).data('id_entidad');
            $.ajax({
                url: "index.php?page=panel_buscador&ajax=true&modulo=indicador_metrica&id_entidad=" + id_entidad + "&cadena=" + cadena,
                success: function (datos) {
                    $('#listado_indicadores').html(datos);
                }
            });
        });
    </script>
{/literal}