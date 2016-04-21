<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <h3 title="{$_nombre_pagina}" class="page-header">
            <div class="row">
                <div class="col-md-10">
                    {if $tipo == 'indicador'}<i class="fa fa-dashboard fa-fw"></i>{else}<i class="fa fa-database fa-fw"></i>{/if} {$_nombre_pagina}
                </div>
                <!-- /.col-md-10 -->
                <!-- Navegación -->
                {if count($indicadores)> 1}
                    <div class="col-md-2">
                        <div style="font-size:10px">{$indice+1} {$smarty.const.TXT_DE} {count($indicadores)} {if $tipo == 'indicador'}{$smarty.const.FIELD_INDICS}{else}{$smarty.const.FIELD_DATOS}{/if}</div>
                        <div class="btn-toolbar" role="toolbar" aria-label="">
                            <div class="btn-group" role="group" aria-label="">
                                <a title="{$smarty.const.TXT_PRIMER} {if $tipo == 'indicador'}{$smarty.const.FIELD_INDIC}{else}{$smarty.const.FIELD_DATO}{/if}" class="btn btn-danger btn-xs {if $indice == 0}disabled{/if}" href='index.php?page=graficas_mostrar&id_entidad={$entidad->id}&id_{$tipo}={$indicadores[0]->id}'>
                                    <i class="fa fa-step-backward fa-fw"></i>
                                </a>
                                <a title="{$smarty.const.TXT_ANT} {if $tipo == 'indicador'}{$smarty.const.FIELD_INDIC}{else}{$smarty.const.FIELD_DATO}{/if}" class="btn btn-danger btn-xs {if $indice == 0}disabled{/if}" href='index.php?page=graficas_mostrar&id_entidad={$entidad->id}&id_{$tipo}={$indicadores[$indice-1]->id}'>
                                    <i class="fa fa-play fa-rotate-180 fa-fw"></i>
                                </a>
                                <a title="{$smarty.const.TXT_SIG} {if $tipo == 'indicador'}{$smarty.const.FIELD_INDIC}{else}{$smarty.const.FIELD_DATO}{/if}" class="btn btn-danger btn-xs {if $indice == (count($indicadores)-1)}disabled{/if}" href='index.php?page=graficas_mostrar&id_entidad={$entidad->id}&id_{$tipo}={$indicadores[$indice+1]->id}'>
                                    <i class="fa fa-play fa-fw"></i>
                                </a>
                                <a title="{$smarty.const.TXT_ULTIMO} {if $tipo == 'indicador'}{$smarty.const.FIELD_INDIC}{else}{$smarty.const.FIELD_DATO}{/if}" class="btn btn-danger btn-xs {if $indice == (count($indicadores)-1)}disabled{/if}" href='index.php?page=graficas_mostrar&id_entidad={$entidad->id}&id_{$tipo}={$indicadores[(count($indicadores)-1)]->id}'>
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
                        <a title="{$smarty.const.TXT_CUADRO_MANDO_DESCRIPCION}" href='index.php?page=cuadro_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-th fa-fw"></i> {$smarty.const.TXT_CUADROS_MANDO} <span title="{$smarty.const.FIELD_TOTAL}: {$num_cuadros} {$smarty.const.TXT_CUADROS_MANDO}">({$num_cuadros})</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_CONSULTA_DESCRIPCION}" href="index.php?page=consulta_avanzada&id_entidad={$entidad->id}">
                            <i class="fa fa-commenting fa-fw"></i> {$smarty.const.TXT_CONSULT}
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
            {if $tipo == 'indicador'}
                <li>
                    <a title="{$smarty.const.TXT_PROCS}" href='index.php?page=proceso_listar&id_entidad={$entidad->id}'>{$smarty.const.TXT_PROCS}</a>
                </li>
                <li>
                    <a title="{$proceso->nombre}" href='index.php?page=proceso_mostrar&id_proceso={$proceso->id}&id_entidad={$entidad->id}'>{$proceso->nombre|truncate:30}</a>
                </li>
            {else}
                <li>
                    <a title="{$smarty.const.FIELD_DATOS}" href='index.php?page={$tipo}_listar&id_entidad={$entidad->id}'>{$smarty.const.FIELD_DATOS}</a>
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
                <a title="{$smarty.const.TXT_FICHA}" href='index.php?page={$tipo}_mostrar&id_{$tipo}={$indicador->id}&id_entidad={$entidad->id}'><i class="fa fa-folder fa-fw"></i> {$smarty.const.TXT_FICHA}</a>
            </li>
            <li role="presentation" class="active">
                <a title="{$smarty.const.TXT_REP_GRAFIC}" href="#"><i class="fa fa-area-chart fa-fw"></i> {$smarty.const.TXT_REP_GRAFIC}</a>
            </li>
            <li role="presentation">
                <a title="{$smarty.const.FIELD_MEDICIONES}" href='index.php?page=medicion_listar&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'><i class="fa fa-history fa-fw"></i> {$smarty.const.FIELD_MEDICIONES}</a>
            </li>
            <li role="presentation">
                <a title="{$smarty.const.TXT_VAL_REF}" href='index.php?page=valor_referencia&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'><i class="fa fa-tags fa-fw"></i> {$smarty.const.TXT_VAL_REF}</a>
            </li>
            {if $tipo == 'indicador'}
                <li role="presentation">
                    <a title="{$smarty.const.TXT_ANALISIS}" href='index.php?page=analisis&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><i class="fa fa-connectdevelop fa-fw"></i> {$smarty.const.TXT_ANALISIS}</a>
                </li>
            {/if}
        </ul>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<br>
