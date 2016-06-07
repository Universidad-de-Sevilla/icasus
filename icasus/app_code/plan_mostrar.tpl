<!-- Diálogo Confirmar Borrado Plan -->
<div class="modal fade" id="dialogo_confirmar_borrado_plan" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel">
                    <i class="fa fa-trash fa-fw"></i> {$smarty.const.TXT_PLAN_BORRAR}: {$plan->anyo_inicio} - {$plan->anyo_inicio + $plan->duracion}</h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_PLAN_CONFIRM_BORRAR}</p>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_NO}" class="btn btn-danger" data-dismiss="modal"><i
                        class="fa fa-times fa-fw"></i> {$smarty.const.TXT_NO}</button>
                <a title="{$smarty.const.TXT_SI}" class="btn btn-success" name="borrar" id="borrar" href="index.php?page=plan_borrar&id_plan={$plan->id}&id_entidad={$plan->id_entidad}"><i
                        class="fa fa-check fa-fw"></i> {$smarty.const.TXT_SI}</a>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Confirmar Borrado Plan -->

<!-- Diálogo Confirmar Borrado Línea -->
<div class="modal fade" id="dialogo_confirmar_borrado_linea" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel"><i
                        class="fa fa-trash fa-fw"></i> {$smarty.const.TXT_LINEA_BORRAR}: <span
                        id="nombre_linea"></span></h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_LINEA_CONFIRM_BORRAR}</p>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_NO}" class="btn btn-danger" data-dismiss="modal"><i
                        class="fa fa-times fa-fw"></i> {$smarty.const.TXT_NO}</button>
                <a title="{$smarty.const.TXT_SI}" class="btn btn-success" name="borrar" id="borrar"><i
                        class="fa fa-check fa-fw"></i> {$smarty.const.TXT_SI}</a>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Confirmar Borrado Línea -->

<!-- Diálogo Confirmar Borrado Objetivo Estratégico -->
<div class="modal fade" id="dialogo_confirmar_borrado_objest" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel"><i
                        class="fa fa-trash fa-fw"></i> {$smarty.const.TXT_OBJEST_BORRAR}: <span
                        id="nombre_objest"></span></h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_OBJEST_CONFIRM_BORRAR}</p>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_NO}" class="btn btn-danger" data-dismiss="modal"><i
                        class="fa fa-times fa-fw"></i> {$smarty.const.TXT_NO}</button>
                <a title="{$smarty.const.TXT_SI}" class="btn btn-success" name="borrar" id="borrar"><i
                        class="fa fa-check fa-fw"></i> {$smarty.const.TXT_SI}</a>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Confirmar Borrado Objetivo Estratégico -->

<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <h3 title="{$_nombre_pagina}" class="page-header">
            <div class="row">
                <div class="col-md-10">
                    <i class="fa fa-book fa-fw"></i> {$_nombre_pagina}
                </div>
                <!-- /.col-md-10 -->
                <!-- Navegación -->
                {if count($planes)> 1}
                    <div class="col-md-2">
                        <div style="font-size:10px">{$indice+1} {$smarty.const.TXT_DE} {count($planes)} {$smarty.const.FIELD_PLANES}</div>
                        <div class="btn-toolbar" role="toolbar" aria-label="">
                            <div class="btn-group" role="group" aria-label="">
                                <a title="{$smarty.const.TXT_PRIMER} {$smarty.const.FIELD_PLAN}" class="btn btn-danger btn-xs {if $indice == 0}disabled{/if}" href='index.php?page=plan_mostrar&id_entidad={$entidad->id}&id_plan={$planes[0]->id}'>
                                    <i class="fa fa-step-backward fa-fw"></i>
                                </a>
                                <a title="{$smarty.const.TXT_ANT} {$smarty.const.FIELD_PLAN}" class="btn btn-danger btn-xs {if $indice == 0}disabled{/if}" href='index.php?page=plan_mostrar&id_entidad={$entidad->id}&id_plan={$planes[$indice-1]->id}'>
                                    <i class="fa fa-play fa-rotate-180 fa-fw"></i>
                                </a>
                                <a title="{$smarty.const.TXT_SIG} {$smarty.const.FIELD_PLAN}" class="btn btn-danger btn-xs {if $indice == (count($planes)-1)}disabled{/if}" href='index.php?page=plan_mostrar&id_entidad={$entidad->id}&id_plan={$planes[$indice+1]->id}'>
                                    <i class="fa fa-play fa-fw"></i>
                                </a>
                                <a title="{$smarty.const.TXT_ULTIMO} {$smarty.const.FIELD_PLAN}" class="btn btn-danger btn-xs {if $indice == (count($planes)-1)}disabled{/if}" href='index.php?page=plan_mostrar&id_entidad={$entidad->id}&id_plan={$planes[(count($planes)-1)]->id}'>
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
            <li title="{$_nombre_pagina}" class="active">{$_nombre_pagina}</li>
        </ol>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- /Breadcrumbs -->

