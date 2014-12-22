{if $modulo == 'inicio'}
    <input type="hidden" name="id_medicion" value="0">
    <input type="hidden" name="tipo" value="{$panel->id}">
    <input type="hidden" name="inicioDay" value="01">
    <input type="hidden" name="inicioMonth" value="01">
    <input type="hidden" name="finDay" value="31">
    <input type="hidden" name="finMonth" value="12">
    <fieldset class="label_side top">
        <label>{$smarty.const.FIELD_NOMBRE}</label>
        <div>
            <input class="required text" type="text" name="nombre"></input>
            <div class="required_tag tooltip hover left"></div>
        </div>
    </fieldset>

    <fieldset class="label_side top">
        <label>{$smarty.const.FIELD_ORDEN}</label>
        <div class="clearfix">
            <div class="col_25">
                <input class="text required" type="text" name="orden"></input>
            </div>
            <div class="required_tag tooltip hover left"></div>
        </div>
    </fieldset>

    <fieldset class="label_side top">
        <label>{$smarty.const.FIELD_ANCHO}<span></span></label>
        <div class="clearfix">
            <select name="ancho" class="required">
                {section start=2 loop=17 name="size"}
                    <option value="{$smarty.section.size.index}"
                            {if $smarty.section.size.index == $panel->ancho_pred}selected="selected"{/if} >
                        {$smarty.section.size.index}</option>
                    {/section}
            </select>
            <div class="required_tag tooltip hover left"></div>
        </div>
    </fieldset>

    <fieldset class="label_side top">
        <label>{$smarty.const.FIELD_PERIODO}<span></span></label>
        <div class="clearfix">
            <div class="col_50">
                {html_select_date prefix="inicio" class="required" year_empty="Fecha de incio" display_months=FALSE display_days=FALSE start_year=($smarty.now|date_format:"%Y")-10 end_year=$smarty.now|date_format:"%Y"}
                <div class="required_tag tooltip hover left"></div>
            </div>
            <div class="col_50" id="div_fecha_fin">
            </div>
        </div>
    </fieldset>

    <fieldset class="label_side top fieldset_indicadores">
        <label>{$smarty.const.FIELD_INDICS}<span></span></label>
        <div class="clearfix">
            <div class="col_25">
                <input data-id_entidad="{$id_entidad}"class="text" placeholder="{$smarty.const.TXT_BUSCAR}" name="buscar_indicador" id="buscar_indicador" type="text">
            </div>
        </div>
        <div id="listado_indicadores">
        </div>
    </fieldset>

    <fieldset id="subunidades" class="label_side top">
    </fieldset>
{/if}
{if $modulo == 'fecha_fin'}
    {html_select_date prefix="fin" class="required" display_months=FALSE display_days=FALSE start_year=$fecha_inicio end_year=$smarty.now|date_format:"%Y"}

{/if}
{if $modulo == 'subunidades'}
    <label>{$smarty.const.FIELD_SUBUNIDS}<span></span></label>
    <div class="clearfix">
        <div class="col_50">
            <input data-id_indicador="{$id_indicador}"class="required subunidad_seleccionada"  name="id_subunidades[]"type="checkbox" value="0"> {$smarty.const.FIELD_TOTAL}<br /> 
            {foreach name=subunidades from=$indicador_subunidades item=item}
                {if $smarty.foreach.subunidades.iteration == floor($indicador_subunidades|@count/2)+1 }</div><div class="col_50 no_border">{/if}
                <input data-id_indicador="{$id_indicador}"class="subunidad_seleccionada"  name="id_subunidades[]"type="checkbox" value="{$item->id_entidad}"> {$item->entidad->etiqueta}<br /> 
            {/foreach}
        </div>
        <div class="required_tag tooltip hover left"></div>
    </div>
{/if}
{literal}
    <script>
    var page = {/literal}"{$panel->clase_css}"{literal};
    $(document).ready(function () {
        $('.subunidad_seleccionada').on('click', function () {
            if ($('.subunidad_seleccionada:checked').length < 1) {
                $('#footer_tabs').hide();
            }
            else {
                $('#footer_tabs').show();
            }
        });
        $('select[name="inicioYear"]').on('change', function () {
            var fecha_inicio = $(this).val();
            $.ajax({
                url: "index.php?page=" + page + "&ajax=true&modulo=fecha_fin&fecha_inicio=" + fecha_inicio,
                success: function (datos) {
                    $("#div_fecha_fin").html(datos);
                }
            });
        });
        $('#buscar_indicador').on('keyup', function () {
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
    });
    </script>
{/literal}

