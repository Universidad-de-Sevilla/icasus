<!-- Diálogo cargando datos de control -->
<div class="modal fade" id="dialogo_cargando_control" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel"><i class="fa fa-sliders fa-fw"></i> {$smarty.const.TXT_CONTROL} (EFQM): {$entidad->nombre}</h3>
            </div>
            <div class="modal-body">
                <h4 class="text-center"><i class="fa fa-spinner fa-pulse"></i> {$smarty.const.MSG_CONTROL_CARGA}</h4>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo cargando datos de control -->

<!-- Diálogo Confirmar Borrado -->
<div class="modal fade" id="dialogo_confirmar_borrado" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel"><i class="fa fa-trash fa-fw"></i> {$smarty.const.TXT_INDIC_BORRAR}: <span id="nombre_indicador"></span></h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_INDIC_CONFIRM_BORRAR}</p>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_NO}" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_NO}</button>
                <a title="{$smarty.const.TXT_SI}" class="btn btn-success" name="borrar" id="borrar"><i class="fa fa-check fa-fw"></i> {$smarty.const.TXT_SI}</a>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Confirmar Borrado -->

{if $modulo == 'inicio'}
    <!-- Nombre página -->
    <div class="row">
        <div class="col-lg-12">
            <h3 title="{$_nombre_pagina}" class="page-header">
                <i class="fa fa-sliders fa-fw"></i> {$_nombre_pagina}
            </h3>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <!-- /Nombre página -->

    <!-- Breadcrumbs -->
    <div class="row">
        <div class="col-lg-12">
            <ol class="breadcrumb">
                <i title="{$smarty.const.TXT_ESTA}" class="fa fa-map-marker fa-fw"></i>
                <li><a title="{$smarty.const.FIELD_UNIDS}" href='index.php?page=entidad_listar'>{$smarty.const.FIELD_UNIDS}</a></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" data-target="#" title="{$entidad->nombre}" href="index.php?page=entidad_mostrar&id_entidad={$entidad->id}">
                        {$entidad->nombre|truncate:30} <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu">
                        <li>
                            <a title="{$smarty.const.FIELD_USER}: {$_usuario->login} - {$smarty.const.TXT_UNID}: {$entidad->nombre} - {$smarty.const.FIELD_ROL}: {$_rol}" href="index.php?page=entidad_mostrar&id_entidad={$entidad->id}"><i class="fa fa-folder fa-fw"></i> {$entidad->nombre} / <i class="fa fa-user fa-fw"></i> {$_rol}</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a title="{$smarty.const.TXT_PLANES_DESCRIPCION}" href='index.php?page=plan_listar&id_entidad={$entidad->id}'>
                                <i class="fa fa-book fa-fw"></i> {$smarty.const.FIELD_PLANES} <span title="{$smarty.const.FIELD_TOTAL}: {$num_planes} {$smarty.const.FIELD_PLANES}">({$num_planes})</span>
                            </a>
                        </li>
                        <li>
                            <a title="{$smarty.const.TXT_PROCS_DESCRIPCION}" href='index.php?page=proceso_listar&id_entidad={$entidad->id}'>
                                <i class="fa fa-gears fa-fw"></i> {$smarty.const.FIELD_PROCS} <span title="{$smarty.const.FIELD_TOTAL}: {$num_procesos} {$smarty.const.FIELD_PROCS}">({$num_procesos})</span>
                            </a>
                        </li>
                        <li>
                            <a title="{$smarty.const.TXT_INDICS_DESCRIPCION}" href='index.php?page=indicador_listar&id_entidad={$entidad->id}'>
                                <i class="fa fa-dashboard fa-fw"></i> {$smarty.const.FIELD_INDICS}/{$smarty.const.FIELD_DATOS} <span title="{$smarty.const.FIELD_TOTAL}: {$num_indicadores} {$smarty.const.FIELD_INDICS}/{$smarty.const.FIELD_DATOS}">({$num_indicadores})</span>
                            </a>
                        </li>
                        <li>
                            <a title="{$smarty.const.TXT_CUADRO_MANDO_DESCRIPCION}" href='index.php?page=cuadro_listar&id_entidad={$entidad->id}'>
                                <i class="fa fa-th fa-fw"></i> {$smarty.const.FIELD_CUADROS_MANDO} <span title="{$smarty.const.FIELD_TOTAL}: {$num_cuadros} {$smarty.const.FIELD_CUADROS_MANDO}">({$num_cuadros})</span>
                            </a>
                        </li>
                        <li>
                            <a title="{$smarty.const.TXT_CONSULTA_DESCRIPCION}" href="index.php?page=consulta_avanzada&id_entidad={$entidad->id}">
                                <i class="fa fa-commenting fa-fw"></i> {$smarty.const.TXT_CONSULT}
                            </a>
                        </li>   
                        <li>
                            <a title="{$smarty.const.TXT_CONTROL_DESCRIPCION}" href="index.php?page=control&modulo=inicio&id_entidad={$entidad->id}">
                                <i class="fa fa-sliders fa-fw"></i> {$smarty.const.TXT_CONTROL}
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-menu -->
                </li>
                <!-- /.dropdown -->
                <li title="{$_nombre_pagina}" class="active">{$_nombre_pagina}</li>
            </ol>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <!-- /Breadcrumbs -->

    <!-- Selección del año de consulta -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-red">
                <div class="panel-heading">
                    <span class="panel-title"><i class="fa fa-list-alt fa-fw"></i> {$smarty.const.TXT_SEL}: {$smarty.const.FIELD_EFQM}</span>
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="alert alert-info">
                        <i class="fa fa-info-circle fa-fw"></i> 
                        {$smarty.const.MSG_CONTROL_EFQM_INFO}
                    </div>
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="efqm" class="col-sm-2 control-label">{$smarty.const.FIELD_EFQM}</label>
                            <div id="criterio" class="col-sm-6" data-id_entidad="{$entidad->id}">
                                <select class="form-control chosen-select" id="efqm" multiple>
                                    <option value="0">{$smarty.const.MSG_NO_DEF}</option>
                                    {foreach $criterios_efqm as $criterio_efqm}
                                        <option value="{$criterio_efqm->id}">
                                            {$criterio_efqm->codigo} - {$criterio_efqm->nombre}
                                        </option>
                                    {/foreach}
                                </select>
                            </div>
                            <div class='col-sm-2'>
                                <a class='btn btn-primary' title="{$smarty.const.TXT_CONTROL}: {$smarty.const.FIELD_MEDICIONES}" href="index.php?page=control&modulo=inicio&id_entidad={$entidad->id}">{$smarty.const.TXT_CONTROL}: {$smarty.const.FIELD_MEDICIONES}</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.panel-body --> 
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <!-- /Selección del año de consulta -->

    <div class="row">
        <div class="col-lg-12">
            <legend><i class="fa fa-dashboard fa-fw"></i> {$smarty.const.FIELD_INDICS}/{$smarty.const.FIELD_DATOS}</legend>
            <div id="datos_control">
                <div class="alert alert-info">
                    <i class="fa fa-info-circle fa-fw"></i> 
                    {$smarty.const.MSG_CONTROL_EFQM_NO_RESUL}
                </div>
            </div>
            <!-- /#datos_control -->
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
{/if}

