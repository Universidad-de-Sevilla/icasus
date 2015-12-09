<!-- Diálogo Valor fuera del intervalo -->
<div class="modal fade" id="dialogo_valor_intervalo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel"><i class="fa fa-pencil fa-fw"></i> {$smarty.const.TXT_VAL_EDIT}: {$indicador->nombre}</h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_MED_VAL_INTERVALO} <span id="intervalo"></span></p>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_BTN_ACEPTAR}" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-check fa-fw"></i> {$smarty.const.TXT_BTN_ACEPTAR}</button>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Valor fuera del intervalo -->

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
                <button type="button" title="{$smarty.const.TXT_NO}" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_NO}</button>
                <button title="{$smarty.const.TXT_SI}" class="btn btn-success" name="btn_confirm_med" id="btn_confirm_med" data-dismiss="modal"><i class="fa fa-check fa-fw"></i> {$smarty.const.TXT_SI}</button>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Asignar Unidad a una medición -->

{foreach from=$subunidades_mediciones item=subunidades}
    <!-- Diálogo Activar las mediciones de una subunidad para un indicador/dato -->
    <div class="modal fade" id="modal_activar_all_{$subunidades->id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h3 class="modal-title" id="myModalLabel"><i class="fa fa-pencil-square-o fa-fw"></i> <span id="nombre_unidad_{$subunidades->id}"></span></h3>
                </div>
                <div class="modal-body">
                    <p>{$smarty.const.TXT_MED_ACT_TODAS}</p>          
                </div>
                <div class="modal-footer">
                    <button type="button" title="{$smarty.const.TXT_CANCEL}" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_CANCEL}</button>
                    <button title="{$smarty.const.TXT_BTN_ACEPTAR}" class="btn btn-success" name="btn_confirm_all" id="btn_confirm_all_{$subunidades->id}" data-dismiss="modal"><i class="fa fa-check fa-fw"></i> {$smarty.const.TXT_BTN_ACEPTAR}</button>
                </div>
            </div>
        </div>
    </div>
    <!-- /Diálogo Activar las mediciones de una subunidad para un indicador/dato -->

    <!-- Diálogo Desactivar las mediciones de una subunidad para un indicador/dato -->
    <div class="modal fade" id="modal_desactivar_all_{$subunidades->id}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h3 class="modal-title" id="myModalLabel"><i class="fa fa-pencil-square-o fa-fw"></i> <span id="nombre_unidad_des_{$subunidades->id}"></span></h3>
                </div>
                <div class="modal-body">
                    <p>{$smarty.const.TXT_MED_DESACT_TODAS}</p>             
                </div>
                <div class="modal-footer">
                    <button type="button" title="{$smarty.const.TXT_CANCEL}" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_CANCEL}</button>
                    <button title="{$smarty.const.TXT_BTN_ACEPTAR}" class="btn btn-success" name="btn_confirm_des_all" id="btn_confirm_des_all_{$subunidades->id}" data-dismiss="modal"><i class="fa fa-check fa-fw"></i> {$smarty.const.TXT_BTN_ACEPTAR}</button>
                </div>
            </div>
        </div>
    </div>
    <!-- /Diálogo Desactivar las mediciones de una subunidad para un indicador/dato -->
{/foreach}

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
                        <a title="{$smarty.const.TXT_PROCS_DESCRIPCION}" href='index.php?page=proceso_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-gears fa-fw"></i> {$smarty.const.TXT_PROCS} <span title="{$smarty.const.FIELD_TOTAL}: {$num_procesos} {$smarty.const.TXT_PROCS}">({$num_procesos})</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_INDICS_DESCRIPCION}" href='index.php?page=indicador_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-dashboard fa-fw"></i> {$smarty.const.FIELD_INDICS} <span title="{$smarty.const.FIELD_TOTAL}: {$num_indicadores} {$smarty.const.FIELD_INDICS}">({$num_indicadores})</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_DATOS_DESCRIPCION}" href='index.php?page=dato_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-database fa-fw"></i> {$smarty.const.FIELD_DATOS} <span title="{$smarty.const.FIELD_TOTAL}: {$num_datos} {$smarty.const.FIELD_DATOS}">({$num_datos})</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_CONSULTA_DESCRIPCION}" href="index.php?page=consulta_avanzada&id_entidad={$entidad->id}">
                            <i class="fa fa-commenting fa-fw"></i> {$smarty.const.TXT_CONSULT}
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_CUADRO_MANDO_DESCRIPCION}" href='index.php?page=cuadro_listar'>
                            <i class="fa fa-th fa-fw"></i> {$smarty.const.TXT_CUADROS_MANDO}
                        </a>
                    </li>
                    {if $_control}
                        <li class="divider"></li>
                        <li>
                            <a title="{$smarty.const.TXT_CONTROL_DESCRIPCION}" href="index.php?page=control&modulo=inicio&id_entidad={$entidad->id}">
                                <i class="fa fa-sliders fa-fw"></i> {$smarty.const.TXT_CONTROL}
                            </a>
                        </li>
                    {/if}
                </ul>
                <!-- /.dropdown-menu -->
            </li>
            <!-- /.dropdown -->
            <li><a title="{if $tipo == 'indicador'}{$smarty.const.FIELD_INDICS}{else}{$smarty.const.FIELD_DATOS}{/if}" href='index.php?page={$tipo}_listar&id_entidad={$entidad->id}'>{if $tipo == 'indicador'}{$smarty.const.FIELD_INDICS}{else}{$smarty.const.FIELD_DATOS}{/if}</a></li>
            <li><a title="{$indicador->nombre}" href='index.php?page={$tipo}_mostrar&id_{$tipo}={$indicador->id}&id_entidad={$entidad->id}'>{$indicador->nombre|truncate:30}</a></li>
            <li><a title="{$smarty.const.FIELD_MEDICIONES}: {$indicador->nombre}" href='index.php?page=medicion_listar&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'>{$smarty.const.FIELD_MEDICIONES}: {$indicador->nombre|truncate:30}</a></li>
            <li title="{$_nombre_pagina}" class="active">{$_nombre_pagina}</li>
        </ol>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- /Breadcrumbs -->

