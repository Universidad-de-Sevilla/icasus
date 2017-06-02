<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <h3 title="{$_nombre_pagina}" class="page-header">
            <i class="fa fa-search fa-fw"></i> {$_nombre_pagina}
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
            <li title="{$_nombre_pagina}" class="active">{$_nombre_pagina}</li>
        </ol>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- /Breadcrumbs -->

{if $texto}
    <div class="row">
        <div class="col-lg-12">

            <!-- Nav tabs -->
            <ul class="nav nav-tabs" role="tablist">     
                <li id="tab_unidades" role="presentation" class="active">
                    <a href="#unidades" title="{$smarty.const.FIELD_UNIDS}" aria-controls="{$smarty.const.FIELD_UNIDS}" role="tab" data-toggle="tab"><i class="fa fa-sitemap fa-fw"></i> {$smarty.const.FIELD_UNIDS}</a>
                </li>
                <li id="tab_planes" role="presentation">
                    <a href="#planes" title="{$smarty.const.FIELD_PLANES}" aria-controls="{$smarty.const.FIELD_PLANES}" role="tab" data-toggle="tab"><i class="fa fa-book fa-fw"></i> {$smarty.const.FIELD_PLANES}</a>
                </li>
                <li id="tab_lineas" role="presentation">
                    <a href="#lineas" title="{$smarty.const.FIELD_LINEAS}" aria-controls="{$smarty.const.FIELD_LINEAS}" role="tab" data-toggle="tab"><i class="fa fa-long-arrow-right fa-fw"></i> {$smarty.const.FIELD_LINEAS}</a>
                </li>
                <li id="tab_objests" role="presentation">
                    <a href="#objests" title="{$smarty.const.FIELD_OBJS_EST}" aria-controls="{$smarty.const.FIELD_OBJS_EST}" role="tab" data-toggle="tab"><i class="fa fa-dot-circle-o fa-fw"></i> {$smarty.const.FIELD_OBJS_EST}</a>
                </li>
                <li id="tab_objops" role="presentation">
                    <a href="#objops" title="{$smarty.const.FIELD_OBJS_OP}" aria-controls="{$smarty.const.FIELD_OBJS_OP}" role="tab" data-toggle="tab"><i class="fa fa-bullseye fa-fw"></i> {$smarty.const.FIELD_OBJS_OP}</a>
                </li>
                <li id="tab_cartas" role="presentation">
                    <a href="#cartas" title="{$smarty.const.FIELD_CARTAS}" aria-controls="{$smarty.const.FIELD_CARTAS}" role="tab" data-toggle="tab"><i class="fa fa-map-o fa-fw"></i> {$smarty.const.FIELD_CARTAS}</a>
                </li>
                <li id="tab_objests" role="presentation">
                    <a href="#servicios" title="{$smarty.const.FIELD_SERVICIOS}" aria-controls="{$smarty.const.FIELD_SERVICIOS}" role="tab" data-toggle="tab"><i class="fa fa-user-circle-o fa-fw"></i> {$smarty.const.FIELD_SERVICIOS}</a>
                </li>
                <li id="tab_objops" role="presentation">
                    <a href="#compromisos" title="{$smarty.const.FIELD_COMPROMISOS}" aria-controls="{$smarty.const.FIELD_COMPROMISOS}" role="tab" data-toggle="tab"><i class="fa fa-handshake-o fa-fw"></i> {$smarty.const.FIELD_COMPROMISOS}</a>
                </li>
                <li id="tab_procesos" role="presentation">
                    <a href="#procesos" title="{$smarty.const.FIELD_PROCS}" aria-controls="{$smarty.const.FIELD_PROCS}" role="tab" data-toggle="tab"><i class="fa fa-gears fa-fw"></i> {$smarty.const.FIELD_PROCS}</a>
                </li>
                <li id="tab_indicadores" role="presentation">
                    <a href="#indicadores" title="{$smarty.const.FIELD_INDICS}" aria-controls="{$smarty.const.FIELD_INDICS}" role="tab" data-toggle="tab"><i class="fa fa-dashboard fa-fw"></i> {$smarty.const.FIELD_INDICS}</a>
                </li>
                <li id="tab_cuadros" role="presentation">
                    <a href="#cuadros" title="{$smarty.const.FIELD_CUADROS_MANDO}" aria-controls="{$smarty.const.FIELD_CUADROS_MANDO}" role="tab" data-toggle="tab"><i class="fa fa-th fa-fw"></i> {$smarty.const.FIELD_CUADROS_MANDO}</a>
                </li>
                <li id="tab_users" role="presentation">
                    <a href="#users" title="{$smarty.const.TXT_USERS}" aria-controls="{$smarty.const.TXT_USERS}" role="tab" data-toggle="tab"><i class="fa fa-users fa-fw"></i> {$smarty.const.TXT_USERS}</a>
                </li>
            </ul>
            <!-- /Nav tabs -->
            <br>
            <!-- Tab panes -->
            <div class="tab-content">

                <!-- Tab unidades -->
                <div id="unidades" role="tabpanel" class="tab-pane active">
                    {if $entidades}
                        <div class="table-responsive">
                            <table class="table datatable table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>{$smarty.const.FIELD_COD}</th>
                                        <th>{$smarty.const.FIELD_UNID}</th>
                                        <th>{$smarty.const.FIELD_ACCIONES}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {foreach from=$entidades item=entidad}
                                        <tr>
                                            <td><span class="label label-primary">{$entidad->codigo}</span></td>
                                            <td><a title="{$entidad->nombre}" href='index.php?page=entidad_mostrar&id_entidad={$entidad->id}'>{$entidad->nombre}</a></td>
                                            <td>
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_FICHA}" href='index.php?page=entidad_mostrar&id_entidad={$entidad->id}'><i class="fa fa-folder fa-fw"></i></a>
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.FIELD_PLANES}" href='index.php?page=plan_listar&id_entidad={$entidad->id}'><i class="fa fa-book fa-fw"></i></a>
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.FIELD_CARTAS}" href='index.php?page=carta_listar&id_entidad={$entidad->id}'><i class="fa fa-map-o fa-fw"></i></a>
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.FIELD_PROCS}" href='index.php?page=proceso_listar&id_entidad={$entidad->id}'><i class="fa fa-gears fa-fw"></i></a>
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.FIELD_INDICS}" href='index.php?page=indicador_listar&id_entidad={$entidad->id}'><i class="fa fa-dashboard fa-fw"></i></a>
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.FIELD_CUADROS_MANDO}" href='index.php?page=cuadro_listar&id_entidad={$entidad->id}'><i class="fa fa-th fa-fw"></i></a>
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_CONSULT}" href='index.php?page=consulta_avanzada&id_entidad={$entidad->id}'><i class="fa fa-commenting fa-fw"></i></a>
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_CONTROL}" href='index.php?page=control&modulo=inicio&id_entidad={$entidad->id}'><i class="fa fa-sliders fa-fw"></i></a>
                                            </td>
                                        </tr>
                                    {/foreach}
                                </tbody>
                            </table>
                        </div>
                    {else}
                        <div class="alert alert-info alert-dismissible">
                            <i class="fa fa-info-circle fa-fw"></i> 
                            {$smarty.const.MSG_BUSCAR_NO_RESUL}
                        </div>
                    {/if}

                </div>
                <!-- /Tab unidades -->

                <!-- Tab planes -->
                <div id="planes" role="tabpanel" class="tab-pane">
                    {if $planes}
                        <div class="table-responsive">
                            <table class="table datatable table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>{$smarty.const.FIELD_PLAN}</th>
                                        <th>{$smarty.const.FIELD_TITULO}</th>
                                        <th>{$smarty.const.FIELD_UNID}</th>
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
                                            <td>
                                                <a title="{$smarty.const.TXT_FICHA}" href='index.php?page=entidad_mostrar&id_entidad={$plan->id_entidad}'>{$plan->entidad->etiqueta}</a>
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
                                            </td>
                                        </tr>
                                    {/foreach}
                                </tbody>
                            </table>
                        </div>
                    {else}
                        <div class="alert alert-info alert-dismissible">
                            <i class="fa fa-info-circle fa-fw"></i> 
                            {$smarty.const.MSG_BUSCAR_NO_RESUL}
                        </div> 
                    {/if}
                </div>
                <!-- /Tab planes -->

                <!-- Tab líneas -->
                <div id="lineas" role="tabpanel" class="tab-pane">
                    {if $lineas}
                        <div class="table-responsive">
                            <table class="table datatable table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>{$smarty.const.FIELD_INDICE}</th>
                                        <th>{$smarty.const.FIELD_LINEA}</th>
                                        <th>{$smarty.const.FIELD_PLAN}</th>
                                        <th>{$smarty.const.FIELD_UNID}</th>
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
                                                <a title="{$smarty.const.TXT_FICHA}" href="index.php?page=linea_mostrar&id_entidad={$linea->plan->id_entidad}&id_linea={$linea->id}">{$linea->nombre}</a>
                                            </td>
                                            <td>
                                                <a title="{$smarty.const.TXT_FICHA}" href="index.php?page=plan_mostrar&id_plan={$linea->id_plan}&id_entidad={$linea->plan->id_entidad}">{$linea->plan->anyo_inicio} - {$linea->plan->anyo_inicio + $linea->plan->duracion - 1}</a>
                                            </td>
                                            <td>
                                                <a title="{$smarty.const.TXT_FICHA}" href='index.php?page=entidad_mostrar&id_entidad={$linea->plan->id_entidad}'>{$linea->plan->entidad->etiqueta}</a>
                                            </td>
                                            <td style="white-space:nowrap">
                                                <div class="progress">
                                                    <div class="progress-bar {if $linea->ejecucion|round:"2" < 25}progress-bar-danger{else if $linea->ejecucion|round:"2" >= 25 && $linea->ejecucion|round:"2" < 75}progress-bar-warning{else if $linea->ejecucion|round:"2" == 100}progress-bar-success{/if}" role="progressbar" aria-valuenow="{$linea->ejecucion|round:"2"}" aria-valuemin="0" aria-valuemax="100" style="min-width: 4em;width:{$linea->ejecucion|round:"2"}%">
                                                        {$linea->ejecucion|round:"2"} %
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_FICHA}" href="index.php?page=linea_mostrar&id_entidad={$linea->plan->id_entidad}&id_linea={$linea->id}">
                                                    <i class="fa fa-folder fa-fw"></i>
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
                            {$smarty.const.MSG_BUSCAR_NO_RESUL}
                        </div> 
                    {/if}
                </div>
                <!-- /Tab líneas -->

                <!-- Tab objests -->
                <div id="objests" role="tabpanel" class="tab-pane">
                    {if $objests}
                        <div class="table-responsive">
                            <table class="table datatable table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>{$smarty.const.FIELD_INDICE}</th>
                                        <th>{$smarty.const.FIELD_OBJ_EST}</th>
                                        <th>{$smarty.const.FIELD_LINEA}</th>
                                        <th>{$smarty.const.FIELD_PLAN}</th>
                                        <th>{$smarty.const.FIELD_UNID}</th>
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
                                                <a title="{$smarty.const.TXT_FICHA}" href="index.php?page=objest_mostrar&id_objest={$objest->id}&id_entidad={$objest->linea->plan->id_entidad}">{$objest->nombre}</a>
                                            </td>
                                            <td>
                                                <a title="{$smarty.const.TXT_FICHA}" href="index.php?page=linea_mostrar&id_entidad={$objest->linea->plan->id_entidad}&id_linea={$objest->id_linea}">{$objest->linea->indice}. {$objest->linea->nombre}</a>
                                            </td>
                                            <td>
                                                <a title="{$smarty.const.TXT_FICHA}" href="index.php?page=plan_mostrar&id_plan={$objest->linea->id_plan}&id_entidad={$objest->linea->plan->id_entidad}">{$objest->linea->plan->anyo_inicio} - {$objest->linea->plan->anyo_inicio + $objest->linea->plan->duracion - 1}</a>
                                            </td>
                                            <td>
                                                <a title="{$smarty.const.TXT_FICHA}" href='index.php?page=entidad_mostrar&id_entidad={$objest->linea->plan->id_entidad}'>{$objest->linea->plan->entidad->etiqueta}</a>
                                            </td>
                                            <td style="white-space:nowrap">
                                                <div class="progress">
                                                    <div class="progress-bar {if $objest->ejecucion|round:"2" < 25}progress-bar-danger{else if $objest->ejecucion|round:"2" >= 25 && $objest->ejecucion|round:"2" < 75}progress-bar-warning{else if $objest->ejecucion|round:"2" == 100}progress-bar-success{/if}" role="progressbar" aria-valuenow="{$objest->ejecucion|round:"2"}" aria-valuemin="0" aria-valuemax="100" style="min-width: 4em;width:{$objest->ejecucion|round:"2"}%">
                                                        {$objest->ejecucion|round:"2"} %
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_FICHA}" href="index.php?page=objest_mostrar&id_objest={$objest->id}&id_entidad={$objest->linea->plan->id_entidad}">
                                                    <i class="fa fa-folder fa-fw"></i>
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
                            {$smarty.const.MSG_BUSCAR_NO_RESUL}
                        </div> 
                    {/if}
                </div>
                <!-- /Tab objests -->

                <!-- Tab objops -->
                <div id="objops" role="tabpanel" class="tab-pane">
                    {if $objops}
                        <div class="table-responsive">
                            <table class="table datatable table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>{$smarty.const.FIELD_INDICE}</th>
                                        <th></th>
                                        <th>{$smarty.const.FIELD_OBJ_OP}</th>
                                        <th>{$smarty.const.FIELD_OBJ_EST}</th>
                                        <th>{$smarty.const.FIELD_LINEA}</th>
                                        <th>{$smarty.const.FIELD_PLAN}</th>
                                        <th>{$smarty.const.FIELD_UNID}</th>
                                        <th>{$smarty.const.FIELD_RESP}</th>
                                        <th>{$smarty.const.FIELD_EJECUCION}</th>
                                        <th>{$smarty.const.FIELD_ACCIONES}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {foreach from=$objops item=objop}
                                        <tr>
                                            <td>
                                                <span class="label label-default">{$objop->objest->linea->indice}.{$objop->objest->indice}.{$objop->indice}</span>
                                            </td>
                                            <td>
                                                {if $objop->descendente}
                                                    <i class="fa fa-sitemap fa-fw" title="{$smarty.const.TXT_OBJOP_DESC}"></i>
                                                {/if}
                                            </td>
                                            <td>
                                                <a title="{$smarty.const.TXT_FICHA}" href="index.php?page=objop_mostrar&id_objop={$objop->id}&id_entidad={$objop->objest->linea->plan->id_entidad}">{$objop->nombre}</a>
                                            </td>
                                            <td>
                                                <a title="{$smarty.const.TXT_FICHA}" href="index.php?page=objest_mostrar&id_objest={$objop->id_objest}&id_entidad={$objop->objest->linea->plan->id_entidad}">{$objop->objest->linea->indice}.{$objop->objest->indice}. {$objop->objest->nombre}</a>
                                            </td>
                                            <td>
                                                <a title="{$smarty.const.TXT_FICHA}" href="index.php?page=linea_mostrar&id_linea={$objop->objest->id_linea}&id_entidad={$objop->objest->linea->plan->id_entidad}">{$objop->objest->linea->indice}. {$objop->objest->linea->nombre}</a>
                                            </td>
                                            <td>
                                                <a title="{$smarty.const.TXT_FICHA}" href="index.php?page=plan_mostrar&id_plan={$objop->objest->linea->id_plan}&id_entidad={$objop->objest->linea->plan->id_entidad}">{$objop->objest->linea->plan->anyo_inicio} - {$objop->objest->linea->plan->anyo_inicio + $objop->objest->linea->plan->duracion - 1}</a>
                                            </td>
                                            <td>
                                                <a title="{$smarty.const.TXT_FICHA}" href='index.php?page=entidad_mostrar&id_entidad={$objop->objest->linea->plan->id_entidad}'>{$objop->objest->linea->plan->entidad->etiqueta}</a>
                                            </td>
                                            <td style="font-size: 12px">
                                                <a title="{$smarty.const.TXT_USER_PERFIL}" href='index.php?page=usuario_mostrar&id_usuario={$objop->id_responsable}'>
                                                    {$objop->responsable->nombre} {$objop->responsable->apellidos}</a>
                                            </td>
                                            <td style="white-space:nowrap">
                                                <div class="progress">
                                                    <div class="progress-bar {if $objop->ejecucion|round:"2" < 25}progress-bar-danger{else if $objop->ejecucion|round:"2" >= 25 && $objop->ejecucion|round:"2" < 75}progress-bar-warning{else if $objop->ejecucion|round:"2" == 100}progress-bar-success{/if}" role="progressbar" aria-valuenow="{$objop->ejecucion|round:"2"}" aria-valuemin="0" aria-valuemax="100" style="min-width: 4em;width:{$objop->ejecucion|round:"2"}%">
                                                        {$objop->ejecucion|round:"2"} %
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_FICHA}" href="index.php?page=objop_mostrar&id_objop={$objop->id}&id_entidad={$objop->objest->linea->plan->id_entidad}">
                                                    <i class="fa fa-folder fa-fw"></i>
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
                            {$smarty.const.MSG_BUSCAR_NO_RESUL}
                        </div> 
                    {/if}
                </div>
                <!-- /Tab objops -->

                <!-- Tab cartas -->
                <div id="cartas" role="tabpanel" class="tab-pane">
                    {if $cartas}
                        <div class="table-responsive">
                            <table class="table datatable table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>{$smarty.const.FIELD_FECHA}</th>
                                        <th>{$smarty.const.FIELD_UNID}</th>
                                        <th>{$smarty.const.FIELD_ACCIONES}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {foreach from=$cartas item=carta}
                                        <tr>
                                            <td>
                                                <a title="{$carta->fecha|date_format:'%d/%m/%Y'}" href="index.php?page=carta_mostrar&id_carta={$carta->id}&id_entidad={$carta->id_entidad}">{$carta->fecha|date_format:'%d/%m/%Y'}</a>
                                            </td>
                                            <td><a title="{$smarty.const.TXT_FICHA}" href='index.php?page=entidad_mostrar&id_entidad={$carta->id_entidad}'>{$carta->entidad->etiqueta}</a></td>
                                            <td>
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_FICHA}" href="index.php?page=carta_mostrar&id_carta={$carta->id}&id_entidad={$carta->id_entidad}">
                                                    <i class="fa fa-folder fa-fw"></i>
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
                            {$smarty.const.MSG_BUSCAR_NO_RESUL}
                        </div> 
                    {/if}
                </div>
                <!-- /Tab cartas -->

                <!-- Tab servicios -->
                <div id="servicios" role="tabpanel" class="tab-pane">
                    {if $servicios}
                        <div class="table-responsive">
                            <table id="tabla_servicios" class="table datatable table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>{$smarty.const.FIELD_INDICE}</th>
                                        <th>{$smarty.const.FIELD_SERVICIO}</th>
                                        <th>{$smarty.const.FIELD_CARTA}</th>
                                        <th>{$smarty.const.FIELD_UNID}</th>
                                        <th>{$smarty.const.FIELD_ACCIONES}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {foreach from=$servicios item=servicio} 
                                        <tr>  
                                            <td>
                                                <span class="label label-default">S.{$servicio->indice}</span>
                                            </td>
                                            <td>
                                                <a title="{$servicio->nombre}: {$servicio->descripcion|replace:"\r\n":" "}" href="index.php?page=servicio_mostrar&id_entidad={$carta->id_entidad}&id_servicio={$servicio->id}">{$servicio->nombre}</a>
                                            </td>
                                            <td>
                                                <a title="{$servicio->carta->fecha|date_format:'%d/%m/%Y'}" href="index.php?page=carta_mostrar&id_carta={$servicio->id_carta}&id_entidad={$servicio->carta->id_entidad}">{$servicio->carta->fecha|date_format:'%d/%m/%Y'}</a>
                                            </td>
                                            <td><a title="{$smarty.const.TXT_FICHA}" href='index.php?page=entidad_mostrar&id_entidad={$servicio->carta->id_entidad}'>{$servicio->carta->entidad->etiqueta}</a></td>
                                            <td>
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_FICHA}" href="index.php?page=servicio_mostrar&id_entidad={$servicio->carta->id_entidad}&id_servicio={$servicio->id}">
                                                    <i class="fa fa-folder fa-fw"></i>
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
                            {$smarty.const.MSG_BUSCAR_NO_RESUL}
                        </div> 
                    {/if}
                </div>
                <!-- /Tab servicios -->

                <!-- Tab compromisos -->
                <div id="compromisos" role="tabpanel" class="tab-pane">
                    {if $compromisos}
                        <div class="table-responsive">
                            <table id="tabla_objest" class="table datatable table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>{$smarty.const.FIELD_INDICE}</th>
                                        <th>{$smarty.const.FIELD_COMPROMISO}</th>
                                        <th>{$smarty.const.FIELD_SERVICIO}</th>
                                        <th>{$smarty.const.FIELD_CARTA}</th>
                                        <th>{$smarty.const.FIELD_UNID}</th>
                                        <th>{$smarty.const.FIELD_ACCIONES}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {foreach from=$compromisos item=compromiso} 
                                        <tr>  
                                            <td>
                                                <span class="label label-default">C.{$compromiso->indice}</span>
                                            </td>
                                            <td>
                                                <a title="{$compromiso->nombre}: {$compromiso->descripcion|replace:"\r\n":" "}" href="index.php?page=compromiso_mostrar&id_entidad={$compromiso->servicio->carta->id_entidad}&id_compromiso={$compromiso->id}">C.{$compromiso->indice}. {$compromiso->nombre}</a>
                                            </td>
                                            <td>
                                                <a title="{$compromiso->servicio->nombre}: {$compromiso->servicio->descripcion|replace:"\r\n":" "}" href="index.php?page=servicio_mostrar&id_entidad={$compromiso->servicio->carta->id_entidad}&id_servicio={$compromiso->id_servicio}">S.{$compromiso->servicio->indice}. {$compromiso->servicio->nombre}</a>
                                            </td>
                                            <td>
                                                <a title="{$compromiso->servicio->carta->fecha|date_format:'%d/%m/%Y'}" href="index.php?page=carta_mostrar&id_carta={$compromiso->servicio->id_carta}&id_entidad={$compromiso->servicio->carta->id_entidad}">{$compromiso->servicio->carta->fecha|date_format:'%d/%m/%Y'}</a>
                                            </td>
                                            <td><a title="{$smarty.const.TXT_FICHA}" href='index.php?page=entidad_mostrar&id_entidad={$compromiso->servicio->carta->id_entidad}'>{$compromiso->servicio->carta->entidad->etiqueta}</a></td>
                                            <td>
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_FICHA}" href="index.php?page=compromiso_mostrar&id_entidad={$compromiso->servicio->carta->id_entidad}&id_compromiso={$compromiso->id}">
                                                    <i class="fa fa-folder fa-fw"></i>
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
                            {$smarty.const.MSG_BUSCAR_NO_RESUL}
                        </div> 
                    {/if}
                </div>
                <!-- /Tab compromisos -->

                <!-- Tab procesos -->
                <div id="procesos" role="tabpanel" class="tab-pane">
                    {if $procesos}
                        <div class="table-responsive">
                            <table class="table datatable table-condensed table-striped table-hover">
                                <thead>
                                    <tr>   
                                        <th>{$smarty.const.FIELD_COD}</th>
                                        <th>{$smarty.const.FIELD_UNID}</th>
                                        <th>{$smarty.const.FIELD_PROC}</th>
                                        <th>{$smarty.const.FIELD_TIPO_PROC}</th>
                                        <th>{$smarty.const.FIELD_PROC_MADRE}</th>         
                                        <th>{$smarty.const.FIELD_PROPIETARIO}</th>
                                        <th>{$smarty.const.FIELD_ACCIONES}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {foreach from=$procesos item=proceso}
                                        <tr>    
                                            <td><span class="label label-primary">{$proceso->codigo}</span></td>
                                            <td><a title="{$smarty.const.TXT_FICHA}" href='index.php?page=entidad_mostrar&id_entidad={$proceso->entidad->id}'>{$proceso->entidad->etiqueta}</a></td>
                                            <td>
                                                <a title="{$proceso->nombre}: {$proceso->mision|replace:"\r\n":" "}" href="index.php?page=proceso_mostrar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}">
                                                    {$proceso->nombre}
                                                </a>
                                            </td>
                                            <td>{$proceso->alcance}</td>
                                            <td>
                                                {if $proceso->madre}
                                                    <a title="{$proceso->madre->nombre}" href="index.php?page=proceso_mostrar&id_proceso={$proceso->madre->id}&id_entidad={$proceso->madre->id_entidad}">
                                                        {$proceso->madre->nombre}
                                                    </a>
                                                {else}
                                                    ---
                                                {/if}
                                            </td>
                                            <td style="font-size: 12px">
                                                <a title="{$smarty.const.TXT_USER_PERFIL}" href="index.php?page=usuario_mostrar&id_usuario={$proceso->propietario->id}">
                                                    {$proceso->propietario->nombre} {$proceso->propietario->apellidos}
                                                </a>
                                            </td>
                                            <td>
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_FICHA}" href="index.php?page=proceso_mostrar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}">
                                                    <i class="fa fa-folder fa-fw"></i>
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
                            {$smarty.const.MSG_BUSCAR_NO_RESUL}
                        </div> 
                    {/if}
                </div>
                <!-- /Tab procesos -->

                <!-- Tab indicadores -->
                <div id="indicadores" role="tabpanel" class="tab-pane">
                    {if $indicadores}
                        <div class="table-responsive">
                            <table class="table table-condensed datatable table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>{$smarty.const.FIELD_COD}</th>
                                        <th>{$smarty.const.FIELD_UNID}</th>
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
                                    {foreach from=$indicadores item=indicador} 
                                        <tr>
                                            <td><span class="label label-primary">{$indicador->codigo}</span></td>
                                            <td><a title="{$smarty.const.TXT_FICHA}" href='index.php?page=entidad_mostrar&id_entidad={$indicador->id_entidad}'>{$indicador->entidad->etiqueta}</a></td>
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
                                                <a href='index.php?page=indicador_mostrar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}' 
                                                   title="{$indicador->nombre}: {$indicador->descripcion|replace:"\r\n":" "}">
                                                    {$indicador->nombre}</a>
                                            </td>
                                            <td>{$indicador->periodicidad}</td>
                                            <td style="font-size: 12px">
                                                <a title="{$smarty.const.TXT_USER_PERFIL}" href='index.php?page=usuario_mostrar&id_usuario={$indicador->id_responsable}'>
                                                    {$indicador->responsable->nombre} {$indicador->responsable->apellidos}</a>
                                            </td>
                                            <td style="font-size: 12px">
                                                <a title="{$smarty.const.TXT_USER_PERFIL}" href='index.php?page=usuario_mostrar&id_usuario={$indicador->id_responsable_medicion}'>
                                                    {$indicador->responsable_medicion->nombre} {$indicador->responsable_medicion->apellidos}
                                                </a>
                                            </td>
                                            <td>
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_FICHA}" href='index.php?page=indicador_mostrar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                                                    <i class="fa fa-folder fa-fw"></i>
                                                </a>
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_REP_GRAFIC}" href='index.php?page=graficas_mostrar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                                                    <i class="fa fa-area-chart fa-fw"></i>
                                                </a>
                                                <a class="btn btn-default btn-circle btn-xs" href='index.php?page=medicion_listar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}' 
                                                   title="{$smarty.const.FIELD_MEDICIONES}">
                                                    <i class="fa fa-hourglass fa-fw"></i>
                                                </a>
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_ANALISIS}" href='index.php?page=analisis&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                                                    <i class="fa fa-connectdevelop fa-fw"></i>
                                                </a>    
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_VAL_REF}" href='index.php?page=valor_referencia&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                                                    <i class="fa fa-tags fa-fw"></i>
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
                            {$smarty.const.MSG_BUSCAR_NO_RESUL}
                        </div> 
                    {/if}
                </div>
                <!-- /Tab indicadores -->

                <!-- Tab cuadros -->
                <div id="cuadros" role="tabpanel" class="tab-pane">
                    {if $cuadros_publicos}
                        <div class="table-responsive">
                            <table class="table datatable table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>{$smarty.const.FIELD_UNID}</th>
                                        <th>{$smarty.const.FIELD_CUADRO_MANDO}</th>
                                        <th>{$smarty.const.FIELD_VISIBILIDAD}</th>
                                        <th>{$smarty.const.FIELD_COMENTARIOS}</th>
                                        <th>{$smarty.const.FIELD_ACCIONES}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {foreach from=$cuadros_publicos item=cuadro}
                                        <tr>
                                            <td><a title="{$smarty.const.TXT_FICHA}" href='index.php?page=entidad_mostrar&id_entidad={$cuadro->entidad->id}'>{$cuadro->entidad->etiqueta}</a></td>
                                            <td><a title="{$cuadro->nombre}" href="index.php?page=cuadro_mostrar&id_cuadro={$cuadro->id}&id_entidad={$cuadro->entidad->id}">{$cuadro->nombre}</a></td>            
                                            <td>
                                                {if $cuadro->privado == 0}{$smarty.const.TXT_PUBLICO}
                                                {else}{$smarty.const.TXT_PRIVADO}
                                                {/if}
                                            </td>
                                            <td>{if $cuadro->comentarios}{$cuadro->comentarios}{else}---{/if}</td>
                                            <td>
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_VER}" href="index.php?page=cuadro_mostrar&id_cuadro={$cuadro->id}&id_entidad={$cuadro->entidad->id}"><i class="fa fa-th fa-fw"></i></a>
                                            </td>
                                        </tr>
                                    {/foreach}
                                </tbody>
                            </table>
                        </div>
                    {else}
                        <div class="alert alert-info alert-dismissible">
                            <i class="fa fa-info-circle fa-fw"></i> 
                            {$smarty.const.MSG_BUSCAR_NO_RESUL}
                        </div> 
                    {/if}
                </div>
                <!-- /Tab cuadros -->

                <!-- Tab usuarios -->
                <div id="users" role="tabpanel" class="tab-pane">
                    {if $usuarios}
                        <div class="table-responsive">
                            <table class="table datatable table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>{$smarty.const.FIELD_LOGIN}</th>
                                        <th>{$smarty.const.FIELD_NOMBRE}</th>
                                        <th>{$smarty.const.FIELD_APEL}</th>
                                        <th>{$smarty.const.FIELD_CORREO}</th>
                                        <th>{$smarty.const.FIELD_TEL}</th>
                                        <th>{$smarty.const.FIELD_ACCIONES}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {foreach from=$usuarios item=usuario}
                                        <tr>
                                            <td> 
                                                <a title="{$smarty.const.TXT_USER_PERFIL}" href='index.php?page=usuario_mostrar&id_usuario={$usuario->id}'>
                                                    {$usuario->login}
                                                </a>
                                            </td>
                                            <td style="font-size: 12px">{$usuario->nombre}</td>
                                            <td style="font-size: 12px">{$usuario->apellidos}</td>       
                                            <td>{if $usuario->correo}<a title="{$smarty.const.TXT_ENVIAR_CORREO}" href='mailto:{$usuario->correo}'>{$usuario->correo}</a>{else}---{/if}</td>
                                            <td>{if $usuario->telefono}<a title="{$smarty.const.TXT_LLAMAR_TLF}" href='tel:+34{$usuario->telefono}'>{$usuario->telefono}</a>{else}---{/if}</td>
                                            <td style="white-space:nowrap">
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_USER_PERFIL}" href='index.php?page=usuario_mostrar&id_usuario={$usuario->id}'><i class="fa fa-user fa-fw"></i></a>                 
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_ENVIAR_CORREO}" href='mailto:{$usuario->correo}'><i class="fa fa-envelope fa-fw"></i></a>
                                            </td>
                                        </tr>
                                    {/foreach}
                                </tbody>
                            </table>
                        </div>
                    {else}
                        <div class="alert alert-info alert-dismissible">
                            <i class="fa fa-info-circle fa-fw"></i> 
                            {$smarty.const.MSG_BUSCAR_NO_RESUL}
                        </div> 
                    {/if}
                </div>
                <!-- /Tab usuarios -->

            </div>
            <!-- /Tab panes -->
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
{else}
    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-warning alert-dismissible">
                <i class="fa fa-exclamation-triangle fa-fw"></i> 
                {$smarty.const.MSG_BUSCAR_NO_TEXTO}
            </div>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
{/if}