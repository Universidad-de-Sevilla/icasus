<!-- Indicadores/Datos con Valores nulos agrupados -->
<div class="row">
    <div class="col-lg-12">
        <div id="tabla_agrupados" class="panel panel-red">
            <div class="panel-heading">
                <span class="panel-title"><i class="fa fa-dashboard fa-fw"></i><i class="fa fa-database fa-fw"></i> {$smarty.const.TXT_INDIC_DAT_MED_NULA_AGRUPADOS}</span>
                <i class="fa fa-chevron-up pull-right clickable"></i>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">        
                <div class="table-responsive">
                    <table class="table datatable table-condensed table-striped table-hover">
                        <thead>
                            <tr>
                                <th>{$smarty.const.FIELD_PROC}</th>
                                <th>{$smarty.const.FIELD_UNIDS}</th>
                                <th>{$smarty.const.FIELD_INDIC} / {$smarty.const.FIELD_DATO}</th>
                                <th>{$smarty.const.FIELD_RESP}</th>
                                <th>{$smarty.const.FIELD_FECHA}</th>
                                <th>{$smarty.const.FIELD_VAL}</th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach from=$valores_agrupados item=valor}
                                <tr>
                                    <td>
                                        {if $valor.cod_proceso == ''}
                                            {$smarty.const.FIELD_DATOS}
                                        {else}
                                            <span style="display:none">{$valor.proceso}</span> 
                                            <a href="index.php?page=proceso_mostrar&id_proceso={$valor.id_proceso}&id_entidad={$valor.entidad_del_indicador}" title="{$smarty.const.TXT_PROC_VER}">
                                                {$valor.cod_proceso}
                                            </a>
                                        {/if}
                                    </td>
                                    <td>{$valor.subunidades}</td>
                                    <td>
                                        {if $valor.cod_proceso==''}
                                            <a href="index.php?page=dato_mostrar&id_dato={$valor.id_indicador}&id_entidad={$valor.entidad_del_indicador}" title="{$smarty.const.TXT_INDIC_IR}">{$valor.indicador}</a>
                                        {else}
                                            <a href="index.php?page=indicador_mostrar&id_indicador={$valor.id_indicador}&id_entidad={$valor.entidad_del_indicador}" title="{$smarty.const.TXT_INDIC_IR}">{$valor.indicador}</a>
                                        {/if}
                                    </td>
                                    <td>{$valor.nombre_responsable} {$valor.apellidos_responsable}</td>
                                    <td>{$valor.fecha}</td>
                                    <td>{if $valor.valor == NULL}
                                        <a href="index.php?page=medicion_editar&id_entidad={$valor.entidad_del_indicador}&id_medicion={$valor.id_medicion}&tipo={if $valor.cod_proceso == ''}dato{else}indicador{/if}" title="{$smarty.const.TXT_MED_VER}">{$smarty.const.TXT_NULO}</a>{/if}
                                    </td>
                                </tr>
                            {/foreach}
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- /.panel-body -->        
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- /Indicadores/Datos con Valores nulos agrupados -->

