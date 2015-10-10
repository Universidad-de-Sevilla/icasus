<!-- Diálogo Asignar Unidad a una medición -->
<div class="modal fade" id="modal_asignar_una_medicion" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel"><i class="fa fa-pencil-square-o fa-fw"></i> <span id="nombre_subunidad"></span></h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.TXT_INDIC_CONFIRM_ASIG_MED}</p>
                <p>{$smarty.const.TXT_INDIC_ACT_MED}
                    <input id="activo" name="activo" data-toggle="toggle" data-on="{$smarty.const.TXT_SI}"
                           data-onstyle="success" data-offstyle="danger" data-size="mini"
                           data-off="{$smarty.const.TXT_NO}" type="checkbox" 
                           checked="checked">
                </p>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_NO}" class="btn btn-default btn-danger" data-dismiss="modal"><i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_NO}</button>
                <button title="{$smarty.const.TXT_SI}" class="btn btn-default btn-success" name="btn_confirm_med" id="btn_confirm_med" data-dismiss="modal"><i class="fa fa-check fa-fw"></i> {$smarty.const.TXT_SI}</button>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Asignar Unidad a una medición -->

<!-- Diálogo Activar/desactivar las mediciones de una subunidad para un indicador/dato -->
<div class="modal fade" id="modal_activar_all" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel"><i class="fa fa-pencil-square-o fa-fw"></i> <span id="nombre_unidad"></span></h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.TXT_CONFIRM}</p>
                <div class="radio">
                    <label>
                        <input name="activo_all" type="radio" value="1" checked="checked"> 
                        {$smarty.const.TXT_MED_ACT_TODAS}
                    </label>
                </div>
                <div class="radio">
                    <label><input name="activo_all" type="radio" value="0"> 
                        {$smarty.const.TXT_MED_DESACT_TODAS}
                    </label>
                </div>            
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_CANCEL}" class="btn btn-default btn-danger" data-dismiss="modal"><i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_CANCEL}</button>
                <button title="{$smarty.const.TXT_BTN_ACEPTAR}" class="btn btn-default btn-success" name="btn_confirm_all" id="btn_confirm_all" data-dismiss="modal"><i class="fa fa-check fa-fw"></i> {$smarty.const.TXT_BTN_ACEPTAR}</button>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Activar/desactivar las mediciones de una subunidad para un indicador/dato -->

<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <h3 title="{$_nombre_pagina}" class="page-header">
            <i class="fa fa-pencil-square-o fa-fw"></i> {$_nombre_pagina}
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
            <div class="btn-group" role="group" aria-label="">    
                <a title="{$smarty.const.TXT_MED_MOSTRAR}" class="btn btn-default btn-danger" href='index.php?page=medicion_listar&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                    <i class="fa fa-clock-o fa-fw"></i> {$smarty.const.TXT_MED_MOSTRAR}
                </a>
                {if $_control}
                    <a title="{$smarty.const.FIELD_RESP_MED}" class="btn btn-default btn-danger" href='index.php?page=medicion_responsable&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                        <i class="fa fa-user fa-fw"></i> {$smarty.const.FIELD_RESP_MED}
                    </a>
                {/if}
            </div>
            <div class="btn-group" role="group" aria-label="">
                <a title="{$smarty.const.TXT_VAL_REF}" class="btn btn-default btn-danger" href='index.php?page=valor_referencia_crear&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                    <i class="fa fa-tags fa-fw"></i> {$smarty.const.TXT_VAL_REF}
                </a>
            </div>
            <div class="btn-group" role="group" aria-label="">
                <a title="{$smarty.const.TXT_VOLVER} {$tipo}" class="btn btn-default btn-danger" href='index.php?page={$tipo}_mostrar&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                    <i class="fa fa-arrow-left fa-fw"></i> {$smarty.const.TXT_VOLVER} {$tipo}
                </a>
            </div>
        </div>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<br>
<!-- /Barra de botones -->

