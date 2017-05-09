<!-- Diálogo Confirmar Borrado Carta-->
<div class="modal fade" id="dialogo_confirmar_borrado_carta" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel"><i class="fa fa-trash fa-fw"></i> {$smarty.const.TXT_CARTA_BORRAR}: <span id="fecha_carta"></span></h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_CARTA_CONFIRM_BORRAR}</p>
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
<!-- /Diálogo Confirmar Borrado Carta -->

<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <h3 title="{$_nombre_pagina}" class="page-header">
            <i class="fa fa-map-o fa-fw"></i> {$_nombre_pagina}
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
                        <a title="{$smarty.const.TXT_CARTAS_DESCRIPCION}" href='index.php?page=carta_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-map-o fa-fw"></i> {$smarty.const.FIELD_CARTAS} <span title="{$smarty.const.FIELD_TOTAL}: {$num_cartas} {$smarty.const.FIELD_CARTAS}">({$num_cartas})</span>
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
            <div id="botones_carta" class="btn-toolbar hidden" role="toolbar" aria-label="">
                <div class="btn-group" role="group" aria-label="">
                    <a class="btn btn-danger" href='index.php?page=carta_crear&id_entidad={$entidad->id}' 
                       title="{$smarty.const.TXT_CARTA_CREAR}">
                        <i class="fa fa-map-o fa-fw"></i><sub class="fa fa-plus fa-fw"></sub>
                    </a>
                </div>
            </div>
        {/if}
        <!-- /Barra de botones -->
        {if $cartas}
            <div class="table-responsive">
                <table id="tabla_cartas" class="table datatable table-striped table-hover">
                    <thead>
                        <tr>
                            <th class="hidden"></th>
                            <th>{$smarty.const.FIELD_FECHA}</th>
                            <th>{$smarty.const.FIELD_ACCIONES}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach from=$cartas item=carta}
                            <tr>
                                <td class="hidden"></td>
                                <td>
                                    <a title="{$carta->fecha|date_format:'%d/%m/%Y'}" href="index.php?page=carta_mostrar&id_carta={$carta->id}&id_entidad={$carta->id_entidad}">{$carta->fecha|date_format:'%d/%m/%Y'}</a>
                                </td>
                                <td>
                                    <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_FICHA}" href="index.php?page=carta_mostrar&id_carta={$carta->id}&id_entidad={$carta->id_entidad}">
                                        <i class="fa fa-folder fa-fw"></i>
                                    </a>
                                    {if $_control}
                                        <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_EDIT}" href="index.php?page=carta_editar&id_carta={$carta->id}&id_entidad={$carta->id_entidad}">
                                            <i class="fa fa-pencil fa-fw"></i>
                                        </a>
                                        <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_CARTA_BORRAR}" href='javascript:void(0)' data-toggle="modal" data-target="#dialogo_confirmar_borrado_carta"
                                           data-id_carta="{$carta->id}" data-fecha_carta="{$carta->fecha|date_format:'%d/%m/%Y'}" data-id_entidad="{$carta->id_entidad}">
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
                        {$smarty.const.MSG_UNID_NO_CARTAS}
                    </div>
                </div>
                <!-- /.col-sm-11 -->
                <div class="col-sm-1">
                    {if $_control}
                        <div class="btn-toolbar" role="toolbar" aria-label="">
                            <div class="btn-group" role="group" aria-label="">
                                <a class="btn btn-danger" href='index.php?page=carta_crear&id_entidad={$entidad->id}' 
                                   title="{$smarty.const.TXT_CARTA_CREAR}">
                                    <i class="fa fa-map-o fa-fw"></i><sub class="fa fa-plus fa-fw"></sub>
                                </a>
                            </div>
                        </div>
                    {/if}
                </div>
                <!-- /.col-sm-1 -->
            </div>
        {/if}     
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->