<!-- Diálogo Confirmar Borrado -->
<div class="modal fade" id="dialogo_confirmar_borrado" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel"><i class="fa fa-trash fa-fw"></i> {$smarty.const.TXT_INDIC_BORRAR}: {$indicador->nombre}</h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_INDIC_CONFIRM_BORRAR}</p>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_NO}" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_NO}</button>
                <a title="{$smarty.const.TXT_SI}" class="btn btn-success" name="borrar" id="borrar" href='index.php?page=indicador_borrar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><i class="fa fa-check fa-fw"></i> {$smarty.const.TXT_SI}</a>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Confirmar Borrado -->

<!-- Diálogo Confirmar Archivado -->
<div class="modal fade" id="dialogo_confirmar_archivado" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel"><i class="fa fa-archive fa-fw"></i> {$smarty.const.TXT_INDIC_ARCHIVAR}: {$indicador->nombre}</h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_INDIC_CONFIRM_ARCHIVAR}</p>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_NO}" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_NO}</button>
                <a title="{$smarty.const.TXT_SI}" class="btn btn-success" name="borrar" id="borrar" href='index.php?page=indicador_archivar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}&modulo=archivar'><i class="fa fa-check fa-fw"></i> {$smarty.const.TXT_SI}</a>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Confirmar Archivado -->

<!-- Diálogo Confirmar Restaurar -->
<div class="modal fade" id="dialogo_confirmar_restaurar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel"><i class="fa fa-recycle fa-fw"></i> {$smarty.const.TXT_INDIC_RESTAURAR}: {$indicador->nombre}</h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_INDIC_CONFIRM_RESTAURAR}</p>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_NO}" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_NO}</button>
                <a title="{$smarty.const.TXT_SI}" class="btn btn-success" name="borrar" id="borrar" href='index.php?page=indicador_archivar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}&modulo=restaurar'><i class="fa fa-check fa-fw"></i> {$smarty.const.TXT_SI}</a>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Confirmar Restaurar -->

<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <h3 title="{$_nombre_pagina}" class="page-header">
            <div class="row">
                <div class="col-md-10">
                    <i class="fa fa-dashboard fa-fw"></i>{if $indicador->archivado}<sub class="fa fa-archive fa-fw"></sub>{else}{if $indicador->id_proceso}<sub class="fa fa-gear fa-fw"></sub>{else if $indicador->control}<sub class="fa fa-sliders fa-fw"></sub>{else}<sub class="fa fa-database fa-fw"></sub>{/if}{/if} {$_nombre_pagina}
                </div>
                <!-- /.col-md-10 -->
                <!-- Navegación -->
                {if count($indicadores)> 1}
                    <div class="col-md-2">
                        <div style="font-size:10px">{$indice+1} {$smarty.const.TXT_DE} {count($indicadores)} {$smarty.const.FIELD_INDICS}</div>
                        <div class="btn-toolbar" role="toolbar" aria-label="">
                            <div class="btn-group" role="group" aria-label="">
                                <a title="{$smarty.const.TXT_PRIMER} {$smarty.const.FIELD_INDIC}" class="btn btn-danger btn-xs {if $indice == 0}disabled{/if}" href='index.php?page=indicador_mostrar&id_entidad={$entidad->id}&id_indicador={$indicadores[0]->id}'>
                                    <i class="fa fa-step-backward fa-fw"></i>
                                </a>
                                <a title="{$smarty.const.TXT_ANT} {$smarty.const.FIELD_INDIC}" class="btn btn-danger btn-xs {if $indice == 0}disabled{/if}" href='index.php?page=indicador_mostrar&id_entidad={$entidad->id}&id_indicador={$indicadores[$indice-1]->id}'>
                                    <i class="fa fa-play fa-rotate-180 fa-fw"></i>
                                </a>
                                <a title="{$smarty.const.TXT_SIG} {$smarty.const.FIELD_INDIC}" class="btn btn-danger btn-xs {if $indice == (count($indicadores)-1)}disabled{/if}" href='index.php?page=indicador_mostrar&id_entidad={$entidad->id}&id_indicador={$indicadores[$indice+1]->id}'>
                                    <i class="fa fa-play fa-fw"></i>
                                </a>
                                <a title="{$smarty.const.TXT_ULTIMO} {$smarty.const.FIELD_INDIC}" class="btn btn-danger btn-xs {if $indice == (count($indicadores)-1)}disabled{/if}" href='index.php?page=indicador_mostrar&id_entidad={$entidad->id}&id_indicador={$indicadores[(count($indicadores)-1)]->id}'>
                                    <i class="fa fa-step-forward fa-fw"></i>
                                </a>
                            </div>
                        </div> 
                    </div>
                    <!-- /.col-md-2 -->
                {/if}
                <!-- /Navegación -->
            </div>
            <!-- /.row -->
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
            {if $indicador->id_proceso}
                <li>
                    <a title="{$smarty.const.FIELD_PROCS}" href='index.php?page=proceso_listar&id_entidad={$entidad->id}'>{$smarty.const.FIELD_PROCS}</a>
                </li>
                {if $proceso->madre}
                    <li>
                        <a title="{$proceso->madre->nombre}" href='index.php?page=proceso_mostrar&id_proceso={$proceso->madre->id}&id_entidad={$entidad->id}'>{$proceso->madre->nombre|truncate:30}</a>
                    </li>
                {/if}
                <li>
                    <a title="{$proceso->nombre}" href='index.php?page=proceso_mostrar&id_proceso={$proceso->id}&id_entidad={$entidad->id}'>{$proceso->nombre|truncate:30}</a>
                </li>
            {else}
                <li>
                    <a title="{$smarty.const.FIELD_INDICS}/{$smarty.const.FIELD_DATOS}" href='index.php?page=indicador_listar&id_entidad={$entidad->id}'>{$smarty.const.FIELD_INDICS}/{$smarty.const.FIELD_DATOS}</a>
                </li>
            {/if}
            <li title="{$_nombre_pagina}" class="active">{$_nombre_pagina}</li>
        </ol>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- /Breadcrumbs -->

