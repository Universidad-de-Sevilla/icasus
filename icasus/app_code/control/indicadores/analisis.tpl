<!-- Diálogo Confirmar Restaurar -->
<div class="modal fade" id="dialogo_confirmar_restaurar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h3 class="modal-title" id="myModalLabel"><i
                            class="fa fa-recycle fa-fw"></i> {$smarty.const.TXT_INDIC_RESTAURAR}: {$indicador->nombre}
                </h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_INDIC_CONFIRM_RESTAURAR}</p>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_NO}" class="btn btn-danger" data-dismiss="modal"><i
                            class="fa fa-times fa-fw"></i> {$smarty.const.TXT_NO}</button>
                <a title="{$smarty.const.TXT_SI}" class="btn btn-success" name="borrar" id="borrar"
                   href='index.php?page=indicador_archivar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}&modulo=restaurar'><i
                            class="fa fa-check fa-fw"></i> {$smarty.const.TXT_SI}</a>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Confirmar Restaurar -->

<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <div class="page-header">
            <div class="row">
                <div class="col-md-10">
                    <h4><i class="fa fa-dashboard fa-fw"></i>{if $indicador->archivado}<sub
                            class="fa fa-archive fa-fw"></sub>{else}{if $indicador->id_proceso}
                        <sub class="fa fa-gear fa-fw"></sub>
                    {elseif $indicador->control}
                        <sub class="fa fa-sliders fa-fw"></sub>
                    {else}
                        <sub class="fa fa-database fa-fw"></sub>
                    {/if}{/if} {$_nombre_pagina}</h4>
                </div>
                <!-- /.col-md-10 -->
                <!-- Navegación -->
                {if count($indicadores)> 1}
                    <div class="col-md-2">
                        <div style="font-size:10px">{$indice+1} {$smarty.const.TXT_DE} {count($indicadores)} {$smarty.const.FIELD_INDICS}</div>
                        <div class="btn-toolbar" role="toolbar" aria-label="">
                            <div class="btn-group" role="group" aria-label="">
                                <a title="{$smarty.const.TXT_PRIMER} {$smarty.const.FIELD_INDIC}"
                                   class="btn btn-danger btn-xs {if $indice == 0}disabled{/if}"
                                   href='index.php?page=analisis&id_entidad={$entidad->id}&id_indicador={$indicadores[0]->id}'>
                                    <i class="fa fa-step-backward fa-fw"></i>
                                </a>
                                {if count($indicadores) > 2}
                                    <a title="{$smarty.const.TXT_ANT} {$smarty.const.FIELD_INDIC}"
                                       class="btn btn-danger btn-xs {if $indice == 0}disabled{/if}"
                                       href='index.php?page=analisis&id_entidad={$entidad->id}&id_indicador={$indicadores[$indice-1]->id}'>
                                        <i class="fa fa-play fa-rotate-180 fa-fw"></i>
                                    </a>
                                    <a title="{$smarty.const.TXT_SIG} {$smarty.const.FIELD_INDIC}"
                                       class="btn btn-danger btn-xs {if $indice == (count($indicadores)-1)}disabled{/if}"
                                       href='index.php?page=analisis&id_entidad={$entidad->id}&id_indicador={$indicadores[$indice+1]->id}'>
                                        <i class="fa fa-play fa-fw"></i>
                                    </a>
                                {/if}
                                <a title="{$smarty.const.TXT_ULTIMO} {$smarty.const.FIELD_INDIC}"
                                   class="btn btn-danger btn-xs {if $indice == (count($indicadores)-1)}disabled{/if}"
                                   href='index.php?page=analisis&id_entidad={$entidad->id}&id_indicador={$indicadores[(count($indicadores)-1)]->id}'>
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
        </div>
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
            <li><a title="{$smarty.const.FIELD_UNIDS}"
                   href='index.php?page=entidad_listar'>{$smarty.const.FIELD_UNIDS}</a></li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" data-target="#" title="{$entidad->nombre}"
                   href="index.php?page=entidad_mostrar&id_entidad={$entidad->id}">
                    {$entidad->nombre|truncate:30} <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu">
                    <li>
                        <a title="{$smarty.const.FIELD_USER}: {$_usuario->login} - {$smarty.const.TXT_UNID}: {$entidad->nombre} - {$smarty.const.FIELD_ROL}: {$_rol}"
                           href="index.php?page=entidad_mostrar&id_entidad={$entidad->id}"><i
                                    class="fa fa-folder fa-fw"></i> {$entidad->nombre} / <i
                                    class="fa fa-user fa-fw"></i> {$_rol}</a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a title="{$smarty.const.TXT_PLANES_DESCRIPCION}"
                           href='index.php?page=plan_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-book fa-fw"></i> {$smarty.const.FIELD_PLANES} <span
                                    title="{$smarty.const.FIELD_TOTAL}: {$num_planes} {$smarty.const.FIELD_PLANES}">({$num_planes}
                                )</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_CARTAS_DESCRIPCION}"
                           href='index.php?page=carta_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-map-o fa-fw"></i> {$smarty.const.FIELD_CARTAS} <span
                                    title="{$smarty.const.FIELD_TOTAL}: {$num_cartas} {$smarty.const.FIELD_CARTAS}">({$num_cartas}
                                )</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_PROCS_DESCRIPCION}"
                           href='index.php?page=proceso_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-gears fa-fw"></i> {$smarty.const.FIELD_PROCS} <span
                                    title="{$smarty.const.FIELD_TOTAL}: {$num_procesos} {$smarty.const.FIELD_PROCS}">({$num_procesos}
                                )</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_INDICS_DESCRIPCION}"
                           href='index.php?page=indicador_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-dashboard fa-fw"></i> {$smarty.const.FIELD_INDICS}
                            /{$smarty.const.FIELD_DATOS} <span
                                    title="{$smarty.const.FIELD_TOTAL}: {$num_indicadores} {$smarty.const.FIELD_INDICS}/{$smarty.const.FIELD_DATOS}">({$num_indicadores}
                                )</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_CUADRO_MANDO_DESCRIPCION}"
                           href='index.php?page=cuadro_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-th fa-fw"></i> {$smarty.const.FIELD_CUADROS_MANDO} <span
                                    title="{$smarty.const.FIELD_TOTAL}: {$num_cuadros} {$smarty.const.FIELD_CUADROS_MANDO}">({$num_cuadros}
                                )</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_CONSULTA_DESCRIPCION}"
                           href="index.php?page=consulta_avanzada&id_entidad={$entidad->id}">
                            <i class="fa fa-commenting fa-fw"></i> {$smarty.const.TXT_CONSULT}
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_CONTROL_DESCRIPCION}"
                           href="index.php?page=control&modulo=inicio&id_entidad={$entidad->id}">
                            <i class="fa fa-sliders fa-fw"></i> {$smarty.const.TXT_CONTROL}
                        </a>
                    </li>
                </ul>
                <!-- /.dropdown-menu -->
            </li>
            <!-- /.dropdown -->
            {if $indicador->id_proceso}
                <li>
                    <a title="{$smarty.const.FIELD_PROCS}"
                       href='index.php?page=proceso_listar&id_entidad={$entidad->id}'>{$smarty.const.FIELD_PROCS}</a>
                </li>
                <li>
                    <a title="{$proceso->nombre}"
                       href='index.php?page=proceso_mostrar&id_proceso={$proceso->id}&id_entidad={$entidad->id}'>{$proceso->nombre|truncate:30}</a>
                </li>
            {else}
                <li>
                    <a title="{$smarty.const.FIELD_INDICS}/{$smarty.const.FIELD_DATOS}"
                       href='index.php?page=indicador_listar&id_entidad={$entidad->id}'>{$smarty.const.FIELD_INDICS}
                        /{$smarty.const.FIELD_DATOS}</a>
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
            <li role="presentation">
                <a title="{$smarty.const.TXT_FICHA}"
                   href='index.php?page=indicador_mostrar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><i
                            class="fa fa-folder fa-fw"></i> {$smarty.const.TXT_FICHA}</a>
            </li>
            <li role="presentation">
                <a title="{$smarty.const.TXT_REP_GRAFIC}"
                   href='index.php?page=graficas_mostrar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><i
                            class="fa fa-area-chart fa-fw"></i> {$smarty.const.TXT_REP_GRAFIC}</a>
            </li>
            <li role="presentation">
                <a title="{$smarty.const.FIELD_MEDICIONES}"
                   href='index.php?page=medicion_listar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><i
                            class="fa fa-hourglass fa-fw"></i> {$smarty.const.FIELD_MEDICIONES}</a>
            </li>
            {if $_control || $indicador->id_responsable == $_usuario->id || $permiso_proceso}
                <li role="presentation">
                    <a title="{$smarty.const.TXT_VAL_EDIT}"
                       href='index.php?page=valores&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><i
                                class="fa fa-pencil-square-o fa-fw"></i> {$smarty.const.TXT_VAL_EDIT}</a>
                </li>
                <li role="presentation">
                    <a title="{$smarty.const.FIELD_RESP_MED}"
                       href='index.php?page=medicion_responsable&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><i
                                class="fa fa-user fa-fw"></i> {$smarty.const.FIELD_RESP_MED}</a>
                </li>
            {/if}
            <li role="presentation">
                <a title="{$smarty.const.TXT_VAL_REF}"
                   href='index.php?page=valor_referencia&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><i
                            class="fa fa-tags fa-fw"></i> {$smarty.const.TXT_VAL_REF}</a>
            </li>
            <li role="presentation" class="active">
                <a title="{$smarty.const.TXT_ANALISIS}" href="#"><i
                            class="fa fa-connectdevelop fa-fw"></i> {$smarty.const.TXT_ANALISIS}</a>
            </li>
        </ul>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<br>