<!-- Indicadores/Datos con Valores nulos -->
<div class="row">
    <div class="col-lg-12">
        <div id="tabla_nulos" class="panel panel-red">
            <div class="panel-heading">
                <span class="panel-title"><i class="fa fa-dashboard fa-fw"></i><i class="fa fa-database fa-fw"></i> {$smarty.const.TXT_INDIC_DAT_MED_NULA}</span>
                <i class="fa fa-chevron-up pull-right clickable"></i>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <form action='index.php?page=control&modulo=inicio&id_entidad={$entidad->id}' method='post' name='formdiv' class="form-horizontal">      
                    <div class="table-responsive">
                        <table class="table datatable table-condensed table-striped table-hover">
                            <thead>               
                                <tr>
                                    <th>{$smarty.const.TXT_DESACT}</th>
                                    <th>{$smarty.const.FIELD_PROC}</th>
                                    <th>{$smarty.const.FIELD_UNID}</th>
                                    <th>{$smarty.const.FIELD_INDIC} / {$smarty.const.FIELD_DATO}</th>
                                    <th>{$smarty.const.FIELD_FECHA}</th>
                                    <th>{$smarty.const.FIELD_VAL}</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach from=$valores item=valor}
                                    <tr>
                                        <td style="text-align: center"><input type='checkbox' name='id_valor[]' value='{$valor.id_valor}'/></td>
                                        <td>
                                            {if $valor.cod_proceso == ''}
                                                {$smarty.const.FIELD_DATOS}
                                            {else}
                                                <span style="display:none">{$valor.proceso}</span> 
                                                <a href="index.php?page=proceso_mostrar&id_proceso={$valor.id_proceso}&id_entidad={$valor.entidad_del_indicador}" title="{$smarty.const.TXT_PROC_VER}">
                                                    {$valor.cod_proceso}
                                                </a>
                                            {/if}
                                        </td>
                                        <td>{$valor.unidad}</td>
                                        <td>
                                            {if $valor.cod_proceso==''}
                                                <a href="index.php?page=dato_mostrar&id_dato={$valor.id_indicador}&id_entidad={$valor.entidad_del_indicador}" title="{$smarty.const.TXT_INDIC_IR}">{$valor.indicador}</a>
                                            {else}
                                                <a href="index.php?page=indicador_mostrar&id_indicador={$valor.id_indicador}&id_entidad={$valor.entidad_del_indicador}" title="{$smarty.const.TXT_INDIC_IR}">{$valor.indicador}</a>
                                            {/if}
                                        </td>
                                        <td>{$valor.fecha}</td>
                                        <td>{if $valor.valor == NULL}
                                            <a href="index.php?page=medicion_editar&id_entidad={$valor.entidad_del_indicador}&id_medicion={$valor.id_medicion}&tipo={if $valor.cod_proceso == ''}dato{else}indicador{/if}" title="{$smarty.const.TXT_MED_VER}">{$smarty.const.TXT_NULO}</a>{/if}
                                        </td>
                                    </tr>
                                {/foreach}
                            </tbody>
                        </table>
                    </div>
                    <br>
                    <div class="form-group">
                        <div class="col-sm-8">
                            <button type="reset" class="btn btn-default btn-warning" title="{$smarty.const.TXT_RESET}">
                                <i class="fa fa-refresh fa-fw"></i> {$smarty.const.TXT_RESET}
                            </button>
                            <button title="{$smarty.const.TXT_VALS_DESACT}" type="button" class="btn btn-default btn-success" data-toggle="modal" data-target="#dialogo_confirmar_desactivar">
                                <i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_VALS_DESACT}
                            </button>
                        </div>
                    </div>

                    <!-- Diálogo Confirmar Desactivar -->
                    <div class="modal fade" id="dialogo_confirmar_desactivar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h3 class="modal-title" id="myModalLabel"><i class="fa fa-sliders fa-fw"></i> {$smarty.const.TXT_CONTROL}: {$entidad->nombre}</h3>
                                </div>
                                <div class="modal-body">
                                    <p>{$smarty.const.MSG_VALS_CONFIRM_DESACT}</p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" title="{$smarty.const.TXT_NO}" class="btn btn-default btn-danger" data-dismiss="modal"><i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_NO}</button>
                                    <button type="submit" title="{$smarty.const.TXT_SI}" class="btn btn-default btn-success" name="alta" id="alta"><i class="fa fa-check fa-fw"></i> {$smarty.const.TXT_SI}</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /Diálogo Confirmar Desactivar -->

                </form>
            </div>
            <!-- /.panel-body -->        
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- /Indicadores/Datos con Valores nulos -->

