<!-- Diálogo Confirmar Borrado -->
<div class="modal fade" id="dialogo_confirmar_borrado" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel"><i class="fa fa-trash fa-fw"></i> {$smarty.const.TXT_MED_BORRAR}: <span id="etiqueta_medicion"></span></h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_MED_CONFIRM_BORRAR}</p>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_NO}" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_NO}</button>
                <a title="{$smarty.const.TXT_SI}" class="btn btn-success" name="borrar" id="borrar"><i class="fa fa-check fa-fw"></i> {$smarty.const.TXT_SI}</a>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Confirmar Borrado -->

<!-- Diálogo Confirmar Generar -->
<div class="modal fade" id="dialogo_confirmar_generar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel"><i class="fa fa-refresh fa-fw"></i> {$smarty.const.TXT_MED_GENERAR}: {$indicador->nombre}</h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_MED_GENERAR}</p>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_NO}" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_NO}</button>
                <a title="{$smarty.const.TXT_SI}" class="btn btn-success" name="generar" id="generar" href="index.php?page=medicion_generar&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}"><i class="fa fa-check fa-fw"></i> {$smarty.const.TXT_SI}</a>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Confirmar Generar -->

<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <h3 title="{$_nombre_pagina}" class="page-header">
            <div class="row">
                <div class="col-md-10">
                    <i class="fa fa-clock-o fa-fw"></i> {$_nombre_pagina}
                </div>
                <!-- /.col-md-10 -->
                <!-- Navegación -->
                {if count($indicadores)> 1}
                    <div class="col-md-2">
                        <div class="btn-toolbar" role="toolbar" aria-label="">
                            <div class="btn-group" role="group" aria-label="">
                                <a title="{$smarty.const.TXT_PRIMER}" class="btn btn-danger btn-xs {if $indice == 0}disabled{/if}" href='index.php?page=medicion_listar&id_entidad={$entidad->id}&id_{$tipo}={$indicadores[0]->id}'>
                                    <i class="fa fa-step-backward fa-fw"></i>
                                </a>
                                <a title="{$smarty.const.TXT_ANT}" class="btn btn-danger btn-xs {if $indice == 0}disabled{/if}" href='index.php?page=medicion_listar&id_entidad={$entidad->id}&id_{$tipo}={$indicadores[$indice-1]->id}'>
                                    <i class="fa fa-play fa-rotate-180 fa-fw"></i>
                                </a>
                                <a title="{$smarty.const.TXT_SIG}" class="btn btn-danger btn-xs {if $indice == (count($indicadores)-1)}disabled{/if}" href='index.php?page=medicion_listar&id_entidad={$entidad->id}&id_{$tipo}={$indicadores[$indice+1]->id}'>
                                    <i class="fa fa-play fa-fw"></i>
                                </a>
                                <a title="{$smarty.const.TXT_ULTIMO}" class="btn btn-danger btn-xs {if $indice == (count($indicadores)-1)}disabled{/if}" href='index.php?page=medicion_listar&id_entidad={$entidad->id}&id_{$tipo}={$indicadores[(count($indicadores)-1)]->id}'>
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
                <a title="{if $tipo == 'indicador'}{$smarty.const.TXT_INDIC_FICHA}{else}{$smarty.const.TXT_DATO_FICHA}{/if}" href='index.php?page={$tipo}_mostrar&id_{$tipo}={$indicador->id}&id_entidad={$entidad->id}'><i class="fa fa-folder fa-fw"></i> {if $tipo == 'indicador'}{$smarty.const.TXT_INDIC_FICHA}{else}{$smarty.const.TXT_DATO_FICHA}{/if}</a>
            </li>
            <li role="presentation" >
                <a title="{$smarty.const.TXT_REP_GRAFIC}" href='index.php?page=graficas_mostrar&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'><i class="fa fa-area-chart fa-fw"></i> {$smarty.const.TXT_REP_GRAFIC}</a>
            </li>
            <li role="presentation" class="active">
                <a title="{$smarty.const.FIELD_MEDICIONES}" href="#"><i class="fa fa-clock-o fa-fw"></i> {$smarty.const.FIELD_MEDICIONES}</a>
            </li>
        </ul>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<br>
<!-- /Menú del indicador -->

