{if $modulo === 'mostrar'}
    <div class="form-horizontal">
        <div id="analisis" class="form-group">
            <label for="analisis" class="col-sm-2 control-label">{$smarty.const.TXT_ANALISIS} ({$anyo})</label>
            <div class="col-sm-6">
                <textarea  class="form-control" id="texto_analisis" placeholder="{$smarty.const.TXT_ANALISIS}" rows="9" readonly>{$analisis_actual->analisis}</textarea>
            </div>
            {if $_control || $responsable}
                <div class="col-sm-2">
                    <a id="editar_analisis" title="{$smarty.const.TXT_EDIT}" class="btn btn-default btn-danger btn-xs btn-circle" data-id_indicador='{$indicador->id}' data-anyo='{$anyo}' ><i class="fa fa-pencil fa-fw"></i></a>
                </div>
            {/if}
        </div>
        <div id="plan" class="form-group">
            <label for="plan_accion" class="col-sm-2 control-label">{$smarty.const.TXT_PLAN_ACCION} ({$anyo})</label>
            <div class="col-sm-6">
                <textarea  class="form-control" id="texto_plan" placeholder="{$smarty.const.TXT_PLAN_ACCION}" rows="9" readonly>{$analisis_actual->plan_accion}</textarea>
            </div>
            {if $_control || $responsable}
                <div class="col-sm-2">
                    <a id="editar_plan" title="{$smarty.const.TXT_EDIT}" class="btn btn-default btn-danger btn-xs btn-circle" data-id_indicador='{$indicador->id}' data-anyo='{$anyo}' ><i class="fa fa-pencil fa-fw"></i></a>
                </div>
            {/if}
        </div>
    </div>
{/if}

{if $modulo === 'editar_analisis'}
    <label for="analisis" class="col-sm-2 control-label">{$smarty.const.TXT_ANALISIS} ({$anyo})</label>
    <div class="col-sm-6">
        <textarea  class="form-control" id="texto_analisis" placeholder="{$smarty.const.TXT_ANALISIS}" rows="9">{$analisis_actual->analisis}</textarea>
    </div>
    <div class="col-sm-2">
        <a id="grabar_analisis" title="{$smarty.const.TXT_GRABAR}" class="btn btn-default btn-danger btn-xs btn-circle" data-id_indicador='{$indicador->id}' data-anyo='{$anyo}'><i class="fa fa-floppy-o fa-fw"></i></a>
        <a id="cancelar_analisis" title="{$smarty.const.TXT_CANCEL}" class="btn btn-default btn-danger btn-xs btn-circle" data-id_indicador='{$indicador->id}' data-anyo='{$anyo}'><i class="fa fa-times fa-fw"></i></a>
    </div>
{/if}

{if $modulo === 'cancelar_analisis'}
    <label for="analisis" class="col-sm-2 control-label">{$smarty.const.TXT_ANALISIS} ({$anyo})</label>
    <div class="col-sm-6">
        <textarea  class="form-control" id="texto_analisis" placeholder="{$smarty.const.TXT_ANALISIS}" rows="9" readonly>{$analisis_actual->analisis}</textarea>
    </div>
    <div class="col-sm-2">
        <a id="editar_analisis" title="{$smarty.const.TXT_EDIT}" class="btn btn-default btn-danger btn-xs btn-circle" data-id_indicador='{$indicador->id}' data-anyo='{$anyo}' ><i class="fa fa-pencil fa-fw"></i></a>
    </div>
{/if}

{if $modulo === 'editar_plan'}
    <label for="plan_accion" class="col-sm-2 control-label">{$smarty.const.TXT_PLAN_ACCION} ({$anyo})</label>
    <div class="col-sm-6">
        <textarea  class="form-control" id="texto_plan" placeholder="{$smarty.const.TXT_PLAN_ACCION}" rows="9">{$analisis_actual->plan_accion}</textarea>
    </div>
    <div class="col-sm-2">
        <a id="grabar_plan" title="{$smarty.const.TXT_GRABAR}" class="btn btn-default btn-danger btn-xs btn-circle" data-id_indicador='{$indicador->id}' data-anyo='{$anyo}'><i class="fa fa-floppy-o fa-fw"></i></a>
        <a id="cancelar_plan" title="{$smarty.const.TXT_CANCEL}" class="btn btn-default btn-danger btn-xs btn-circle" data-id_indicador='{$indicador->id}' data-anyo='{$anyo}'><i class="fa fa-times fa-fw"></i></a>
    </div>
{/if}

