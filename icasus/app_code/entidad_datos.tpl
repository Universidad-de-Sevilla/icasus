<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <h3 title="{$_nombre_pagina}" class="page-header">
            <i class="fa fa-folder fa-fw"></i> {$_nombre_pagina}
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
            <li><a title="{$entidad->nombre}" href="index.php?page=entidad_mostrar&id_entidad={$entidad->id}&principal=1">{$entidad->nombre|truncate:30}</a></li>
            <li title="{$_nombre_pagina}" class="active">{$_nombre_pagina}</li>
        </ol>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- /Breadcrumbs -->

<!-- Barra de botones -->
{if $_control}
    <div class="row">
        <div class="col-lg-12">
            <div class="btn-toolbar" role="toolbar" aria-label="">
                <div class="btn-group" role="group" aria-label="">
                    <a title="{$smarty.const.TXT_UNID_EDIT}" class="btn btn-default btn-danger" href='index.php?page=entidad_editar&id_entidad={$entidad->id}'>
                        <i class="fa fa-pencil fa-fw"></i> {$smarty.const.TXT_UNID_EDIT}
                    </a>
                    <a title="{$smarty.const.TXT_VAL_IMPORT}" class="btn btn-default btn-danger" href='index.php?page=csv_importar&id_entidad={$entidad->id}'>
                        <i class="fa fa-upload fa-fw"></i> {$smarty.const.TXT_VAL_IMPORT}
                    </a>
                </div>   
                <div class="btn-group" role="group" aria-label="">
                    <a title="{$smarty.const.TXT_USERS_VINC}" class="btn btn-default btn-danger" href='index.php?page=entidad_poblar&id_entidad={$entidad->id}'>
                        <i class="fa fa-user-plus fa-fw"></i> {$smarty.const.TXT_USERS_VINC}
                    </a>
                    <a title="{$smarty.const.TXT_USERS_DESVINC}" class="btn btn-default btn-danger" href='index.php?page=entidad_despoblar&id_entidad={$entidad->id}'>
                        <i class="fa fa-user-times fa-fw"></i> {$smarty.const.TXT_USERS_DESVINC}
                    </a>
                </div>
            </div>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <br>
{/if}
<!-- /Barra de botones -->

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-red">
            <div class="panel-heading">
                <span class="panel-title"><i class="fa fa-sitemap fa-fw"></i> {$smarty.const.TXT_UNID_PARAM}</span>
                <i class="fa fa-chevron-up pull-right clickable"></i>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <table class="table table-striped table-hover">
                    <tbody>
                        <tr>
                            <th>{$smarty.const.FIELD_COD}</th>
                            <td>{$entidad->codigo}</td>
                        </tr>
                        <tr>
                            <th>{$smarty.const.FIELD_NOMBRE}</th>
                            <td>{$entidad->nombre}</td>
                        </tr>
                        <tr>
                            <th>{$smarty.const.FIELD_WEB}</th>
                            <td>
                                {if $entidad->web}
                                    <a title="{$entidad->web}" href='{$entidad->web}' target="_blank">{$entidad->web}</a>
                                {else}
                                    ---
                                {/if}
                            </td>
                        </tr>
                        <tr>
                            <th>{$smarty.const.FIELD_UNID_SUP}</th>
                            <td>
                                {if $entidad->madre->id !=0}
                                    <a title="{$entidad->madre->nombre}" href="index.php?page=entidad_mostrar&id_entidad={$entidad->madre->id}&principal=1">{$entidad->madre->nombre}</a>
                                {else}
                                    ---
                                {/if}
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- /.panel-body -->        
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-red">
            <div class="panel-heading">
                <span class="panel-title"><i class="fa fa-users fa-fw"></i> {$smarty.const.TXT_USERS}</span>
                <i class="fa fa-chevron-up pull-right clickable"></i>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                {if $usuarios}
                    <div class="table-responsive">
                        <table class="table datatable table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>{$smarty.const.FIELD_LOGIN}</th>
                                    <th>{$smarty.const.FIELD_ROL}</th>
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
                                            <a title="{$smarty.const.TXT_USER_PERFIL}" href='index.php?page=usuario_mostrar&id_usuario={$usuario->usuario->id}'>
                                                {$usuario->usuario->login}
                                            </a>
                                        </td>
                                        <td>{$usuario->rol->nombre}</td>
                                        <td>{$usuario->usuario->nombre}</td>
                                        <td>{$usuario->usuario->apellidos}</td>       
                                        <td><a title="{$smarty.const.TXT_ENVIAR_CORREO}" href='mailto:{$usuario->usuario->correo}'>{$usuario->usuario->correo}</a></td>
                                        <td>{$usuario->usuario->telefono}</td>
                                        <td style="white-space:nowrap">
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_USER_PERFIL}" href='index.php?page=usuario_mostrar&id_usuario={$usuario->usuario->id}'><i class="fa fa-user fa-fw"></i></a>                 
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_ENVIAR_CORREO}" href='mailto:{$usuario->usuario->correo}'><i class="fa fa-envelope fa-fw"></i></a>
                                        </td>
                                    </tr>
                                {/foreach}
                            </tbody>
                        </table>
                    </div>
                {else}
                    <div class="alert alert-info alert-dismissible">
                        <i class="fa fa-info-circle fa-fw"></i> 
                        {$smarty.const.MSG_UNID_NO_USERS}
                    </div> 
                {/if}
            </div>
            <!-- /.panel-body -->        
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-red">
            <div class="panel-heading">
                <span class="panel-title"><i class="fa fa-sitemap fa-fw"></i> {$smarty.const.FIELD_SUBUNIDS}</span>
                <i class="fa fa-chevron-up pull-right clickable"></i>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                {if $subentidades}
                    <div class="table-responsive">
                        <table class="table datatable table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>{$smarty.const.FIELD_COD}</th>
                                    <th>{$smarty.const.FIELD_NOMBRE}</th>
                                    <th>{$smarty.const.FIELD_ACCIONES}</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach from=$subentidades item=subentidad}
                                    <tr>  
                                        <td style="white-space:nowrap">{$subentidad->codigo}</td>
                                        <td>
                                            <a title="{$subentidad->nombre}" href='index.php?page=entidad_mostrar&id_entidad={$subentidad->id}&principal=1'>{$subentidad->nombre}</a>
                                        </td>
                                        <td style="white-space:nowrap">
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_UNID_FICHA}" href='index.php?page=entidad_datos&id_entidad={$subentidad->id}'><i class="fa fa-folder fa-fw"></i></a>
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_PROCS}" href='index.php?page=proceso_listar&id_entidad={$subentidad->id}'><i class="fa fa-gears fa-fw"></i></a>
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.FIELD_INDICS}" href='index.php?page=indicador_listar&id_entidad={$subentidad->id}'><i class="fa fa-dashboard fa-fw"></i></a>
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.FIELD_DATOS}" href='index.php?page=dato_listar&id_entidad={$subentidad->id}'><i class="fa fa-database fa-fw"></i></a>
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_CONSULT}" href='index.php?page=consulta_avanzada&id_entidad={$subentidad->id}'><i class="fa fa-commenting fa-fw"></i></a>
                                        </td>
                                    </tr>
                                {/foreach}
                            </tbody>
                        </table>
                    </div>
                {else}
                    <div class="alert alert-info alert-dismissible">
                        <i class="fa fa-info-circle fa-fw"></i> 
                        {$smarty.const.MSG_UNID_NO_SUBUNIDS}
                    </div> 
                {/if}
            </div>
            <!-- /.panel-body -->        
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->