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
                <button type="button" title="{$smarty.const.TXT_NO}" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_NO}</button>
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
            {if $_control}
                <div class="btn-group pull-right" role="group" aria-label="">
                    <a class="btn btn-danger" href='index.php?page=dato_crear&id_entidad={$entidad->id}' title="{$smarty.const.TXT_DATO_CREAR}">
                        <i class="fa fa-plus-circle fa-fw"></i>
                    </a>
                </div>
            {/if}
            {if $entidad->id == 14}
                <div class="btn-group" role="group" aria-label="">
                    <a class="btn btn-danger" href='index.php?page=datos_rebiun&id_entidad={$entidad->id}' title="{$smarty.const.TXT_DATOS_REBIUN_RECOGIDA}">
                        <i class="fa fa-folder-open fa-fw"></i> {$smarty.const.TXT_DATOS_REBIUN_RECOGIDA}
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
        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active">
                <a href="#dato_list" title="{$smarty.const.TXT_DATOS_LIST}" aria-controls="{$smarty.const.TXT_DATOS_LIST}" role="tab" data-toggle="tab"><i class="fa fa-database fa-fw"></i> {$smarty.const.TXT_DATOS_LIST}</a>
            </li>
            {if $datos_propios}
                <li role="presentation">
                    <a href="#user_dato" title="{$smarty.const.TXT_USER_DATO}" aria-controls="{$smarty.const.TXT_USER_DATO}" role="tab" data-toggle="tab"><i class="fa fa-database fa-fw"></i> {$smarty.const.TXT_USER_DATO}</a>
                </li>
            {/if}
        </ul>
        <!-- /Nav tabs -->
        <br>
        <!-- Tab panes -->
        <div class="tab-content">

            <!-- Lista de Datos -->
            <div role="tabpanel" class="tab-pane active" id="dato_list">
                {if $datos}
                    <div class="table-responsive">
                        <table class="table table-condensed datatable table-striped table-hover">
                            <thead>
                                <tr>   
                                    <th>{$smarty.const.FIELD_ID}</th>
                                    <th>{$smarty.const.FIELD_COD}</th>
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
                                        <td><span class="badge">{$dato->id}</span></td>
                                        <td><span class="label label-primary">{$dato->codigo}</span></td>
                                        <td>
                                            {if $dato->calculo}
                                                <i class="fa fa-calculator fa-fw" title="{$smarty.const.TXT_CALC_AUTO}: {$dato->calculo}"></i>
                                            {/if}
                                            {if $dato->id_tipo_agregacion!= 0}
                                                <i class="fa fa-sitemap fa-fw" title="{$smarty.const.FIELD_AGREG}"></i>
                                            {/if}
                                            <a target="_blank" href='index.php?page=dato_mostrar&id_dato={$dato->id}&id_entidad={$entidad->id}' 
                                               title="{$dato->nombre}: {$dato->descripcion}">
                                                {$dato->nombre}</a>
                                        </td>
                                        <td>{$dato->periodicidad}</td>
                                        <td style="font-size: 12px">
                                            <a title="{$smarty.const.TXT_USER_PERFIL}" href='index.php?page=usuario_mostrar&id_usuario={$dato->id_responsable}&id_entidad={$entidad->id}'>
                                                {$dato->responsable->nombre} 
                                                {$dato->responsable->apellidos}</a>
                                        </td>
                                        <td style="font-size: 12px">
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
                                            {if $_control OR $_usuario->id==$dato->id_responsable}
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
            <!-- /Lista de Datos -->

            <!-- Datos del usuario -->
            {if $datos_propios}
                <div role="tabpanel" class="tab-pane" id="user_dato">
                    <div class="table-responsive">
                        <table class="table table-condensed datatable table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>{$smarty.const.FIELD_COD}</th>
                                    <th>{$smarty.const.FIELD_DATO}</th>
                                    <th>{$smarty.const.FIELD_PERIOD}</th>
                                    <th>{$smarty.const.FIELD_RESP}</th>
                                    <th>{$smarty.const.FIELD_RESP_MED}</th>
                                    <th>{$smarty.const.TXT_MED_ULTIMA}</th>
                                    <th>{$smarty.const.FIELD_VAL}</th>
                                    <th>{$smarty.const.FIELD_STATUS}</th>
                                    <th>{$smarty.const.FIELD_ACCIONES}</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach from=$datos_propios item=indicador} 
                                    <tr {if isset($medicion_lim[$indicador->id]) AND isset($medicion_obj[$indicador->id])}
                                                        {if $totales[$indicador->id] < $medicion_lim[$indicador->id]}
                                                            class="danger"
                                                        {else if $totales[$indicador->id] >= $medicion_obj[$indicador->id]}
                                                            class="success"
                                                        {else}
                                                            class="warning"
                                                        {/if}
                                                    {/if}
                                                    {if isset($medicion_obj[$indicador->id]) AND !isset($medicion_lim[$indicador->id])}
                                                        {if $totales[$indicador->id] >= $medicion_obj[$indicador->id]}
                                                            class="success"
                                                        {else}
                                                            class="danger"
                                                        {/if}
                                                    {/if}
                                                    {if isset($medicion_lim[$indicador->id]) AND !isset($medicion_obj[$indicador->id])}
                                                        {if $totales[$indicador->id] < $medicion_lim[$indicador->id]}
                                                            class="danger"
                                                        {else}
                                                            class="success"
                                                        {/if}
                                                    {/if}>
                                        <td><span class="label label-primary">{$indicador->codigo}</span></td>
                                        <td>
                                            {if $indicador->calculo}
                                                <i class="fa fa-calculator fa-fw" title="{$smarty.const.TXT_CALC_AUTO}: {$indicador->calculo}"></i>
                                            {/if}
                                            {if $indicador->id_tipo_agregacion!= 0}
                                                <i class="fa fa-sitemap fa-fw" title="{$smarty.const.FIELD_AGREG}"></i>
                                            {/if}
                                            <a target="_blank" href='index.php?page=dato_mostrar&id_dato={$indicador->id}&id_entidad={$indicador->id_entidad}' 
                                               title="{$indicador->nombre}: {$indicador->descripcion}">
                                                {$indicador->nombre}</a>
                                        </td>
                                        <td>{$indicador->periodicidad}</td>
                                        <td style="font-size: 12px">
                                            <a title="{$smarty.const.TXT_USER_PERFIL}" href='index.php?page=usuario_mostrar&id_usuario={$indicador->id_responsable}'>
                                                {$indicador->responsable->nombre} 
                                                {$indicador->responsable->apellidos}</a>
                                        </td>
                                        <td style="font-size: 12px">
                                            <a title="{$smarty.const.TXT_USER_PERFIL}" href='index.php?page=usuario_mostrar&id_usuario={$indicador->id_responsable_medicion}'>
                                                {$indicador->responsable_medicion->nombre} 
                                                {$indicador->responsable_medicion->apellidos}</a>
                                        </td>
                                        <td>{$indicador->medicion->etiqueta}</td>
                                        <td class="text-center" style="white-space: nowrap">{if ($totales[$indicador->id])}{$totales[$indicador->id]|round:"2"}{else}---{/if}
                                            <a class="btn btn-default btn-circle btn-xs" 
                                               href="index.php?page=medicion_editar&id_medicion={$indicador->medicion->id}&id_entidad={$indicador->id_entidad}&tipo=dato#med_valores">
                                                {if $indicador->calculo}
                                                        <i title='{$smarty.const.TXT_MED_VER}' class="fa fa-pencil fa-fw"></i>
                                                    {else}
                                                        <i title='{$smarty.const.TXT_GRABAR}' class="fa fa-floppy-o fa-fw"></i>
                                                    {/if}
                                            </a>
                                        </td>
                                         <td class="text-center"> 
                                            {if $totales[$indicador->id] != NULL}
                                                {if isset($medicion_lim[$indicador->id]) AND isset($medicion_obj[$indicador->id])}
                                                    {if  $totales[$indicador->id] < $medicion_lim[$indicador->id]}
                                                        <i title="{$smarty.const.TXT_VAL_MEJORABLE}" class="fa fa-circle fa-fw" style="color:red"></i>
                                                    {else if $totales[$indicador->id] >= $medicion_obj[$indicador->id]}
                                                        <i title="{$smarty.const.TXT_VAL_LOGRADO}" class="fa fa-circle fa-fw" style="color:green"></i>
                                                    {else}
                                                        <i title="{$smarty.const.TXT_VAL_ACEPTABLE}" class="fa fa-circle fa-fw" style="color:yellow"></i>
                                                    {/if}
                                                {else if isset($medicion_obj[$indicador->id])}
                                                    {if $totales[$indicador->id] >= $medicion_obj[$indicador->id] }
                                                        <i title="{$smarty.const.TXT_VAL_LOGRADO}" class="fa fa-circle fa-fw" style="color:green"></i>
                                                    {else}
                                                        <i title="{$smarty.const.TXT_VAL_MEJORABLE}" class="fa fa-circle fa-fw" style="color:red"></i>
                                                    {/if}
                                                {else if isset($medicion_lim[$indicador->id])}
                                                    {if $totales[$indicador->id] < $medicion_lim[$indicador->id] }
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
                                        <td>
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_INDIC_MOSTRAR}" target="_blank" href='index.php?page=dato_mostrar&id_dato={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                                                <i class="fa fa-folder fa-fw"></i>
                                            </a>
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_REP_GRAFIC}" target="_blank" href='index.php?page=graficas_mostrar&id_dato={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                                                <i class="fa fa-area-chart fa-fw"></i>
                                            </a>
                                            <a class="btn btn-default btn-circle btn-xs" href='index.php?page=medicion_listar&id_dato={$indicador->id}&id_entidad={$indicador->id_entidad}' 
                                               title="{$smarty.const.TXT_INDIC_MED}: {$indicador->nombre}" target="_blank">
                                                <i class="fa fa-clock-o fa-fw"></i>
                                            </a>
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_VAL_REF}" href='index.php?page=valor_referencia_crear&id_dato={$indicador->id}&id_entidad={$indicador->id_entidad}' target="_blank">
                                                <i class="fa fa-tags fa-fw"></i>
                                            </a>
                                            {if $_control OR $_usuario->id==$indicador->id_responsable}
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_EDIT}" href='index.php?page=dato_editar&id_dato={$indicador->id}&id_entidad={$indicador->id_entidad}' target="_blank">
                                                    <i class="fa fa-pencil fa-fw"></i>
                                                </a>
                                                {if !$indicador->calculo}
                                                    <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_VAL_EDIT}" href='index.php?page=indicador_subunidad_valor&id_dato={$indicador->id}&id_entidad={$indicador->id_entidad}' target="_blank">
                                                        <i class="fa fa-pencil-square-o fa-fw"></i> 
                                                    </a>
                                                {/if}
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.FIELD_RESP_MED}" href='index.php?page=medicion_responsable&id_dato={$indicador->id}&id_entidad={$indicador->id_entidad}' target="_blank">
                                                    <i class="fa fa-user fa-fw"></i>
                                                </a>
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_BORRAR}" href='javascript:void(0)' data-toggle="modal" data-target="#dialogo_confirmar_borrado"
                                                   data-id_dato="{$indicador->id}" data-nombre_dato="{$indicador->nombre}" data-id_entidad="{$indicador->id_entidad}">
                                                    <i class="fa fa-trash fa-fw"></i>
                                                </a>
                                            {/if}
                                        </td>
                                    </tr>
                                {/foreach}
                            </tbody>
                        </table>
                    </div>

                </div>
            {/if}
            <!-- /Datos del usuario -->

        </div>
        <!-- /Tab panes -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->