{if $modulo == 'efqm'} 
    {if isset($indicadores_efqm) && count($indicadores_efqm)>0}
        <div class="table-responsive">
            <table id="tabla_indicadores" class="table table-condensed datatable table-striped table-hover">
                <thead>
                    <tr>   
                        <th>{$smarty.const.FIELD_COD}</th>
                        <th>{$smarty.const.FIELD_INDIC}</th>
                        <th>{$smarty.const.FIELD_EFQM}</th>
                        <th>{$smarty.const.FIELD_RESP}</th>
                        <th>{$smarty.const.FIELD_RESP_MED}</th>
                        <th>{$smarty.const.FIELD_ACCIONES}</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach from=$indicadores_efqm item=indicador} 
                        <tr>
                            <td><span class="label label-primary">{$indicador->codigo}</span></td>
                            <td>
                                {if $indicador->calculo}
                                    <i class="fa fa-calculator fa-fw" title="{$smarty.const.TXT_CALC_AUTO}: {$indicador->calculo}"></i>
                                {/if}
                                {if $indicador->id_tipo_agregacion!= 0}
                                    <i class="fa fa-sitemap fa-fw" title="{$smarty.const.FIELD_AGREG}"></i>
                                {/if}
                                <a target="_blank" href='index.php?page=indicador_mostrar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}' 
                                   title="{$indicador->nombre}: {$indicador->descripcion|replace:"\r\n":" "}">
                                    {$indicador->nombre}</a>
                            </td>
                            <td>
                                {if ($indicador->criterios_efqm|@count) > 0}
                                    <ul class="list-unstyled"> 
                                        {foreach $indicador->criterios_efqm as $indicador_criterio_efqm}
                                            <li>
                                                {$indicador_criterio_efqm->criterio_efqm->codigo} - {$indicador_criterio_efqm->criterio_efqm->nombre}
                                            </li>
                                        {/foreach}
                                    </ul>
                                {else}
                                    {$smarty.const.MSG_NO_DEF}
                                {/if}
                            </td>
                            <td style="font-size: 12px">
                                <a title="{$smarty.const.TXT_USER_PERFIL}" href='index.php?page=usuario_mostrar&id_usuario={$indicador->id_responsable}'>
                                    {$indicador->responsable->nombre} {$indicador->responsable->apellidos}</a>
                            </td>
                            <td style="font-size: 12px">
                                <a title="{$smarty.const.TXT_USER_PERFIL}" href='index.php?page=usuario_mostrar&id_usuario={$indicador->id_responsable_medicion}'>
                                    {$indicador->responsable_medicion->nombre} {$indicador->responsable_medicion->apellidos}</a>
                            </td>
                            <td>
                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_FICHA}" target="_blank" href='index.php?page=indicador_mostrar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                                    <i class="fa fa-folder fa-fw"></i>
                                </a>
                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_REP_GRAFIC}" target="_blank" href='index.php?page=graficas_mostrar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                                    <i class="fa fa-area-chart fa-fw"></i>
                                </a>
                                <a class="btn btn-default btn-circle btn-xs" href='index.php?page=medicion_listar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}' 
                                   title="{$smarty.const.FIELD_MEDICIONES}" target="_blank">
                                    <i class="fa fa-hourglass fa-fw"></i>
                                </a>
                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_ANALISIS}" href='index.php?page=analisis&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}' target="_blank">
                                    <i class="fa fa-connectdevelop fa-fw"></i>
                                </a>
                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_VAL_REF}" href='index.php?page=valor_referencia&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}' target="_blank">
                                    <i class="fa fa-tags fa-fw"></i>
                                </a>
                                {if $_control OR $_usuario->id==$indicador->id_responsable}
                                    <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_EDIT}" href='index.php?page=indicador_editar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}' target="_blank">
                                        <i class="fa fa-pencil fa-fw"></i>
                                    </a>
                                    <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_VAL_EDIT}" href='index.php?page=valores&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}' target="_blank">
                                        <i class="fa fa-pencil-square-o fa-fw"></i> 
                                    </a>
                                    <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.FIELD_RESP_MED}" href='index.php?page=medicion_responsable&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}' target="_blank">
                                        <i class="fa fa-user fa-fw"></i>
                                    </a>
                                    <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_BORRAR}" href='javascript:void(0)' data-toggle="modal" data-target="#dialogo_confirmar_borrado"
                                       data-id_indicador="{$indicador->id}" data-nombre_indicador="{$indicador->nombre}" data-id_entidad="{$indicador->id_entidad}">
                                        <i class="fa fa-trash fa-fw"></i>
                                    </a>
                                {/if}
                            </td>
                        </tr>
                    {/foreach}
                </tbody>
            </table>
        </div>
        {*Recargamos script para datatables y botones*}
        {literal}
            <script defer>
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

                    //Reajustamos las cabeceras de las datatables al cambiar de pestaña
                    $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
                        datatables.fixedHeader.adjust();
                    });

                    //Reajustamos las cabeceras de las datatables al hacer scroll
                    $('.table-responsive').on('scroll', function () {
                        datatables.fixedHeader.adjust();
                    });
                });
            </script>
        {/literal}
    {else}
        <div class="alert alert-info">
            <i class="fa fa-info-circle fa-fw"></i> 
            {$smarty.const.MSG_CONTROL_EFQM_NO_RESUL}
        </div>
    {/if}
{/if}