<!-- Barra de botones -->
<div class="row">
    <div class="col-lg-12">
        <div class="btn-toolbar" role="toolbar" aria-label="">
            <div class="btn-group" role="group" aria-label="">
                {if $_control || $responsable}
                    <a title="{$smarty.const.TXT_MED_GENERAR}" class="btn btn-danger" href='javascript:void(0)' 
                       data-toggle="modal" data-target="#dialogo_confirmar_generar">
                        <i class="fa fa-refresh fa-fw"></i> {$smarty.const.TXT_MED_GENERAR}
                    </a>
                    <a title="{$smarty.const.TXT_MED_AGREGAR}" class="btn btn-danger" href="index.php?page=medicion_crear&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}">
                        <i class="fa fa-plus-circle fa-fw"></i> {$smarty.const.TXT_MED_AGREGAR}
                    </a>
                {/if}
                {if !$indicador->calculo && ($_control || $_usuario->id==$indicador->id_responsable)}
                    <a title="{$smarty.const.TXT_VAL_EDIT}" class="btn btn-danger" href='index.php?page=indicador_subunidad_valor&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                        <i class="fa fa-pencil-square-o fa-fw"></i> {$smarty.const.TXT_VAL_EDIT}
                    </a>
                {/if}
                {if $_control || $_usuario->id==$indicador->id_responsable}
                    <a title="{$smarty.const.FIELD_RESP_MED}" class="btn btn-danger" href='index.php?page=medicion_responsable&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                        <i class="fa fa-user fa-fw"></i> {$smarty.const.FIELD_RESP_MED}
                    </a>
                {/if}
            </div>
            <div class="btn-group" role="group" aria-label="">
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
                                            <a class="btn btn-info" href='index.php?page=indicador_mostrar&id_indicador={$indicador_influyente->id}&id_entidad={$entidad->id}' 
                                               title="{$smarty.const.TXT_INDIC_MOSTRAR}: {$indicador_influyente->nombre}">
                                                <i class="fa fa-dashboard fa-fw"></i> {$indicador_influyente->nombre}
                                            </a>
                                        </td>
                                    </tr>
                                {else}
                                    <tr>
                                        <td><span class="badge">{$indicador_influyente->id}</span></td>
                                        <td> 
                                            <a class="btn btn-info" href='index.php?page=dato_mostrar&id_dato={$indicador_influyente->id}&id_entidad={$entidad->id}' 
                                               title="{$smarty.const.TXT_DATO_MOSTRAR}: {$indicador_influyente->nombre}">
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

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-red">
            <div class="panel-heading">
                <span class="panel-title"><i class="fa fa-clock-o fa-fw"></i> {$smarty.const.TXT_MED_TABLA}</span>
                <i class="fa fa-chevron-up pull-right clickable"></i>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                {if $mediciones}
                    <div class="table-responsive">
                        <table class="table datatable table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>{$smarty.const.FIELD_ETIQUETA}</th>
                                    <th>{$smarty.const.FIELD_INICIO_PERIODO}</th>
                                    <th>{$smarty.const.FIELD_FIN_PERIODO}</th>
                                    <th>{$smarty.const.FIELD_VAL}</th>
                                    <th>{$smarty.const.FIELD_STATUS}</th>
                                    <th>{$smarty.const.FIELD_OBSERV}</th>
                                    <th>{$smarty.const.FIELD_ACCIONES}</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach $mediciones as $medicion}
                                    <tr {if isset($medicion_lim[$medicion->id]) AND isset($medicion_obj[$medicion->id])}
                                        {if  $totales[$medicion->id]< $medicion_lim[$medicion->id]}
                                            class="danger"
                                        {else if $totales[$medicion->id] >= $medicion_obj[$medicion->id]}
                                            class="success"
                                        {else}
                                            class="warning"
                                        {/if}
                                        {/if}
                                            {if isset($medicion_obj[$medicion->id]) AND !isset($medicion_lim[$medicion->id])}
                                                {if $totales[$medicion->id] >= $medicion_obj[$medicion->id] }
                                                    class="success"
                                                {else}
                                                    class="danger"
                                                {/if}
                                            {/if}
                                            {if isset($medicion_lim[$medicion->id]) AND !isset($medicion_obj[$medicion->id])}
                                                {if $totales[$medicion->id] < $medicion_lim[$medicion->id] }
                                                    class="danger"
                                                {else}
                                                    class="success"
                                                {/if}
                                            {/if}>
                                            <td>
                                                <a title="{$smarty.const.TXT_MED_VER}" href="index.php?page=medicion_editar&id_entidad={$entidad->id}&id_medicion={$medicion->id}&tipo={$tipo}">{$medicion->etiqueta}</a>
                                            </td>
                                            <td>{$medicion->periodo_inicio|date_format:"%d-%m-%Y"}</td>
                                            <td>{$medicion->periodo_fin|date_format:"%d-%m-%Y"}</td>
                                            <td>{if $totales[$medicion->id]}{$totales[$medicion->id]|round:"2"}{else}---{/if}</td>
                                            <td class="text-center">
                                                {if $totales[$medicion->id] != NULL}
                                                    {if isset($medicion_lim[$medicion->id]) AND isset($medicion_obj[$medicion->id])}
                                                        {if  $totales[$medicion->id] < $medicion_lim[$medicion->id]}
                                                            <i title="{$smarty.const.TXT_VAL_MEJORABLE}" class="fa fa-circle fa-fw" style="color:red"></i>
                                                        {else if $totales[$medicion->id] >= $medicion_obj[$medicion->id]}
                                                            <i title="{$smarty.const.TXT_VAL_LOGRADO}" class="fa fa-circle fa-fw" style="color:green"></i>
                                                        {else}
                                                            <i title="{$smarty.const.TXT_VAL_ACEPTABLE}" class="fa fa-circle fa-fw" style="color:yellow"></i>
                                                        {/if}
                                                    {else if isset($medicion_obj[$medicion->id])}
                                                        {if $totales[$medicion->id] >= $medicion_obj[$medicion->id] }
                                                            <i title="{$smarty.const.TXT_VAL_LOGRADO}" class="fa fa-circle fa-fw" style="color:green"></i>
                                                        {else}
                                                            <i title="{$smarty.const.TXT_VAL_MEJORABLE}" class="fa fa-circle fa-fw" style="color:red"></i>
                                                        {/if}
                                                    {else if isset($medicion_lim[$medicion->id])}
                                                        {if $totales[$medicion->id] < $medicion_lim[$medicion->id] }
                                                            <i title="{$smarty.const.TXT_VAL_MEJORABLE}" class="fa fa-circle fa-fw" style="color:red"></i>
                                                        {else}
                                                            <i title="{$smarty.const.TXT_VAL_LOGRADO}" class="fa fa-circle fa-fw" style="color:green"></i>
                                                        {/if}
                                                    {else}
                                                        ---
                                                    {/if}
                                                {else}
                                                    ---
                                                {/if}
                                            </td>
                                            <td>{$medicion->observaciones|truncate:60}</td>
                                            <td>
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_MED_VER}" href="index.php?page=medicion_editar&id_entidad={$entidad->id}&id_medicion={$medicion->id}&tipo={$tipo}"><i class="fa fa-pencil fa-fw"></i></a>
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_MED_BORRAR}" href='javascript:void(0)' data-toggle="modal" data-target="#dialogo_confirmar_borrado"
                                                   data-etiqueta_medicion="{$medicion->etiqueta}" data-id_medicion="{$medicion->id}" data-tipo="{$tipo}" data-id_entidad="{$entidad->id}">
                                                    <i class="fa fa-trash fa-fw"></i>
                                                </a>
                                            </td>
                                        </tr>
                                        {/foreach}
                                        </tbody>
                                    </table>
                                </div>
                                {else}
                                    <div class="alert alert-info alert-dismissible">
                                        <i class="fa fa-info-circle fa-fw"></i> 
                                        {$smarty.const.MSG_MED_NO_TIPO} {$tipo}
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

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="panel panel-red">
                                    <div class="panel-heading">
                                        <span class="panel-title"><i class="fa fa-tags fa-fw"></i> {$smarty.const.TXT_VAL_TABLA}</span>
                                        <i class="fa fa-chevron-up pull-right clickable"></i>
                                    </div>
                                    <!-- /.panel-heading -->
                                    <div class="panel-body">
                                        {if $mediciones}
                                            <div class="table-responsive">
                                                <table class="table table-striped table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th>{$smarty.const.FIELD_UNID}</th>
                                                                {foreach from=$mediciones item=medicion}
                                                                <th>{$medicion->etiqueta}</th>
                                                                {/foreach}
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        {foreach from=$subunidades_mediciones item=subunidades}
                                                            <tr>
                                                                <td>{$subunidades->etiqueta}</td>
                                                                {foreach from=$subunidades->mediciones item=medicion}
                                                                    <td {if $indicador->id_tipo_agregacion == 0 && $subunidades->id == $entidad->id}
                                                                        {if isset($medicion_lim[$medicion->id]) AND isset($medicion_obj[$medicion->id])}
                                                                            {if  $medicion->medicion_valor->valor < $medicion_lim[$medicion->id]}
                                                                                class="danger" title="{$smarty.const.TXT_VAL_MEJORABLE}"
                                                                            {else if $medicion->medicion_valor->valor >= $medicion_obj[$medicion->id]}
                                                                                class="success" title="{$smarty.const.TXT_VAL_LOGRADO}"
                                                                            {else}
                                                                                class="warning" title="{$smarty.const.TXT_VAL_ACEPTABLE}"
                                                                            {/if}
                                                                        {/if}
                                                                        {if isset($medicion_obj[$medicion->id]) AND !isset($medicion_lim[$medicion->id])}
                                                                            {if $medicion->medicion_valor->valor >= $medicion_obj[$medicion->id] }
                                                                                class="success" title="{$smarty.const.TXT_VAL_LOGRADO}"
                                                                            {else}
                                                                                class="danger" title="{$smarty.const.TXT_VAL_MEJORABLE}"
                                                                            {/if}
                                                                        {/if}
                                                                        {if isset($medicion_lim[$medicion->id]) AND !isset($medicion_obj[$medicion->id])}
                                                                            {if $medicion->medicion_valor->valor < $medicion_lim[$medicion->id] }
                                                                                class="danger" title="{$smarty.const.TXT_VAL_MEJORABLE}"
                                                                            {else}
                                                                                class="success" title="{$smarty.const.TXT_VAL_LOGRADO}"
                                                                            {/if}
                                                                        {/if}
                                                                        {/if}>
                                                                            {if $medicion->medicion_valor->valor == NULL} 
                                                                                --- 
                                                                            {else}
                                                                                {$medicion->medicion_valor->valor|round:"2"}
                                                                                {if $indicador->id_tipo_agregacion == 0}
                                                                                    {if isset($medicion_lim[$medicion->id]) AND isset($medicion_obj[$medicion->id])}
                                                                                        {if  $medicion->medicion_valor->valor < $medicion_lim[$medicion->id]}
                                                                                            <i class="fa fa-circle fa-fw" style="color:red"></i>
                                                                                        {else if $medicion->medicion_valor->valor >= $medicion_obj[$medicion->id]}
                                                                                            <i class="fa fa-circle fa-fw" style="color:green"></i>
                                                                                        {else}
                                                                                            <i class="fa fa-circle fa-fw" style="color:yellow"></i>
                                                                                        {/if}
                                                                                    {/if}
                                                                                    {if isset($medicion_obj[$medicion->id]) AND !isset($medicion_lim[$medicion->id])}
                                                                                        {if $medicion->medicion_valor->valor >= $medicion_obj[$medicion->id] }
                                                                                            <i class="fa fa-circle fa-fw" style="color:green"></i>
                                                                                        {else}
                                                                                            <i class="fa fa-circle fa-fw" style="color:red"></i>
                                                                                        {/if}
                                                                                    {/if}
                                                                                    {if isset($medicion_lim[$medicion->id]) AND !isset($medicion_obj[$medicion->id])}
                                                                                        {if $medicion->medicion_valor->valor < $medicion_lim[$medicion->id] }
                                                                                            <i class="fa fa-circle fa-fw" style="color:red"></i>
                                                                                        {else}
                                                                                            <i class="fa fa-circle fa-fw" style="color:green"></i>
                                                                                        {/if}
                                                                                    {/if}
                                                                                {/if}
                                                                            {/if}
                                                                        </td>
                                                                        {/foreach}
                                                                        </tr>
                                                                        {/foreach}
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                                {else}
                                                                    <div class="alert alert-info alert-dismissible">
                                                                        <i class="fa fa-info-circle fa-fw"></i> 
                                                                        {$smarty.const.MSG_INDIC_NO_VAL}
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