<!-- Diálogo Carga de Paneles -->
<div class="modal fade" id="dialogo_cargando_paneles" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel"><i class="fa fa-sitemap fa-fw"></i> {$_nombre_pagina}</h3>
            </div>
            <div class="modal-body">
                <h4 class="text-center"><i class='fa fa-spinner fa-pulse'></i> {$smarty.const.MSG_PANEL_CARGANDO}</h4>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Carga de Paneles -->

<!-- Diálogo Confirmar Borrado Plan -->
<div class="modal fade" id="dialogo_confirmar_borrado_plan" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel">
                    <i class="fa fa-trash fa-fw"></i> {$smarty.const.TXT_PLAN_BORRAR}: {$plan->anyo_inicio} - {$plan->anyo_inicio + $plan->duracion-1}</h3>
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

<!-- Diálogo Confirmar Borrado Objetivo Operacional -->
<div class="modal fade" id="dialogo_confirmar_borrado_objop" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel"><i
                        class="fa fa-trash fa-fw"></i> {$smarty.const.TXT_OBJOP_BORRAR}: <span
                        id="nombre_objop"></span></h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_OBJOP_CONFIRM_BORRAR}</p>
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
<!-- /Diálogo Confirmar Borrado Objetivo Operacional -->

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
            <li><a title="{$smarty.const.FIELD_PLANES}" href='index.php?page=plan_listar&id_entidad={$entidad->id}'>{$smarty.const.FIELD_PLANES}</a></li>
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
                <a href="#plan_archivos" title="{$smarty.const.TXT_ARCHIVOS}" aria-controls="{$smarty.const.TXT_ARCHIVOS}" role="tab" data-toggle="tab"><i class="fa fa-archive fa-fw"></i> {$smarty.const.TXT_ARCHIVOS}</a>
            </li>
            <li role="presentation">
                <a href="#plan_res" title="{$smarty.const.TXT_SEGUIMIENTO} ({$smarty.const.FIELD_LINEAS}, {$smarty.const.FIELD_OBJS_EST}, {$smarty.const.FIELD_OBJS_OP})" aria-controls="{$smarty.const.TXT_SEGUIMIENTO} ({$smarty.const.FIELD_LINEAS}, {$smarty.const.FIELD_OBJS_EST}, {$smarty.const.FIELD_OBJS_OP})" role="tab" data-toggle="tab"><i class="fa fa-tasks fa-fw"></i> {$smarty.const.TXT_SEGUIMIENTO}</a>
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
                                    <td><span class="label label-default">{$plan->anyo_inicio} - {($plan->anyo_inicio + $plan->duracion-1)}</span></td>
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
            </div>
            <!-- /Ficha del plan -->

            <!-- Líneas estratégicas del plan -->
            <div role="tabpanel" class="tab-pane" id="plan_lineas">
                <!-- Barra de botones -->
                {if $_control}
                    <div id="botones_linea" class="btn-toolbar hidden" role="toolbar" aria-label="">
                        <div class="btn-group" role="group" aria-label="">
                            <a class="btn btn-danger" href='index.php?page=linea_crear&id_plan={$plan->id}&id_entidad={$plan->id_entidad}' 
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
                                            <a title="{$smarty.const.TXT_FICHA}" href="index.php?page=linea_mostrar&id_entidad={$plan->id_entidad}&id_linea={$linea->id}">{$linea->nombre}</a>
                                        </td>
                                        <td style="white-space:nowrap">
                                            <div class="progress">
                                                <div class="progress-bar {if $linea->ejecucion|round:"2" < 25}progress-bar-danger{else if $linea->ejecucion|round:"2" >= 25 && $linea->ejecucion|round:"2" < 75}progress-bar-warning{else if $linea->ejecucion|round:"2" == 100}progress-bar-success{/if}" role="progressbar" aria-valuenow="{$linea->ejecucion|round:"2"}" aria-valuemin="0" aria-valuemax="100" style="min-width: 4em;width:{$linea->ejecucion|round:"2"}%">
                                                    {$linea->ejecucion|round:"2"} %
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_FICHA}" href="index.php?page=linea_mostrar&id_entidad={$plan->id_entidad}&id_linea={$linea->id}">
                                                <i class="fa fa-folder fa-fw"></i>
                                            </a>
                                            {if $_control}
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_OBJEST_CREAR}" href="index.php?page=objest_crear&id_linea={$linea->id}&id_entidad={$plan->id_entidad}">
                                                    <i class="fa fa-dot-circle-o fa-fw"></i>
                                                </a>
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_EDIT}" href="index.php?page=linea_editar&id_entidad={$plan->id_entidad}&id_linea={$linea->id}">
                                                    <i class="fa fa-pencil fa-fw"></i>
                                                </a>
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_LINEA_BORRAR}" href='javascript:void(0)' data-toggle="modal" data-target="#dialogo_confirmar_borrado_linea"
                                                   data-id_entidad="{$plan->id_entidad}" data-nombre="{$linea->indice}. {$linea->nombre}" data-id_linea="{$linea->id}">
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
                                        <a class="btn btn-danger" href='index.php?page=linea_crear&id_plan={$plan->id}&id_entidad={$plan->id_entidad}' 
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
                                    <th>{$smarty.const.FIELD_LINEA}</th>
                                    <th>{$smarty.const.FIELD_INDICE}</th>
                                    <th>{$smarty.const.FIELD_OBJ_EST}</th>
                                    <th>Nº {$smarty.const.FIELD_OBJS_OP}</th>
                                    <th>{$smarty.const.FIELD_EJECUCION}</th>
                                    <th>{$smarty.const.FIELD_ACCIONES}</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach from=$objests item=objest} 
                                    <tr>  
                                        <td>
                                            <a title="{$smarty.const.TXT_FICHA}" href="index.php?page=linea_mostrar&id_entidad={$plan->id_entidad}&id_linea={$objest->id_linea}">{$objest->linea->indice}. {$objest->linea->nombre}</a>
                                        </td>
                                        <td>
                                            <span class="label label-default">{$objest->linea->indice}.{$objest->indice}</span>
                                        </td>
                                        <td>
                                            <a title="{$smarty.const.TXT_FICHA}" href="index.php?page=objest_mostrar&id_objest={$objest->id}&id_entidad={$plan->id_entidad}">{$objest->nombre}</a>
                                        </td>
                                        <td>
                                            {$objops_objests[$objest->id]|@count}
                                        </td>
                                        <td style="white-space:nowrap">
                                            <div class="progress">
                                                <div class="progress-bar {if $objest->ejecucion|round:"2" < 25}progress-bar-danger{else if $objest->ejecucion|round:"2" >= 25 && $objest->ejecucion|round:"2" < 75}progress-bar-warning{else if $objest->ejecucion|round:"2" == 100}progress-bar-success{/if}" role="progressbar" aria-valuenow="{$objest->ejecucion|round:"2"}" aria-valuemin="0" aria-valuemax="100" style="min-width: 4em;width:{$objest->ejecucion|round:"2"}%">
                                                    {$objest->ejecucion|round:"2"} %
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_FICHA}" href="index.php?page=objest_mostrar&id_objest={$objest->id}&id_entidad={$plan->id_entidad}">
                                                <i class="fa fa-folder fa-fw"></i>
                                            </a>
                                            {if $_control}
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_OBJOP_CREAR}" href="index.php?page=objop_crear&id_objest={$objest->id}&id_entidad={$plan->id_entidad}">
                                                    <i class="fa fa-bullseye fa-fw"></i>
                                                </a>
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_EDIT}" href="index.php?page=objest_editar&id_objest={$objest->id}&id_entidad={$plan->id_entidad}">
                                                    <i class="fa fa-pencil fa-fw"></i>
                                                </a>
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_OBJEST_BORRAR}" href='javascript:void(0)' data-toggle="modal" data-target="#dialogo_confirmar_borrado_objest"
                                                   data-id_entidad="{$plan->id_entidad}" data-nombre="{$objest->linea->indice}.{$objest->indice}. {$objest->nombre}" data-id_objest="{$objest->id}">
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
                {if $objops}
                    <div class="table-responsive">
                        <table id="tabla_objop" class="table datatable table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>{$smarty.const.FIELD_OBJ_EST}</th>
                                    <th>{$smarty.const.FIELD_INDICE}</th>
                                    <th>{$smarty.const.FIELD_OBJ_OP}</th>
                                    <th>{$smarty.const.FIELD_RESP}</th>
                                    <th>{$smarty.const.FIELD_DURACION}</th>
                                    <th>{$smarty.const.FIELD_EJECUCION}</th>
                                    <th>Nº {$smarty.const.FIELD_UNIDS}</th>
                                    <th>{$smarty.const.FIELD_ACCIONES}</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach from=$objops item=objop} 
                                    <tr>  
                                        <td>
                                            <a title="{$smarty.const.TXT_FICHA}" href="index.php?page=objest_mostrar&id_objest={$objop->id_objest}&id_entidad={$plan->id_entidad}">{$objop->objest->linea->indice}.{$objop->objest->indice}. {$objop->objest->nombre}</a>
                                        </td>
                                        <td>
                                            <span class="label label-default">{$objop->objest->linea->indice}.{$objop->objest->indice}.{$objop->indice}</span>
                                        </td>
                                        <td>
                                            {if $objop->descendente}
                                                <i class="fa fa-sitemap fa-fw" title="{$smarty.const.TXT_OBJOP_DESC}"></i>
                                            {/if}
                                            <a title="{$smarty.const.TXT_FICHA}" href="index.php?page=objop_mostrar&id_objop={$objop->id}&id_entidad={$entidad->id}">{$objop->nombre}</a>
                                        </td>
                                        <td style="font-size: 12px">
                                            <a title="{$smarty.const.TXT_USER_PERFIL}" href='index.php?page=usuario_mostrar&id_usuario={$objop->id_responsable}'>
                                                {$objop->responsable->nombre} {$objop->responsable->apellidos}</a>
                                        </td>
                                        <td>
                                            {if $objops_anyos[$objop->id]}
                                                {foreach $objops_anyos[$objop->id] as $anyo}
                                                    {if $anyo@first}
                                                        {$anyo}{$escrito=true}
                                                    {else if $anyo_anterior+1 == $anyo and !$anyo@last}
                                                        {$escrito=false}
                                                    {else if $anyo_anterior+1 != $anyo and !$escrito}
                                                        - {$anyo_anterior}, {$anyo}
                                                        {$escrito=true}
                                                    {else if $anyo_anterior+1 != $anyo}
                                                        , {$anyo}
                                                        {$escrito=true}
                                                    {else if $anyo@last && $objops_anyos[$objop->id]|@count>1}
                                                        - {$anyo}
                                                    {/if}
                                                    {$anyo_anterior=$anyo}
                                                {/foreach}
                                            {else}
                                                ---
                                            {/if}
                                        </td>
                                        <td style="white-space:nowrap">
                                            <div class="progress">
                                                <div class="progress-bar {if $objop->ejecucion|round:"2" < 25}progress-bar-danger{else if $objop->ejecucion|round:"2" >= 25 && $objop->ejecucion|round:"2" < 75}progress-bar-warning{else if $objop->ejecucion|round:"2" == 100}progress-bar-success{/if}" role="progressbar" aria-valuenow="{$objop->ejecucion|round:"2"}" aria-valuemin="0" aria-valuemax="100" style="min-width: 4em;width:{$objop->ejecucion|round:"2"}%">
                                                    {$objop->ejecucion|round:"2"} %
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            {if $objop->descendente}
                                                {$objops_unids[$objop->id]|@count}
                                            {else}
                                                1
                                            {/if}
                                        </td>
                                        <td>
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_FICHA}" href="index.php?page=objop_mostrar&id_objop={$objop->id}&id_entidad={$plan->id_entidad}">
                                                <i class="fa fa-folder fa-fw"></i>
                                            </a>
                                            {if $_control}
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_EDIT}" href="index.php?page=objop_editar&id_objop={$objop->id}&id_entidad={$plan->id_entidad}">
                                                    <i class="fa fa-pencil fa-fw"></i>
                                                </a>
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_OBJOP_BORRAR}" href='javascript:void(0)' data-toggle="modal" data-target="#dialogo_confirmar_borrado_objop"
                                                   data-id_entidad="{$plan->id_entidad}" data-nombre="{$objop->objest->linea->indice}.{$objop->objest->indice}.{$objop->indice}. {$objop->nombre}" data-id_objop="{$objop->id}">
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
                                {$smarty.const.MSG_PLAN_NO_OBJOP}
                            </div>
                        </div>
                        <!-- /.col-sm-12 -->
                    </div>
                    <!-- /.row -->
                {/if}
            </div>
            <!-- /Objetivos operacionales del plan -->

            <!-- Archivos del plan -->
            <div role="tabpanel" class="tab-pane" id="plan_archivos">
                <!-- Barra de botones -->
                {if $_control}
                    <div id="botones_archivo" class="btn-toolbar hidden" role="toolbar" aria-label="">
                        <div class="btn-group" role="group" aria-label="">
                            <a class="btn btn-danger" href='index.php?page=archivo_gestionar&id_plan={$plan->id}&id_entidad={$entidad->id}' 
                               title="{$smarty.const.TXT_ARCHIVOS_GESTION}">
                                <i class="fa fa-archive fa-fw"></i>
                            </a>
                        </div>
                    </div>
                {/if}
                <!-- /Barra de botones -->
                {if $archivos}
                    <div class="table-responsive">
                        <table id="tabla_archivos" class="table datatable table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>{$smarty.const.FIELD_ARCHIVO}</th>
                                    <th>{$smarty.const.FIELD_USER}</th>
                                    <th>{$smarty.const.FIELD_ACCIONES}</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach from=$archivos item=archivo} 
                                    {if $archivo->visible}
                                        <tr>  
                                            <td>
                                                <a title='{$archivo->titulo}: {$archivo->descripcion|replace:"\r\n":" "}' href="index.php?page=archivo_descargar&id={$archivo->id}">{$archivo->titulo}</a>
                                            </td>
                                            <td style="font-size: 12px">
                                                <a title="{$smarty.const.TXT_USER_PERFIL}" href='index.php?page=usuario_mostrar&id_usuario={$archivo->usuario->id}'>{$archivo->usuario->nombre} {$archivo->usuario->apellidos}</a>
                                            </td>
                                            <td style="white-space:nowrap">
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_ARCHIVO_DESCARGA}" href="index.php?page=archivo_descargar&id={$archivo->id}"><i class="fa fa-download fa-fw"></i></a>                 
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_USER_PERFIL}" href='index.php?page=usuario_mostrar&id_usuario={$archivo->usuario->id}'><i class="fa fa-user fa-fw"></i></a>
                                            </td>
                                        </tr>
                                    {/if}
                                {/foreach}
                            </tbody>
                        </table>
                    </div>
                {else}
                    <div class="row">
                        <div class="col-sm-11">
                            <div class="alert alert-info alert-dismissible">
                                <i class="fa fa-info-circle fa-fw"></i> 
                                {$smarty.const.MSG_PLAN_NO_ARCHIVOS}
                            </div>
                        </div>
                        <!-- /.col-sm-11 -->
                        <div class="col-sm-1">
                            {if $_control}
                                <div class="btn-toolbar" role="toolbar" aria-label="">
                                    <div class="btn-group" role="group" aria-label="">
                                        <a class="btn btn-danger" href='index.php?page=archivo_gestionar&id_plan={$plan->id}&id_entidad={$entidad->id}' 
                                           title="{$smarty.const.TXT_ARCHIVOS_GESTION}">
                                            <i class="fa fa-archive fa-fw"></i>
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
            <!-- /Archivos del plan -->

            <!-- Seguimiento del plan -->
            <div role="tabpanel" class="tab-pane" id="plan_res">
                {if $lineas}
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="form-horizontal">
                                <div class="form-group h4">
                                    <label for="anyo" class="col-sm-2 control-label">{$smarty.const.FIELD_ANYO}</label>
                                    <div class="col-sm-5">
                                        <select class="form-control chosen-select" id="anyo" data-id_plan="{$plan->id}">
                                            <option value="0" selected>{$smarty.const.TXT_TODOS}</option>
                                            {for $i={($plan->anyo_inicio + $plan->duracion-1)} to {$plan->anyo_inicio} step=-1}
                                                <option value="{$i}">{$i}</option>
                                            {/for}
                                        </select>
                                    </div>
                                    <div class='col-sm-2'>
                                        <a class='btn btn-primary' title="{$smarty.const.TXT_RESUL}" href="#ejec_anyo">{$smarty.const.TXT_RESUL}</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->
                    <div id="plan_anyo">
                        <ul class="list-group" style="margin: 0;">
                            <li class="list-group-item list-group-item-info">
                                <div class="row">
                                    <div class="col-sm-8 h4">
                                        {$smarty.const.FIELD_PLAN} {$plan->anyo_inicio} - {($plan->anyo_inicio + $plan->duracion-1)}
                                    </div>
                                    <!-- /.col-sm-8 -->
                                    <div class="col-sm-4">
                                        <div class="progress">
                                            <div class="progress-bar {if $plan->ejecucion|round:"2" < 25}progress-bar-danger{else if $plan->ejecucion|round:"2" >= 25 && $plan->ejecucion|round:"2" < 75}progress-bar-warning{else if $plan->ejecucion|round:"2" == 100}progress-bar-success{/if}" role="progressbar" aria-valuenow="{$plan->ejecucion|round:"2"}" aria-valuemin="0" aria-valuemax="100" style="min-width: 4em;width: {$plan->ejecucion|round:"2"}%;">
                                                {$plan->ejecucion|round:"2"} %
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /.col-sm-4 -->
                                </div>
                                <!-- /.row -->
                            </li>
                        </ul>
                        <div class="panel-group" id="accordion_lineas" role="tablist" aria-multiselectable="true" style="margin-bottom: 0;">
                            {foreach from=$lineas item=linea}
                                <div class="panel panel-danger" style="margin-top: 0;">
                                    <div class="panel-heading" role="tab">
                                        <div class="row">
                                            <div class="col-sm-8">
                                                <h4 class="panel-title">
                                                    <a title="{$smarty.const.FIELD_LINEA}: {$linea->indice}. {$linea->nombre}" role="button" data-toggle="collapse" data-parent="#accordion_lineas" href="#{$linea->id}" aria-expanded="false" aria-controls="">
                                                        <i class="fa fa-long-arrow-right fa-fw"></i> {$linea->indice}. {$linea->nombre}
                                                    </a>
                                                    <a class="panel-title pull-right" title="{$smarty.const.TXT_FICHA}" href="index.php?page=linea_mostrar&id_linea={$linea->id}&id_entidad={$plan->id_entidad}">
                                                        <i class="fa fa-folder fa-fw"></i>
                                                    </a> 
                                                </h4>   
                                            </div>
                                            <!-- /.col-sm-8 -->
                                            <div class="col-sm-4">
                                                <div class="progress">
                                                    <div class="progress-bar {if $linea->ejecucion|round:"2" < 25}progress-bar-danger{else if $linea->ejecucion|round:"2" >= 25 && $linea->ejecucion|round:"2" < 75}progress-bar-warning{else if $linea->ejecucion|round:"2" == 100}progress-bar-success{/if}" role="progressbar" aria-valuenow="{$linea->ejecucion|round:"2"}" aria-valuemin="0" aria-valuemax="100" style="min-width: 4em;width: {$linea->ejecucion|round:"2"}%;">
                                                        {$linea->ejecucion|round:"2"} %
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /.col-sm-4 -->
                                        </div>
                                        <!-- /.row -->
                                    </div>
                                    <!-- /.panel-heading -->
                                    <div id="{$linea->id}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="">
                                        <div class="panel-group" id="accordion_objests" role="tablist" aria-multiselectable="true" style="margin-bottom: 0;">
                                            {if $objests_lineas[$linea->id]}
                                                {foreach from=$objests_lineas[$linea->id] item=objest}
                                                    <div class="panel panel-warning" style="margin-top: 0;">
                                                        <div class="panel-heading" role="tab">
                                                            <div class="row">
                                                                <div class="col-sm-8">
                                                                    <h4 class="panel-title">
                                                                        <a title="{$smarty.const.FIELD_OBJ_EST}: {$linea->indice}.{$objest->indice}. {$objest->nombre}" role="button" data-toggle="collapse" data-parent="#accordion_objests" href="#{$linea->id}{$objest->id}" aria-expanded="false" aria-controls="">
                                                                            <i class="fa fa-dot-circle-o fa-fw"></i> {$linea->indice}.{$objest->indice}. {$objest->nombre}
                                                                        </a>
                                                                        <a class="panel-title pull-right" title="{$smarty.const.TXT_FICHA}" href="index.php?page=objest_mostrar&id_objest={$objest->id}&id_entidad={$plan->id_entidad}">
                                                                            <i class="fa fa-folder fa-fw"></i>
                                                                        </a> 
                                                                    </h4>
                                                                </div>
                                                                <!-- /.col-sm-8 -->
                                                                <div class="col-sm-4">
                                                                    <div class="progress">
                                                                        <div class="progress-bar {if $objest->ejecucion|round:"2" < 25}progress-bar-danger{else if $objest->ejecucion|round:"2" >= 25 && $objest->ejecucion|round:"2" < 75}progress-bar-warning{else if $objest->ejecucion|round:"2" == 100}progress-bar-success{/if}" role="progressbar" aria-valuenow="{$objest->ejecucion|round:"2"}" aria-valuemin="0" aria-valuemax="100" style="min-width: 4em;width: {$objest->ejecucion|round:"2"}%;">
                                                                            {$objest->ejecucion|round:"2"} %
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!-- /.col-sm-4 -->
                                                            </div>
                                                            <!-- /.row -->
                                                        </div>
                                                        <!-- /.panel-heading -->
                                                        <div id="{$linea->id}{$objest->id}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="">
                                                            <div class="panel-group" id="accordion_objops" role="tablist" aria-multiselectable="true" style="margin-bottom: 0;">
                                                                {if $objops_objests[$objest->id]}
                                                                    {foreach from=$objops_objests[$objest->id] item=objop}
                                                                        <div class="panel panel-success" style="margin-top: 0;">
                                                                            <div class="panel-heading" role="tab">
                                                                                <div class="row">
                                                                                    <div class="col-sm-8">
                                                                                        <h4 class="panel-title">
                                                                                            <a title="{$smarty.const.FIELD_OBJ_OP}: {$linea->indice}.{$objest->indice}.{$objop->indice}. {$objop->nombre}" role="button" data-toggle="collapse" data-parent="#accordion_objops" href="#{$linea->id}{$objest->id}{$objop->id}" aria-expanded="false" aria-controls="">
                                                                                                <i class="fa fa-bullseye fa-fw"></i> {$linea->indice}.{$objest->indice}.{$objop->indice}. {$objop->nombre}
                                                                                            </a>
                                                                                            <a class="panel-title pull-right" title="{$smarty.const.TXT_FICHA}" href="index.php?page=objop_mostrar&id_objop={$objop->id}&id_entidad={$plan->id_entidad}">
                                                                                                <i class="fa fa-folder fa-fw"></i>
                                                                                            </a> 
                                                                                        </h4>
                                                                                    </div>
                                                                                    <!-- /.col-sm-8 -->
                                                                                    <div class="col-sm-4">
                                                                                        <div class="progress">
                                                                                            <div class="progress-bar {if $objop->ejecucion|round:"2" < 25}progress-bar-danger{else if $objop->ejecucion|round:"2" >= 25 && $objop->ejecucion|round:"2" < 75}progress-bar-warning{else if $objop->ejecucion|round:"2" == 100}progress-bar-success{/if}" role="progressbar" aria-valuenow="{$objop->ejecucion|round:"2"}" aria-valuemin="0" aria-valuemax="100" style="min-width: 4em;width: {$objop->ejecucion|round:"2"}%;">
                                                                                                {$objop->ejecucion|round:"2"} %
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                    <!-- /.col-sm-4 -->
                                                                                </div>
                                                                                <!-- /.row -->
                                                                            </div>
                                                                            <!-- /.panel-heading -->
                                                                            <div id="{$linea->id}{$objest->id}{$objop->id}" class="panel-collapse collapse objop" role="tabpanel" aria-labelledby="" data-num_indic="{$objops_indicadores_correlacion[$objop->id]|@count + $objops_indicadores_control[$objop->id]|@count}">
                                                                                <div class="panel-group" id="accordion_indics" role="tablist" aria-multiselectable="true" style="margin-bottom: 0;">

                                                                                    <!-- Indicadores de correlación -->
                                                                                    {if $objops_indicadores_correlacion[$objop->id]}
                                                                                        <div class="panel panel-default">
                                                                                            <div class="panel-heading">
                                                                                                <span class="panel-title">
                                                                                                    <div class="row">
                                                                                                        <div class="col-md-10">
                                                                                                            <i class="fa fa-dashboard fa-fw"></i><sub class="fa fa-gear fa-fw"></sub> {$smarty.const.FIELD_INDICS} ({$smarty.const.FIELD_PROC})
                                                                                                        </div>
                                                                                                        <!-- /.col-md-10 -->
                                                                                                        <div class="col-md-2">
                                                                                                            <span title="{$objop->nombre}: {$objops_indicadores_correlacion[$objop->id]|@count} {$smarty.const.FIELD_INDICS} ({$smarty.const.FIELD_PROC})" class="badge">{$objops_indicadores_correlacion[$objop->id]|@count} {$smarty.const.FIELD_INDICS}</span>
                                                                                                        </div>
                                                                                                        <!-- /.col-md-2 -->
                                                                                                    </div>
                                                                                                    <!-- /.row -->
                                                                                                </span>
                                                                                            </div>
                                                                                            <!-- /.panel-heading -->
                                                                                            <div class="panel-body">
                                                                                                <div id="carousel-correl-{$objop->id}" class="carousel slide" data-ride="carousel" data-interval="15000">
                                                                                                    <!-- Wrapper for slides -->
                                                                                                    <div class="carousel-inner" role="listbox">
                                                                                                        {foreach $objops_indicadores_correlacion[$objop->id] as $ind_correl}
                                                                                                            <div class="item {if $ind_correl@first}active{/if}">
                                                                                                                <div class="{$linea->id}{$objest->id}{$objop->id} highchart" 
                                                                                                                     id="panel_{$objop->id}_{$ind_correl->id}" 
                                                                                                                     data-id_indicador="{$ind_correl->id}" 
                                                                                                                     data-nombre_indicador="{$ind_correl->nombre}"
                                                                                                                     data-valor_min="{$ind_correl->valor_min}" 
                                                                                                                     data-valor_max="{$ind_correl->valor_max}" 
                                                                                                                     data-fecha_inicio="{$plan->anyo_inicio - 1}-01-01" 
                                                                                                                     data-fecha_fin="{($plan->anyo_inicio + $plan->duracion-1)}-12-31"
                                                                                                                     {if $ind_correl->periodicidad=='Bienal'}
                                                                                                                         data-periodicidad= "bienal" 
                                                                                                                     {else}
                                                                                                                         data-periodicidad= "anual"
                                                                                                                     {/if}>
                                                                                                                </div>
                                                                                                                <div class="carousel-caption">
                                                                                                                    <h3>
                                                                                                                        <a href='index.php?page=indicador_mostrar&id_indicador={$ind_correl->id}&id_entidad={$ind_correl->id_entidad}' 
                                                                                                                           title="{$ind_correl->nombre}: {$ind_correl->descripcion|replace:"\r\n":" "}"><i class="fa fa-dashboard fa-fw"></i></a>
                                                                                                                    </h3>
                                                                                                                    <p style="color: #337AB7;">{$smarty.const.TXT_GRAFICO_AUMENTAR}</p>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        {/foreach}
                                                                                                    </div>
                                                                                                    <!-- Controls -->
                                                                                                    <a class="left carousel-control" title="{$smarty.const.TXT_ANT}" href="#carousel-correl-{$objop->id}" role="button" data-slide="prev">
                                                                                                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true" style="color: #337AB7;"></span>
                                                                                                        <span class="sr-only">{$smarty.const.TXT_ANT}</span>
                                                                                                    </a>
                                                                                                    <a class="right carousel-control" title="{$smarty.const.TXT_SIG}" href="#carousel-correl-{$objop->id}" role="button" data-slide="next">
                                                                                                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true" style="color: #337AB7;"></span>
                                                                                                        <span class="sr-only">{$smarty.const.TXT_SIG}</span>
                                                                                                    </a>
                                                                                                </div>
                                                                                                <!-- /.carousel -->
                                                                                            </div>
                                                                                            <!-- /.panel-body -->
                                                                                        </div>
                                                                                        <!-- /.panel -->
                                                                                    {else}
                                                                                        <div class="alert alert-info alert-dismissible" style="margin: 0;">
                                                                                            <i class="fa fa-info-circle fa-fw"></i> 
                                                                                            {$smarty.const.MSG_OBJOP_NO_INDICS_CORREL}
                                                                                        </div>
                                                                                    {/if}
                                                                                    <!-- /Indicadores de correlación -->

                                                                                    <!-- Indicadores de control -->
                                                                                    {if $objops_indicadores_control[$objop->id]}
                                                                                        <div class="panel panel-default">
                                                                                            <div class="panel-heading">
                                                                                                <span class="panel-title">
                                                                                                    <div class="row">
                                                                                                        <div class="col-md-10">
                                                                                                            <i class="fa fa-dashboard fa-fw"></i><sub class="fa fa-sliders fa-fw"></sub> {$smarty.const.FIELD_INDICS} ({$smarty.const.TXT_CONTROL})
                                                                                                        </div>
                                                                                                        <!-- /.col-md-10 -->
                                                                                                        <div class="col-md-2">
                                                                                                            <span title="{$objop->nombre}: {$objops_indicadores_control[$objop->id]|@count} {$smarty.const.FIELD_INDICS} ({$smarty.const.TXT_CONTROL})" class="badge">{$objops_indicadores_control[$objop->id]|@count} {$smarty.const.FIELD_INDICS}</span>
                                                                                                        </div>
                                                                                                        <!-- /.col-md-2 -->
                                                                                                    </div>
                                                                                                    <!-- /.row -->
                                                                                                </span>
                                                                                            </div>
                                                                                            <!-- /.panel-heading -->
                                                                                            <div class="panel-body">
                                                                                                <div id="carousel-control-{$objop->id}" class="carousel slide" data-ride="carousel" data-interval="15000">
                                                                                                    <!-- Wrapper for slides -->
                                                                                                    <div class="carousel-inner" role="listbox">
                                                                                                        {foreach $objops_indicadores_control[$objop->id] as $ind_ctl}
                                                                                                            <div class="item {if $ind_ctl@first}active{/if}">
                                                                                                                <div class="{$linea->id}{$objest->id}{$objop->id} highchart" 
                                                                                                                     id="panel_{$objop->id}_{$ind_ctl->id}" 
                                                                                                                     data-id_indicador="{$ind_ctl->id}" 
                                                                                                                     data-nombre_indicador="{$ind_ctl->nombre}"
                                                                                                                     data-valor_min="{$ind_ctl->valor_min}" 
                                                                                                                     data-valor_max="{$ind_ctl->valor_max}" 
                                                                                                                     data-fecha_inicio="{$plan->anyo_inicio - 1}-01-01" 
                                                                                                                     data-fecha_fin="{($plan->anyo_inicio + $plan->duracion-1)}-12-31"
                                                                                                                     {if $ind_ctl->periodicidad=='Bienal'}
                                                                                                                         data-periodicidad= "bienal" 
                                                                                                                     {else}
                                                                                                                         data-periodicidad= "anual"
                                                                                                                     {/if}>
                                                                                                                </div>
                                                                                                                <div class="carousel-caption">
                                                                                                                    <h3>
                                                                                                                        <a href='index.php?page=indicador_mostrar&id_indicador={$ind_ctl->id}&id_entidad={$ind_ctl->id_entidad}' 
                                                                                                                           title="{$ind_ctl->nombre}: {$ind_ctl->descripcion|replace:"\r\n":" "}"><i class="fa fa-dashboard fa-fw"></i></a>
                                                                                                                    </h3>
                                                                                                                    <p style="color: #337AB7;">{$smarty.const.TXT_GRAFICO_AUMENTAR}</p>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        {/foreach}
                                                                                                    </div>
                                                                                                    <!-- Controls -->
                                                                                                    <a class="left carousel-control" title="{$smarty.const.TXT_ANT}" href="#carousel-control-{$objop->id}" role="button" data-slide="prev">
                                                                                                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true" style="color: #337AB7;"></span>
                                                                                                        <span class="sr-only">{$smarty.const.TXT_ANT}</span>
                                                                                                    </a>
                                                                                                    <a class="right carousel-control" title="{$smarty.const.TXT_SIG}" href="#carousel-control-{$objop->id}" role="button" data-slide="next">
                                                                                                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true" style="color: #337AB7;"></span>
                                                                                                        <span class="sr-only">{$smarty.const.TXT_SIG}</span>
                                                                                                    </a>
                                                                                                </div>
                                                                                                <!-- /.carousel -->
                                                                                            </div>
                                                                                            <!-- /.panel-body -->
                                                                                        </div>
                                                                                        <!-- /.panel -->
                                                                                    {else}
                                                                                        <div class="alert alert-info alert-dismissible" style="margin: 0;">
                                                                                            <i class="fa fa-info-circle fa-fw"></i> 
                                                                                            {$smarty.const.MSG_OBJOP_NO_INDICS_CONTROL}
                                                                                        </div>
                                                                                    {/if}
                                                                                    <!-- /Indicadores de control -->

                                                                                </div>
                                                                            </div>
                                                                            <!-- /.panel-collapse -->
                                                                        </div>
                                                                        <!-- /.panel -->
                                                                    {/foreach}
                                                                {else}
                                                                    <div class="alert alert-info alert-dismissible" style="margin: 0;">
                                                                        <i class="fa fa-info-circle fa-fw"></i> 
                                                                        {$smarty.const.MSG_OBJEST_NO_OBJOP}
                                                                    </div> 
                                                                {/if}
                                                            </div>
                                                        </div>
                                                        <!-- /.panel-collapse -->
                                                    </div>
                                                    <!-- /.panel -->
                                                {/foreach}
                                            {else}
                                                <div class="alert alert-info alert-dismissible" style="margin: 0;">
                                                    <i class="fa fa-info-circle fa-fw"></i> 
                                                    {$smarty.const.MSG_LINEA_NO_OBJEST}
                                                </div> 
                                            {/if}
                                        </div> 
                                    </div>
                                    <!-- /.panel-collapse -->
                                </div>
                                <!-- /.panel -->
                            {/foreach}
                        </div>
                    </div>
                    <hr>
                    <!-- Ejecución/año -->
                    <div class="row">
                        <div class="col-md-12">
                            <div id="ejec_anyo" class="panel panel-red">
                                <div class="panel-heading">
                                    <span class="panel-title"><i class="fa fa-tasks fa-fw"></i> {$smarty.const.FIELD_EJECUCION}/{$smarty.const.FIELD_ANYO}: {$smarty.const.FIELD_PLAN} {$plan->anyo_inicio} - {($plan->anyo_inicio + $plan->duracion-1)}</span>
                                    <i class="fa fa-chevron-up pull-right clickable"></i>
                                </div>
                                <!-- /.panel-heading -->
                                <div class="panel-body">
                                    <table class="table table-striped table-hover ficha">
                                        <thead>
                                            <tr>
                                                <th>{$smarty.const.FIELD_ANYO}</th>
                                                <th>{$smarty.const.FIELD_EJECUCION}</th>
                                                <th>{$smarty.const.TXT_RESUL}</th>
                                                    {if $_control}
                                                    <th></th>
                                                    {/if}
                                            </tr>
                                        </thead>
                                        <tbody>
                                            {for $i={$plan->anyo_inicio} to {($plan->anyo_inicio + $plan->duracion-1)}}
                                                <tr>
                                                    <td><span class="label label-default">{$i}</span></td>
                                                    <td>
                                                        <div class="progress">
                                                            <div class="progress-bar {if $ejecucion_anual[$i]|round:"2" < 25}progress-bar-danger{else if $ejecucion_anual[$i]|round:"2" >= 25 && $ejecucion_anual[$i]|round:"2" < 75}progress-bar-warning{else if $ejecucion_anual[$i]|round:"2" == 100}progress-bar-success{/if}" role="progressbar" aria-valuenow="{$ejecucion_anual[$i]|round:"2"}" aria-valuemin="0" aria-valuemax="100" style="min-width: 4em;width:{$ejecucion_anual[$i]|round:"2"}%">
                                                                {$ejecucion_anual[$i]|round:"2"} %
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td id="resultado_{$i}">
                                                        <textarea class="form-control" placeholder="{$smarty.const.TXT_RESUL}" readonly>{$resultado_anual[$i]}</textarea>
                                                    </td>
                                                    {if $_control}
                                                        <td style="white-space:nowrap" id="edicion_{$i}">
                                                            <a title="{$smarty.const.TXT_EDIT}" class="btn btn-default btn-xs btn-circle editar" data-id_plan='{$plan->id}' data-anyo='{$i}'>
                                                                <i class="fa fa-pencil fa-fw"></i>
                                                            </a>
                                                        </td>
                                                    {/if}
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

                {else}
                    <div class="alert alert-info alert-dismissible" style="margin: 0;">
                        <i class="fa fa-info-circle fa-fw"></i> 
                        {$smarty.const.MSG_PLAN_NO_LINEAS}
                    </div> 
                {/if}
            </div>
            <!-- /Seguimiento del plan -->

        </div>
        <!-- /Tab panes -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->