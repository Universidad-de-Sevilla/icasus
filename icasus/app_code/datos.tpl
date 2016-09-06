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
                <a href="#user_dato" title="{$smarty.const.TXT_USER_DATO}" aria-controls="{$smarty.const.TXT_USER_DATO}" role="tab" data-toggle="tab"><i class="fa fa-database fa-fw"></i> {$smarty.const.TXT_USER_DATO}</a>
            </li>
            <li role="presentation">
                <a href="#dato_todos" title="{$smarty.const.TXT_DATO_TODOS}" aria-controls="{$smarty.const.TXT_DATO_TODOS}" role="tab" data-toggle="tab"><i class="fa fa-database fa-fw"></i> {$smarty.const.TXT_DATO_TODOS}</a>
            </li>
            <li role="presentation">
                <a href="#dato_archivados" title="{$smarty.const.TXT_DATO_ARCHIVADOS}" aria-controls="{$smarty.const.TXT_DATO_ARCHIVADOS}" role="tab" data-toggle="tab"><i class="fa fa-database fa-fw"></i> {$smarty.const.TXT_DATO_ARCHIVADOS}</a>
            </li>
        </ul>
        <!-- /Nav tabs -->
        <br>
        <!-- Tab panes -->
        <div class="tab-content">

            <!-- Datos del usuario -->
            <div role="tabpanel" class="tab-pane active" id="user_dato">
                {if $datos_propios}
                    <div class="table-responsive">
                        <table class="table table-condensed datatable table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>{$smarty.const.FIELD_COD}</th>
                                    <th>{$smarty.const.FIELD_DATO}</th>
                                    <th>{$smarty.const.FIELD_UNID}</th>
                                    <th>{$smarty.const.FIELD_PERIOD}</th>
                                    <th>{$smarty.const.FIELD_RESP}</th>
                                    <th>{$smarty.const.FIELD_RESP_MED}</th>
                                    <th>{$smarty.const.TXT_MED_ULTIMA}</th>
                                    <th>{$smarty.const.FIELD_VAL}</th>
                                    <th>{$smarty.const.FIELD_ACCIONES}</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach from=$datos_propios item=indicador} 
                                    <tr {if isset($status[$indicador->id])}class="{$status[$indicador->id]}"{/if}>
                                        <td><span class="label label-primary">{$indicador->codigo}</span></td>
                                        <td>
                                            {if $indicador->calculo}
                                                <i class="fa fa-calculator fa-fw" title="{$smarty.const.TXT_CALC_AUTO}: {$indicador->calculo}"></i>
                                            {/if}
                                            {if $indicador->id_tipo_agregacion!= 0}
                                                <i class="fa fa-sitemap fa-fw" title="{$smarty.const.FIELD_AGREG}"></i>
                                            {/if}
                                            <a target="_blank" href='index.php?page=dato_mostrar&id_dato={$indicador->id}&id_entidad={$indicador->id_entidad}' 
                                               title="{$indicador->nombre}: {$indicador->descripcion|replace:"\r\n":" "}">
                                                {$indicador->nombre}</a>
                                        </td>
                                        <td><a title="{$smarty.const.TXT_FICHA}" href='index.php?page=entidad_mostrar&id_entidad={$indicador->id_entidad}'>{$indicador->entidad->etiqueta}</a></td>
                                        <td>{$indicador->periodicidad}</td>
                                        <td style="font-size: 12px">
                                            <a title="{$smarty.const.TXT_USER_PERFIL}" href='index.php?page=usuario_mostrar&id_usuario={$indicador->id_responsable}'>
                                                {$indicador->responsable->nombre} {$indicador->responsable->apellidos}</a>
                                        </td>
                                        <td style="font-size: 12px">
                                            <a title="{$smarty.const.TXT_USER_PERFIL}" href='index.php?page=usuario_mostrar&id_usuario={$indicador->id_responsable_medicion}'>
                                                {$indicador->responsable_medicion->nombre} {$indicador->responsable_medicion->apellidos}</a>
                                        </td>
                                        <td>{if $indicador->medicion->etiqueta}{$indicador->medicion->etiqueta}{else}---{/if}</td>
                                        <td style="white-space: nowrap">
                                            {if ($totales[$indicador->id])!== NULL}
                                                {if isset($status[$indicador->id])}
                                                    {if $status[$indicador->id] == 'danger'}
                                                        <span title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_MEJORABLE} ({$smarty.const.FIELD_LIMITE}: {$medicion_lim[$indicador->id]}, {$smarty.const.FIELD_META}: {$medicion_obj[$indicador->id]})" class="label label-{$status[$indicador->id]}">{$totales[$indicador->id]|round:"2"}</span>
                                                    {else if $status[$indicador->id] == 'success'}
                                                        <span title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_LOGRADO} ({$smarty.const.FIELD_LIMITE}: {$medicion_lim[$indicador->id]}, {$smarty.const.FIELD_META}: {$medicion_obj[$indicador->id]})" class="label label-{$status[$indicador->id]}">{$totales[$indicador->id]|round:"2"}</span>
                                                    {else}
                                                        <span title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_ACEPTABLE} ({$smarty.const.FIELD_LIMITE}: {$medicion_lim[$indicador->id]}, {$smarty.const.FIELD_META}: {$medicion_obj[$indicador->id]})" class="label label-{$status[$indicador->id]}">{$totales[$indicador->id]|round:"2"}</span>
                                                    {/if}
                                                {else}
                                                    <span class="label label-default">{$totales[$indicador->id]|round:"2"}</span>
                                                {/if}
                                            {else}
                                                ---
                                            {/if}
                                            {if $indicador->medicion->etiqueta}
                                                <a class="btn btn-default btn-circle btn-xs" 
                                                   href="index.php?page=medicion&id_medicion={$indicador->medicion->id}&id_entidad={$indicador->id_entidad}&tipo=dato#med_valores">
                                                    {if $indicador->calculo}
                                                        <i title='{$smarty.const.TXT_MED_VER}' class="fa fa-pencil fa-fw"></i>
                                                    {else}
                                                        <i title='{$smarty.const.TXT_GRABAR}' class="fa fa-floppy-o fa-fw"></i>
                                                    {/if}
                                                </a>
                                            {/if}
                                        </td>
                                        <td>
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_FICHA}" target="_blank" href='index.php?page=dato_mostrar&id_dato={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                                                <i class="fa fa-folder fa-fw"></i>
                                            </a>
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_REP_GRAFIC}" target="_blank" href='index.php?page=graficas_mostrar&id_dato={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                                                <i class="fa fa-area-chart fa-fw"></i>
                                            </a>
                                            <a class="btn btn-default btn-circle btn-xs" href='index.php?page=medicion_listar&id_dato={$indicador->id}&id_entidad={$indicador->id_entidad}' 
                                               title="{$smarty.const.TXT_INDIC_MED}: {$indicador->nombre}" target="_blank">
                                                <i class="fa fa-history fa-fw"></i>
                                            </a>
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_VAL_REF}" href='index.php?page=valor_referencia&id_dato={$indicador->id}&id_entidad={$indicador->id_entidad}' target="_blank">
                                                <i class="fa fa-tags fa-fw"></i>
                                            </a>
                                            {if $_control OR $_usuario->id==$indicador->id_responsable}
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_EDIT}" href='index.php?page=dato_editar&id_dato={$indicador->id}&id_entidad={$indicador->id_entidad}' target="_blank">
                                                    <i class="fa fa-pencil fa-fw"></i>
                                                </a>
                                                {if !$indicador->calculo}
                                                    <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_VAL_EDIT}" href='index.php?page=valores&id_dato={$indicador->id}&id_entidad={$indicador->id_entidad}' target="_blank">
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
                {else}
                    <div class="alert alert-info alert-dismissible">
                        <i class="fa fa-info-circle fa-fw"></i> 
                        {$smarty.const.MSG_DATO_NO_ASIG}
                    </div> 
                {/if}
            </div>
            <!-- /Datos del usuario -->

            <!-- Todos los datos -->
            <div role="tabpanel" class="tab-pane" id="dato_todos">
                {if $datos}
                    <div class="table-responsive">
                        <table class="table table-condensed datatable table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>{$smarty.const.FIELD_COD}</th>
                                    <th>{$smarty.const.FIELD_DATO}</th>
                                    <th>{$smarty.const.FIELD_UNID}</th>
                                    <th>{$smarty.const.FIELD_PERIOD}</th>
                                    <th>{$smarty.const.FIELD_RESP}</th>
                                    <th>{$smarty.const.FIELD_RESP_MED}</th>
                                    <th>{$smarty.const.FIELD_ACCIONES}</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach from=$datos item=dato} 
                                    <tr>
                                        <td><span class="label label-primary">{$dato->codigo}</span></td>
                                        <td>
                                            {if $dato->calculo}
                                                <i class="fa fa-calculator fa-fw" title="{$smarty.const.TXT_CALC_AUTO}: {$dato->calculo}"></i>
                                            {/if}
                                            {if $dato->id_tipo_agregacion!= 0}
                                                <i class="fa fa-sitemap fa-fw" title="{$smarty.const.FIELD_AGREG}"></i>
                                            {/if}
                                            <a target="_blank" href='index.php?page=dato_mostrar&id_dato={$dato->id}&id_entidad={$dato->id_entidad}' 
                                               title="{$dato->nombre}: {$dato->descripcion|replace:"\r\n":" "}">
                                                {$dato->nombre}</a>
                                        </td>
                                        <td><a title="{$smarty.const.TXT_FICHA}" href='index.php?page=entidad_mostrar&id_entidad={$dato->id_entidad}'>{$dato->entidad->etiqueta}</a></td>
                                        <td>{$dato->periodicidad}</td>
                                        <td style="font-size: 12px">
                                            <a title="{$smarty.const.TXT_USER_PERFIL}" href='index.php?page=usuario_mostrar&id_usuario={$dato->id_responsable}'>
                                                {$dato->responsable->nombre} {$dato->responsable->apellidos}</a>
                                        </td>
                                        <td style="font-size: 12px"> 
                                            <a title="{$smarty.const.TXT_USER_PERFIL}" href='index.php?page=usuario_mostrar&id_usuario={$dato->id_responsable_medicion}'>
                                                {$dato->responsable_medicion->nombre} {$dato->responsable_medicion->apellidos}</a>
                                        </td>
                                        <td>
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_FICHA}" target="_blank" href='index.php?page=dato_mostrar&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'>
                                                <i class="fa fa-folder fa-fw"></i>
                                            </a>
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_REP_GRAFIC}" target="_blank" href='index.php?page=graficas_mostrar&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'>
                                                <i class="fa fa-area-chart fa-fw"></i>
                                            </a>
                                            <a class="btn btn-default btn-circle btn-xs" href='index.php?page=medicion_listar&id_dato={$dato->id}&id_entidad={$dato->id_entidad}' 
                                               title="{$smarty.const.TXT_DATO_MEDICIONES}: {$dato->nombre}" target="_blank">
                                                <i class="fa fa-history fa-fw"></i>
                                            </a>
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_VAL_REF}" href='index.php?page=valor_referencia&id_dato={$dato->id}&id_entidad={$dato->id_entidad}' target="_blank">
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
                        {$smarty.const.MSG_DATOS_NO}
                    </div> 
                {/if}
            </div>
            <!-- /Todos los datos -->

            <!-- Datos archivados -->
            <div role="tabpanel" class="tab-pane" id="dato_archivados">
                {if $datos_archivados}
                    <div class="table-responsive">
                        <table class="table table-condensed datatable table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>{$smarty.const.FIELD_COD}</th>
                                    <th>{$smarty.const.FIELD_DATO}</th>
                                    <th>{$smarty.const.FIELD_UNID}</th>
                                    <th>{$smarty.const.FIELD_PERIOD}</th>
                                    <th>{$smarty.const.FIELD_RESP}</th>
                                    <th>{$smarty.const.FIELD_RESP_MED}</th>
                                    <th>{$smarty.const.FIELD_ACCIONES}</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach from=$datos_archivados item=dato} 
                                    <tr>
                                        <td><span class="label label-primary">{$dato->codigo}</span></td>
                                        <td>
                                            {if $dato->calculo}
                                                <i class="fa fa-calculator fa-fw" title="{$smarty.const.TXT_CALC_AUTO}: {$dato->calculo}"></i>
                                            {/if}
                                            {if $dato->id_tipo_agregacion!= 0}
                                                <i class="fa fa-sitemap fa-fw" title="{$smarty.const.FIELD_AGREG}"></i>
                                            {/if}
                                            <a target="_blank" href='index.php?page=dato_mostrar&id_dato={$dato->id}&id_entidad={$dato->id_entidad}' 
                                               title="{$dato->nombre}: {$dato->descripcion|replace:"\r\n":" "}">
                                                {$dato->nombre}</a>
                                        </td>
                                        <td><a title="{$smarty.const.TXT_FICHA}" href='index.php?page=entidad_mostrar&id_entidad={$dato->id_entidad}'>{$dato->entidad->etiqueta}</a></td>
                                        <td>{$dato->periodicidad}</td>
                                        <td style="font-size: 12px">
                                            <a title="{$smarty.const.TXT_USER_PERFIL}" href='index.php?page=usuario_mostrar&id_usuario={$dato->id_responsable}'>
                                                {$dato->responsable->nombre} {$dato->responsable->apellidos}</a>
                                        </td>
                                        <td style="font-size: 12px"> 
                                            <a title="{$smarty.const.TXT_USER_PERFIL}" href='index.php?page=usuario_mostrar&id_usuario={$dato->id_responsable_medicion}'>
                                                {$dato->responsable_medicion->nombre} {$dato->responsable_medicion->apellidos}</a>
                                        </td>
                                        <td>
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_FICHA}" target="_blank" href='index.php?page=dato_mostrar&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'>
                                                <i class="fa fa-folder fa-fw"></i>
                                            </a>
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_REP_GRAFIC}" target="_blank" href='index.php?page=graficas_mostrar&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'>
                                                <i class="fa fa-area-chart fa-fw"></i>
                                            </a>
                                            <a class="btn btn-default btn-circle btn-xs" href='index.php?page=medicion_listar&id_dato={$dato->id}&id_entidad={$dato->id_entidad}' 
                                               title="{$smarty.const.TXT_DATO_MEDICIONES}: {$dato->nombre}" target="_blank">
                                                <i class="fa fa-history fa-fw"></i>
                                            </a>
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_VAL_REF}" href='index.php?page=valor_referencia&id_dato={$dato->id}&id_entidad={$dato->id_entidad}' target="_blank">
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
                        {$smarty.const.MSG_DATOS_NO_ARCHIVADOS}
                    </div> 
                {/if}
            </div>
            <!-- /Datos archivados -->

        </div>
        <!-- /Tab panes -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->