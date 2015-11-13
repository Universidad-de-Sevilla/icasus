{if $modulo == 'inicio'}   
    <input type="hidden" name="tipo" value="{$panel->id}">
    <input type="hidden" name="inicioYear" value="01">
    <input type="hidden" name="inicioMonth" value="01">
    <input type="hidden" name="inicioDay" value="01">
    <input type="hidden" name="finYear" value="12">
    <input type="hidden" name="finMonth" value="12">
    <input type="hidden" name="finDay" value="31">
    <input type="hidden" name="periodicidad" value="anual">
    <input type="hidden" name="id_medicion" value="0">

    <!-- división  -->
    <div id="dialog_subunidades" style="display:none">
        <div class="block" style="opacity: 1;" >
            <div id="lista_subunidades" class="section" style="padding:20px">
            </div>
        </div>
    </div>
    <!--fin dialog -->

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

    <div class="form-group" >
        <label for="buscar_indicador_base" class="col-sm-2 control-label">{$smarty.const.FIELD_INDIC_BASE} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
        <div class="col-sm-8" id="content_buscador_indicador_base">
            <input data-id_entidad="{$id_entidad}" class="form-control" placeholder="{$smarty.const.TXT_INDIC_BUSCAR_BASE}" name="buscar_indicador_base" id="buscar_indicador_base" type="text">
        </div> 
    </div>

    <div id="indicador_base" class="form-group hidden">
        <div class="col-sm-8  col-sm-offset-2">
            <table class="table table-striped table-hover table-bordered" id="content_indicador_base">
            </table>
        </div>
    </div>

    <div class="form-group has-feedback hidden" id="listado_indicadores_base"></div>

    <div id="fila_periodicidad" class="form-group has-feedback hidden">
        <label for="periodicidad" class="col-sm-2 control-label">{$smarty.const.FIELD_PERIOD} {$smarty.const.FIELD_INDIC_BASE} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
        <div class="col-sm-3">
            <div class="radio-inline">
                <label>
                    <input id="periodicidad" title="{$smarty.const.FIELD_MED}" type="radio" class="tipo_periodicidad" name="tipo_periodicidad" data-periodicidad="medicion" value="1" required>
                    {$smarty.const.FIELD_MED}
                </label>
            </div>
            <div class="radio-inline">
                <label>
                    <input id="periodicidad" title="{$smarty.const.FIELD_ANYO}" type="radio" class="tipo_periodicidad" name="tipo_periodicidad" data-periodicidad="años" value="2" required>
                    {$smarty.const.FIELD_ANYO}
                </label>
            </div>
            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
            <div class="help-block with-errors"></div>
        </div>    
        <div id="content_periodicidad"></div>
    </div>

    <div  id="div_fecha_fin"></div>

    <div id="content_buscador_indicadores_complementarios" class="form-group hidden">
        <label for="buscar_indicador_complementario" class="col-sm-2 control-label">{$smarty.const.FIELD_INDIC_COMPLEMENT}</label>
        <div class="col-sm-8">
            <input data-id_entidad="{$id_entidad}" class="form-control" placeholder="{$smarty.const.TXT_INDIC_BUSCAR_COMPLEMENT}" name="buscar_indicador_complementario" id="buscar_indicador_complementario" type="text">
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
        //lista los indicadores para seleccionar el indicador base
        $('#buscar_indicador_base').on('keyup', function () {
            $('#listado_indicadores_base').removeClass('hidden');
            var cadena = $(this).val();
            var id_entidad = $(this).data('id_entidad');
            $.ajax({
                url: "index.php?page=panel_buscador&ajax=true&modulo=indicador_barra_base&id_entidad=" + id_entidad + "&cadena=" + cadena,
                success: function (datos) {
                    $('#listado_indicadores_base').html(datos);
                }
            });
        });
        //incrementa los indicadores complementarios
        $('#wrapper').on('click', '.indicador_complementario_seleccionado_barra', function () {
            $('#indicadores_complementarios').removeClass('hidden');
            var id_indicador = $(this).data('id_indicador');
            var nombre_indicador = $(this).data('nombre_indicador');
            $('#content_indicadores_complementarios').append('<tr class="ric"><td><input type="hidden" name="id_indicadores[]" value="' + id_indicador + '"> ' + nombre_indicador +
                    '</td><td class="text-center"><a href="#" title="Quitar" class="remove_indicador_complementario"><i class="fa fa-times fa-fw"></i></a></td></tr>');
        });
        //inserta el indicador base, sus selects de mediciones y años
        $('#wrapper').on('click', '.indicador_base_seleccionado_barra', function () {
            var id_indicador = $(this).data('id_indicador');
            var nombre_indicador = $(this).data('nombre_indicador');
            $('#indicador_base').removeClass('hidden');
            $('#content_indicador_base').html('<tr><td><input type="hidden" name="id_indicadores[]" value="' + id_indicador + '"> ' + nombre_indicador +
                    '</td><td class="text-center"><a href="#" title="Quitar" class="remove_indicador_base"><i class="fa fa-times fa-fw"></i></a></td></tr>');
            $('#listado_indicadores_base').html('');
            $('#content_buscador_indicador_base').addClass('hidden');
            ;
            $('#fila_periodicidad').removeClass('hidden');
            $.ajax({
                url: "index.php?page=panel_buscador&ajax=true&modulo=periodicidad&id_indicador=" + id_indicador,
                success: function (datos) {
                    $("#content_periodicidad").html(datos);
                    $('#footer_tabs').removeClass('hidden');
                }
            });
        });
        //elimina el indicador complementario. Si no quedan complementarios se borra el pie
        $('#wrapper').on('click', '.remove_indicador_complementario', function (e) {
            e.preventDefault();
            $(this).parent().parent('.ric').remove();
            if ($('.ric').length === 0) {
                $('#indicadores_complementarios').addClass('hidden');
            }
        });
        //elimina el indicador base seleccionado
        $('#wrapper').on('click', '.remove_indicador_base', function (e) {
            e.preventDefault();
            $('#content_indicador_base').html('');
            $('#indicador_base').addClass('hidden');
            $('#content_buscador_indicador_base').removeClass('hidden');
            $('#fila_periodicidad').addClass('hidden');
            $(".tipo_periodicidad").removeAttr("checked");
            $('#footer_tabs').addClass('hidden');
            $('#content_buscador_indicadores_complementarios').addClass('hidden');
            $('#listado_indicadores_complementarios').addClass('hidden');
            $('#indicadores_complementarios').addClass('hidden');
            $('.ric').remove();
        });
        //Selecciona el tipo de periodicidad
        $('#wrapper').on('change', '.tipo_periodicidad', function () {
            var tipo_periodo = $(this).val();
            if (tipo_periodo === '1')
            {
                $('#periodicidad_etiquetas').removeClass('hidden');
                $('#periodicidad_años').addClass('hidden');
            }
            else if (tipo_periodo === '2')
            {
                $('#periodicidad_etiquetas').addClass('hidden');
                $('#periodicidad_años').removeClass('hidden');
            }
            //$('#content_periodicidad').html('');
            //$('#indicadores_complementarios').removeClass('hidden');
            $('#content_buscador_indicadores_complementarios').removeClass('hidden');
        });
    </script>
{/if}

