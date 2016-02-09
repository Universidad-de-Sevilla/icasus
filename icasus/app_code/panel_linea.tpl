<!-- Diálogo Subunidades -->
<div class="modal fade" id="dialogo_subunidades" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel"><span></span> ({$smarty.const.FIELD_SUBUNIDS})</h3>
            </div>
            <div class="modal-body">
                <div class="row" id="lista_subunidades"></div>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Subunidades -->

{if $modulo == 'inicio'}
    <input type="hidden" name="tipo" value="{$panel->id}">
    <input type="hidden" name="id_medicion" value="0">
    <input type="hidden" name="inicioMonth" value="01">
    <input type="hidden" name="finMonth" value="12">
    <input type="hidden" name="inicioDay" value="01">
    <input type="hidden" name="finDay" value="31">

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
    <div class="form-group">
        <label for="periodicidad" class="col-sm-2 control-label">{$smarty.const.FIELD_PERIOD}</label>
        <div class="col-sm-8">
            <select class="form-control chosen-select" name="periodicidad" id='periodicidad'>
                <option value="anual">{$smarty.const.TXT_ANUAL}</option>
                <option value="mensual">{$smarty.const.TXT_MENSUAL}</option>     
            </select>
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
        <label for="buscar_indicador" class="col-sm-2 control-label">{$smarty.const.FIELD_INDICS}/{$smarty.const.FIELD_DATOS} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
        <div class="col-sm-8">
            <input data-id_entidad="{$id_entidad}" class="form-control" placeholder="{$smarty.const.TXT_BUSCAR}" name="buscar_indicador" id="buscar_indicador" type="text">
        </div> 
    </div>

    <div id="indicadores_subunidades" class="form-group hidden">
        <div class="col-sm-8  col-sm-offset-2">
            <table class="table table-striped table-hover table-bordered" id="indicadores_subunidades_seleccionados">
            </table>
        </div>
    </div>

    <div class="form-group has-feedback hidden" id="listado_indicadores"></div>
{/if} 
<!-- /modulo == inicio -->

{if $modulo == 'subunidades'}
    <ul class="list-unstyled">
        <div class="col-sm-6">
            <li>
                <input data-id_indicador="{$id_indicador}" class="subunidad_seleccionada"
                       name="id_subunidad"type="radio" value="0" data-nombre_indicador="{$nombre_indicador}" data-nombre_subunidad="{$smarty.const.FIELD_TOTAL}"> {$smarty.const.FIELD_TOTAL}
            </li>
            {foreach name=subunidades from=$indicador_subunidades item=item}
                {if $smarty.foreach.subunidades.iteration == floor($indicador_subunidades|@count/2)+1 }
                </div><div class="col-sm-6">
                {/if}
                <li>
                    <input data-id_indicador="{$id_indicador}" class="subunidad_seleccionada"
                           name="id_subunidad"
                           type="radio" value="{$item->id_entidad}" 
                           data-nombre_indicador="{$nombre_indicador}"
                           data-nombre_subunidad="{$item->entidad->etiqueta}"> 
                    {$item->entidad->etiqueta}
                </li>
            {/foreach}
        </div>
    </ul>
    {literal}
        <script>
            $('#wrapper').on('click', '.remove_seleccion', function (e) {
                e.preventDefault();
                $(this).parents('.fila_borrar').remove();
                if ($('.remove_seleccion').length === 0) {
                    $('#indicadores_subunidades').addClass('hidden');
                    $('#footer_tabs').addClass('hidden');
                }
            });
            $('.subunidad_seleccionada').on('click', function () {
                var id_subunidad = $(this).val();
                var id_indicador = $(this).data('id_indicador');
                var indicador = $(this).data('nombre_indicador');
                var subunidad = $(this).data('nombre_subunidad');
                $('#indicadores_subunidades').removeClass('hidden');
                $('#indicadores_subunidades_seleccionados').append('<tr class="fila_borrar">' +
                        '<td><input type="hidden" name="id_indicadores[]" value="' + id_indicador + '">' + indicador +
                        '</td>' +
                        '<td><input type="hidden" name="id_subunidades[]" value="' + id_subunidad + '">' + subunidad +
                        '</td>' +
                        '<td class="text-center">' +
                        '<a class="remove_seleccion" title="Quitar" href="#"><i class="fa fa-times fa-fw"></i></a>' +
                        '</td></tr>');
                $('#dialogo_subunidades').modal('hide');
                $('#footer_tabs').removeClass('hidden');
            });
        </script>
    {/literal}
{/if}
<!-- /modulo == subunidades -->

{literal}
    <script>
        var page = {/literal}"{$panel->clase_css}"{literal};
        $(document).ready(function () {
            $('#wrapper').on('click', '.indicador_seleccionado_linea', function () {
                var id_indicador = $(this).data('id_indicador');
                var nombre_indicador = $(this).data('nombre_indicador');
                $.ajax({
                    url: "index.php?page=" + page + "&ajax=true&modulo=subunidades&id_indicador="
                            + id_indicador + "&nombre_indicador=" + nombre_indicador,
                    success: function (datos) {
                        $("#lista_subunidades").html(datos);
                    }
                });
                $('#dialogo_subunidades .modal-title span').text(nombre_indicador);
                $('#dialogo_subunidades').modal('show');
            });
            $('#buscar_indicador').on('keyup', function () {
                $('#listado_indicadores').removeClass('hidden');
                var cadena = $(this).val();
                var id_entidad = $(this).data('id_entidad');
                $.ajax({
                    url: "index.php?page=panel_buscador&ajax=true&modulo=indicadores_linea&id_entidad=" + id_entidad + "&cadena=" + cadena,
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