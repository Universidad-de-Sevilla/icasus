<!-- Diálogo Confirmar Borrado Plan-->
<div class="modal fade" id="dialogo_confirmar_borrado_plan" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel"><i
                        class="fa fa-trash fa-fw"></i> {$smarty.const.TXT_PLAN_BORRAR}: <span
                        id="periodo_plan"></span></h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_PLAN_CONFIRM_BORRAR}</p>
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
<!-- /Diálogo Confirmar Borrado Plan-->

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
            <i class="fa fa-book fa-fw"></i> {$_nombre_pagina}
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
            <li title="{$_nombre_pagina}" class="active">{$_nombre_pagina}</li>
        </ol>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- /Breadcrumbs -->

<div class="row">
    <div class="col-lg-12">
        <!-- Barra de botones -->
        {if $_control}
            <div id="botones_plan" class="btn-toolbar hidden" role="toolbar" aria-label="">
                <div class="btn-group" role="group" aria-label="">
                    <a class="btn btn-danger" href='index.php?page=plan_crear&id_entidad={$entidad->id}' 
                       title="{$smarty.const.TXT_PLAN_CREAR}">
                        <i class="fa fa-book fa-fw"></i><sub class="fa fa-plus fa-fw"></sub>
                    </a>
                </div>
            </div>
        {/if}
        <!-- /Barra de botones -->
        {if $objops_propios}
            <!-- Nav tabs -->
            <ul class="nav nav-tabs" role="tablist">
                <li role="presentation" class="active">
                    <a href="#planes" title="{$smarty.const.FIELD_PLANES}" aria-controls="{$smarty.const.FIELD_PLANES}" role="tab" data-toggle="tab"><i class="fa fa-book fa-fw"></i> {$smarty.const.FIELD_PLANES}</a>
                </li>
                <li role="presentation">
                    <a href="#user_objops" title="{$smarty.const.TXT_USER_OBJOPS}" aria-controls="{$smarty.const.TXT_USER_OBJOPS}" role="tab" data-toggle="tab"><i class="fa fa-bullseye fa-fw"></i><sub class="fa fa-user fa-fw"></sub> {$smarty.const.TXT_USER_OBJOPS}</a>
                </li>
            </ul>
            <!-- /Nav tabs -->
            <br>
            <!-- Tab panes -->
            <div class="tab-content">

                <!-- Planes -->
                <div role="tabpanel" class="tab-pane active" id="planes">
                    {if $planes}
                        <div class="table-responsive">
                            <table id="tabla_planes" class="table datatable table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>{$smarty.const.FIELD_PLAN}</th>
                                        <th>{$smarty.const.FIELD_TITULO}</th>
                                        <th>{$smarty.const.FIELD_EJECUCION}</th>
                                        <th>{$smarty.const.FIELD_ACCIONES}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {foreach from=$planes item=plan} 
                                        <tr>  
                                            <td>
                                                <a title="{$smarty.const.FIELD_PLAN} {$plan->anyo_inicio} - {$plan->anyo_inicio + $plan->duracion-1}" href="index.php?page=plan_mostrar&id_plan={$plan->id}&id_entidad={$plan->id_entidad}">
                                                    {$plan->anyo_inicio} - {$plan->anyo_inicio + $plan->duracion-1}
                                                </a>
                                            </td>
                                            <td>
                                                {if $plan->titulo}
                                                    <i>"{$plan->titulo}"</i>
                                                {else}
                                                    ---
                                                {/if}
                                            </td>
                                            <td style="white-space:nowrap">
                                                <div class="progress">
                                                    <div class="progress-bar {if $plan->ejecucion|round:"2" < 25}progress-bar-danger{else if $plan->ejecucion|round:"2" >= 25 && $plan->ejecucion|round:"2" < 75}progress-bar-warning{else if $plan->ejecucion|round:"2" == 100}progress-bar-success{/if}" role="progressbar" aria-valuenow="{$plan->ejecucion|round:"2"}" aria-valuemin="0" aria-valuemax="100" style="min-width: 4em;width:{$plan->ejecucion|round:"2"}%">
                                                        {$plan->ejecucion|round:"2"} %
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_FICHA}" href="index.php?page=plan_mostrar&id_plan={$plan->id}&id_entidad={$plan->id_entidad}">
                                                    <i class="fa fa-folder fa-fw"></i>
                                                </a>
                                                {if $_control}
                                                    <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_EDIT}" href="index.php?page=plan_editar&id_plan={$plan->id}&id_entidad={$plan->id_entidad}">
                                                        <i class="fa fa-pencil fa-fw"></i>
                                                    </a>
                                                    <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_PLAN_BORRAR}" href='javascript:void(0)' data-toggle="modal" data-target="#dialogo_confirmar_borrado_plan"
                                                       data-id_plan="{$plan->id}" data-periodo_plan="{$plan->anyo_inicio} - {$plan->anyo_inicio + $plan->duracion-1}" data-id_entidad="{$plan->id_entidad}">
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
                                    {$smarty.const.MSG_UNID_NO_PLANES}
                                </div>
                            </div>
                            <!-- /.col-sm-11 -->
                            <div class="col-sm-1">
                                {if $_control}
                                    <div class="btn-toolbar" role="toolbar" aria-label="">
                                        <div class="btn-group" role="group" aria-label="">
                                            <a class="btn btn-danger" href='index.php?page=plan_crear&id_entidad={$entidad->id}' 
                                               title="{$smarty.const.TXT_PLAN_CREAR}">
                                                <i class="fa fa-book fa-fw"></i><sub class="fa fa-plus fa-fw"></sub>
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
                <!-- /Planes -->

                <!-- Objetivos operacionales del usuario -->
                <div role="tabpanel" class="tab-pane" id="user_objops">
                    <div class="table-responsive">
                        <table id="tabla_user_objops" class="table datatable table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>{$smarty.const.FIELD_INDICE}</th>
                                    <th>{$smarty.const.FIELD_OBJ_OP}</th>
                                    <th>{$smarty.const.FIELD_PLAN}</th>
                                    <th>{$smarty.const.FIELD_RESP}</th>
                                    <th>{$smarty.const.FIELD_DURACION}</th>
                                    <th>{$smarty.const.FIELD_EJECUCION}</th>
                                    <th>Nº {$smarty.const.FIELD_UNIDS}</th>
                                    <th>{$smarty.const.FIELD_ACCIONES}</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach from=$objops_propios item=objop} 
                                    <tr>  
                                        <td>
                                            <span class="label label-default">{$objop->objest->linea->indice}.{$objop->objest->indice}.{$objop->indice}</span>
                                        </td>
                                        <td>
                                            {if $objop->descendente}
                                                <i class="fa fa-sitemap fa-fw" title="{$smarty.const.TXT_OBJOP_DESC}"></i>
                                            {/if}
                                            <a title="{$smarty.const.TXT_FICHA}" href="index.php?page=objop_mostrar&id_objop={$objop->id}&id_entidad={$objop->objest->linea->plan->id_entidad}">{$objop->nombre}</a>
                                        </td>
                                        <td>
                                            <a title="{$smarty.const.TXT_FICHA}" href="index.php?page=plan_mostrar&id_plan={$objop->objest->linea->id_plan}&id_entidad={$objop->objest->linea->plan->id_entidad}">{$objop->objest->linea->plan->anyo_inicio} - {$objop->objest->linea->plan->anyo_inicio + $objop->objest->linea->plan->duracion - 1}</a>
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
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_FICHA}" href="index.php?page=objop_mostrar&id_objop={$objop->id}&id_entidad={$objop->objest->linea->plan->id_entidad}">
                                                <i class="fa fa-folder fa-fw"></i>
                                            </a>
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_EDIT}" href="index.php?page=objop_editar&id_objop={$objop->id}&id_entidad={$objop->objest->linea->plan->id_entidad}">
                                                <i class="fa fa-pencil fa-fw"></i>
                                            </a>
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_OBJOP_BORRAR}" href='javascript:void(0)' data-toggle="modal" data-target="#dialogo_confirmar_borrado_objop"
                                               data-id_entidad="{$objop->objest->linea->plan->id_entidad}" data-nombre="{$objop->objest->linea->indice}.{$objop->objest->indice}.{$objop->indice}. {$objop->nombre}" data-id_objop="{$objop->id}">
                                                <i class="fa fa-trash fa-fw"></i>
                                            </a>
                                        </td>
                                    </tr>     
                                {/foreach}
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- /Objetivos operacionales del usuario -->

            </div>
        {else}
            {if $planes}
                <div class="table-responsive">
                    <table id="tabla_planes" class="table datatable table-striped table-hover">
                        <thead>
                            <tr>
                                <th>{$smarty.const.FIELD_PLAN}</th>
                                <th>{$smarty.const.FIELD_TITULO}</th>
                                <th>{$smarty.const.FIELD_EJECUCION}</th>
                                <th>{$smarty.const.FIELD_ACCIONES}</th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach from=$planes item=plan} 
                                <tr>  
                                    <td>
                                        <a title="{$smarty.const.FIELD_PLAN} {$plan->anyo_inicio} - {$plan->anyo_inicio + $plan->duracion-1}" href="index.php?page=plan_mostrar&id_plan={$plan->id}&id_entidad={$plan->id_entidad}">
                                            {$plan->anyo_inicio} - {$plan->anyo_inicio + $plan->duracion-1}
                                        </a>
                                    </td>
                                    <td>
                                        {if $plan->titulo}
                                            <i>"{$plan->titulo}"</i>
                                        {else}
                                            ---
                                        {/if}
                                    </td>
                                    <td style="white-space:nowrap">
                                        <div class="progress">
                                            <div class="progress-bar {if $plan->ejecucion|round:"2" < 25}progress-bar-danger{else if $plan->ejecucion|round:"2" >= 25 && $plan->ejecucion|round:"2" < 75}progress-bar-warning{else if $plan->ejecucion|round:"2" == 100}progress-bar-success{/if}" role="progressbar" aria-valuenow="{$plan->ejecucion|round:"2"}" aria-valuemin="0" aria-valuemax="100" style="min-width: 4em;width:{$plan->ejecucion|round:"2"}%">
                                                {$plan->ejecucion|round:"2"} %
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_FICHA}" href="index.php?page=plan_mostrar&id_plan={$plan->id}&id_entidad={$plan->id_entidad}">
                                            <i class="fa fa-folder fa-fw"></i>
                                        </a>
                                        {if $_control}
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_EDIT}" href="index.php?page=plan_editar&id_plan={$plan->id}&id_entidad={$plan->id_entidad}">
                                                <i class="fa fa-pencil fa-fw"></i>
                                            </a>
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_PLAN_BORRAR}" href='javascript:void(0)' data-toggle="modal" data-target="#dialogo_confirmar_borrado_plan"
                                               data-id_plan="{$plan->id}" data-periodo_plan="{$plan->anyo_inicio} - {$plan->anyo_inicio + $plan->duracion-1}" data-id_entidad="{$plan->id_entidad}">
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
                            {$smarty.const.MSG_UNID_NO_PLANES}
                        </div>
                    </div>
                    <!-- /.col-sm-11 -->
                    <div class="col-sm-1">
                        {if $_control}
                            <div class="btn-toolbar" role="toolbar" aria-label="">
                                <div class="btn-group" role="group" aria-label="">
                                    <a class="btn btn-danger" href='index.php?page=plan_crear&id_entidad={$entidad->id}' 
                                       title="{$smarty.const.TXT_PLAN_CREAR}">
                                        <i class="fa fa-book fa-fw"></i><sub class="fa fa-plus fa-fw"></sub>
                                    </a>
                                </div>
                            </div>
                        {/if}
                    </div>
                    <!-- /.col-sm-1 -->
                </div>
                <!-- /.row -->
            {/if}
        {/if}
    </div>
    <!-- /.col-lg-12 -->    
</div>
<!-- /.row -->