{if $modulo === 'cancelar_plan'}
    <label for="plan_accion" class="col-sm-2 control-label">{$smarty.const.TXT_PLAN_ACCION} ({$anyo})</label>
    <div class="col-sm-6">
        <textarea  class="form-control" id="texto_plan" placeholder="{$smarty.const.TXT_PLAN_ACCION}" rows="9" readonly>{$analisis_actual->plan_accion}</textarea>
    </div>
    <div class="col-sm-2">
        <a id="editar_plan" title="{$smarty.const.TXT_EDIT}" class="btn btn-default btn-danger btn-xs btn-circle" data-id_indicador='{$indicador->id}' data-anyo='{$anyo}' ><i class="fa fa-pencil fa-fw"></i></a>
    </div>
{/if}

{if $modulo === 'actualizar_tabla'}
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-red">
                <div class="panel-heading">
                    <span class="panel-title"><i class="fa fa-connectdevelop fa-fw"></i> {$smarty.const.TXT_TABLA_ANAPLAN}</span>
                    <i class="fa fa-chevron-down pull-right clickable panel-collapsed"></i>
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body" style="display: none">
                    {if $lista_analisis}
                        <div class="table-responsive">
                            <table class="table datatable table-condensed table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>{$smarty.const.FIELD_ANYO}</th> 
                                        <th>{$smarty.const.TXT_ANALISIS}</th>
                                        <th>{$smarty.const.TXT_PLAN_ACCION}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {foreach from=$lista_analisis item=anaplan}
                                        <tr>
                                            <td><span class="label label-primary">{$anaplan->anyo}</span></td>
                                            <td title="{$anaplan->analisis}">
                                                {if $anaplan->analisis|count_characters}
                                                    {$anaplan->analisis|nl2br}
                                                {else}
                                                    ---
                                                {/if}
                                            </td>
                                            <td title="{$anaplan->plan_accion}">
                                                {if $anaplan->plan_accion|count_characters}
                                                    {$anaplan->plan_accion|nl2br}
                                                {else}
                                                    ---
                                                {/if}
                                            </td>
                                        </tr>
                                    {/foreach}
                                </tbody>
                            </table>
                        {else}
                            <div class="alert alert-info alert-dismissible">
                                <i class="fa fa-info-circle fa-fw"></i> 
                                {$smarty.const.MSG_ANAPLAN_NO}
                            </div>
                        {/if}
                    </div>
                </div>
                <!-- /.panel-body -->        
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    {*Recargamos script, datatables y collapsible panels tras petición ajax*}
    {literal}
        <script>
            //Collapsible panels
            jQuery(function ($) {
                $('#tabla_analisis_plan .panel-heading i.clickable').on("click", function (e) {
                    if ($(this).hasClass('panel-collapsed')) {
                        // expand the panel
                        $(this).parents('.panel').find('.panel-body').slideDown();
                        $(this).removeClass('panel-collapsed');
                        $(this).removeClass('fa-chevron-down').addClass('fa-chevron-up');
                    }
                    else {
                        // collapse the panel
                        $(this).parents('.panel').find('.panel-body').slideUp();
                        $(this).addClass('panel-collapsed');
                        $(this).removeClass('fa-chevron-up').addClass('fa-chevron-down');
                    }
                });
            });
            //Datatables
            $(document).ready(function () {
                $('.datatable').DataTable({
                    "pagingType": "full_numbers",
                    "iDisplayLength": 25,
                    fixedHeader: true,
                    dom: "<'row'<'col-sm-2'B><'col-sm-5'l><'col-sm-5'f>>" +
                            "<'row'<'col-sm-12'tr>>" +
                            "<'row'<'col-sm-5'i><'col-sm-7'p>>",
                    buttons: [
                        {extend: 'colvis', text: "<i title='Ver columnas' class='fa fa-columns fa-fw'></i> <i class='fa fa-caret-down'></i>"},
                        {
                            extend: 'collection',
                            text: "<i title='Exportar' class='fa fa-share-square-o fa-fw'></i> <i class='fa fa-caret-down'></i>",
                            buttons: [
                                {extend: 'csv', text: "<i title='Exportar a CSV' class='fa fa-file-text-o fa-fw'></i> Exportar a CSV"},
                                {extend: 'excel', text: "<i title='Exportar a Excel' class='fa fa-file-excel-o fa-fw'></i> Exportar a Excel"},
                                {extend: 'print', text: "<i title='Imprimir/PDF' class='fa fa-print fa-fw'></i> Imprimir/PDF"}
                            ]
                        }
                    ]
                });
            });
        </script>
    {/literal}
{/if}