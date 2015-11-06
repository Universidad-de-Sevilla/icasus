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

    <div class="col-sm-8 col-sm-offset-2 hidden" id="listado_indicadores" style="overflow-y: scroll;height: 40vh;"></div>

    <div class="col-sm-8 col-sm-offset-2 hidden" id="subunidades_metrica" style="overflow-y: scroll;height: 40vh;"></div>

    <div class="col-sm-8 col-sm-offset-2 hidden" id="mediciones_metrica" style="overflow-y: scroll;height: 40vh;"></div>
{/if}

{if $modulo == 'subunidades_metrica'}
    <label>{$smarty.const.FIELD_SUBUNID}<span></span></label>
    <div class="clearfix">
        <div class="col_50">
            <input data-id_indicador="{$id_indicador}" class="required subunidad_seleccionada_metrica"
                   name="id_subunidad"type="radio" value="0" data-nombre_indicador="{$nombre_indicador}"data-nombre_subunidad="Total"> {$smarty.const.FIELD_TOTAL}<br /> 
            {foreach name=subunidades from=$indicador_subunidades item=item}
                {if $smarty.foreach.subunidades.iteration == floor($indicador_subunidades|@count/2)+1 }</div><div class="col_50 no_border">{/if}
                <input data-id_indicador="{$id_indicador}" class="required subunidad_seleccionada_metrica"  name="id_subunidad" type="radio" value="{$item->id_entidad}"> {$item->entidad->etiqueta}<br /> 
            {/foreach}
        </div>
        <div class="required_tag tooltip hover left"></div>
    </div>
{/if}

{if $modulo == 'mediciones_metrica'}
    <label>{$smarty.const.FIELD_FECHA}<span></span></label>
    <div class="clearfix">
        <div class="col_50">
            {foreach name=mediciones from=$mediciones item=item}
                {if $smarty.foreach.mediciones.iteration == floor($mediciones|@count/2)+2}</div><div class="col_50 no_border">{/if}
                <input data-id_indicador="{$id_indicador}" class="required medicion" name="id_medicion" type="radio" value="{$item->id}"> {$item->etiqueta}<br /> 
            {/foreach}
        </div>
        <div class="required_tag tooltip hover left"></div>
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
            $('#subunidades').html('');
            $.ajax({
                url: "index.php?page=panel_buscador&ajax=true&modulo=indicador_metrica&id_entidad=" + id_entidad + "&cadena=" + cadena,
                success: function (datos) {
                    $('#listado_indicadores').html(datos);
                }
            });
        });
    </script>
{/literal}