<!-- Nav tabs -->
<ul class="nav nav-tabs" role="tablist">
    <li role="presentation" class="active">
        <a href="#planes" title="{$smarty.const.FIELD_PLANES}" aria-controls="{$smarty.const.FIELD_PLANES}" role="tab" data-toggle="tab"><i class="fa fa-book fa-fw"></i> {$smarty.const.FIELD_PLANES}</a>
    </li>
    <li role="presentation">
        <a href="#lineas" title="{$smarty.const.FIELD_LINEAS}" aria-controls="{$smarty.const.FIELD_LINEAS}" role="tab" data-toggle="tab"><i class="fa fa-long-arrow-right fa-fw"></i> {$smarty.const.FIELD_LINEAS}</a>
    </li>
    <li role="presentation">
        <a href="#objests" title="{$smarty.const.FIELD_OBJS_EST}" aria-controls="{$smarty.const.FIELD_OBJS_EST}" role="tab" data-toggle="tab"><i class="fa fa-dot-circle-o fa-fw"></i> {$smarty.const.FIELD_OBJS_EST}</a>
    </li>
    <li role="presentation">
        <a href="#objops" title="{$smarty.const.FIELD_OBJS_OP}" aria-controls="{$smarty.const.FIELD_OBJS_OP}" role="tab" data-toggle="tab"><i class="fa fa-bullseye fa-fw"></i> {$smarty.const.FIELD_OBJS_OP}</a>
    </li>
