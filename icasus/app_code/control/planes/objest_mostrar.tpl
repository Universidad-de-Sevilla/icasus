<!-- Diálogo Confirmar Borrado Objetivo Estratégico -->
<div class="modal fade" id="dialogo_confirmar_borrado_objest" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel"><i
                            class="fa fa-trash fa-fw"></i> {$smarty.const.TXT_OBJEST_BORRAR}: {$linea->indice}
                    .{$objest->indice}. {$objest->nombre}</h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_OBJEST_CONFIRM_BORRAR}</p>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_NO}" class="btn btn-danger" data-dismiss="modal"><i
                            class="fa fa-times fa-fw"></i> {$smarty.const.TXT_NO}</button>
                <a title="{$smarty.const.TXT_SI}" class="btn btn-success" name="borrar" id="borrar"
                   href="index.php?page=objest_borrar&id_objest={$objest->id}&id_entidad={$entidad->id}"><i
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
        <div class="row">
            <div class="col-md-10">
                <h3 title="{$_nombre_pagina}" class="page-header">
                    <i class="fa fa-dot-circle-o fa-fw"></i> {$_nombre_pagina}</h3>
            </div>
            <!-- /.col-md-10 -->
            <!-- Navegación -->
            {if count($objests)> 1}
                <div class="col-md-2">
                    <div style="font-size:10px">{$indice+1} {$smarty.const.TXT_DE} {count($objests)} {$smarty.const.FIELD_OBJS_EST}</div>
                    <div class="btn-toolbar" role="toolbar" aria-label="">
                        <div class="btn-group" role="group" aria-label="">
                            <a title="{$smarty.const.TXT_PRIMER} {$smarty.const.FIELD_OBJ_EST}"
                               class="btn btn-danger btn-xs {if $indice == 0}disabled{/if}"
                               href='index.php?page=objest_mostrar&id_entidad={$plan->id_entidad}&id_objest={$objests[0]->id}'>
                                <i class="fa fa-step-backward fa-fw"></i>
                            </a>
                            <a title="{$smarty.const.TXT_ANT} {$smarty.const.FIELD_OBJ_EST}"
                               class="btn btn-danger btn-xs{if $indice == 0} disabled" href="#"{else}"
                            href="index.php?page=objest_mostrar&id_entidad={$plan->id_entidad}
                            &id_objest={$objests[$indice-1]->id}"{/if}>
                            <i class="fa fa-play fa-rotate-180 fa-fw"></i>
                            </a>
                            <a title="{$smarty.const.TXT_SIG} {$smarty.const.FIELD_OBJ_EST}"
                               class="btn btn-danger btn-xs{if $indice == (count($objests)-1)} disabled" href="#"{else}"
                            href="index.php?page=objest_mostrar&id_entidad={$plan->id_entidad}
                            &id_objest={$objests[$indice+1]->id}"{/if}>
                            <i class="fa fa-play fa-fw"></i>
                            </a>
                            <a title="{$smarty.const.TXT_ULTIMO} {$smarty.const.FIELD_OBJ_EST}{count($objests)}"
                               class="btn btn-danger btn-xs {if $indice == (count($objests)-1)}disabled{/if}"
                               href='index.php?page=objest_mostrar&id_entidad={$plan->id_entidad}&id_objest={$objests[(count($objests)-1)]->id}'>
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
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- /Nombre página -->

