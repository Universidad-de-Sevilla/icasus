<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <h2 title="{$_nombre_pagina}" class="page-header">
            <i class="fa fa-home fa-fw"></i> {$_nombre_pagina}
        </h2>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- /Nombre página -->

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-red">
            <div class="panel-heading">
                <span class="panel-title"><i class="fa fa-sitemap fa-fw"></i> {$smarty.const.TXT_USER_UNIDS}</span>
                <i class="fa fa-chevron-up pull-right clickable"></i>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                {if $entidades_usuario }
                    <div class="table-responsive">
                        <table class="table datatable table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>{$smarty.const.FIELD_COD}</th>
                                    <th>{$smarty.const.FIELD_UNID}</th>
                                    <th>{$smarty.const.FIELD_ROL}</th>
                                    <th>{$smarty.const.FIELD_ACCIONES}</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach from=$entidades_usuario item=entidad}
                                    <tr>
                                        <td>{$entidad->entidad->codigo}</td>
                                        <td><a title="{$entidad->entidad->nombre}" href='index.php?page=entidad_datos&id_entidad={$entidad->entidad->id}'>{$entidad->entidad->nombre}</a></td>
                                        <td>{$entidad->rol->nombre}</td>
                                        <td style="white-space:nowrap">
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_UNID_FICHA}" href='index.php?page=entidad_datos&id_entidad={$entidad->entidad->id}'><i class="fa fa-th-list fa-fw"></i></a>
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_PROCS}" href='index.php?page=proceso_listar&id_entidad={$entidad->entidad->id}'><i class="fa fa-gears fa-fw"></i></a>
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.FIELD_INDICS}" href='index.php?page=indicador_listar&id_entidad={$entidad->entidad->id}'><i class="fa fa-dashboard fa-fw"></i></a>
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.FIELD_DATOS}" href='index.php?page=dato_listar&id_entidad={$entidad->entidad->id}'><i class="fa fa-table fa-fw"></i></a>
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_CONSULT}" href='index.php?page=consulta_avanzada&id_entidad={$entidad->entidad->id}'><i class="fa fa-eye fa-fw"></i></a>
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_CUAD_RES}" href='index.php?page=cuadro_unidad&id_entidad={$entidad->entidad->id}'><i class="fa fa-dashcube fa-fw"></i></a>
                                                {if $entidad->rol->id == 1 OR $entidad->rol->id == 2}
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_CONTROL}" href='index.php?page=control&modulo=inicio&id_entidad={$entidad->entidad->id}'><i class="fa fa-sliders fa-fw"></i></a>      
                                                {/if}
                                        </td>
                                    </tr>
                                {/foreach}
                            </tbody>
                        </table>
                    </div>
                {else}
                    <div class="alert alert-info alert-dismissible">
                        <i class="fa fa-info-circle fa-fw"></i> 
                        {$smarty.const.MSG_UNID_NO_ASIG}
                    </div>
                {/if}
            </div>
            <!-- /.panel-body -->        
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

{if $indicadores}
    <div class="box grid_16 single_datatable">
        <h2 class="box_head grad_grey_dark">{$smarty.const.TXT_INDIC_ACARGO}</h2>
        <a href="#" class="grabber"></a>
        <a href="#" class="toggle"></a>
        <div id="dt1" class="no_margin">
            <table class="table datatable table-striped table-hover" id="tabla_indicadores">
                <thead>
                    <tr>
                        <th>{$smarty.const.FIELD_COD}</th>
                        <th>{$smarty.const.FIELD_NOMBRE}</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach $indicadores as $indicador}
                        <tr class="gradeX">
                            <td>{$indicador->codigo}</td>
                            <td><a href="index.php?page={if $indicador->id_proceso > 0}indicador{else}dato{/if}_mostrar&id_{if $indicador->id_proceso > 0}indicador{else}dato{/if}={$indicador->id}">{$indicador->nombre}</a></td>
                        </tr>
                    {/foreach}
                </tbody>
            </table>
        </div>
    </div>
{/if}

{if $mediciones_usuario}
    <div class="box grid_16 single_datatable">
        <h2 class="box_head grad_grey_dark">{$smarty.const.TXT_MED_ACARGO}</h2>
        <a href="#" class="grabber"></a>
        <a href="#" class="toggle"></a>
        <div id="dt1" class="no_margin">
            <table class="table datatable table-striped table-hover" id="tabla_mediciones">
                <thead>
                    <tr>
                        <th>{$smarty.const.FIELD_COD}</th>
                        <th>{$smarty.const.FIELD_NOMBRE}</th>
                        <th>{$smarty.const.FIELD_PENDIENTES}</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach $mediciones_usuario as $medicion_usuario}
                        <tr class="gradeX">
                            <td>{$medicion_usuario->codigo}</td>
                            <td><a href="index.php?page={if $medicion_usuario->id_proceso > 0}indicador{else}dato{/if}_mostrar&id_{if $medicion_usuario->id_proceso > 0}indicador{else}dato{/if}={$medicion_usuario->id}">{$medicion_usuario->nombre}</a></td>
                            <td>{$medicion_usuario->valores_pendientes}
                                {if $medicion_usuario->valores_pendientes > 0}
                                    | <a href="index.php?page=medicion_listar&id_{if $medicion_usuario->id_proceso > 0}indicador{else}dato{/if}={$medicion_usuario->id}&id_entidad={$medicion_usuario->id_entidad}">{$smarty.const.TXT_GRABAR}</a>
                                {/if}
                            </td>
                        </tr>
                    {/foreach}
                </tbody>
            </table>
        </div>
    </div>
{/if}