<!-- Menú del indicador -->
<div class="row">
    <div class="col-lg-12">
        <ul class="nav nav-tabs">
            <li role="presentation" class="active">
                <a title="{$smarty.const.TXT_FICHA}" href="#"><i class="fa fa-folder fa-fw"></i> {$smarty.const.TXT_FICHA}</a>
            </li>
            <li role="presentation">
                <a title="{$smarty.const.TXT_REP_GRAFIC}" href='index.php?page=graficas_mostrar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><i class="fa fa-area-chart fa-fw"></i> {$smarty.const.TXT_REP_GRAFIC}</a>
            </li>
            <li role="presentation">
                <a title="{$smarty.const.FIELD_MEDICIONES}" href='index.php?page=medicion_listar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><i class="fa fa-hourglass fa-fw"></i> {$smarty.const.FIELD_MEDICIONES}</a>
            </li>
            {if $_control || $_usuario->id==$indicador->id_responsable}
                <li role="presentation">
                    <a title="{$smarty.const.TXT_VAL_EDIT}" href='index.php?page=valores&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><i class="fa fa-pencil-square-o fa-fw"></i> {$smarty.const.TXT_VAL_EDIT}</a>
                </li>
                <li role="presentation">
                    <a title="{$smarty.const.FIELD_RESP_MED}" href='index.php?page=medicion_responsable&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><i class="fa fa-user fa-fw"></i> {$smarty.const.FIELD_RESP_MED}</a>
                </li>
            {/if}
            <li role="presentation">
                <a title="{$smarty.const.TXT_VAL_REF}" href='index.php?page=valor_referencia&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><i class="fa fa-tags fa-fw"></i> {$smarty.const.TXT_VAL_REF}</a>
            </li>
            <li role="presentation">
                <a title="{$smarty.const.TXT_ANALISIS}" href='index.php?page=analisis&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><i class="fa fa-connectdevelop fa-fw"></i> {$smarty.const.TXT_ANALISIS}</a>
            </li>
        </ul>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<br>
<!-- /Menú del indicador -->

