<!-- Diálogo Confirmar Borrado -->
<div class="modal fade" id="dialogo_confirmar_borrado" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel"><i class="fa fa-trash fa-fw"></i> {$smarty.const.TXT_CUADRO_BORRAR}: <span id="nombre_cuadro"></span></h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_CUADRO_MANDO_CONFIRM_BORRAR}</p>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_NO}" class="btn btn-default btn-danger" data-dismiss="modal"><i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_NO}</button>
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
            <i class="fa fa-th fa-fw"></i> {$_nombre_pagina}
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
                            <i class="fa fa-dashboard fa-fw"></i> {$smarty.const.FIELD_INDICS} <span title="{$smarty.const.FIELD_TOTAL}: {$num_indicadores} {$smarty.const.FIELD_INDICS}">({$num_indicadores})</span>
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
        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active">
                <a href="#cuadro_list" title="{$smarty.const.FIELD_CUADROS_MANDO}" aria-controls="{$smarty.const.FIELD_CUADROS_MANDO}" role="tab" data-toggle="tab"><i class="fa fa-th fa-fw"></i> {$smarty.const.FIELD_CUADROS_MANDO}</a>
            </li>
            {if $cuadros_propios}
                <li role="presentation">
                    <a href="#user_cuadro" title="{$smarty.const.TXT_USER_CUADROS}" aria-controls="{$smarty.const.TXT_USER_CUADROS}" role="tab" data-toggle="tab"><i class="fa fa-th fa-fw"></i><sub class="fa fa-user fa-fw"></sub> {$smarty.const.TXT_USER_CUADROS}</a>
                </li>
            {/if}
        </ul>
        <!-- /Nav tabs -->
        <br>
        <!-- Tab panes -->
        <div class="tab-content">

            <!-- Lista de Cuadros de mando -->
            <div role="tabpanel" class="tab-pane active" id="cuadro_list">
                <!-- Barra de botones -->
                {if $_control}
                    <div id="botones" class="btn-toolbar hidden" role="toolbar" aria-label="">
                        <div class="btn-group" role="group" aria-label="">
                            <a class="btn btn-default btn-danger" href="index.php?page=cuadro_crear&id_entidad={$entidad->id}" title="{$smarty.const.TXT_CUADRO_CREAR}">
                                <i class="fa fa-th fa-fw"></i><sub class="fa fa-plus fa-fw"></sub></a>
                        </div>
                    </div>
                {/if}
                <!-- /Barra de botones -->
                {if $cuadros}
                    <div class="table-responsive">
                        <table id="tabla_cuadros" class="table datatable table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>{$smarty.const.FIELD_CUADRO_MANDO}</th>
                                    <th>{$smarty.const.FIELD_VISIBILIDAD}</th>
                                    <th>{$smarty.const.FIELD_COMENTARIOS}</th>
                                    <th>{$smarty.const.FIELD_ACCIONES}</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach from=$cuadros item=cuadro}
                                    <tr>
                                        <td><a title="{$cuadro->nombre}" href="index.php?page=cuadro_mostrar&id_cuadro={$cuadro->id}&id_entidad={$cuadro->id_entidad}">{$cuadro->nombre}</a></td>            
                                        <td>
                                            {if $cuadro->privado == 0}{$smarty.const.TXT_PUBLICO}
                                            {else}{$smarty.const.TXT_PRIVADO}
                                            {/if}
                                        </td>
                                        <td>{if $cuadro->comentarios}{$cuadro->comentarios}{else}---{/if}</td>
                                        <td style="white-space:nowrap">
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_VER}" href="index.php?page=cuadro_mostrar&id_cuadro={$cuadro->id}&id_entidad={$cuadro->id_entidad}"><i class="fa fa-th fa-fw"></i></a>
                                                {if $cuadro->id_usuario == $_usuario->id || $_control}
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_EDIT}" href='index.php?page=cuadro_editar&id_cuadro={$cuadro->id}&id_entidad={$cuadro->id_entidad}'><i class="fa fa-pencil fa-fw"></i></a>   
                                                <a class="btn btn-default btn-circle btn-xs" data-toggle="modal" data-target="#dialogo_confirmar_borrado"
                                                   title="{$smarty.const.TXT_BORRAR}" data-nombre_cuadro="{$cuadro->nombre}" data-id_cuadro="{$cuadro->id}"
                                                   href='javascript:void(0)'><i class="fa fa-trash fa-fw"></i>
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
                                {$smarty.const.MSG_UNID_NO_CUADROS}
                            </div> 
                        </div>
                        <!-- /.col-sm-11 -->
                        <div class="col-sm-1">
                            <!-- Barra de botones -->
                            {if $_control}
                                <div class="btn-toolbar" role="toolbar" aria-label="">
                                    <div class="btn-group" role="group" aria-label="">
                                        <a class="btn btn-default btn-danger" href="index.php?page=cuadro_crear&id_entidad={$entidad->id}" title="{$smarty.const.TXT_CUADRO_CREAR}">
                                            <i class="fa fa-th fa-fw"></i><sub class="fa fa-plus fa-fw"></sub></a>
                                    </div>
                                </div>
                            {/if}
                            <!-- /Barra de botones -->
                        </div>
                        <!-- /.col-sm-1 -->
                    </div>
                    <!-- /.row -->
                {/if}
            </div>
            <!-- /Lista de Cuadros de mando -->

            <!-- Cuadros de mando del usuario -->
            {if $cuadros_propios}
                <div role="tabpanel" class="tab-pane" id="user_cuadro">
                    <div class="table-responsive">
                        <table id="tabla_mis_cuadros" class="table datatable table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>{$smarty.const.FIELD_CUADRO_MANDO}</th>
                                    <th>{$smarty.const.FIELD_VISIBILIDAD}</th>
                                    <th>{$smarty.const.FIELD_COMENTARIOS}</th>
                                    <th>{$smarty.const.FIELD_ACCIONES}</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach from=$cuadros_propios item=cuadro}
                                    <tr>
                                        <td>
                                            <a title="{$cuadro->nombre}" href="index.php?page=cuadro_mostrar&id_cuadro={$cuadro->id}&id_entidad={$cuadro->id_entidad}">{$cuadro->nombre}</a>
                                        </td> 
                                        <td>
                                            {if $cuadro->privado == 0}
                                                {$smarty.const.TXT_PUBLICO}
                                            {else}
                                                {$smarty.const.TXT_PRIVADO}
                                            {/if}
                                        </td>
                                        <td>{if $cuadro->comentarios}{$cuadro->comentarios}{else}---{/if}</td>
                                        <td style="white-space:nowrap">
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_VER}" href="index.php?page=cuadro_mostrar&id_cuadro={$cuadro->id}&id_entidad={$cuadro->id_entidad}"><i class="fa fa-th fa-fw"></i></a>                 
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_EDIT}" href='index.php?page=cuadro_editar&id_cuadro={$cuadro->id}&id_entidad={$cuadro->id_entidad}'><i class="fa fa-pencil fa-fw"></i></a>   
                                            <a class="btn btn-default btn-circle btn-xs" data-toggle="modal" data-target="#dialogo_confirmar_borrado" 
                                               title="{$smarty.const.TXT_BORRAR}" data-nombre_cuadro="{$cuadro->nombre}" data-id_cuadro="{$cuadro->id}"
                                               href='javascript:void(0)'><i class="fa fa-trash fa-fw"></i></a>                                            
                                        </td>
                                    </tr>
                                {/foreach}
                            </tbody>
                        </table>
                    </div>
                </div>
            {/if}
            <!-- /Cuadros de mando del usuario -->

        </div>
        <!-- /Tab panes -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->