<div class="row">
    <div class="col-lg-12">
        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active">
                <a href="#plan_ficha" title="{$smarty.const.TXT_FICHA}" aria-controls="{$smarty.const.TXT_FICHA}" role="tab" data-toggle="tab"><i class="fa fa-folder fa-fw"></i> {$smarty.const.TXT_FICHA}</a>
            </li>
            <li role="presentation">
                <a href="#plan_lineas" title="{$smarty.const.FIELD_LINEAS}" aria-controls="{$smarty.const.FIELD_LINEAS}" role="tab" data-toggle="tab"><i class="fa fa-long-arrow-right fa-fw"></i> {$smarty.const.FIELD_LINEAS}</a>
            </li>
            <li role="presentation">
                <a href="#plan_objest" title="{$smarty.const.FIELD_OBJS_EST}" aria-controls="{$smarty.const.FIELD_OBJS_EST}" role="tab" data-toggle="tab"><i class="fa fa-dot-circle-o fa-fw"></i> {$smarty.const.FIELD_OBJS_EST}</a>
            </li>
            <li role="presentation">
                <a href="#plan_objop" title="{$smarty.const.FIELD_OBJS_OP}" aria-controls="{$smarty.const.FIELD_OBJS_OP}" role="tab" data-toggle="tab"><i class="fa fa-bullseye fa-fw"></i> {$smarty.const.FIELD_OBJS_OP}</a>
            </li>
            <li role="presentation">
                <a href="#plan_res" title="{$smarty.const.TXT_RESUMEN} ({$smarty.const.FIELD_LINEAS}, {$smarty.const.FIELD_OBJS_EST}, {$smarty.const.FIELD_OBJS_OP})" aria-controls="{$smarty.const.TXT_RESUMEN} ({$smarty.const.FIELD_LINEAS}, {$smarty.const.FIELD_OBJS_EST}, {$smarty.const.FIELD_OBJS_OP})" role="tab" data-toggle="tab"><i class="fa fa-th-list fa-fw"></i> {$smarty.const.TXT_RESUMEN}</a>
            </li>
        </ul>
        <!-- /Nav tabs -->
        <br>
        <!-- Tab panes -->
        <div class="tab-content">

            <!-- Ficha del plan -->
            <div role="tabpanel" class="tab-pane active" id="plan_ficha">
                <div class="row">

                    <!-- Datos del plan -->
                    <div class="col-md-12">
                        <table class="table table-striped table-hover ficha">
                            <thead><th></th><th></th></thead>
                            <tbody>
                                <tr>
                                    <th>{$smarty.const.FIELD_PLAN}</th>
                                    <td><span class="label label-default">{$plan->anyo_inicio} - {($plan->anyo_inicio + $plan->duracion)}</span></td>
                                </tr>
                                <tr>
                                    <th>{$smarty.const.FIELD_TITULO}</th>
                                    <td> 
                                        {if $plan->titulo}
                                            <i>"{$plan->titulo}"</i>
                                        {else}
                                            ---
                                        {/if}
                                    </td>
                                </tr>
                                <tr>
                                    <th>{$smarty.const.FIELD_EJECUCION}</th>
                                    <td> 
                                        <div class="progress">
                                            <div class="progress-bar {if $plan->ejecucion|round:"2" < 25}progress-bar-danger{else if $plan->ejecucion|round:"2" >= 25 && $plan->ejecucion|round:"2" < 75}progress-bar-warning{else if $plan->ejecucion|round:"2" == 100}progress-bar-success{/if}" role="progressbar" aria-valuenow="{$plan->ejecucion|round:"2"}" aria-valuemin="0" aria-valuemax="100" style="min-width: 4em;width:{$plan->ejecucion|round:"2"}%">
                                                {$plan->ejecucion|round:"2"} %
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>{$smarty.const.FIELD_MISION}</th>
                                    <td>
                                        {if $plan->mision}
                                            {$plan->mision|nl2br}
                                        {else}
                                            ---
                                        {/if}
                                    </td>
                                </tr>
                                <tr>
                                    <th>{$smarty.const.FIELD_VISION}</th>
                                    <td>
                                        {if $plan->vision}
                                            {$plan->vision|nl2br}
                                        {else}
                                            ---
                                        {/if}
                                    </td>
                                </tr>
                                <tr>
                                    <th>{$smarty.const.FIELD_VALORES}</th>
                                    <td>
                                        {if $plan->valores}
                                            {$plan->valores|nl2br}
                                        {else}
                                            ---
                                        {/if}
                                    </td>
                                </tr>
                                <tr>
                                    <th>{$smarty.const.FIELD_FCE}</th>
                                    <td>
                                        {if $plan->fce}
                                            {$plan->fce|nl2br}
                                        {else}
                                            ---
                                        {/if}
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        {if $_control}
                            <div id="botones_ficha" class="btn-toolbar hidden" role="toolbar" aria-label="">
                                <a title="{$smarty.const.TXT_PLAN_EDIT}" class="btn btn-default btn-danger" href="index.php?page=plan_editar&id_plan={$plan->id}&id_entidad={$plan->id_entidad}">
                                    <i class="fa fa-book fa-fw"></i><sub class="fa fa-pencil fa-fw"></sub>
                                </a>
                                <a title="{$smarty.const.TXT_PLAN_BORRAR}" class="btn btn-default btn-danger" href='javascript:void(0)' data-toggle="modal" data-target="#dialogo_confirmar_borrado_plan">
                                    <i class="fa fa-trash fa-fw"></i>
                                </a>
                            </div>
                        {/if}
                    </div>
                    <!-- /.col-md-12 -->
                    <!-- /Datos del plan -->
                </div>
                <!-- /.row -->

                <!-- Ejecución/año -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-red">
                            <div class="panel-heading">
                                <span class="panel-title"><i class="fa fa-tasks fa-fw"></i> {$smarty.const.FIELD_EJECUCION}/{$smarty.const.FIELD_ANYO}: {$smarty.const.FIELD_PLAN} {$plan->anyo_inicio} - {($plan->anyo_inicio + $plan->duracion)}</span>
                                <i class="fa fa-chevron-up pull-right clickable"></i>
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <table class="table table-striped table-hover ficha">
                                    <thead>
                                        <tr>
                                            <th>{$smarty.const.FIELD_ANYO}</th>
                                            <th>{$smarty.const.FIELD_EJECUCION}</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        {for $i={$plan->anyo_inicio} to {($plan->anyo_inicio + $plan->duracion)}}
                                            <tr>
                                                <td><span class="label label-default">{$i}</span></td>
                                                <td>
                                                    <div class="progress">
                                                        <div class="progress-bar {if $ejecucion_anual[$i]|round:"2" < 25}progress-bar-danger{else if $ejecucion_anual[$i]|round:"2" >= 25 && $ejecucion_anual[$i]|round:"2" < 75}progress-bar-warning{else if $ejecucion_anual[$i]|round:"2" == 100}progress-bar-success{/if}" role="progressbar" aria-valuenow="{$ejecucion_anual[$i]|round:"2"}" aria-valuemin="0" aria-valuemax="100" style="min-width: 4em;width:{$ejecucion_anual[$i]|round:"2"}%">
                                                            {$ejecucion_anual[$i]|round:"2"} %
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        {/for}
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.panel-body -->        
                        </div>
                        <!-- /.panel -->
                    </div>
                    <!-- /.col-md-12 -->
                </div>
                <!-- /.row -->
                <!-- /Ejecución/año -->

            </div>
            <!-- /Ficha del plan -->

            <!-- Líneas estratégicas del plan -->
            <div role="tabpanel" class="tab-pane" id="plan_lineas">
                <!-- Barra de botones -->
                {if $_control}
                    <div id="botones_linea" class="btn-toolbar hidden" role="toolbar" aria-label="">
                        <div class="btn-group" role="group" aria-label="">
                            <a class="btn btn-danger" href='index.php?page=linea_crear&id_plan={$plan->id}' 
                               title="{$smarty.const.TXT_LINEA_CREAR}">
                                <i class="fa fa-long-arrow-right fa-fw"></i><sub class="fa fa-plus fa-fw"></sub>
                            </a>
                        </div>
                    </div>
                {/if}
                <!-- /Barra de botones -->
                {if $lineas}
                    <div class="table-responsive">
                        <table id="tabla_lineas" class="table datatable table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>{$smarty.const.FIELD_INDICE}</th>
                                    <th>{$smarty.const.FIELD_LINEA}</th>
                                    <th>{$smarty.const.FIELD_EJECUCION}</th>
                                    <th>{$smarty.const.FIELD_ACCIONES}</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach from=$lineas item=linea} 
                                    <tr>  
                                        <td>
                                            <span class="label label-default">{$linea->indice}</span>
                                        </td>
                                        <td>
                                            <a title="{$smarty.const.TXT_FICHA}" href="index.php?page=linea_mostrar&id_plan={$plan->id}&id_linea={$linea->id}">{$linea->nombre}</a>
                                        </td>
                                        <td style="white-space:nowrap">
                                            <div class="progress">
                                                <div class="progress-bar {if $linea->ejecucion|round:"2" < 25}progress-bar-danger{else if $linea->ejecucion|round:"2" >= 25 && $linea->ejecucion|round:"2" < 75}progress-bar-warning{else if $linea->ejecucion|round:"2" == 100}progress-bar-success{/if}" role="progressbar" aria-valuenow="{$linea->ejecucion|round:"2"}" aria-valuemin="0" aria-valuemax="100" style="min-width: 4em;width:{$linea->ejecucion|round:"2"}%">
                                                    {$linea->ejecucion|round:"2"} %
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_FICHA}" href="index.php?page=linea_mostrar&id_plan={$plan->id}&id_linea={$linea->id}">
                                                <i class="fa fa-folder fa-fw"></i>
                                            </a>
                                            {if $_control}
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_OBJEST_CREAR}" href="index.php?page=objest_crear&id_linea={$linea->id}">
                                                    <i class="fa fa-dot-circle-o fa-fw"></i>
                                                </a>
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_EDIT}" href="index.php?page=linea_editar&id_plan={$plan->id}&id_linea={$linea->id}">
                                                    <i class="fa fa-pencil fa-fw"></i>
                                                </a>
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_LINEA_BORRAR}" href='javascript:void(0)' data-toggle="modal" data-target="#dialogo_confirmar_borrado_linea"
                                                   data-id_plan="{$plan->id}" data-nombre="{$linea->indice}. {$linea->nombre}" data-id_linea="{$linea->id}">
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
                    <div class="row">
                        <div class="col-sm-11">
                            <div class="alert alert-info alert-dismissible">
                                <i class="fa fa-info-circle fa-fw"></i> 
                                {$smarty.const.MSG_PLAN_NO_LINEAS}
                            </div>
                        </div>
                        <!-- /.col-sm-11 -->
                        <div class="col-sm-1">
                            {if $_control}
                                <div class="btn-toolbar" role="toolbar" aria-label="">
                                    <div class="btn-group" role="group" aria-label="">
                                        <a class="btn btn-danger" href='index.php?page=linea_crear&id_plan={$plan->id}' 
                                           title="{$smarty.const.TXT_LINEA_CREAR}">
                                            <i class="fa fa-long-arrow-right fa-fw"></i><sub class="fa fa-plus fa-fw"></sub>
                                        </a>
                                    </div>
                                </div>
                            {/if}
                        </div>
                        <!-- /.col-sm-1 -->
                    </div>
                    <!-- /.row -->
                {/if}
            </div>
            <!-- /Líneas estratégicas del plan -->

            <!-- Objetivos estratégicos del plan -->
            <div role="tabpanel" class="tab-pane" id="plan_objest">
                {if $objests}
                    <div class="table-responsive">
                        <table id="tabla_objest" class="table datatable table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>{$smarty.const.FIELD_INDICE}</th>
                                    <th>{$smarty.const.FIELD_OBJ_EST}</th>
                                    <th>{$smarty.const.FIELD_LINEA}</th>
                                    <th>{$smarty.const.FIELD_EJECUCION}</th>
                                    <th>{$smarty.const.FIELD_ACCIONES}</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach from=$objests item=objest} 
                                    <tr>  
                                        <td>
                                            <span class="label label-default">{$objest->linea->indice}.{$objest->indice}</span>
                                        </td>
                                        <td>
                                            <a title="{$smarty.const.TXT_FICHA}" href="index.php?page=objest_mostrar&id_objest={$objest->id}&id_linea={$objest->id_linea}">{$objest->nombre}</a>
                                        </td>
                                        <td>
                                            <a title="{$smarty.const.TXT_FICHA}" href="index.php?page=linea_mostrar&id_plan={$plan->id}&id_linea={$objest->id_linea}">{$objest->linea->indice}. {$objest->linea->nombre}</a>
                                        </td>
                                        <td style="white-space:nowrap">
                                            <div class="progress">
                                                <div class="progress-bar {if $objest->ejecucion|round:"2" < 25}progress-bar-danger{else if $objest->ejecucion|round:"2" >= 25 && $objest->ejecucion|round:"2" < 75}progress-bar-warning{else if $objest->ejecucion|round:"2" == 100}progress-bar-success{/if}" role="progressbar" aria-valuenow="{$objest->ejecucion|round:"2"}" aria-valuemin="0" aria-valuemax="100" style="min-width: 4em;width:{$objest->ejecucion|round:"2"}%">
                                                    {$objest->ejecucion|round:"2"} %
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_FICHA}" href="index.php?page=objest_mostrar&id_objest={$objest->id}&id_linea={$objest->id_linea}">
                                                <i class="fa fa-folder fa-fw"></i>
                                            </a>
                                            {if $_control}
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_OBJOP_CREAR}" href="index.php?page=objop_crear&id_objest={$objest->id}">
                                                    <i class="fa fa-bullseye fa-fw"></i>
                                                </a>
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_EDIT}" href="index.php?page=objest_editar&id_objest={$objest->id}&id_linea={$objest->id_linea}">
                                                    <i class="fa fa-pencil fa-fw"></i>
                                                </a>
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_LINEA_BORRAR}" href='javascript:void(0)' data-toggle="modal" data-target="#dialogo_confirmar_borrado_objest"
                                                   data-id_linea="{$objest->id_linea}" data-nombre="{$objest->linea->indice}.{$objest->indice}. {$objest->nombre}" data-id_objest="{$objest->id}">
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
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="alert alert-info alert-dismissible">
                                <i class="fa fa-info-circle fa-fw"></i> 
                                {$smarty.const.MSG_PLAN_NO_OBJEST}
                            </div>
                        </div>
                        <!-- /.col-sm-12 -->
                    </div>
                    <!-- /.row -->
                {/if}
            </div>
            <!-- /Objetivos estratégicos del plan -->

            <!-- Objetivos operacionales del plan -->
            <div role="tabpanel" class="tab-pane" id="plan_objop">

            </div>
            <!-- /Objetivos operacionales del plan -->

            <!-- Resumen del plan -->
            <div role="tabpanel" class="tab-pane" id="plan_res">

            </div>
            <!-- /Resumen del plan -->

        </div>
        <!-- /Tab panes -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->