<!-- /Menú del indicador -->

<!-- Indicadores/datos calculados -->
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
                                {if $indicador_influyente->id_proceso}
                                    <tr>
                                        <td><span class="badge">{$indicador_influyente->id}</span></td>
                                        <td>
                                            <a class="btn btn-info" href='index.php?page=indicador_mostrar&id_indicador={$indicador_influyente->id}&id_entidad={$indicador_influyente->id_entidad}' 
                                               title="{$smarty.const.TXT_FICHA}: {$indicador_influyente->nombre}">
                                                <i class="fa fa-dashboard fa-fw"></i> {$indicador_influyente->nombre}
                                            </a>
                                        </td>
                                    </tr>
                                {else}
                                    <tr>
                                        <td><span class="badge">{$indicador_influyente->id}</span></td>
                                        <td> 
                                            <a class="btn btn-info" href='index.php?page=dato_mostrar&id_dato={$indicador_influyente->id}&id_entidad={$indicador_influyente->id_entidad}' 
                                               title="{$smarty.const.TXT_FICHA}: {$indicador_influyente->nombre}">
                                                <i class="fa fa-database fa-fw"></i> {$indicador_influyente->nombre}
                                            </a>
                                        </td>
                                    </tr>
                                {/if}   
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
<!-- /Indicadores/datos calculados -->

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
                                            <a class="btn btn-warning" href='index.php?page=indicador_mostrar&id_indicador={$indicador_dependiente->id}&id_entidad={$indicador_dependiente->id_entidad}' 
                                               title="{$smarty.const.TXT_FICHA}: {$indicador_dependiente->nombre}">
                                                <i class="fa fa-dashboard fa-fw"></i> {$indicador_dependiente->nombre}
                                            </a>
                                        </td>
                                    </tr>
                                {else}
                                    <tr>
                                        <td><span class="badge">{$indicador_dependiente->id}</span></td>
                                        <td> 
                                            <a class="btn btn-warning" href='index.php?page=dato_mostrar&id_dato={$indicador_dependiente->id}&id_entidad={$indicador_dependiente->id_entidad}' 
                                               title="{$smarty.const.TXT_FICHA}: {$indicador_dependiente->nombre}">
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

<!-- Gráficas -->
<div class ="row">
    {if $pinta_grafico}

        {if $panel_res}
            <div class="col-lg-{$panel_res->ancho}" >
                <div class="panel panel-red">
                    <div class="panel-heading">
                        <span class="panel-title"><i class="fa fa-bar-chart fa-fw"></i><strong> {$panel_res->nombre}</strong> {$smarty.const.TXT_GRAFICO_AUMENTAR}</span>
                        <i class="fa fa-chevron-up pull-right clickable"></i>
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div  id="container" 
                              data-id_indicador="{$indicador->id}" 
                              data-nombre_indicador="{$indicador->nombre}" 
                              data-periodicidad="{$panel_res->periodicidad}"
                              data-valor_min="{$indicador->valor_min}" 
                              data-valor_max="{$indicador->valor_max}">
                        </div>
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-{$panel->ancho} -->    
        {/if}

        {if isset($paneles)}
            {foreach $paneles as $panel}
                <div class="col-lg-{$panel->ancho}" >
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <span class="panel-title"><i class="fa fa-line-chart fa-fw"></i><strong> {$panel->nombre}</strong> {$smarty.const.TXT_GRAFICO_AUMENTAR}</span>
                            <i class="fa fa-chevron-up pull-right clickable"></i>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">  
                            <div class="highchart {$panel->tipo->clase_css}" 
                                 id="panel_{$panel->id}" 
                                 data-id_indicador="{$indicador->id}" 
                                 data-nombre_indicador="{$indicador->nombre}" 
                                 data-valor_min="{$indicador->valor_min}" 
                                 data-valor_max="{$indicador->valor_max}" 
                                 data-fecha_inicio="{$panel->fecha_inicio}" 
                                 data-fecha_fin="{$panel->fecha_fin}" 
                                 data-periodicidad="{$panel->periodicidad}">
                            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-{$panel->ancho} -->
            {/foreach} 
        {/if}

    {else if !$mediciones}
        <div class="col-lg-12">
            <div class="alert alert-info alert-dismissible">
                <i class="fa fa-info-circle fa-fw"></i> 
                {$smarty.const.MSG_MED_NO_TIPO} {$tipo}
            </div>
        </div>
        <!-- /.col-lg-12 -->
    {else}
        <div class="col-lg-12">
            <div class="alert alert-info alert-dismissible">
                <i class="fa fa-info-circle fa-fw"></i> 
                {$smarty.const.MSG_INDIC_NO_VAL}
            </div>
        </div>
        <!-- /.col-lg-12 -->
    {/if}
</div>
<!-- /.row -->
<!-- /Gráficas -->