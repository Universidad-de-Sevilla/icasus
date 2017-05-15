<!-- Diálogo Valor invalido -->
<div class="modal fade" id="dialogo_valor_invalido" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel"><i class="fa fa-bullseye fa-fw"></i><sub class="fa fa-tasks fa-fw"></sub> {$smarty.const.FIELD_OBJ_OP}: {$objop->objest->linea->indice}.{$objop->objest->indice}.{$objop->indice}. {$objop->nombre}</h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_OBJOP_VALOR_EJ}</p>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_BTN_ACEPTAR}" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-check fa-fw"></i> {$smarty.const.TXT_BTN_ACEPTAR}</button>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Valor invalido -->

<!-- Diálogo Confirmar Borrado Objetivo Operacional -->
<div class="modal fade" id="dialogo_confirmar_borrado_objop" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel"><i
                        class="fa fa-trash fa-fw"></i> {$smarty.const.TXT_OBJOP_BORRAR}: {$objop->objest->linea->indice}.{$objop->objest->indice}.{$objop->indice}. {$objop->nombre}</h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_OBJOP_CONFIRM_BORRAR}</p>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_NO}" class="btn btn-danger" data-dismiss="modal"><i
                        class="fa fa-times fa-fw"></i> {$smarty.const.TXT_NO}</button>
                <a title="{$smarty.const.TXT_SI}" class="btn btn-success" name="borrar" id="borrar" href="index.php?page=objop_borrar&id_objop={$objop->id}&id_entidad={$entidad->id}"><i
                        class="fa fa-check fa-fw"></i> {$smarty.const.TXT_SI}</a>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Confirmar Objetivo Operacional -->