<!-- Barra de botones -->
<div class="row">
    <div class="col-lg-12">
        <div class="btn-toolbar" role="toolbar" aria-label="">
            <div class="btn-group" role="group" aria-label="">    
                <a title="{$smarty.const.FIELD_MEDICIONES}" class="btn btn-danger" href='index.php?page=medicion_listar&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                    <i class="fa fa-clock-o fa-fw"></i> {$smarty.const.FIELD_MEDICIONES}
                </a>
            </div>
            <div class="btn-group pull-right" role="group" aria-label="">    
                {if $_control || $_usuario->id==$indicador->id_responsable}
                    <a title="{$smarty.const.FIELD_RESP_MED}" class="btn btn-danger" href='index.php?page=medicion_responsable&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                        <i class="fa fa-user fa-fw"></i> {$smarty.const.FIELD_RESP_MED}
                    </a>
                {/if}
                <a title="{$smarty.const.TXT_VAL_REF}" class="btn btn-danger" href='index.php?page=valor_referencia_crear&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                    <i class="fa fa-tags fa-fw"></i> {$smarty.const.TXT_VAL_REF}
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
                                            <a class="btn btn-warning" href='index.php?page=indicador_mostrar&id_indicador={$indicador_dependiente->id}&id_entidad={$entidad->id}' 
                                               title="{$smarty.const.TXT_INDIC_MOSTRAR}: {$indicador_dependiente->nombre}">
                                                <i class="fa fa-dashboard fa-fw"></i> {$indicador_dependiente->nombre}
                                            </a>
                                        </td>
                                    </tr>
                                {else}
                                    <tr>
                                        <td><span class="badge">{$indicador_dependiente->id}</span></td>
                                        <td> 
                                            <a class="btn btn-warning" href='index.php?page=dato_mostrar&id_dato={$indicador_dependiente->id}&id_entidad={$entidad->id}' 
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
                            class="btn btn-success">
                        <i class="fa fa-search fa-fw"></i> {$smarty.const.TXT_MOSTRAR_RESUL}
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
            <div id="panel_valores" data-valor_min="{$indicador->valor_min}" data-valor_max="{$indicador->valor_max}" class="panel-body">
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