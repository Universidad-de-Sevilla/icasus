{if $modulo == 'inicio'}
    <input type="hidden" name="tipo" value="{$panel->id}">
    <input type="hidden" name="id_medicion" value="0">
    <input type="hidden" name="inicioMonth" value="01">
    <input type="hidden" name="finMonth" value="12">
    <input type="hidden" name="inicioDay" value="01">
    <input type="hidden" name="finDay" value="31">

    <!-- popup subunidades  -->
    <div id="dialog_subunidades" style="display:none">
        <div class="block" style="opacity: 1;" >
            <div id="lista_subunidades" class="section" style="padding:20px">
            </div>
        </div>
    </div>

    <fieldset class="label_side">
        <label>{$smarty.const.FIELD_NOMBRE}</label>
        <div>
            <input class="required text" type="text" name="nombre">
            <div class="required_tag tooltip hover left"></div>
        </div>
    </fieldset>

    <fieldset class="label_side">
        <label>{$smarty.const.FIELD_ORDEN}</label>
        <div class="clearfix">
            <div class="col_25">
                <input class="text required" type="text" name="orden">
            </div>
            <div class="required_tag tooltip hover left"></div>
        </div>
    </fieldset>

    <fieldset class="label_side">
        <label>{$smarty.const.FIELD_ANCHO}<span></span></label>
        <div class="clearfix">
            <select name="ancho" class="required">
                {section start=2 loop=17 name="size"}
                    <option value="{$smarty.section.size.index}"
                            {if $smarty.section.size.index == $panel->ancho_pred} selected="selected"{/if} >
                        {$smarty.section.size.index}</option> 
                    {/section}
            </select>
            <div class="required_tag tooltip hover left"></div>
        </div>
    </fieldset>

    <fieldset class="label_side">
        <label>{$smarty.const.FIELD_PERIOD}</label>
        <div>
            <select name="periodicidad">
                <option value="anual">{$smarty.const.TXT_ANUAL}</option>
                <option value="mensual">{$smarty.const.TXT_MENSUAL}</option>
            </select>
        </div>
    </fieldset>

    <fieldset class="label_side">
        <label>{$smarty.const.FIELD_FECHA_INIC}<span></span></label>
        <div>
            {html_select_date prefix="inicio" class="required" year_empty=" "
    display_months=FALSE display_days=FALSE start_year=($smarty.now|date_format:"%Y")-10
    end_year=$smarty.now|date_format:"%Y"}
            <div class="required_tag tooltip hover left"></div>
        </div>
    </fieldset>

    <fieldset class="label_side" id="div_fecha_fin"> </fieldset>

    <fieldset class="label_side">
        <label>{$smarty.const.FIELD_INDICS}<span></span></label>
        <div class="clearfix">
            <table class="static" id="indicadores_subunidades_seleccionados">
            </table>
            <div class="required_tag tooltip hover left"></div>
        </div>
    </fieldset>

    <fieldset class="label_side">
        <label><span></span></label>
        <div class="clearfix">
            <div class="col_25">
                <input data-id_entidad="{$id_entidad}"class="text" placeholder="{$smarty.const.TXT_BUSCAR}" name="buscar_indicador" id="buscar_indicador" type="text">
            </div>
        </div>
        <div id="listado_indicadores" > </div>
    </fieldset>
{/if} <!-- modulo == inicio -->

{if $modulo == 'fecha_fin'}
    <label>{$smarty.const.FIELD_FECHA_FIN}<span></span></label>
    <div>
        {html_select_date prefix="fin" class="required" display_months=FALSE display_days=FALSE start_year=$fecha_inicio end_year=$smarty.now|date_format:"%Y"}
        <div class="required_tag tooltip hover left"></div>
    </div>
{/if}

{if $modulo == 'subunidades'}
    <div class="clearfix">
        <div class="col_50">
            <input data-id_indicador="{$id_indicador}" class="subunidad_seleccionada"
                   name="id_subunidad"type="radio" value="0" data-nombre_indicador="{$nombre_indicador}"data-nombre_subunidad="Total"> {$smarty.const.FIELD_TOTAL}<br /> 
            {foreach name=subunidades from=$indicador_subunidades item=item}
                {if $smarty.foreach.subunidades.iteration == floor($indicador_subunidades|@count/2)+1 }
                </div><div class="col_50 no_border">
                {/if}
                <input data-id_indicador="{$id_indicador}" class="subunidad_seleccionada"
                       name="id_subunidad"
                       type="radio" value="{$item->id_entidad}" 
                       data-nombre_indicador="{$nombre_indicador}"
                       data-nombre_subunidad="{$item->entidad->etiqueta}"> 
                {$item->entidad->etiqueta}<br /> 
            {/foreach}
        </div>
        <div class="required_tag tooltip hover left"></div>
    </div>
    {literal}
        <script>
            $('#main_container').on('click', '.remove_seleccion', function (e) {
                e.preventDefault();
                $(this).parents('.fila_borrar').remove();
                if ($('.remove_seleccion').length === 0) {
                    $('#footer_tabs').hide();
                }
            });
            $('.subunidad_seleccionada').on('click', function () {
                var id_subunidad = $(this).val();
                var id_indicador = $(this).data('id_indicador');
                var indicador = $(this).data('nombre_indicador');
                var subunidad = $(this).data('nombre_subunidad');
                $('#indicadores_subunidades_seleccionados').append('<tr class="fila_borrar">' +
                        '<td>' +
                        '<a class="remove_seleccion" href="#">X</a>' +
                        '</td>' +
                        '<td><input type="hidden" name="id_indicadores[]" value="' + id_indicador + '">' + indicador +
                        '</td>' +
                        '<td><input type="hidden" name="id_subunidades[]" value="' + id_subunidad + '">' + subunidad +
                        '</td></tr>');
                $('#dialog_subunidades').dialog('close');
                $('#footer_tabs').show();
            });
        </script>
    {/literal}
{/if} <!-- modulo == subunidades -->

{literal}
    <script>
        var page = {/literal}"{$panel->clase_css}"{literal};
        $(document).ready(function () {
            $('select[name="inicioYear"]').on('change', function () {
                var fecha_inicio = $(this).val();
                $.ajax({
                    url: "index.php?page=" + page + "&ajax=true&modulo=fecha_fin&fecha_inicio=" + fecha_inicio,
                    success: function (datos) {
                        $("#div_fecha_fin").html(datos);
                    }
                });
            });

            $('#main_container').on('click', '.indicador_seleccionado_linea', function () {
                var id_indicador = $(this).data('id_indicador');
                var nombre_indicador = $(this).data('nombre_indicador');
                $.ajax({
                    url: "index.php?page=" + page + "&ajax=true&modulo=subunidades&id_indicador="
                            + id_indicador + "&nombre_indicador=" + nombre_indicador,
                    success: function (datos) {
                        $("#lista_subunidades").html(datos);
                    }
                });
                $('#dialog_subunidades').dialog({
                    autoOpen: true, modal: true, title: nombre_indicador, width: 500
                });
            });

            $('#buscar_indicador').on('keyup', function () {
                var cadena = $(this).val();
                var id_entidad = $(this).data('id_entidad');
                $('#subunidades').html('');
                $.ajax({
                    url: "index.php?page=panel_buscador&ajax=true&modulo=indicadores_linea&id_entidad=" + id_entidad + "&cadena=" + cadena,
                    success: function (datos) {
                        $('#listado_indicadores').html(datos);
                    }
                });
            });
        });
    </script>
{/literal}