<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <h3 title="{$_nombre_pagina}" class="page-header">
            <div class="row">
                <div class="col-md-10">
                    <i class="fa fa-bullseye fa-fw"></i> {$_nombre_pagina}
                </div>
                <!-- /.col-md-10 -->
                <!-- Navegación -->
                {if count($objops)> 1}
                    <div class="col-md-2">
                        <div style="font-size:10px">{$indice+1} {$smarty.const.TXT_DE} {count($objops)} {$smarty.const.FIELD_OBJS_OP}</div>
                        <div class="btn-toolbar" role="toolbar" aria-label="">
                            <div class="btn-group" role="group" aria-label="">
                                <a title="{$smarty.const.TXT_PRIMER} {$smarty.const.FIELD_OBJ_OP}" class="btn btn-danger btn-xs {if $indice == 0}disabled{/if}" href='index.php?page=objop_mostrar&id_entidad={$entidad->id}&id_objop={$objops[0]->id}'>
                                    <i class="fa fa-step-backward fa-fw"></i>
                                </a>
                                <a title="{$smarty.const.TXT_ANT} {$smarty.const.FIELD_OBJ_OP}" class="btn btn-danger btn-xs {if $indice == 0}disabled{/if}" href='index.php?page=objop_mostrar&id_entidad={$entidad->id}&id_objop={$objops[$indice-1]->id}'>
                                    <i class="fa fa-play fa-rotate-180 fa-fw"></i>
                                </a>
                                <a title="{$smarty.const.TXT_SIG} {$smarty.const.FIELD_OBJ_OP}" class="btn btn-danger btn-xs {if $indice == (count($objops)-1)}disabled{/if}" href='index.php?page=objop_mostrar&id_entidad={$entidad->id}&id_objop={$objops[$indice+1]->id}'>
                                    <i class="fa fa-play fa-fw"></i>
                                </a>
                                <a title="{$smarty.const.TXT_ULTIMO} {$smarty.const.FIELD_OBJ_OP}" class="btn btn-danger btn-xs {if $indice == (count($objops)-1)}disabled{/if}" href='index.php?page=objop_mostrar&id_entidad={$entidad->id}&id_objop={$objops[(count($objops)-1)]->id}'>
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
            <li><a title="{$smarty.const.FIELD_PLAN} {$plan->anyo_inicio} - {($plan->anyo_inicio + $plan->duracion-1)}" href='index.php?page=plan_mostrar&id_plan={$plan->id}&id_entidad={$entidad->id}'>{$smarty.const.FIELD_PLAN} {$plan->anyo_inicio} - {$plan->anyo_inicio + $plan->duracion-1}</a></li>
            <li><a title="{$smarty.const.FIELD_LINEA} {$linea->indice}. {$linea->nombre}" href='index.php?page=linea_mostrar&id_entidad={$entidad->id}&id_linea={$linea->id}'>{$smarty.const.FIELD_LINEA} {$linea->indice}. {$linea->nombre|truncate:30}</a></li>
            <li><a title="{$smarty.const.FIELD_OBJ_EST} {$linea->indice}.{$objest->indice}. {$objest->nombre}" href='index.php?page=objest_mostrar&id_objest={$objest->id}&id_entidad={$entidad->id}'>{$smarty.const.FIELD_OBJ_EST} {$linea->indice}.{$objest->indice}. {$objest->nombre|truncate:30}</a></li>
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
                <a href="#objop_ficha" title="{$smarty.const.TXT_FICHA}" aria-controls="{$smarty.const.TXT_FICHA}" role="tab" data-toggle="tab"><i class="fa fa-folder fa-fw"></i> {$smarty.const.TXT_FICHA}</a>
            </li>
            <li role="presentation">
                <a href="#indics_correl" title="{$smarty.const.FIELD_INDICS} ({$smarty.const.FIELD_PROC})" aria-controls="{$smarty.const.FIELD_INDICS} ({$smarty.const.FIELD_PROC})" role="tab" data-toggle="tab"><i class="fa fa-dashboard fa-fw"></i><sub class="fa fa-gear fa-fw"></sub> {$smarty.const.FIELD_INDICS} ({$smarty.const.FIELD_PROC})</a>
            </li>
            <li role="presentation">
                <a href="#indics_control" title="{$smarty.const.FIELD_INDICS} ({$smarty.const.TXT_CONTROL})" aria-controls="{$smarty.const.FIELD_INDICS} ({$smarty.const.TXT_CONTROL})" role="tab" data-toggle="tab"><i class="fa fa-dashboard fa-fw"></i><sub class="fa fa-sliders fa-fw"></sub> {$smarty.const.FIELD_INDICS} ({$smarty.const.TXT_CONTROL})</a>
            </li>
            <li role="presentation">
                <a href="#objop_res" title="{$smarty.const.TXT_SEGUIMIENTO}" aria-controls="{$smarty.const.TXT_SEGUIMIENTO}" role="tab" data-toggle="tab"><i class="fa fa-tasks fa-fw"></i> {$smarty.const.TXT_SEGUIMIENTO}</a>
            </li>
        </ul>
        <!-- /Nav tabs -->
        <br>
        <!-- Tab panes -->
        <div class="tab-content">

            <!-- Ficha del objetivo operacional -->
            <div role="tabpanel" class="tab-pane active" id="objop_ficha">
                <div class="row">
                    <!-- Datos del objetivo operacional -->
                    <div class="col-md-12">
                        <table class="table table-striped table-hover ficha">
                            <thead><th></th><th></th></thead>
                            <tbody>
                                <tr>
                                    <th>{$smarty.const.FIELD_INDICE}</th>
                                    <td><span class="label label-default">{$objop->objest->linea->indice}.{$objop->objest->indice}.{$objop->indice}</span></td>
                                </tr>
                                <tr>
                                    <th>{$smarty.const.FIELD_NOMBRE}</th>
                                    <td> 
                                        {$objop->nombre}
                                    </td>
                                </tr>
                                <tr>
                                    <th>{$smarty.const.FIELD_RESP}</th>
                                    <td> 
                                        {$objop->responsable->nombre} {$objop->responsable->apellidos}
                                    </td>
                                </tr>
                                <tr>
                                    <th>{$smarty.const.FIELD_OBJ_EST}</th>
                                    <td> 
                                        <a title="{$smarty.const.FIELD_OBJ_EST} {$linea->indice}.{$objest->indice}. {$objest->nombre}" href='index.php?page=objest_mostrar&id_objest={$objest->id}&id_entidad={$entidad->id}'>{$linea->indice}.{$objest->indice}. {$objest->nombre}</a>
                                    </td>
                                </tr>
                                <tr>
                                    <th>{$smarty.const.FIELD_DESC}</th>
                                    <td> 
                                        {if $objop->descripcion}
                                            {$objop->descripcion|nl2br}
                                        {else}
                                            ---
                                        {/if}
                                    </td>
                                </tr>
                                <tr>
                                    <th>{$smarty.const.FIELD_OBSERV}</th>
                                    <td> 
                                        {if $objop->observaciones}
                                            {$objop->observaciones|nl2br}
                                        {else}
                                            ---
                                        {/if}
                                    </td>
                                </tr>
                                <tr>
                                    <th>{$smarty.const.FIELD_DURACION}</th>
                                    <td id="duracion">
                                        {if $objop_anyos}
                                            {foreach $objop_anyos as $anyo}
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
                                                {else if $anyo@last && $objop_anyos|@count>1}
                                                    - {$anyo}
                                                {/if}
                                                {$anyo_anterior=$anyo}
                                            {/foreach}
                                        {else}
                                            ---
                                        {/if}
                                    </td>
                                </tr>
                                <tr>
                                    <th>{$smarty.const.FIELD_EJECUCION}</th>
                                    <td id="ejecucion_global"> 
                                        <div class="progress">
                                            <div class="progress-bar {if $objop->ejecucion|round:"2" < 25}progress-bar-danger{else if $objop->ejecucion|round:"2" >= 25 && $objop->ejecucion|round:"2" < 75}progress-bar-warning{else if $objop->ejecucion|round:"2" == 100}progress-bar-success{/if}" role="progressbar" aria-valuenow="{$objop->ejecucion|round:"2"}" aria-valuemin="0" aria-valuemax="100" style="min-width: 4em;width:{$objop->ejecucion|round:"2"}%">
                                                {$objop->ejecucion|round:"2"} %
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr title="{$smarty.const.TXT_PESO}">
                                    <th>{$smarty.const.FIELD_PESO}</th>
                                    <td> 
                                        {$objop->peso}
                                    </td>
                                </tr>
                                <tr>
                                    <th>{$smarty.const.TXT_OBJOP_TIPO}</th>
                                    <td> 
                                        {if $objop->descendente}
                                            {$smarty.const.TXT_OBJOP_DESC}
                                        {else}
                                            {$smarty.const.TXT_OBJOP_PROPIO}
                                        {/if}
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        {if $objop->descendente}
                                            {$smarty.const.FIELD_SUBUNIDS}
                                        {else}
                                            {$smarty.const.FIELD_UNID}
                                        {/if}
                                    </th>
                                    <td>
                                        {if $objetivo_subunidades}
                                            <ul class="list-unstyled">
                                                {foreach $objetivo_subunidades as $objetivo_subunidad}
                                                    <li>
                                                        <a title="{$objetivo_subunidad->entidad->etiqueta}" href="index.php?page=entidad_mostrar&id_entidad={$objetivo_subunidad->entidad->id}">{$objetivo_subunidad->entidad->etiqueta}</a>
                                                    </li>
                                                {/foreach}
                                            </ul>
                                        {else}
                                            {$smarty.const.MSG_OBJOP_NO_SUBUNID_ASIG}
                                        {/if}
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        {if $_control || $responsable}
                            <div id="botones_ficha" class="btn-toolbar hidden" role="toolbar" aria-label="">
                                <a title="{$smarty.const.TXT_OBJOP_EDIT}" class="btn btn-default btn-danger" href="index.php?page=objop_editar&id_objop={$objop->id}&id_entidad={$entidad->id}">
                                    <i class="fa fa-bullseye fa-fw"></i><sub class="fa fa-pencil fa-fw"></sub>
                                </a>
                                <a title="{$smarty.const.TXT_OBJOP_BORRAR}" class="btn btn-default btn-danger" href='javascript:void(0)' data-toggle="modal" data-target="#dialogo_confirmar_borrado_objop">
                                    <i class="fa fa-trash fa-fw"></i>
                                </a>
                            </div>
                        {/if}
                    </div>
                    <!-- /.col-md-12 -->
                    <!-- /Datos del objetivo operacional -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /Ficha del objetivo operacional -->

            <!-- Indicadores de correlación -->
            <div role="tabpanel" class="tab-pane" id="indics_correl">
                {if $indicadores_correlacion}
                    <div class="table-responsive">
                        <table id="tabla_indics_correl" class="table datatable table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>{$smarty.const.FIELD_COD}</th>
                                    <th></th>
                                    <th></th>
                                    <th>{$smarty.const.FIELD_INDIC}</th>
                                    <th>{$smarty.const.FIELD_PROC}</th>
                                    <th>{$smarty.const.FIELD_PERIOD}</th>
                                    <th>{$smarty.const.FIELD_RESP}</th>
                                    <th>{$smarty.const.FIELD_RESP_MED}</th>
                                    <th>{$smarty.const.FIELD_ACCIONES}</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach from=$indicadores_correlacion item=indicador}
                                    <tr>
                                        <td><span class="label label-primary">{$indicador->codigo}</span></td>
                                        <td>
                                            {if $indicador->calculo}
                                                <i class="fa fa-calculator fa-fw" title="{$smarty.const.TXT_CALC_AUTO}: {$indicador->calculo}"></i>
                                            {/if}
                                        </td>
                                        <td>
                                            {if $indicador->id_tipo_agregacion!= 0}
                                                <i class="fa fa-sitemap fa-fw" title="{$smarty.const.FIELD_AGREG}"></i>
                                            {/if}
                                        </td>
                                        <td>
                                            <a target="_blank" href='index.php?page=indicador_mostrar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}' 
                                               title="{$indicador->nombre}: {$indicador->descripcion|replace:"\r\n":" "}">
                                                {$indicador->nombre}</a>
                                        </td>
                                        <td>
                                            <a target="_blank" title="{$smarty.const.TXT_PROC_VER}" href='index.php?page=proceso_mostrar&id_proceso={$indicador->id_proceso}&id_entidad={$indicador->id_entidad}'>
                                                {$indicador->proceso->nombre}
                                            </a>
                                        </td>
                                        <td>{$indicador->periodicidad}</td>
                                        <td style="font-size: 12px">
                                            <a target="_blank" title="{$smarty.const.TXT_USER_PERFIL}" href='index.php?page=usuario_mostrar&id_usuario={$indicador->id_responsable}'>
                                                {$indicador->responsable->nombre} {$indicador->responsable->apellidos}</a>
                                        </td>
                                        <td style="font-size: 12px">
                                            <a target="_blank" title="{$smarty.const.TXT_USER_PERFIL}" href='index.php?page=usuario_mostrar&id_usuario={$indicador->id_responsable_medicion}'>
                                                {$indicador->responsable_medicion->nombre} {$indicador->responsable_medicion->apellidos}</a>
                                        </td>
                                        <td>
                                            <a target="_blank" class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_FICHA}" href='index.php?page=indicador_mostrar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                                                <i class="fa fa-folder fa-fw"></i>
                                            </a>
                                            <a target="_blank" class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_REP_GRAFIC}" href='index.php?page=graficas_mostrar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                                                <i class="fa fa-area-chart fa-fw"></i>
                                            </a>
                                            <a target="_blank" class="btn btn-default btn-circle btn-xs" href='index.php?page=medicion_listar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}' 
                                               title="{$smarty.const.FIELD_MEDICIONES}">
                                                <i class="fa fa-hourglass fa-fw"></i>
                                            </a>
                                            <a target="_blank" class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_ANALISIS}" href='index.php?page=analisis&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                                                <i class="fa fa-connectdevelop fa-fw"></i>
                                            </a>
                                            <a target="_blank" class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_VAL_REF}" href='index.php?page=valor_referencia&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                                                <i class="fa fa-tags fa-fw"></i>
                                            </a>
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
                                {$smarty.const.MSG_OBJOP_NO_INDICS_CORREL}
                            </div>
                        </div>
                        <!-- /.col-sm-12 -->
                    </div>
                    <!-- /.row -->
                {/if}
            </div>
            <!-- /Indicadores de correlación -->

            <!-- Indicadores de control -->
            <div role="tabpanel" class="tab-pane" id="indics_control">
                {if $indicadores_control}
                    <div class="table-responsive">
                        <table id="tabla_indics_control" class="table datatable table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>{$smarty.const.FIELD_COD}</th>
                                    <th></th>
                                    <th></th>
                                    <th>{$smarty.const.FIELD_INDIC}</th>
                                    <th>{$smarty.const.FIELD_PERIOD}</th>
                                    <th>{$smarty.const.FIELD_RESP}</th>
                                    <th>{$smarty.const.FIELD_RESP_MED}</th>
                                    <th>{$smarty.const.FIELD_ACCIONES}</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach from=$indicadores_control item=indicador}
                                    <tr>
                                        <td><span class="label label-primary">{$indicador->codigo}</span></td>
                                        <td>
                                            {if $indicador->calculo}
                                                <i class="fa fa-calculator fa-fw" title="{$smarty.const.TXT_CALC_AUTO}: {$indicador->calculo}"></i>
                                            {/if}
                                        </td>
                                        <td>
                                            {if $indicador->id_tipo_agregacion!= 0}
                                                <i class="fa fa-sitemap fa-fw" title="{$smarty.const.FIELD_AGREG}"></i>
                                            {/if}
                                        </td>
                                        <td>
                                            <a target="_blank" href='index.php?page=indicador_mostrar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}' 
                                               title="{$indicador->nombre}: {$indicador->descripcion|replace:"\r\n":" "}">
                                                {$indicador->nombre}</a>
                                        </td>
                                        <td>{$indicador->periodicidad}</td>
                                        <td style="font-size: 12px">
                                            <a target="_blank" title="{$smarty.const.TXT_USER_PERFIL}" href='index.php?page=usuario_mostrar&id_usuario={$indicador->id_responsable}'>
                                                {$indicador->responsable->nombre} {$indicador->responsable->apellidos}</a>
                                        </td>
                                        <td style="font-size: 12px">
                                            <a target="_blank" title="{$smarty.const.TXT_USER_PERFIL}" href='index.php?page=usuario_mostrar&id_usuario={$indicador->id_responsable_medicion}'>
                                                {$indicador->responsable_medicion->nombre} {$indicador->responsable_medicion->apellidos}</a>
                                        </td>
                                        <td>
                                            <a target="_blank" class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_FICHA}" href='index.php?page=indicador_mostrar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                                                <i class="fa fa-folder fa-fw"></i>
                                            </a>
                                            <a target="_blank" class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_REP_GRAFIC}" href='index.php?page=graficas_mostrar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                                                <i class="fa fa-area-chart fa-fw"></i>
                                            </a>
                                            <a target="_blank" class="btn btn-default btn-circle btn-xs" href='index.php?page=medicion_listar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}' 
                                               title="{$smarty.const.FIELD_MEDICIONES}">
                                                <i class="fa fa-hourglass fa-fw"></i>
                                            </a>
                                            <a target="_blank" class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_ANALISIS}" href='index.php?page=analisis&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                                                <i class="fa fa-connectdevelop fa-fw"></i>
                                            </a> 
                                            <a target="_blank" class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_VAL_REF}" href='index.php?page=valor_referencia&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                                                <i class="fa fa-tags fa-fw"></i>
                                            </a>
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
                                {$smarty.const.MSG_OBJOP_NO_INDICS_CONTROL}
                            </div>
                        </div>
                        <!-- /.col-sm-12 -->
                    </div>
                    <!-- /.row -->
                {/if}
            </div>
            <!-- /Indicadores de control -->

            <!-- Seguimiento del objetivo operacional -->
            <div role="tabpanel" class="tab-pane" id="objop_res">
                <!-- Ejecución/año -->
                <div class="table-responsive">
                    <table class="table table-striped table-hover ficha">
                        <thead>
                            <tr>
                                <th>{$smarty.const.FIELD_ANYO}</th>
                                <th>{$smarty.const.FIELD_EJECUCION}</th>
                                <th>{$smarty.const.TXT_RESUL}</th>
                                    {if $_control || $responsable}
                                    <th></th>
                                    {/if}
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            {for $i={$plan->anyo_inicio} to {($plan->anyo_inicio + $plan->duracion-1)}}
                                {if $activacion_anual[$i] || $_control || $responsable}
                                    <tr>
                                        <td><span class="label label-default">{$i}</span></td>
                                        <td id="porcentaje_{$i}">
                                            <div class="progress">
                                                <div class="progress-bar {if $ejecucion_anual[$i]|round:"2" < 25}progress-bar-danger{else if $ejecucion_anual[$i]|round:"2" >= 25 && $ejecucion_anual[$i]|round:"2" < 75}progress-bar-warning{else if $ejecucion_anual[$i]|round:"2" == 100}progress-bar-success{/if}" role="progressbar" aria-valuenow="{$ejecucion_anual[$i]|round:"2"}" aria-valuemin="0" aria-valuemax="100" style="min-width: 4em;width:{$ejecucion_anual[$i]|round:"2"}%">
                                                    {$ejecucion_anual[$i]|round:"2"} %
                                                </div>
                                            </div>
                                        </td>
                                        <td id="resultado_{$i}">
                                            <textarea  class="form-control" placeholder="{$smarty.const.TXT_RESUL}" readonly>{$resultado_anual[$i]}</textarea>
                                        </td>
                                        {if $_control || $responsable}
                                            <td style="white-space:nowrap" id="edicion_{$i}">
                                                <a title="{$smarty.const.TXT_EDIT}" class="btn btn-default btn-xs btn-circle editar" data-id_objop='{$objop->id}' data-anyo='{$i}'>
                                                    <i class="fa fa-pencil fa-fw"></i>
                                                </a>
                                            </td>
                                            <td>
                                                <input class="form-control activar" data-width="60" type="checkbox"
                                                       data-toggle="toggle" data-on="{$smarty.const.TXT_VAL_ACTIVO}"
                                                       data-onstyle="success" data-offstyle="danger" data-size="mini"
                                                       data-off="{$smarty.const.TXT_VAL_INACTIVO}"
                                                       data-id_objop='{$objop->id}' data-anyo='{$i}'
                                                       {if $activacion_anual[$i] == 1}checked="checked"{/if}>
                                            </td>
                                        {else}
                                            <td>
                                                <input class="form-control activar" data-width="60" type="checkbox"
                                                       data-toggle="toggle" data-on="{$smarty.const.TXT_VAL_ACTIVO}"
                                                       data-onstyle="success" data-offstyle="danger" data-size="mini"
                                                       data-off="{$smarty.const.TXT_VAL_INACTIVO}"
                                                       data-id_objop='{$objop->id}' data-anyo='{$i}'
                                                       {if $activacion_anual[$i] == 1}checked="checked"{/if} disabled>
                                            </td>
                                        {/if}
                                    </tr>
                                {/if}
                            {/for}
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- /Ejecución/año -->
        </div>
        <!-- /Seguimiento del objetivo operacional -->

    </div>
    <!-- /Tab panes -->
</div>
<!-- /.col-lg-12 -->
</div>
<!-- /.row -->