{if $modulo == 'fecha_fin'}
    <input type="hidden" name="finYear" value="{$fecha_inicio}">
{/if}

{if $modulo == 'subunidades'}
    <div class="clearfix">
        <div class="col_50">
            <input data-id_indicador="{$id_indicador}" class="subunidad_seleccionada"
                   name="id_subunidad" type="radio" value="0" data-nombre_indicador="{$nombre_indicador}" data-nombre_subunidad="Total"> {$smarty.const.FIELD_TOTAL}<br/> 
            {foreach name=subunidades from=$indicador_subunidades item=item}
                {if $smarty.foreach.subunidades.iteration == floor($indicador_subunidades|@count/2)+1 }
                </div><div class="col_50 no_border">
                {/if}
                <input data-id_indicador="{$id_indicador}" class="subunidad_seleccionada"
                       name="id_subunidad" type="radio" value="{$item->id_entidad}" data-nombre_indicador="{$nombre_indicador}" data-nombre_subunidad="{$item->entidad->etiqueta}"> 
                {$item->entidad->etiqueta}<br /> 
            {/foreach}
        </div>
        <div class="required_tag tooltip hover left"></div>
    </div>
    {literal}
        <script>
            $('#wrapper').on('click', '.remove_seleccion', function (e) {
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
{/if}

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
        });
    </script>
{/literal}