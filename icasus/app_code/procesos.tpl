<!-- Diálogo Confirmar Borrado -->
<div class="modal fade" id="dialogo_confirmar_borrado" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel"><i class="fa fa-trash fa-fw"></i> {$smarty.const.TXT_PROC_BORRAR}: <span id="nombre_proceso"></span></h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_PROC_CONFIRM_BORRAR}</p>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_NO}" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_NO}</button>
                <a title="{$smarty.const.TXT_SI}" class="btn btn-success" name="borrar" id="borrar"><i class="fa fa-check fa-fw"></i> {$smarty.const.TXT_SI}</a>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Confirmar Borrado -->

<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <h3 title="{$_nombre_pagina}" class="page-header">
            <i class="fa fa-gears fa-fw"></i> {$_nombre_pagina}
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
                <a href="#proc_todos" title="{$smarty.const.TXT_PROC_TODOS}" aria-controls="{$smarty.const.TXT_PROC_TODOS}" role="tab" data-toggle="tab"><i class="fa fa-gears fa-fw"></i> {$smarty.const.TXT_PROC_TODOS}</a>
            </li>
            <li role="presentation" >
                <a href="#user_procs" title="{$smarty.const.TXT_USER_PROCS}" aria-controls="{$smarty.const.TXT_USER_PROCS}" role="tab" data-toggle="tab"><i class="fa fa-gears fa-fw"></i> {$smarty.const.TXT_USER_PROCS}</a>
            </li>
        </ul>
        <!-- /Nav tabs -->
        <br>
        <!-- Tab panes -->
        <div class="tab-content">

            <!-- Procesos del usuario -->
            <div role="tabpanel" class="tab-pane" id="user_procs">
                {if $procesos_propios}
                    <div class="table-responsive">
                        <table class="table datatable table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>{$smarty.const.FIELD_COD}</th>
                                    <th>{$smarty.const.FIELD_UNID}</th>
                                    <th>{$smarty.const.FIELD_NOMBRE}</th>
                                    <th>{$smarty.const.FIELD_TIPO_PROC}</th>
                                    <th>{$smarty.const.FIELD_PROC_MADRE}</th>         
                                    <th>{$smarty.const.FIELD_PROPIETARIO}</th>
                                    <th>{$smarty.const.FIELD_ACCIONES}</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach from=$procesos_propios item=proceso}
                                    <tr>    
                                        <td><span class="label label-primary">{$proceso->codigo}</span></td>
                                        <td><a title="{$smarty.const.TXT_UNID_FICHA}" href='index.php?page=entidad_mostrar&id_entidad={$proceso->entidad->id}'>{$proceso->entidad->etiqueta}</a></td>
                                        <td>
                                            <a title="{$proceso->nombre}: {$proceso->mision}" href="index.php?page=proceso_mostrar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}">
                                                {$proceso->nombre}
                                            </a>
                                        </td>
                                        <td>{$proceso->alcance}</td>
                                        <td>
                                            {if $proceso->madre->id > 0}
                                                <a title="{$proceso->madre->nombre}" href="index.php?page=proceso_mostrar&id_proceso={$proceso->madre->id}&id_entidad={$proceso->madre->id_entidad}">
                                                    {$proceso->madre->nombre}
                                                </a>
                                            {else}
                                                ---
                                            {/if}
                                        </td>
                                        <td style="font-size: 12px">
                                            <a title="{$smarty.const.TXT_USER_PERFIL}" href="index.php?page=usuario_mostrar&id_usuario={$proceso->propietario->id}">
                                                {$proceso->propietario->nombre}
                                                {$proceso->propietario->apellidos}
                                            </a>
                                        </td>
                                        <td>
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_PROC_FICHA}" href="index.php?page=proceso_mostrar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}">
                                                <i class="fa fa-folder fa-fw"></i>
                                            </a>
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_ARCHIVOS}" href='index.php?page=archivo_gestionar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}'>
                                                <i class="fa fa-file fa-fw"></i>
                                            </a>
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_EDIT}" href='index.php?page=proceso_editar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}'>
                                                <i class="fa fa-pencil fa-fw"></i>
                                            </a>   
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_BORRAR}" 
                                               href='javascript:void(0)' data-toggle="modal" data-target="#dialogo_confirmar_borrado"
                                               data-id_proceso="{$proceso->id}" data-nombre_proceso="{$proceso->nombre}" data-id_entidad="{$proceso->id_entidad}">
                                                <i class="fa fa-trash fa-fw"></i>
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
                        {$smarty.const.MSG_PROC_NO_ASIG}
                    </div>
                {/if}
            </div>
            <!-- /Procesos del usuario -->

            <!-- Todos los procesos -->
            <div role="tabpanel" class="tab-pane active" id="proc_todos">
                {if $procesos}
                    <div class="table-responsive">
                        <table class="table datatable table-striped table-hover">
                            <thead>
                                <tr>   
                                    <th>{$smarty.const.FIELD_COD}</th>
                                    <th>{$smarty.const.FIELD_UNID}</th>
                                    <th>{$smarty.const.FIELD_NOMBRE}</th>
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
                                        <td><a title="{$smarty.const.TXT_UNID_FICHA}" href='index.php?page=entidad_mostrar&id_entidad={$proceso->entidad->id}'>{$proceso->entidad->etiqueta}</a></td>
                                        <td>
                                            <a title="{$proceso->nombre}: {$proceso->mision}" href="index.php?page=proceso_mostrar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}">
                                                {$proceso->nombre}
                                            </a>
                                        </td>
                                        <td>{$proceso->alcance}</td>
                                        <td>
                                            {if $proceso->madre->id > 0}
                                                <a title="{$proceso->madre->nombre}" href="index.php?page=proceso_mostrar&id_proceso={$proceso->madre->id}&id_entidad={$proceso->madre->id_entidad}">
                                                    {$proceso->madre->nombre}
                                                </a>
                                            {else}
                                                ---
                                            {/if}
                                        </td>
                                        <td style="font-size: 12px">
                                            <a title="{$smarty.const.TXT_USER_PERFIL}" href="index.php?page=usuario_mostrar&id_usuario={$proceso->propietario->id}">
                                                {$proceso->propietario->nombre}
                                                {$proceso->propietario->apellidos}
                                            </a>
                                        </td>
                                        <td>
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_PROC_FICHA}" href="index.php?page=proceso_mostrar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}">
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
                        {$smarty.const.MSG_PROCS_NO}
                    </div> 
                {/if}
            </div>
            <!-- /Todos los procesos -->

        </div>
        <!-- /Tab panes -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->