<!-- Barra de botones -->
{if $_control || $responsable}
    <div id="botones" class="hidden">
        <a title="{$smarty.const.TXT_INDIC_EDIT}" class="btn btn-danger {if $indicador->archivado}disabled{/if}" href='index.php?page=indicador_editar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>
            <i class="fa fa-dashboard fa-fw"></i><sub class="fa fa-pencil fa-fw"></sub>
        </a>
        {if !$indicador->archivado}
            <a title="{$smarty.const.TXT_INDIC_ARCHIVAR}" class="btn btn-danger" href='javascript:void(0)' 
               data-toggle="modal" data-target="#dialogo_confirmar_archivado">
                <i class="fa fa-archive fa-fw"></i>
            </a>
        {/if}
        <a title="{$smarty.const.TXT_INDIC_BORRAR}" class="btn btn-danger {if $indicador->archivado}disabled{/if}" href='javascript:void(0)' 
           data-toggle="modal" data-target="#dialogo_confirmar_borrado">
            <i class="fa fa-trash fa-fw"></i>
        </a>
    </div>
{/if}
<!-- /Barra de botones -->

<!-- Indicadores archivados -->
{if $indicador->archivado}
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-danger">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-sm-10">
                            <span class="panel-title">
                                <i class="fa fa-archive fa-fw"></i> {$smarty.const.TXT_INDIC_ARCHIVADO}
                            </span>
                        </div>
                        <!-- /.col-sm-10 -->
                        <div class="col-sm-2">
                            {if $_control || $responsable}
                                <a title="{$smarty.const.TXT_INDIC_RESTAURAR}" class="btn btn-danger pull-right" href='javascript:void(0)' 
                                   data-toggle="modal" data-target="#dialogo_confirmar_restaurar">
                                    <i class="fa fa-recycle fa-fw"></i>
                                </a>
                            {/if}
                        </div>
                        <!-- /.col-sm-2 -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-hover">
                            <tbody>
                                <tr>
                                    <th>{$smarty.const.FIELD_CREAC}</th>
                                    <td>{$indicador->fecha_creacion|date_format:"%d-%m-%Y"}</td>
                                </tr>
                                <tr>
                                    <th>{$smarty.const.FIELD_ARCHIVADO}</th>
                                    <td>{$indicador->archivado|date_format:"%d-%m-%Y"}</td>
                                </tr>
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
{/if}
<!-- /Indicadores archivados -->

<!-- Indicadores calculados -->
{if $indicador->calculo}
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <span class="panel-title"><i class="fa fa-info-circle fa-fw"></i> {$smarty.const.TXT_CALC_AUTO}</span>
                    <i class="fa fa-chevron-down pull-right clickable panel-collapsed"></i>
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body" style="display: none">
                    {$smarty.const.TXT_DEPENDE}
                    <div class="table-responsive">
                        <table class="table table-striped table-hover">
                            <tr>
                                <th>{$smarty.const.FIELD_ID}</th>
                                <th>{$smarty.const.FIELD_NOMBRE}</th>
                            </tr>
                            {foreach $indicadores_influyentes as $indicador_influyente}
                                <tr>
                                    <td><span class="badge">{$indicador_influyente->id}</span></td>
                                    <td>
                                        <a class="btn btn-info" href='index.php?page=indicador_mostrar&id_indicador={$indicador_influyente->id}&id_entidad={$indicador_influyente->id_entidad}' 
                                           title="{$smarty.const.TXT_FICHA}: {$indicador_influyente->nombre}">
                                            <i class="fa fa-dashboard fa-fw"></i>{if $indicador_influyente->id_proceso}<sub class="fa fa-gear fa-fw"></sub>{else if $indicador_influyente->control}<sub class="fa fa-sliders fa-fw"></sub>{else}<sub class="fa fa-database fa-fw"></sub>{/if} {$indicador_influyente->nombre}
                                        </a>
                                    </td>
                                </tr>  
                            {/foreach}
                            <tr class="info">
                                <th><i class="fa fa-calculator fa-fw"></i> {$smarty.const.FIELD_FORMULA}</th>
                                <td>{$indicador->calculo}</td>
                            </tr>
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
<!-- /Indicadores calculados -->