<!-- Indicadores/datos dependientes -->
{if $indicadores_dependientes}
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-warning">
                <div class="panel-heading">
                    <span class="panel-title"><i class="fa fa-exclamation-triangle fa-fw"></i> {$smarty.const.TXT_INDIC_DAT_DEPENDIENTES}</span>
                    <i class="fa fa-chevron-down pull-right clickable panel-collapsed"></i>
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body" style="display: none">
                    {$smarty.const.TXT_INFLUYE}
                    <div class="table-responsive">
                        <table class="table table-striped table-hover">
                            <tr>
                                <th>{$smarty.const.FIELD_ID}</th>
                                <th>{$smarty.const.FIELD_NOMBRE}</th>
                            </tr>
                            {foreach $indicadores_dependientes as $indicador_dependiente}
                                {if $indicador_dependiente->id_proceso}
                                    <tr>
                                        <td><span class="badge">{$indicador_dependiente->id}</span></td>
                                        <td>
                                            <a class="btn btn-default btn-warning" href='index.php?page=indicador_mostrar&id_indicador={$indicador_dependiente->id}&id_entidad={$entidad->id}' 
                                               title="{$smarty.const.TXT_INDIC_MOSTRAR}: {$indicador_dependiente->nombre}">
                                                <i class="fa fa-dashboard fa-fw"></i> {$indicador_dependiente->nombre}
                                            </a>
                                        </td>
                                    </tr>
                                {else}
                                    <tr>
                                        <td><span class="badge">{$indicador_dependiente->id}</span></td>
                                        <td> 
                                            <a class="btn btn-default btn-warning" href='index.php?page=dato_mostrar&id_dato={$indicador_dependiente->id}&id_entidad={$entidad->id}' 
                                               title="{$smarty.const.TXT_DATO_MOSTRAR}: {$indicador_dependiente->nombre}">
                                                <i class="fa fa-database fa-fw"></i> {$indicador_dependiente->nombre}
                                            </a>
                                        </td>
                                    </tr>
                                {/if}   
                            {/foreach}
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
{/if}
<!-- /Indicadores/datos dependientes -->

<!-- Selección de periodos a consultar -->
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-red">
            <div class="panel-heading">
                <span class="panel-title"><i class="fa fa-calendar fa-fw"></i> {$smarty.const.TXT_RANGO_FECHAS}</span>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <form class="form-inline" method="post" action="">
                    <input type="hidden" name="id_indicador" id="id_indicador" value="{$indicador->id}">
                    <input type="hidden" name="id_entidad" id="id_entidad" value="{$entidad->id}">   
                    <div class="form-group">
                        <label for="inicio">{$smarty.const.FIELD_INICIO_PERIODO}</label>            
                        <select class="form-control chosen-select" id="inicio" name="inicio">
                            <option value="0">{$smarty.const.TXT_SEL}</option>
                            {foreach from=$years item=year}
                                <option value="{$year->periodo_inicio|truncate:4:''}" data-id_indicador="{$indicador->id}">{$year->periodo_inicio|truncate:4:''}</option>
                            {/foreach}
                        </select>                
                    </div>
                    <div class="form-group col-lg-offset-1" id="end_year">
                    </div>       
                </form>
                <div class="pull-right">
                    <button id="btn_mostrar"
                            data-id_indicador="{$indicador->id}"
                            data-id_entidad="{$entidad->id}"
                            class="btn btn-default btn-success">
                        <i class="fa fa-check fa-fw"></i> {$smarty.const.TXT_MOSTRAR_RESUL}
                    </button>
                </div> 
            </div>
            <!-- /.panel-body --> 
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- /Selección de periodos a consultar -->

<!-- Valores de subunidades-mediciones -->
<div class="row">
    <div class="col-lg-12" id="mostrar_valores">
        <div class="panel panel-red">
            <div class="panel-heading">
                <span class="panel-title"><i class="fa fa-tags fa-fw"></i> {$smarty.const.TXT_VAL_TABLA}</span>
            </div>
            <!-- /.panel-heading -->
            <div id="panel_valores" class="panel-body">
                {include file="indicador_subunidad_valor_mostrar.tpl"}
            </div>
            <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- /Valores de subunidades-mediciones -->