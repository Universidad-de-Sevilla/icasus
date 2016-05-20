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
                <a href="#cuadros_propios" title="{$smarty.const.TXT_USER_CUADROS}" aria-controls="{$smarty.const.TXT_USER_CUADROS}" role="tab" data-toggle="tab"><i class="fa fa-th fa-fw"></i> {$smarty.const.TXT_USER_CUADROS}</a>
            </li>
            <li role="presentation">
                <a href="#cuadro_todos" title="{$smarty.const.TXT_CUADROS_MANDO_PUBLIC}" aria-controls="{$smarty.const.TXT_CUADROS_MANDO_PUBLIC}" role="tab" data-toggle="tab"><i class="fa fa-th fa-fw"></i> {$smarty.const.TXT_CUADROS_MANDO_PUBLIC}</a>
            </li>
        </ul>
        <!-- /Nav tabs -->
        <br>
        <!-- Tab panes -->
        <div class="tab-content">

            <!-- Cuadros de mando del usuario -->
            <div role="tabpanel" class="tab-pane active" id="cuadros_propios">
                {if $cuadros_propios|count > 0}
                    <div class="table-responsive">
                        <table class="table datatable table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>{$smarty.const.TXT_CUADRO_MANDO}</th>
                                    <th>{$smarty.const.FIELD_UNID}</th>
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
                                        <td><a title="{$smarty.const.TXT_FICHA}" href='index.php?page=entidad_mostrar&id_entidad={$cuadro->entidad->id}'>{$cuadro->entidad->etiqueta}</a></td>
                                        <td>
                                            {if $cuadro->privado == 0}
                                                {$smarty.const.TXT_PUBLICO}
                                            {else}
                                                {$smarty.const.TXT_PRIVADO}
                                            {/if}
                                        </td>
                                        <td>{$cuadro->comentarios}</td>
                                        <td style="white-space:nowrap">
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_VER}" href="index.php?page=cuadro_mostrar&id_cuadro={$cuadro->id}&id_entidad={$cuadro->id_entidad}"><i class="fa fa-eye fa-fw"></i></a>                 
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
                {else}
                    <div class="alert alert-info alert-dismissible">
                        <i class="fa fa-info-circle fa-fw"></i> 
                        {$smarty.const.MSG_CUADRO_MANDO_NO_PROPIO}
                    </div> 
                {/if}
            </div>
            <!-- /Cuadros de mando del usuario -->

            <!-- Todos los cuadros de mando -->
            <div role="tabpanel" class="tab-pane" id="cuadro_todos">
                {if $cuadros_publicos|count > 0}
                    <div class="table-responsive">
                        <table class="table datatable table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>{$smarty.const.TXT_CUADRO_MANDO}</th>
                                    <th>{$smarty.const.FIELD_UNID}</th>
                                    <th>{$smarty.const.FIELD_VISIBILIDAD}</th>
                                    <th>{$smarty.const.FIELD_COMENTARIOS}</th>
                                    <th>{$smarty.const.FIELD_ACCIONES}</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach from=$cuadros_publicos item=cuadro}
                                    <tr>
                                        <td><a title="{$cuadro->nombre}" href="index.php?page=cuadro_mostrar&id_cuadro={$cuadro->id}&id_entidad={$cuadro->id_entidad}">{$cuadro->nombre}</a></td>            
                                        <td><a title="{$smarty.const.TXT_FICHA}" href='index.php?page=entidad_mostrar&id_entidad={$cuadro->entidad->id}'>{$cuadro->entidad->etiqueta}</a></td>
                                        <td>
                                            {if $cuadro->privado == 0}{$smarty.const.TXT_PUBLICO}
                                            {else}{$smarty.const.TXT_PRIVADO}
                                            {/if}
                                        </td>
                                        <td>{$cuadro->comentarios}</td>
                                        <td style="white-space:nowrap">
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_VER}" href="index.php?page=cuadro_mostrar&id_cuadro={$cuadro->id}&id_entidad={$cuadro->id_entidad}"><i class="fa fa-eye fa-fw"></i></a>
                                                {if $cuadro->id_usuario == $_usuario->id}
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_EDIT}" href='index.php?page=cuadro_editar&id_cuadro={$cuadro->id}&id_entidad={$cuadro->id_entidad}'><i class="fa fa-pencil fa-fw"></i></a>   
                                                <a class="btn btn-default btn-circle btn-xs" data-toggle="modal" data-target="#dialogo_confirmar_borrado"
                                                   title="{$smarty.const.TXT_BORRAR}" data-nombre_cuadro="{$cuadro->nombre}" data-id_cuadro="{$cuadro->id}"
                                                   href='javascript:void(0)'><i class="fa fa-trash fa-fw"></i></a>                                            
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
                        {$smarty.const.MSG_CUADRO_MANDO_NO_PUBLIC}
                    </div> 
                {/if}
            </div>
            <!-- /Todos los cuadros de mando -->

        </div>
        <!-- /Tab panes -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->