<!-- Indicadores/Datos última modificación -->
<div class="row">
    <div class="col-lg-12">
        <div id="tabla_modificados" class="panel panel-red">
            <div class="panel-heading">
                <span class="panel-title"><i class="fa fa-dashboard fa-fw"></i><i class="fa fa-database fa-fw"></i> {$smarty.const.TXT_INDIC_DAT_ULTIMA_MOD}</span>
                <i class="fa fa-chevron-up pull-right clickable"></i>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">        
                <div class="table-responsive">
                    <table class="table datatable table-condensed table-striped table-hover">
                        <thead>
                            <tr>
                                <th>{$smarty.const.FIELD_PROC}</th> 
                                <th>{$smarty.const.FIELD_UNID}</th>
                                <th>{$smarty.const.FIELD_INDIC} / {$smarty.const.FIELD_DATO}</th>
                                <th>{$smarty.const.FIELD_FECHA}</th>
                                <th>{$smarty.const.FIELD_FECHA_RECOGIDA}</th>
                                <th>{$smarty.const.FIELD_VAL}</th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach from= $valores_ult_mod item=valor}
                                <tr>
                                    <td>
                                        {if $valor.cod_proceso == ''}
                                            {$smarty.const.FIELD_DATOS}
                                        {else}
                                            <span style="display:none">{$valor.proceso}</span> 
                                            <a href="index.php?page=proceso_mostrar&id_proceso={$valor.id_proceso}&id_entidad={$valor.entidad_del_indicador}" title="{$smarty.const.TXT_PROC_VER}">
                                                {$valor.cod_proceso}
                                            </a>
                                        {/if}
                                    </td>
                                    <td>{$valor.unidad}</td>
                                    <td>
                                        {if $valor.cod_proceso==''}
                                            <a href="index.php?page=dato_mostrar&id_dato={$valor.id_indicador}&id_entidad={$valor.entidad_del_indicador}" title="{$smarty.const.TXT_INDIC_IR}">{$valor.indicador}</a>
                                        {else}
                                            <a href="index.php?page=indicador_mostrar&id_indicador={$valor.id_indicador}&id_entidad={$valor.entidad_del_indicador}" title="{$smarty.const.TXT_INDIC_IR}">{$valor.indicador}</a>
                                        {/if}
                                    </td>
                                    <td>{$valor.fecha}</td>
                                    <td>{$valor.fecha_recogida|date_format:"%d-%m-%Y"}</td>
                                    <td>
                                        <a href="index.php?page=medicion_editar&id_entidad={$valor.entidad_del_indicador}&id_medicion={$valor.id_medicion}&tipo={if $valor.cod_proceso == ''}dato{else}indicador{/if}" title="{$smarty.const.TXT_MED_VER}">{$valor.valor}</a>
                                    </td>
                                </tr>
                            {/foreach}
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- /.panel-body -->        
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- /Indicadores/Datos última modificación -->

<!-- Indicadores/Datos sin Mediciones -->
<div class="row">
    <div class="col-lg-12">
        <div id="tabla_sin_med" class="panel panel-red">
            <div class="panel-heading">
                <span class="panel-title"><i class="fa fa-dashboard fa-fw"></i><i class="fa fa-database fa-fw"></i> {$smarty.const.TXT_INDIC_DAT_SIN_MED}</span>
                <i class="fa fa-chevron-up pull-right clickable"></i>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">        
                <div class="table-responsive">
                    <table class="table datatable table-condensed table-striped table-hover">
                        <thead>
                            <tr>
                                <th>{$smarty.const.FIELD_PROC}</th>        
                                <th>{$smarty.const.FIELD_INDIC} / {$smarty.const.FIELD_DATO}</th>
                                <th>{$smarty.const.FIELD_FECHA}</th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach from=$indicadores_sin_med item=indicador}
                                <tr>
                                    <td>
                                        {if $indicador.cod_proceso == ''}
                                            {$smarty.const.FIELD_DATOS}
                                        {else}
                                            <a href="index.php?page=proceso_mostrar&id_proceso={$indicador.id_proceso}&id_entidad={$indicador.id_entidad}" title="{$smarty.const.TXT_PROC_VER}">
                                                {$indicador.proceso}
                                            </a>
                                        {/if}
                                    </td>
                                    <td>
                                        {if $indicador.cod_proceso==''}
                                            <a href="index.php?page=dato_mostrar&id_dato={$indicador.id_indicador}&id_entidad={$indicador.id_entidad}" title="{$smarty.const.TXT_INDIC_IR}">{$indicador.indicador}</a>
                                        {else}
                                            <a href="index.php?page=indicador_mostrar&id_indicador={$indicador.id_indicador}&id_entidad={$indicador.id_entidad}" title="{$smarty.const.TXT_INDIC_IR}">{$indicador.indicador}</a>
                                        {/if}
                                    </td>
                                    <td>{$fecha}</td>
                                </tr>
                            {/foreach}
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- /.panel-body -->        
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- /Indicadores/Datos sin Mediciones -->

{*Recargamos script, datatables y collapsible panels tras petición ajax*}
{literal}
    <script>
        //Collapsible panels
        jQuery(function ($) {
            $('.panel-heading i.clickable').on("click", function (e) {
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
                dom: "<'row'<'col-sm-3'l><'col-sm-3'B><'col-sm-6'f>>" +
                        "<'row'<'col-sm-12'tr>>" +
                        "<'row'<'col-sm-5'i><'col-sm-7'p>>",
                buttons: [
                    {extend: 'pdf', className: 'btn-danger'},
                    {extend: 'csv', className: 'btn-danger'},
                    {extend: 'print', text: 'Imprimir', className: 'btn-danger'}
                ]
            });
        });
    </script>
{/literal}