<!-- /Menú del indicador -->

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
                                <a title="{$smarty.const.TXT_INDIC_RESTAURAR}" class="btn btn-danger pull-right"
                                   href='javascript:void(0)'
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
                    <span class="panel-title"><i
                                class="fa fa-info-circle fa-fw"></i> {$smarty.const.TXT_CALC_AUTO}</span>
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
                                        <a class="btn btn-info"
                                           href='index.php?page=indicador_mostrar&id_indicador={$indicador_influyente->id}&id_entidad={$indicador_influyente->id_entidad}'
                                           title="{$smarty.const.TXT_FICHA}: {$indicador_influyente->nombre}">
                                            <i class="fa fa-dashboard fa-fw"></i>{if $indicador_influyente->id_proceso}
                                            <sub class="fa fa-gear fa-fw"></sub>{elseif $indicador_influyente->control}
                                            <sub class="fa fa-sliders fa-fw"></sub>{else}<sub
                                                class="fa fa-database fa-fw"></sub>{/if} {$indicador_influyente->nombre}
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
                    <span class="panel-title"><i
                                class="fa fa-exclamation-triangle fa-fw"></i> {$smarty.const.TXT_INDIC_DAT_DEPENDIENTES}</span>
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
                                        <a class="btn btn-warning"
                                           href='index.php?page=indicador_mostrar&id_indicador={$indicador_dependiente->id}&id_entidad={$indicador_dependiente->id_entidad}'
                                           title="{$smarty.const.TXT_FICHA}: {$indicador_dependiente->nombre}">
                                            <i class="fa fa-dashboard fa-fw"></i>{if $indicador_dependiente->id_proceso}
                                            <sub class="fa fa-gear fa-fw"></sub>{elseif $indicador_dependiente->control}
                                            <sub class="fa fa-sliders fa-fw"></sub>{else}<sub
                                                class="fa fa-database fa-fw"></sub>{/if} {$indicador_dependiente->nombre}
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