<!-- Indicadores dependientes -->
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
                                <tr>
                                    <td><span class="badge">{$indicador_dependiente->id}</span></td>
                                    <td>
                                        <a class="btn btn-warning" href='index.php?page=indicador_mostrar&id_indicador={$indicador_dependiente->id}&id_entidad={$indicador_dependiente->id_entidad}' 
                                           title="{$smarty.const.TXT_FICHA}: {$indicador_dependiente->nombre}">
                                            <i class="fa fa-dashboard fa-fw"></i>{if $indicador_dependiente->id_proceso}<sub class="fa fa-gear fa-fw"></sub>{else if $indicador_dependiente->control}<sub class="fa fa-sliders fa-fw"></sub>{else}<sub class="fa fa-database fa-fw"></sub>{/if} {$indicador_dependiente->nombre}
                                        </a>
                                    </td>
                                </tr>  
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
<!-- /Indicadores dependientes -->

<div class="row">
    <div class="col-lg-12">
        <div class="table-responsive">
            <table class="table table-striped table-hover ficha">
                <thead><th></th><th></th></thead>
                <tbody>
                    <tr>
                        <th>{$smarty.const.FIELD_ID}</th>
                        <td><span class="badge">{$indicador->id}</span></td>
                    </tr>
                    <tr>
                        <th>{$smarty.const.FIELD_COD}</th>
                        <td><span class="label label-primary">{$indicador->codigo}</span></td>
                    </tr>
                    <tr>
                        {if $indicador->control}
                            <th>{$smarty.const.FIELD_OBJ_OP}</th>
                            <td>
                                {if isset($objop)}
                                    <a title="{$smarty.const.TXT_FICHA}" href="index.php?page=objop_mostrar&id_objop={$objop->id}&id_entidad={$indicador->id_entidad}">{$objop->nombre}</a>
                                {else}
                                    ---
                                {/if}
                            </td>
                        {else}
                            <th>{$smarty.const.FIELD_PROC}</th>
                            <td>
                                {if $indicador->id_proceso}
                                    <a title="{$smarty.const.TXT_PROC_VER}" href="index.php?page=proceso_mostrar&id_proceso={$indicador->proceso->id}&id_entidad={$indicador->id_entidad}">{$indicador->proceso->codigo} - {$indicador->proceso->nombre}</a>
                                {else}
                                    {$smarty.const.TXT_INDIC_NO_PROC} ({$smarty.const.FIELD_DATO})
                                {/if}
                            </td>
                        {/if}
                    </tr>
                    <tr>
                        <th>{$smarty.const.FIELD_NOMBRE}</th>
                        <td>{$indicador->nombre}</td>
                    </tr>
                    <tr>
                        <th>{$smarty.const.FIELD_DESC}</th>
                        <td> 
                            {if $indicador->descripcion != ""}
                                {$indicador->descripcion|nl2br}
                            {else}
                                ---
                            {/if}
                        </td>
                    </tr>
                    <tr>
                        <th>{$smarty.const.FIELD_HISTORICO}</th>
                        <td>{$indicador->historicos}</td>
                    </tr>
                    <tr>
                        <th>{$smarty.const.FIELD_PERIOD}</th>
                        <td>{$indicador->periodicidad}</td>
                    </tr>      
                    <tr>
                        <th title="{$smarty.const.TXT_CALCULO_TOTAL_ANUAL}">{$smarty.const.FIELD_CALC_TOTAL_ANUAL}</th>
                        <td title="{$indicador->tipo_agregacion_temporal->explicacion}">{$indicador->tipo_agregacion_temporal->descripcion}</td>
                    </tr>
                    <tr>
                        <th>{$smarty.const.FIELD_OBSERV}</th>
                        <td> 
                            {if $indicador->observaciones != ""}
                                {$indicador->observaciones|nl2br}
                            {else}
                                ---
                            {/if}
                        </td>
                    </tr>
                    <tr>
                        <th>{$smarty.const.FIELD_FORM}</th>
                        <td>
                            {if $indicador->formulacion != ""}
                                {$indicador->formulacion|nl2br}
                            {else}
                                ---
                            {/if}
                        </td>
                    </tr>
                    <tr>
                        <th>{$smarty.const.FIELD_RESP_SEG}</th>
                        <td> {$indicador->responsable->nombre} {$indicador->responsable->apellidos}
                            {if $indicador->responsable->puesto} - {$indicador->responsable->puesto} {/if}
                        </td>
                    </tr>
                    <tr>
                        <th>{$smarty.const.FIELD_RESP_MED}</th>
                        <td> {$indicador->responsable_medicion->nombre} {$indicador->responsable_medicion->apellidos}
                            {if $indicador->responsable_medicion->puesto} - {$indicador->responsable_medicion->puesto} {/if}
                        </td>
                    </tr>
                    <tr>
                        <th>{$smarty.const.FIELD_FUENTE_INFO}</th>
                        <td> 
                            {if $indicador->fuente_informacion != ""}
                                {$indicador->fuente_informacion}
                            {else}
                                ---
                            {/if}
                        </td>
                    </tr>
                    <tr>
                        <th>{$smarty.const.FIELD_FUENTE_DAT}</th>
                        <td> 
                            {if $indicador->fuente_datos != ""}
                                {$indicador->fuente_datos}
                            {else}
                                ---
                            {/if}
                        </td>
                    </tr>
                    <tr>
                        <th>{$smarty.const.FIELD_MET}</th>
                        <td> 
                            {if $indicador->evidencia != ""}
                                {$indicador->evidencia}
                            {else}
                                ---
                            {/if}
                        </td>
                    </tr>
                    <tr>
                        <th>{$smarty.const.FIELD_INTERP}</th>
                        <td> 
                            {if $indicador->interpretacion != ""}
                                {$indicador->interpretacion}
                            {else}
                                ---
                            {/if}
                        </td>
                    </tr>
                    <tr>
                        <th>{$smarty.const.FIELD_ESTIMACION}</th>
                        <td title="{$smarty.const.TXT_ESTIMACION}"> 
                            {if $indicador->inverso}
                                {$smarty.const.TXT_DESCENDENTE}
                            {else}
                                {$smarty.const.TXT_ASCENDENTE}
                            {/if}
                        </td>
                    </tr>
                    <tr>
                        <th>{$smarty.const.FIELD_INTERVALO}</th>
                        <td>
                            {if $indicador->valor_min != NULL && $indicador->valor_max != NULL}
                                [{$indicador->valor_min}, {$indicador->valor_max}] 
                            {else}
                                {$smarty.const.TXT_NO_ASIG}
                            {/if}
                        </td>
                    </tr>
                    <tr>
                        <th>{$smarty.const.FIELD_EFQM}</th>
                        <td>
                            {if ($indicador->criterios_efqm|@count) > 0}
                                <ul> 
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
                    </tr>
                    <tr>
                        <th>{$smarty.const.FIELD_VISIBILIDAD}</th>
                        <td>{$indicador->visibilidad->nombre}</td>
                    </tr>
                    <tr>
                        <th>{$smarty.const.FIELD_UNID_GEN}</th>
                        <td> 
                            {if $indicador->unidad_generadora != ""}
                                {$indicador->unidad_generadora}
                            {else}
                                ---
                            {/if}
                        </td>
                    </tr>
                    <tr>
                        <th>
                            {if $indicador->id_tipo_agregacion}
                                {$smarty.const.FIELD_SUBUNIDS}
                            {else}
                                {$smarty.const.FIELD_UNID}
                            {/if}
                        </th>
                        <td>
                            {if $indicador_subunidades}
                                <ul class="list-unstyled">
                                    {foreach $indicador_subunidades as $indicador_subunidad}
                                        <li>
                                            <a title="{$indicador_subunidad->entidad->etiqueta}" href="index.php?page=entidad_mostrar&id_entidad={$indicador_subunidad->entidad->id}">{$indicador_subunidad->entidad->etiqueta}</a>
                                        </li>
                                    {/foreach}
                                </ul>
                            {else}
                                {$smarty.const.MSG_INDIC_NO_SUBUNID_ASIG}
                            {/if}
                        </td>
                    </tr>
                    <tr>
                        <th title="{$smarty.const.TXT_CALCULO_TOTAL}">{$smarty.const.FIELD_CALC_TOTAL}</th>
                        <td title="{$indicador->tipo_agregacion->explicacion}">{$indicador->tipo_agregacion->descripcion}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->