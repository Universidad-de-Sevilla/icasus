{if $modulo == 'inicio'}
    <input type="hidden" name="id_medicion" value="0">
    <input type="hidden" name="tipo" value="{$panel->id}">
    <input type="hidden" name="inicioDay" value="01">
    <input type="hidden" name="inicioMonth" value="01">
    <input type="hidden" name="finDay" value="31">
    <input type="hidden" name="finMonth" value="12">

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
            <input type="number" value="{$panel->ancho_pred}" id='ancho' name="ancho" class="form-control" placeholder="{$smarty.const.FIELD_ANCHO}" min='3' max="12" required/>
            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
            <div class="help-block with-errors"></div>
        </div>
    </div>
    <div class="form-group has-feedback">
        <label for="anyos_atras" class="col-sm-2 control-label">{$smarty.const.TXT_PANEL_ANYOS_ATRAS} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
        <div class="col-sm-8">
            <input type="number" value="5" name="anyos_atras" id='anyos_atras' class="form-control" placeholder="{$smarty.const.TXT_PANEL_ANYOS_ATRAS}" min='2' max="10" required/>
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

    <div class="form-group has-feedback hidden" id="subunidades"></div>
{/if}

{if $modulo == 'fecha_fin'}
    {html_select_date prefix="fin" all_extra="class='form-control chosen-select'id='fin'" display_months=FALSE display_days=FALSE start_year=$fecha_inicio end_year=$smarty.now|date_format:"%Y"}
{/if}

{if $modulo == 'subunidades'}
    <label for="id_subunidad" class="col-sm-2 control-label">{$smarty.const.FIELD_SUBUNID} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
    <div class="col-sm-8" style="overflow-y: auto;height: 30vh;">
        <ul class="list-unstyled">
            <div class="radio">
                <label>
                    <input id="id_subunidad" data-id_indicador="{$id_indicador}" class="subunidad_seleccionada"
                           name="id_subunidades[]" type="radio" value="0" data-nombre_indicador="{$nombre_indicador}" data-nombre_subunidad="Total" required>
                    {$smarty.const.FIELD_TOTAL}
                </label>
            </div>
            {foreach name=subunidades from=$indicador_subunidades item=item}
                <li>
                    <div class="radio">
                        <label>
                            <input id="id_subunidad" data-id_indicador="{$id_indicador}" class="subunidad_seleccionada" name="id_subunidades[]" type="radio" value="{$item->id_entidad}" required>
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
{literal}
    <script>
        var page = {/literal}"{$panel->clase_css}"{literal};
        $(document).ready(function () {
            $('.subunidad_seleccionada').on('click', function () {
                if ($('.subunidad_seleccionada:checked').length < 1) {
                    $('#footer_tabs').addClass('hidden');
                }
                else {
                    $('#footer_tabs').removeClass('hidden');
                }
            });
            $('#buscar_indicador').on('keyup', function () {
                $('#listado_indicadores').removeClass('hidden');
                var cadena = $(this).val();
                var id_entidad = $(this).data('id_entidad');
                $('#subunidades').html('');
                $.ajax({
                    url: "index.php?page=panel_buscador&ajax=true&modulo=indicador_subunidades&id_entidad=" + id_entidad + "&cadena=" + cadena,
                    success: function (datos) {
                        $('#listado_indicadores').html(datos);
                    }
                });
            });
            //Chosen selects (añade búsqueda a los html select)
            $(".chosen-select").chosen({
                disable_search_threshold: 100,
                no_results_text: "Oops, no se encuentran registros coincidentes"
            });
        });
    </script>
{/literal}