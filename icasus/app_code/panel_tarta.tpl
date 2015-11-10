{if $modulo == 'inicio'}
    <input type="hidden" name="tipo" value="{$panel->id}">
    <input type="hidden" name="inicioYear" value="0000">
    <input type="hidden" name="finYear" value="0000">
    <input type="hidden" name="inicioMonth" value="00">
    <input type="hidden" name="finMonth" value="00">
    <input type="hidden" name="inicioDay" value="00">
    <input type="hidden" name="finDay" value="00">

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
            <input type="number" value="1" id='orden' name="orden" class="form-control" placeholder="{$smarty.const.FIELD_ORDEN}" min='1' required/>
            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
            <div class="help-block with-errors"></div>
        </div>
    </div>
    <div class="form-group has-feedback">
        <label for="ancho" class="col-sm-2 control-label">{$smarty.const.FIELD_ANCHO} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
        <div class="col-sm-8">
            <input type="number" value="{$panel->ancho_pred}" id='ancho' name="ancho" class="form-control" placeholder="{$smarty.const.FIELD_ANCHO}" min='2' max="12" required/>
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

    <div class="form-group has-feedback hidden" id="mediciones_tarta"></div>
{/if}

{if $modulo == 'mediciones_tarta'}
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
        $(document).ready(function () {
            $('.medicion').on('click', function () {
                $('#footer_tabs').removeClass('hidden');
            });
            $('#buscar_indicador').on('keyup', function () {
                $('#listado_indicadores').removeClass('hidden');
                var cadena = $(this).val();
                var id_entidad = $(this).data('id_entidad');
                $.ajax({
                    url: "index.php?page=panel_buscador&ajax=true&modulo=indicador_tarta&id_entidad=" + id_entidad + "&cadena=" + cadena,
                    success: function (datos) {
                        $('#listado_indicadores').html(datos);
                    }
                });
            });
        });
    </script>
{/literal}