<!-- Breadcrumbs -->
<div class="row">
    <div class="col-lg-12">
        <ol class="breadcrumb">
            <li>
                <i title="{$smarty.const.TXT_ESTA}" class="fa fa-map-marker fa-fw"></i>
                <a title="{$smarty.const.FIELD_UNIDS}"
                   href='index.php?page=entidad_listar'>{$smarty.const.FIELD_UNIDS}</a></li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" data-target="#" title="{$entidad->nombre}"
                   href="index.php?page=entidad_mostrar&id_entidad={$entidad->id}">
                    {$entidad->nombre|truncate:30} <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu">
                    <li>
                        <a title="{$smarty.const.FIELD_USER}: {$_usuario->login} - {$smarty.const.TXT_UNID}:
                            {$entidad->nombre} - {$smarty.const.FIELD_ROL}: {$_rol}"
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
            <li><a title="{$smarty.const.FIELD_PLANES}"
                   href='index.php?page=plan_listar&id_entidad={$entidad->id}'>{$smarty.const.FIELD_PLANES}</a></li>
            <li><a title="{$smarty.const.FIELD_PLAN} {$plan->anyo_inicio} - {($plan->anyo_inicio + $plan->duracion-1)}"
                   href='index.php?page=plan_mostrar&id_plan={$plan->id}&id_entidad={$entidad->id}'>{$smarty.const.FIELD_PLAN} {$plan->anyo_inicio}
                    - {$plan->anyo_inicio + $plan->duracion-1}</a></li>
            <li><a title="{$smarty.const.FIELD_LINEAS}"
                   href='index.php?page=plan_mostrar&id_plan={$plan->id}&id_entidad={$entidad->id}#plan_lineas'>{$smarty.const.FIELD_LINEAS}</a>
            </li>
            <li><a title="{$smarty.const.FIELD_LINEA} {$linea->indice}. {$linea->nombre}"
                   href='index.php?page=linea_mostrar&id_entidad={$entidad->id}&id_linea={$linea->id}'>{$smarty.const.FIELD_LINEA} {$linea->indice}
                    . {$linea->nombre|truncate:30}</a></li>
            <li><a title="{$smarty.const.FIELD_OBJS_EST}"
                   href='index.php?page=linea_mostrar&id_linea={$linea->id}&id_entidad={$entidad->id}#linea_objests'>{$smarty.const.FIELD_OBJS_EST}</a>
            </li>
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
            <li role="presentation">
                <a href="#objest_ficha" title="{$smarty.const.TXT_FICHA}" aria-controls="{$smarty.const.TXT_FICHA}"
                   role="tab" data-toggle="tab"><i class="fa fa-folder fa-fw"></i> {$smarty.const.TXT_FICHA}</a>
            </li>
            <li role="presentation" class="active">
                <a href="#objest_objop" title="{$smarty.const.FIELD_OBJS_OP}"
                   aria-controls="{$smarty.const.FIELD_OBJS_OP}" role="tab" data-toggle="tab"><i
                            class="fa fa-bullseye fa-fw"></i> {$smarty.const.FIELD_OBJS_OP}</a>
            </li>
            <li role="presentation">
                <a href="#objest_res" title="{$smarty.const.TXT_SEGUIMIENTO}"
                   aria-controls="{$smarty.const.TXT_SEGUIMIENTO}" role="tab" data-toggle="tab"><i
                            class="fa fa-tasks fa-fw"></i> {$smarty.const.TXT_SEGUIMIENTO}</a>
            </li>
        </ul>
        <!-- /Nav tabs -->
        <br>
        <!-- Tab panes -->
        <div class="tab-content">

            <!-- Ficha del objetivo estratégico -->
            <div role="tabpanel" class="tab-pane" id="objest_ficha">
                <div class="row">
                    <!-- Datos del objetivo estratégico -->
                    <div class="col-md-12">
                        <table class="table table-striped table-hover ficha">
                            <thead>
                            <tr>
                                <th></th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th>{$smarty.const.FIELD_INDICE}</th>
                                <td><span class="label label-default">{$linea->indice}.{$objest->indice}</span></td>
                            </tr>
                            <tr>
                                <th>{$smarty.const.FIELD_NOMBRE}</th>
                                <td>
                                    {$objest->nombre}
                                </td>
                            </tr>
                            <tr>
                                <th>{$smarty.const.FIELD_LINEA}</th>
                                <td>
                                    <a title="{$smarty.const.FIELD_LINEA} {$linea->indice}. {$linea->nombre}"
                                       href='index.php?page=linea_mostrar&id_entidad={$entidad->id}&id_linea={$linea->id}'>{$linea->indice}
                                        . {$linea->nombre}</a>
                                </td>
                            </tr>
                            <tr>
                                <th>{$smarty.const.FIELD_EJECUCION}</th>
                                <td>
                                    <div class="progress">
                                        <div class="progress-bar {if $objest->ejecucion|round:"2" < 25}progress-bar-danger{elseif $objest->ejecucion|round:"2" >= 25 && $objest->ejecucion|round:"2" < 75}progress-bar-warning{elseif $objest->ejecucion|round:"2" == 100}progress-bar-success{/if}"
                                             role="progressbar" aria-valuenow="{$objest->ejecucion|round:"2"}"
                                             aria-valuemin="0" aria-valuemax="100"
                                             style="min-width: 4em;width:{$objest->ejecucion|round:"2"}%">
                                            {$objest->ejecucion|round:"2"} %
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        {if $_control}
                            <div id="botones_ficha" class="btn-toolbar hidden" role="toolbar" aria-label="">
                                <a title="{$smarty.const.TXT_OBJEST_EDIT}" class="btn btn-default btn-danger"
                                   href="index.php?page=objest_editar&id_objest={$objest->id}&id_entidad={$plan->id_entidad}">
                                    <i class="fa fa-dot-circle-o fa-fw"></i><sub class="fa fa-pencil fa-fw"></sub>
                                </a>
                                <a title="{$smarty.const.TXT_OBJEST_BORRAR}" class="btn btn-default btn-danger"
                                   href='javascript:void(0)' data-toggle="modal"
                                   data-target="#dialogo_confirmar_borrado_objest">
                                    <i class="fa fa-trash fa-fw"></i>
                                </a>
                            </div>
                        {/if}
                    </div>
                    <!-- /.col-md-12 -->
                    <!-- /Datos del objetivo estratégico -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /Ficha del objetivo estratégico -->

            <!-- Objetivos operacionales del objetivo estratégico -->
            <div role="tabpanel" class="tab-pane active" id="objest_objop">
                <!-- Ejecucion -->
                <ul class="list-group" style="margin: 0;">
                    <li class="list-group-item list-group-item-info">
                        <div class="row">
                            <div class="col-sm-8 h4">
                                {$linea->indice}.{$objest->indice}. {$objest->nombre}
                            </div>
                            <!-- /.col-sm-8 -->
                            <div class="col-sm-4">
                                <div class="progress">
                                    <div class="progress-bar {if $objest->ejecucion|round:"2" < 25}progress-bar-danger{elseif $objest->ejecucion|round:"2" >= 25 && $objest->ejecucion|round:"2" < 75}progress-bar-warning{elseif $objest->ejecucion|round:"2" == 100}progress-bar-success{/if}"
                                         role="progressbar" aria-valuenow="{$objest->ejecucion|round:"2"}"
                                         aria-valuemin="0" aria-valuemax="100"
                                         style="min-width: 4em;width: {$objest->ejecucion|round:"2"}%;">
                                        {$objest->ejecucion|round:"2"} %
                                    </div>
                                </div>
                            </div>
                            <!-- /.col-sm-4 -->
                        </div>
                        <!-- /.row -->
                    </li>
                </ul>
                <!-- /Ejecucion -->
                <br>
                <!-- Barra de botones -->
                {if $_control}
                    <div id="botones_objop" class="btn-toolbar hidden" role="toolbar" aria-label="">
                        <div class="btn-group" role="group" aria-label="">
                            <a class="btn btn-danger"
                               href='index.php?page=objop_crear&id_objest={$objest->id}&id_entidad={$entidad->id}'
                               title="{$smarty.const.TXT_OBJOP_CREAR}">
                                <i class="fa fa-bullseye fa-fw"></i><sub class="fa fa-plus fa-fw"></sub>
                            </a>
                        </div>
                    </div>
                {/if}
                <!-- /Barra de botones -->
                {if $objops}
                    <div class="table-responsive">
                        <table id="tabla_objop" class="table datatable table-striped table-hover">
                            <thead>
                            <tr>
                                <th>{$smarty.const.FIELD_INDICE}</th>
                                <th></th>
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
                                    <td style="width:2%">
                                        <span class="label label-default">{$objop->objest->linea->indice}
                                            .{$objop->objest->indice}.{$objop->indice}</span>
                                    </td>
                                    <td>
                                        {if $objop->descendente}
                                            <i class="fa fa-sitemap fa-fw" title="{$smarty.const.TXT_OBJOP_DESC}"></i>
                                        {/if}
                                    </td>
                                    <td style="width:40%">
                                        <a title="{$smarty.const.TXT_FICHA}"
                                           href="index.php?page=objop_mostrar&id_objop={$objop->id}&id_entidad={$entidad->id}">{$objop->nombre}</a>
                                    </td>
                                    <td style="font-size: 12px">
                                        <a title="{$smarty.const.TXT_USER_PERFIL}"
                                           href='index.php?page=usuario_mostrar&id_usuario={$objop->id_responsable}'>
                                            {$objop->responsable->nombre} {$objop->responsable->apellidos}</a>
                                    </td>
                                    <td style="width:2%">
                                        {if $objops_anyos[$objop->id]}
                                            {foreach $objops_anyos[$objop->id] as $anyo}
                                                {if $anyo@first}
                                                    {$anyo}{$escrito=true}
                                                {elseif $anyo_anterior+1 == $anyo and !$anyo@last}
                                                    {$escrito=false}
                                                {elseif $anyo_anterior+1 != $anyo and !$escrito}
                                                    - {$anyo_anterior}, {$anyo}
                                                    {$escrito=true}
                                                {elseif $anyo_anterior+1 != $anyo}
                                                    , {$anyo}
                                                    {$escrito=true}
                                                {elseif $anyo@last && $objops_anyos[$objop->id]|@count>1}
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
                                            <div class="progress-bar {if $objop->ejecucion|round:"2" < 25}progress-bar-danger{elseif $objop->ejecucion|round:"2" >= 25 && $objop->ejecucion|round:"2" < 75}progress-bar-warning{elseif $objop->ejecucion|round:"2" == 100}progress-bar-success{/if}"
                                                 role="progressbar" aria-valuenow="{$objop->ejecucion|round:"2"}"
                                                 aria-valuemin="0" aria-valuemax="100"
                                                 style="min-width: 4em;width:{$objop->ejecucion|round:"2"}%">
                                                {$objop->ejecucion|round:"2"} %
                                            </div>
                                        </div>
                                    </td>
                                    <td style="width:2%">
                                        {if $objop->descendente}
                                            {$objops_unids[$objop->id]|@count}
                                        {else}
                                            1
                                        {/if}
                                    </td>
                                    <td>
                                        <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_FICHA}"
                                           href="index.php?page=objop_mostrar&id_objop={$objop->id}&id_entidad={$entidad->id}">
                                            <i class="fa fa-folder fa-fw"></i>
                                        </a>
                                        {if $_control}
                                            <a class="btn btn-default btn-circle btn-xs"
                                               title="{$smarty.const.TXT_EDIT}"
                                               href="index.php?page=objop_editar&id_objop={$objop->id}&id_entidad={$entidad->id}">
                                                <i class="fa fa-pencil fa-fw"></i>
                                            </a>
                                            <a class="btn btn-default btn-circle btn-xs"
                                               title="{$smarty.const.TXT_OBJOP_BORRAR}" href='javascript:void(0)'
                                               data-toggle="modal" data-target="#dialogo_confirmar_borrado_objop"
                                               data-id_entidad="{$plan->id_entidad}"
                                               data-nombre="{$objop->objest->linea->indice}.{$objop->objest->indice}.{$objop->indice}. {$objop->nombre}"
                                               data-id_objop="{$objop->id}">
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
                                {$smarty.const.MSG_OBJEST_NO_OBJOP}
                            </div>
                        </div>
                        <!-- /.col-sm-11 -->
                        <div class="col-sm-1">
                            {if $_control}
                                <div class="btn-toolbar" role="toolbar" aria-label="">
                                    <div class="btn-group" role="group" aria-label="">
                                        <a class="btn btn-danger"
                                           href='index.php?page=objop_crear&id_objest={$objest->id}&id_entidad={$entidad->id}'
                                           title="{$smarty.const.TXT_OBJOP_CREAR}">
                                            <i class="fa fa-bullseye fa-fw"></i><sub class="fa fa-plus fa-fw"></sub>
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
            <!-- /Objetivos operacionales del objetivo estratégico -->

            <!-- Seguimiento del objetivo estratégico -->
            <div role="tabpanel" class="tab-pane" id="objest_res">
                <!-- Ejecucion -->
                <ul class="list-group" style="margin: 0;">
                    <li class="list-group-item list-group-item-info">
                        <div class="row">
                            <div class="col-sm-8 h4">
                                {$linea->indice}.{$objest>indice}. {$objest->nombre}
                            </div>
                            <!-- /.col-sm-8 -->
                            <div class="col-sm-4">
                                <div class="progress">
                                    <div class="progress-bar {if $objest->ejecucion|round:"2" < 25}progress-bar-danger{elseif $objest->ejecucion|round:"2" >= 25 && $objest->ejecucion|round:"2" < 75}progress-bar-warning{elseif $objest->ejecucion|round:"2" == 100}progress-bar-success{/if}"
                                         role="progressbar" aria-valuenow="{$objest->ejecucion|round:"2"}"
                                         aria-valuemin="0" aria-valuemax="100"
                                         style="min-width: 4em;width: {$objest->ejecucion|round:"2"}%;">
                                        {$objest->ejecucion|round:"2"} %
                                    </div>
                                </div>
                            </div>
                            <!-- /.col-sm-4 -->
                        </div>
                        <!-- /.row -->
                    </li>
                </ul>
                <!-- /Ejecucion -->
                <br>
                <!-- Ejecución/año -->
                <div class="table-responsive">
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
                                <td style="width:2%"><span class="label label-default">{$i}</span></td>
                                <td>
                                    <div class="progress">
                                        <div class="progress-bar {if $ejecucion_anual[$i]|round:"2" < 25}progress-bar-danger{elseif $ejecucion_anual[$i]|round:"2" >= 25 && $ejecucion_anual[$i]|round:"2" < 75}progress-bar-warning{elseif $ejecucion_anual[$i]|round:"2" == 100}progress-bar-success{/if}"
                                             role="progressbar" aria-valuenow="{$ejecucion_anual[$i]|round:"2"}"
                                             aria-valuemin="0" aria-valuemax="100"
                                             style="min-width: 4em;width:{$ejecucion_anual[$i]|round:"2"}%">
                                            {$ejecucion_anual[$i]|round:"2"} %
                                        </div>
                                    </div>
                                </td>
                                <td id="resultado_{$i}" style="width:50%">
                                    <textarea class="form-control" placeholder="{$smarty.const.TXT_RESUL}" rows="4"
                                              readonly>{$resultado_anual[$i]}</textarea>
                                </td>
                                {if $_control}
                                    <td style="white-space:nowrap" id="edicion_{$i}">
                                        <a title="{$smarty.const.TXT_EDIT}"
                                           class="btn btn-default btn-xs btn-circle editar"
                                           data-id_objest='{$objest->id}' data-anyo='{$i}'>
                                            <i class="fa fa-pencil fa-fw"></i>
                                        </a>
                                    </td>
                                {/if}
                            </tr>
                        {/for}
                        </tbody>
                    </table>
                </div>
                <!-- /Ejecución/año -->
            </div>
            <!-- /Seguimiento del objetivo estratégico -->

        </div>
        <!-- /Tab panes -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
