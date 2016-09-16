<!-- Nav tabs -->
<ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active">
        <a href="#tabla_agrupados" title="{$smarty.const.TXT_INDIC_DAT_MED_NULA_AGRUPADOS}" aria-controls="{$smarty.const.TXT_INDIC_DAT_MED_NULA_AGRUPADOS}" role="tab" data-toggle="tab"><i class="fa fa-hourglass-o fa-fw"></i> {$smarty.const.TXT_INDIC_DAT_MED_NULA_AGRUPADOS}</a>
    </li>
    <li role="presentation">
        <a href="#tabla_nulos" title="{$smarty.const.TXT_INDIC_DAT_MED_NULA}" aria-controls="{$smarty.const.TXT_INDIC_DAT_MED_NULA}" role="tab" data-toggle="tab"><i class="fa fa-hourglass-o fa-fw"></i>/<i class="fa fa-sitemap fa-fw"></i> {$smarty.const.TXT_INDIC_DAT_MED_NULA}</a>
    </li>
    <li role="presentation">
        <a href="#tabla_modificados" title="{$smarty.const.TXT_INDIC_DAT_ULTIMA_MOD}" aria-controls="{$smarty.const.TXT_INDIC_DAT_ULTIMA_MOD}" role="tab" data-toggle="tab"><i class="fa fa-hourglass-end fa-fw"></i> {$smarty.const.TXT_INDIC_DAT_ULTIMA_MOD}</a>
    </li>
    <li role="presentation">
        <a href="#tabla_sin_med" title="{$smarty.const.TXT_INDIC_DAT_SIN_MED}" aria-controls="{$smarty.const.TXT_INDIC_DAT_SIN_MED}" role="tab" data-toggle="tab"><i class="fa fa-ban fa-fw"></i><sub class="fa fa-hourglass fa-fw"></sub> {$smarty.const.TXT_INDIC_DAT_SIN_MED}</a>
    </li>
    <li role="presentation">
        <a href="#tabla_val_ref" title="{$smarty.const.TXT_VAL_REF}" aria-controls="{$smarty.const.TXT_VAL_REF}" role="tab" data-toggle="tab"><i class="fa fa-tags fa-fw"></i> {$smarty.const.TXT_VAL_REF}</a>
    </li>
