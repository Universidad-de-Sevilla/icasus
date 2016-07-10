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
    <label for="id_subunidad" class="col-sm-2 control-label">{$smarty.const.FIELD_UNID}</label>
    <div class="col-sm-8">
        <select id="id_subunidad" name="id_subunidad" class="form-control chosen-select" required>
            <option value="0">{$smarty.const.FIELD_TOTAL}</option>
            {foreach $subunidades as $subunidad}
                <option value="{$subunidad->id}">{$subunidad->etiqueta}</option>
            {/foreach}
        </select>
    </div>
</div>

<div id="content_buscador_indicadores_complementarios" class="form-group">
    <label for="buscar_indicador_complementario" class="col-sm-2 control-label">{$smarty.const.FIELD_INDICS}/{$smarty.const.FIELD_DATOS} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
    <div class="col-sm-8">
        <input data-id_entidad="{$id_entidad}" class="form-control" placeholder="{$smarty.const.TXT_BUSCAR}" name="buscar_indicador_complementario" id="buscar_indicador_complementario" type="text">
    </div> 
</div>

<div id="indicadores_complementarios" class="form-group hidden">
    <div class="col-sm-8  col-sm-offset-2">
        <table class="table table-striped table-hover table-bordered" id="content_indicadores_complementarios">
        </table>
    </div>
</div>

<div class="form-group hidden" id="listado_indicadores_complementarios"></div>

<script>
    //lista los indicadores para seleccionar los complementarios
    $('#buscar_indicador_complementario').on('keyup', function () {
        $('#listado_indicadores_complementarios').removeClass('hidden');
        var cadena = $(this).val();
        var id_entidad = $(this).data('id_entidad');
        $.ajax({
            url: "index.php?page=panel_buscador&ajax=true&modulo=indicadores_barra_complementarios&id_entidad=" + id_entidad + "&cadena=" + cadena,
            success: function (datos) {
                $('#listado_indicadores_complementarios').html(datos);
            }
        });
    });
    //incrementa los indicadores complementarios
    $('#wrapper').on('click', '.indicador_complementario_seleccionado_barra', function () {
        $('#indicadores_complementarios').removeClass('hidden');
        $('#footer_tabs').removeClass('hidden');
        var id_indicador = $(this).data('id_indicador');
        var nombre_indicador = $(this).data('nombre_indicador');
        $('#content_indicadores_complementarios').append('<tr class="ric"><td><input type="hidden" name="id_indicadores[]" value="' + id_indicador + '"> ' + nombre_indicador +
                '</td><td class="text-center"><a href="#" title="Quitar" class="remove_indicador_complementario"><i class="fa fa-times fa-fw"></i></a></td></tr>');
    });
    //elimina el indicador complementario. Si no quedan complementarios se borra el pie
    $('#wrapper').on('click', '.remove_indicador_complementario', function (e) {
        e.preventDefault();
        $(this).parent().parent('.ric').remove();
        if ($('.ric').length === 0) {
            $('#indicadores_complementarios').addClass('hidden');
            $('#footer_tabs').addClass('hidden');
        }
    });
    //Chosen selects (añade búsqueda a los html select)
    $(".chosen-select").chosen({
        disable_search_threshold: 10,
        no_results_text: "Oops, no se encuentran registros coincidentes"
    });
</script>