</ul>
<!-- /Nav tabs -->
<br>
<!-- Tab panes -->
<div class="tab-content">

    <!-- Planes Estratégicos -->
    <div role="tabpanel" class="tab-pane active" id="planes">
        {if $planes|@count>0}
            <div class="table-responsive">
                <table class="table datatable table-condensed table-striped table-hover">
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
                                    <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_GRABAR} {$smarty.const.TXT_RESUL}" href="index.php?page=plan_mostrar&id_plan={$plan->id}&id_entidad={$plan->id_entidad}#plan_res">
                                        <i class="fa fa-floppy-o fa-fw"></i>
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
                {$smarty.const.MSG_CONTROL_NO_RESUL}
            </div> 
        {/if}   
    </div>
    <!-- /.Planes Estratégicos -->

    <!-- Líneas Estratégicas -->
    <div role="tabpanel" class="tab-pane" id="lineas">
        {if $lineas|@count>0}
            <div class="table-responsive">
                <table id="tabla_nulos" class="table datatable table-condensed table-striped table-hover">
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
                                <td style="width:2%">
                                    <span class="label label-default">{$linea->indice}</span>
                                </td>
                                <td style="width:40%">
                                    <a title="{$smarty.const.TXT_FICHA}" href="index.php?page=linea_mostrar&id_entidad={$linea->plan->id_entidad}&id_linea={$linea->id}">{$linea->nombre}</a>
                                </td>
                                <td style="white-space:nowrap">
                                    <div class="progress">
                                        <div class="progress-bar {if $linea->ejecucion|round:"2" < 25}progress-bar-danger{else if $linea->ejecucion|round:"2" >= 25 && $linea->ejecucion|round:"2" < 75}progress-bar-warning{else if $linea->ejecucion|round:"2" == 100}progress-bar-success{/if}" role="progressbar" aria-valuenow="{$linea->ejecucion|round:"2"}" aria-valuemin="0" aria-valuemax="100" style="min-width: 4em;width:{$linea->ejecucion|round:"2"}%">
                                            {$linea->ejecucion|round:"2"} %
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_GRABAR} {$smarty.const.TXT_RESUL}" href="index.php?page=linea_mostrar&id_entidad={$linea->plan->id_entidad}&id_linea={$linea->id}#linea_res">
                                        <i class="fa fa-floppy-o fa-fw"></i>
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
                {$smarty.const.MSG_CONTROL_NO_RESUL}
            </div> 
        {/if}
    </div>
    <!-- /Líneas Estratégicas -->

    <!-- Objetivos Estratégicos -->
    <div role="tabpanel" class="tab-pane" id="objests">
        {if $objests|@count>0}
            <div class="table-responsive">
                <table class="table datatable table-condensed table-striped table-hover">
                    <thead>
                        <tr>
                            <th>{$smarty.const.FIELD_INDICE}</th>
                            <th>{$smarty.const.FIELD_OBJ_EST}</th>
                            <th>{$smarty.const.FIELD_EJECUCION}</th>
                            <th>{$smarty.const.FIELD_ACCIONES}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach from=$objests item=objest} 
                            <tr>  
                                <td style="width:2%">
                                    <span class="label label-default">{$objest->linea->indice}.{$objest->indice}</span>
                                </td>
                                <td style="width:40%">
                                    <a title="{$smarty.const.TXT_FICHA}" href="index.php?page=objest_mostrar&id_objest={$objest->id}&id_entidad={$objest->linea->plan->id_entidad}">{$objest->nombre}</a>
                                </td>
                                <td style="white-space:nowrap">
                                    <div class="progress">
                                        <div class="progress-bar {if $objest->ejecucion|round:"2" < 25}progress-bar-danger{else if $objest->ejecucion|round:"2" >= 25 && $objest->ejecucion|round:"2" < 75}progress-bar-warning{else if $objest->ejecucion|round:"2" == 100}progress-bar-success{/if}" role="progressbar" aria-valuenow="{$objest->ejecucion|round:"2"}" aria-valuemin="0" aria-valuemax="100" style="min-width: 4em;width:{$objest->ejecucion|round:"2"}%">
                                            {$objest->ejecucion|round:"2"} %
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_GRABAR} {$smarty.const.TXT_RESUL}" href="index.php?page=objest_mostrar&id_objest={$objest->id}&id_entidad={$objest->linea->plan->id_entidad}#objest_res">
                                        <i class="fa fa-floppy-o fa-fw"></i>
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
                {$smarty.const.MSG_CONTROL_NO_RESUL}
            </div> 
        {/if}
    </div>
    <!-- /Objetivos Estratégicos -->

    <!-- Objetivos Operacionales -->
    <div role="tabpanel" class="tab-pane" id="objops">
        {if $objops|@count>0}
            <div class="table-responsive">
                <table class="table datatable table-condensed table-striped table-hover">
                    <thead>
                        <tr>
                            <th>{$smarty.const.FIELD_INDICE}</th>
                            <th></th>
                            <th>{$smarty.const.FIELD_OBJ_OP}</th>
                            <th>{$smarty.const.FIELD_RESP}</th>
                            <th>{$smarty.const.FIELD_EJECUCION}</th>
                            <th>{$smarty.const.FIELD_ACCIONES}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach from=$objops item=objop} 
                            <tr>  
                                <td style="width:2%">
                                    <span class="label label-default">{$objop->objest->linea->indice}.{$objop->objest->indice}.{$objop->indice}</span>
                                </td>
                                <td>
                                    {if $objop->descendente}
                                        <i class="fa fa-sitemap fa-fw" title="{$smarty.const.TXT_OBJOP_DESC}"></i>
                                    {/if}
                                </td>
                                <td style="width:40%">
                                    <a title="{$smarty.const.TXT_FICHA}" href="index.php?page=objop_mostrar&id_objop={$objop->id}&id_entidad={$entidad->id}">{$objop->nombre}</a>
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
                                    <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_GRABAR} {$smarty.const.TXT_RESUL}" href="index.php?page=objop_mostrar&id_objop={$objop->id}&id_entidad={$entidad->id}#objop_res">
                                        <i class="fa fa-floppy-o fa-fw"></i>
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
                {$smarty.const.MSG_CONTROL_NO_RESUL}
            </div> 
        {/if} 
    </div>
    <!-- /Objetivos Operacionales -->
</div>