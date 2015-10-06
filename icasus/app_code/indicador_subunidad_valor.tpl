<!-- Diálogo Activar/Desactivar Valor-medición -->
<div class="modal fade" id="modal_activar_uno" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel"><i class="fa fa-pencil-square-o fa-fw"></i> </h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.TXT_CONFIRM} <b><span id="msg_activacion_uno"></span></b> {$smarty.const.TXT_MED_ESTA}.</p>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_NO}" class="btn btn-default btn-danger" data-dismiss="modal"><i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_NO}</button>
                <a title="{$smarty.const.TXT_SI}" class="btn btn-default btn-success" name="" id=""><i class="fa fa-check fa-fw"></i> {$smarty.const.TXT_SI}</a>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Activar/Desactivar Valor-medición -->

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
                <p>{$smarty.const.TXT_INDIC_ACT_MED}: <input type="checkbox" id="activo" name="activo" value="1" checked="checked">
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_NO}" class="btn btn-default btn-danger" data-dismiss="modal"><i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_NO}</button>
                <a title="{$smarty.const.TXT_SI}" class="btn btn-default btn-success" name="" id=""><i class="fa fa-check fa-fw"></i> {$smarty.const.TXT_SI}</a>
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
                <h3 class="modal-title" id="myModalLabel"><i class="fa fa-pencil-square-o fa-fw"></i> </h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.TXT_CONFIRM}:<br />
                    <input  name="activo_all" type="radio" value="1" checked="checked">{$smarty.const.TXT_MED_ACT_TODAS}<br>
                    <input name="activo_all" type="radio" value="0">{$smarty.const.TXT_MED_DESACT_TODAS}
                </p>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_NO}" class="btn btn-default btn-danger" data-dismiss="modal"><i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_NO}</button>
                <a title="{$smarty.const.TXT_SI}" class="btn btn-default btn-success" name="" id=""><i class="fa fa-check fa-fw"></i> {$smarty.const.TXT_SI}</a>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Activar/desactivar las mediciones de una subunidad para un indicador/dato -->

<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <h3 title="{$_nombre_pagina}" class="page-header">
            <i class="fa fa-folder fa-fw"></i> {$_nombre_pagina}
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
            <div class="panel-body">
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