{if $mediciones}
    <div class="row">

        <!-- Gráfica -->
        <div id="grafica">
            <div class="col-lg-{$panel->ancho}">
                <div class="panel panel-red">
                    <div class="panel-heading">
                        <span class="panel-title"><i
                                    class="fa fa-line-chart fa-fw"></i><strong> {$panel->nombre}</strong> {$smarty.const.TXT_GRAFICO_AUMENTAR}</span>
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        {if $grafica_historico}
                            <div class="highchart"
                                 id="panel_{$panel->id}"
                                 data-id_indicador="{$indicador->id}"
                                 data-nombre_indicador="{$indicador->nombre}"
                                 data-valor_min="{$indicador->valor_min}"
                                 data-valor_max="{$indicador->valor_max}"
                                 data-fecha_inicio="{$panel->fecha_inicio}"
                                 data-fecha_fin="{$panel->fecha_fin}"
                                 data-periodicidad="{$panel->periodicidad}">
                            </div>
                        {else}
                            <div class="alert alert-info alert-dismissible">
                                <i class="fa fa-info-circle fa-fw"></i>
                                {$smarty.const.MSG_INDIC_NO_VAL_PERIODO}
                            </div>
                        {/if}
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-{$panel->ancho} -->
        </div>
        <!-- /Gráfica -->

        <div class="col-lg-6">
            <div class="form-horizontal">
                <div class="form-group">
                    <label for="anyo" class="col-sm-2 control-label">{$smarty.const.FIELD_ANYO}</label>
                    <div class="col-sm-4">
                        <select class="form-control chosen-select" id="anyo" name="anyo"
                                data-id_indicador='{$indicador->id}' data-id_entidad='{$indicador->id_entidad}'>
                            {foreach from=$years item=year}
                                <option value="{$year->periodo_fin|truncate:4:''}"
                                        {if $year->periodo_fin|truncate:4:''== $anyo}selected{/if}>
                                    {$year->periodo_fin|truncate:4:''}
                                </option>
                            {/foreach}
                        </select>
                    </div>
                </div>
            </div>
            <div id='analisis_plan'>
                <div class="form-horizontal">
                    <div id="analisis" class="form-group">
                        <label for="analisis" class="col-sm-2 control-label">{$smarty.const.TXT_ANALISIS}</label>
                        <div class="col-sm-6">
                            <textarea class="form-control" id="texto_analisis"
                                      placeholder="{$smarty.const.TXT_ANALISIS_DESC}" rows="9"
                                      readonly>{$analisis_actual->analisis}</textarea>
                        </div>
                        {if $_control || $responsable}
                            <div class="col-sm-2">
                                <a id="editar_analisis" title="{$smarty.const.TXT_EDIT}"
                                   class="btn btn-default btn-danger btn-xs btn-circle {if $indicador->archivado}disabled{/if}"
                                   data-id_indicador='{$indicador->id}' data-anyo='{$anyo}'><i
                                            class="fa fa-pencil fa-fw"></i></a>
                            </div>
                        {/if}
                    </div>
                    <div id="plan" class="form-group">
                        <label for="plan_accion" class="col-sm-2 control-label">{$smarty.const.TXT_PLAN_ACCION} ({$anyo}
                            )</label>
                        <div class="col-sm-6">
                            <textarea class="form-control" id="texto_plan" placeholder="{$smarty.const.TXT_PLAN_ACCION_DESC}"
                                      rows="9" readonly>{$analisis_actual->plan_accion}</textarea>
                        </div>
                        {if $_control || $responsable}
                            <div class="col-sm-2">
                                <a id="editar_plan" title="{$smarty.const.TXT_EDIT}"
                                   class="btn btn-default btn-danger btn-xs btn-circle {if $indicador->archivado}disabled{/if}"
                                   data-id_indicador='{$indicador->id}' data-anyo='{$anyo}'><i
                                            class="fa fa-pencil fa-fw"></i></a>
                            </div>
                        {/if}
                    </div>
                </div>
            </div>
        </div>
        <!-- /.col-lg-6 -->
    </div>
    <!-- /.row -->

    <!-- Tabla de análisis y planes -->
    <div id="tabla_analisis_plan">
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-red">
                    <div class="panel-heading">
                        <span class="panel-title"><i
                                    class="fa fa-connectdevelop fa-fw"></i> {$smarty.const.TXT_TABLA_ANAPLAN}</span>
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
    </div>
    <!-- /Tabla de análisis y planes -->

{else}
    <div class='row'>
        <div class="col-lg-12">
            <div class="alert alert-info alert-dismissible">
                <i class="fa fa-info-circle fa-fw"></i>
                {$smarty.const.MSG_INDIC_NO_MED}
            </div>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
{/if}