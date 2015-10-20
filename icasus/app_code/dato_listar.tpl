<!-- Diálogo Confirmar Borrado -->
<div class="modal fade" id="dialogo_confirmar_borrado" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel"><i class="fa fa-trash fa-fw"></i> {$smarty.const.TXT_DATO_BORRAR}: <span id="nombre_dato"></span></h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_DATO_CONFIRM_BORRAR}</p>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_NO}" class="btn btn-default btn-danger" data-dismiss="modal"><i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_NO}</button>
                <a title="{$smarty.const.TXT_SI}" class="btn btn-default btn-success" name="borrar" id="borrar"><i class="fa fa-check fa-fw"></i> {$smarty.const.TXT_SI}</a>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Confirmar Borrado -->

<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <h3 title="{$_nombre_pagina}" class="page-header">
            <i class="fa fa-database fa-fw"></i> {$_nombre_pagina}
        </h3>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- /Nombre página -->

<!-- Barra de botones -->
<div class="row">
    <div class="col-lg-12">
        <div class="btn-toolbar" role="toolbar" aria-label="">
            {if $_control}
                <div class="btn-group" role="group" aria-label="">
                    <a class="btn btn-default btn-danger" href='index.php?page=dato_crear&id_entidad={$entidad->id}' title="{$smarty.const.TXT_DATO_CREAR}">
                        <i class="fa fa-plus-circle fa-fw"></i> {$smarty.const.TXT_DATO_CREAR}
                    </a>
                </div>
            {/if}
            {if $entidad->id == 14}
                <div class="btn-group" role="group" aria-label="">
                    <a class="btn btn-default btn-danger" href='index.php?page=datos_rebiun&id_entidad={$entidad->id}' title="{$smarty.const.TXT_DATOS_REBIUN_RECOGIDA}">
                        <i class="fa fa-cubes fa-fw"></i> {$smarty.const.TXT_DATOS_REBIUN_RECOGIDA}
                    </a>
                </div>
            {/if} 
        </div>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<br>
<!-- /Barra de botones -->

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-red">
            <div class="panel-heading">
                <span class="panel-title"><i class="fa fa-database fa-fw"></i> {$smarty.const.FIELD_DATOS}</span>
                <i class="fa fa-chevron-up pull-right clickable"></i>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                {if $datos}
                    <div class="table-responsive">
                        <table class="table table-condensed datatable table-striped table-hover">
                            <thead>
                                <tr>   
                                    <th>{$smarty.const.FIELD_ID}</th>
                                    <th>{$smarty.const.FIELD_DATO}</th>  
                                    <th>{$smarty.const.FIELD_PERIOD}</th>
                                    <th>{$smarty.const.FIELD_RESP}</th>
                                    <th>{$smarty.const.FIELD_RESP_MED}</th>
                                    <th>{$smarty.const.FIELD_ACCIONES}</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach from=$datos item=dato} 
                                    <tr>
                                        <td>
                                            <span class="badge">{$dato->id}</span>
                                        </td>
                                        <td>
                                            {if $dato->calculo}
                                                <i class="fa fa-calculator fa-fw" title="{$smarty.const.TXT_CALC_AUTO}: {$dato->calculo}"></i>
                                            {/if}
                                            <a target="_blank" href='index.php?page=dato_mostrar&id_dato={$dato->id}&id_entidad={$entidad->id}' 
                                               title="{$dato->nombre}: {$dato->descripcion}">
                                                {$dato->nombre}</a>
                                        </td>
                                        <td>{$dato->periodicidad}</td>
                                        <td>
                                            <a title="{$smarty.const.TXT_USER_PERFIL}" href='index.php?page=usuario_mostrar&id_usuario={$dato->id_responsable}&id_entidad={$entidad->id}'>
                                                {$dato->responsable->nombre} 
                                                {$dato->responsable->apellidos}</a>
                                        </td>
                                        <td>
                                            <a title="{$smarty.const.TXT_USER_PERFIL}" href='index.php?page=usuario_mostrar&id_usuario={$dato->id_responsable_medicion}&id_entidad={$entidad->id}'>
                                                {$dato->responsable_medicion->nombre} 
                                                {$dato->responsable_medicion->apellidos}</a>
                                        </td>
                                        <td>
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_DATO_MOSTRAR}" target="_blank" href='index.php?page=dato_mostrar&id_dato={$dato->id}&id_entidad={$entidad->id}'>
                                                <i class="fa fa-folder fa-fw"></i>
                                            </a>
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_REP_GRAFIC}" target="_blank" href='index.php?page=graficas_mostrar&id_dato={$dato->id}&id_entidad={$entidad->id}'>
                                                <i class="fa fa-area-chart fa-fw"></i>
                                            </a>
                                            <a class="btn btn-default btn-circle btn-xs" href='index.php?page=medicion_listar&id_dato={$dato->id}&id_entidad={$dato->id_entidad}' 
                                               title="{$smarty.const.TXT_DATO_MEDICIONES}: {$dato->nombre}" target="_blank">
                                                <i class="fa fa-clock-o fa-fw"></i>
                                            </a>
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_VAL_REF}" href='index.php?page=valor_referencia_crear&id_dato={$dato->id}&id_entidad={$dato->id_entidad}' target="_blank">
                                                <i class="fa fa-tags fa-fw"></i>
                                            </a>
                                            {if $_control}
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_EDIT}" href='index.php?page=dato_editar&id_dato={$dato->id}&id_entidad={$dato->id_entidad}' target="_blank">
                                                    <i class="fa fa-pencil fa-fw"></i>
                                                </a>
                                                {if !$dato->calculo}
                                                    <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_VAL_EDIT}" href='index.php?page=indicador_subunidad_valor&id_dato={$dato->id}&id_entidad={$dato->id_entidad}' target="_blank">
                                                        <i class="fa fa-pencil-square-o fa-fw"></i> 
                                                    </a>
                                                {/if}
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.FIELD_RESP_MED}" href='index.php?page=medicion_responsable&id_dato={$dato->id}&id_entidad={$dato->id_entidad}' target="_blank">
                                                    <i class="fa fa-user fa-fw"></i>
                                                </a>
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_BORRAR}" href='javascript:void(0)' data-toggle="modal" data-target="#dialogo_confirmar_borrado"
                                                   data-id_dato="{$dato->id}" data-nombre_dato="{$dato->nombre}" data-id_entidad="{$dato->id_entidad}">
                                                    <i class="fa fa-trash fa-fw"></i>
                                                </a>
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
                        {$smarty.const.MSG_UNID_NO_DATOS}
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