</ul>
<!-- /Nav tabs -->
<br>
<!-- Tab panes -->
<div class="tab-content">

    <!-- Mediciones nulas -->
    <div role="tabpanel" class="tab-pane active" id="tabla_agrupados">
        {if $valores_agrupados}
            <div class="table-responsive">
                <table class="table datatable table-condensed table-striped table-hover">
                    <thead>
                        <tr>
                            <th>{$smarty.const.FIELD_PROC}</th>
                            <th>{$smarty.const.FIELD_UNIDS}</th>
                            <th>{$smarty.const.FIELD_INDIC} / {$smarty.const.FIELD_DATO}</th>
                            <th>{$smarty.const.FIELD_RESP}</th>
                            <th>{$smarty.const.FIELD_RESP_MED}</th>
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
                                <td style="font-size: 12px">{$valor.nombre_responsable} {$valor.apellidos_responsable}</td>
                                <td style="font-size: 12px">{$valor.nombre_responsable_med} {$valor.apellidos_responsable_med}</td>
                                <td>{$valor.fecha}</td>
                                <td>{if $valor.valor == NULL}
                                    <a href="index.php?page=medicion&id_entidad={$valor.entidad_del_indicador}&id_medicion={$valor.id_medicion}&tipo={if $valor.cod_proceso == ''}dato{else}indicador{/if}" title="{$smarty.const.TXT_MED_VER}">---</a>{/if}
                                </td>
                            </tr>
                        {/foreach}
                    </tbody>
                </table>
            </div>
        {else}
            <div class="alert alert-info alert-dismissible">
                <i class="fa fa-info-circle fa-fw"></i> 
                {$smarty.const.MSG_CONTROL_NO_MED_NULO}
            </div> 
        {/if}   
    </div>
    <!-- /Mediciones nulas -->

    <!-- Mediciones nulas/Unidad -->
    <div role="tabpanel" class="tab-pane" id="tabla_nulos">
        {if $valores}
            <form action='index.php?page=control&modulo=inicio&id_entidad={$entidad->id}&desactivar' method='post' name='formdiv' class="form-horizontal">      
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
                                        <a href="index.php?page=medicion&id_entidad={$valor.entidad_del_indicador}&id_medicion={$valor.id_medicion}&tipo={if $valor.cod_proceso == ''}dato{else}indicador{/if}" title="{$smarty.const.TXT_MED_VER}">---</a>{/if}
                                    </td>
                                </tr>
                            {/foreach}
                        </tbody>
                    </table>
                </div>
                <br>
                <div class="form-group">
                    <div class="col-sm-12">
                        <button type="reset" class="btn btn-default btn-warning" title="{$smarty.const.TXT_RESET}">
                            <i class="fa fa-refresh fa-fw"></i> {$smarty.const.TXT_RESET}
                        </button>
                        <button title="{$smarty.const.TXT_VALS_DESACT}" type="button" class="btn btn-default btn-success pull-right" data-toggle="modal" data-target="#dialogo_confirmar_desactivar">
                            <i class="fa fa-check fa-fw"></i> {$smarty.const.TXT_VALS_DESACT}
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
        {else}
            <div class="alert alert-info alert-dismissible">
                <i class="fa fa-info-circle fa-fw"></i> 
                {$smarty.const.MSG_CONTROL_NO_MED_NULO}
            </div> 
        {/if}
    </div>
    <!-- /Mediciones nulas/Unidad -->

    <!-- Última modificación -->
    <div role="tabpanel" class="tab-pane" id="tabla_modificados">
        {if $valores_ult_mod}
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
                                    <a href="index.php?page=medicion&id_entidad={$valor.entidad_del_indicador}&id_medicion={$valor.id_medicion}&tipo={if $valor.cod_proceso == ''}dato{else}indicador{/if}" title="{$smarty.const.TXT_MED_VER}">{$valor.valor}</a>
                                </td>
                            </tr>
                        {/foreach}
                    </tbody>
                </table>
            </div>
        {else}
            <div class="alert alert-info alert-dismissible">
                <i class="fa fa-info-circle fa-fw"></i> 
                {$smarty.const.MSG_CONTROL_NO_VAL}
            </div> 
        {/if}
    </div>
    <!-- /Última modificación -->

    <!-- Sin Mediciones -->
    <div role="tabpanel" class="tab-pane" id="tabla_sin_med">
        {if $indicadores_sin_med}
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
        {else}
            <div class="alert alert-info alert-dismissible">
                <i class="fa fa-info-circle fa-fw"></i> 
                {$smarty.const.MSG_CONTROL_MED}
            </div> 
        {/if} 
    </div>
    <!-- /Sin Mediciones -->

    <!-- Valores de referencia -->
    <div role="tabpanel" class="tab-pane" id="tabla_val_ref">
        {if $indicadores_sin_med|count != $indicadores|count}
            <div class="table-responsive">
                <table class="table datatable table-condensed table-striped table-hover">
                    <thead>
                        <tr>      
                            <th>{$smarty.const.FIELD_INDIC} / {$smarty.const.FIELD_DATO}</th>
                            <th>{$smarty.const.FIELD_PROC}</th>
                            <th>{$smarty.const.FIELD_MED}</th>
                            <th><span class="label label-danger">{$smarty.const.FIELD_LIMITE}</span></th>
                            <th><span class="label label-success">{$smarty.const.FIELD_META}</span></th>
                            <th>{$smarty.const.FIELD_ACCIONES}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach from=$indicadores item=indicador}
                            {foreach $mediciones[$indicador->id] as $medicion}
                                <tr>
                                    <td>
                                        {if $indicador->id_proceso}
                                            <a href="index.php?page=indicador_mostrar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}" title="{$smarty.const.TXT_INDIC_IR}">{$indicador->nombre}</a>
                                        {else}
                                            <a href="index.php?page=dato_mostrar&id_dato={$indicador->id}&id_entidad={$indicador->id_entidad}" title="{$smarty.const.TXT_INDIC_IR}">{$indicador->nombre}</a>
                                        {/if}
                                    </td>
                                    <td>
                                        {if $indicador->id_proceso}
                                            <a href="index.php?page=proceso_mostrar&id_proceso={$indicador->id_proceso}&id_entidad={$indicador->id_entidad}" title="{$smarty.const.TXT_PROC_VER}">
                                                {$indicador->proceso->nombre}
                                            </a>
                                        {else}
                                            {$smarty.const.FIELD_DATOS}
                                        {/if}
                                    </td>
                                    <td>{$medicion->etiqueta}</td>
                                    <td {if isset($medicion_lim[$indicador->id])}style="color:red"{/if}>
                                        {if isset($medicion_lim[$indicador->id])}
                                            {if ($medicion_lim[$indicador->id][$medicion->id])}
                                                {$medicion_lim[$indicador->id][$medicion->id]}
                                            {else}
                                                ---
                                            {/if}
                                        {else}
                                            {$smarty.const.MSG_NO_DEF}
                                        {/if}
                                    </td>
                                    <td {if isset($medicion_obj[$indicador->id])}style="color:green"{/if}>
                                        {if isset($medicion_obj[$indicador->id])}
                                            {if ($medicion_obj[$indicador->id][$medicion->id])}
                                                {$medicion_obj[$indicador->id][$medicion->id]}
                                            {else}
                                                ---
                                            {/if}
                                        {else}
                                            {$smarty.const.MSG_NO_DEF}
                                        {/if}
                                    </td>
                                    <td>
                                        {if ($indicador->id_proceso)}
                                            <a class="btn btn-default btn-circle btn-xs" 
                                               href="index.php?page=medicion&id_medicion={$medicion->id}&id_entidad={$indicador->id_entidad}&tipo=indicador">
                                                <i title='{$smarty.const.TXT_GRABAR}' class="fa fa-floppy-o fa-fw"></i>
                                            </a>
                                        {else}
                                            <a class="btn btn-default btn-circle btn-xs" 
                                               href="index.php?page=medicion&id_medicion={$medicion->id}&id_entidad={$indicador->id_entidad}&tipo=dato">
                                                <i title='{$smarty.const.TXT_GRABAR}' class="fa fa-floppy-o fa-fw"></i>
                                            </a>
                                        {/if}
                                    </td>
                                </tr>
                            {/foreach}
                        {/foreach}
                    </tbody>
                </table>
            </div>
        {else}
            <div class="alert alert-info alert-dismissible">
                <i class="fa fa-info-circle fa-fw"></i> 
                {$smarty.const.MSG_CONTROL_NO_MED}
            </div> 
        {/if}
    </div>
    <!-- /Valores de referencia -->

</div>

{*Recargamos script para datatables*}
{literal}
    <script>
        //Datatables
        $(document).ready(function () {
            datatables = $('.datatable').DataTable({
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
        //Reajustamos las cabeceras de las datatables al cambiar de pestaña
        $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
            datatables.fixedHeader.adjust();
        });

        //Reajustamos las cabeceras de las datatables al hacer scroll
        $('.table-responsive').on('scroll', function () {
            datatables.fixedHeader.adjust();
        });
    </script>
{/literal}