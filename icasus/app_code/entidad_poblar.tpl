<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <h2 title="{$_nombre_pagina}" class="page-header">
            <i class="fa fa-user-plus fa-fw"></i> {$_nombre_pagina}
        </h2>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- /Nombre página -->

<!-- Barra de botones -->
<div class="row">
    <div class="col-lg-12">
        <div class="btn-toolbar" role="toolbar" aria-label="">
            <div class="btn-group" role="group" aria-label="">
                <a class="btn btn-default btn-danger" href="index.php?page=entidad_datos&id_entidad={$entidad->id}" title="{$smarty.const.TXT_UNID_VOLVER}">
                    <i class="fa fa-arrow-left fa-fw"></i> {$smarty.const.TXT_UNID_VOLVER}</a>
            </div>
        </div>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<br>
<!-- /Barra de botones -->

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-red">
            <div class="panel-heading">
                <span class="panel-title"><i class="fa fa-users fa-fw"></i> {$smarty.const.TXT_USERS_DISP}</span>
                <i class="fa fa-chevron-up pull-right clickable"></i>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <form action='index.php?page=entidad_poblar&id_entidad={$entidad->id}' 
                      method='post' name='formpoblar' 
                      onsubmit="return confirm('{$smarty.const.MSG_USERS_CONFIRM_VINC}');"
                      class="form-horizontal">
                    <div class="table-responsive">
                        <table class="table datatable table-striped table-hover">
                            <thead>               
                                <tr>
                                    <th></th>
                                    <th>{$smarty.const.FIELD_NOMBRE}</th>
                                    <th>{$smarty.const.FIELD_APEL}</th>
                                    <th>{$smarty.const.FIELD_CORREO}</th>
                                    <th>{$smarty.const.FIELD_UNID_RPT}</th>
                                    <th>{$smarty.const.FIELD_PUESTO}</th>

                                </tr>
                            </thead>
                            <tbody>
                                {foreach from=$personas item=persona}
                                    <tr>
                                        <td><input title="{$smarty.const.TXT_SEL}" type='checkbox' name='id_usuario[]' value='{$persona.id}'/></td>
                                        <td>{$persona.nombre|upper}</td>
                                        <td>{$persona.apellidos|upper}</td>
                                        <td>{$persona.correo}</td>
                                        <td>{$persona.unidad_hominis}</td>
                                        <td>{$persona.puesto}</td>
                                    </tr>
                                {/foreach}
                            </tbody>
                        </table>
                    </div>
                    <br>
                    <div class="form-group">
                        <label for="id_rol" class="col-sm-2 control-label">{$smarty.const.FIELD_ROL}</label>
                        <div class="col-sm-8">
                            <select class="form-control chosen-select" name='id_rol' id='id_rol'>
                                {foreach from=$roles item='rol'}
                                    <option value="{$rol->id}">{$rol->nombre}</option>
                                {/foreach }
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="button" class="btn btn-default btn-danger" title="{$smarty.const.TXT_CANCEL}" onclick="location.href = 'index.php?page=entidad_datos&id_entidad={$entidad->id}';">
                                <i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_CANCEL}
                            </button>
                            <button type="reset" class="btn btn-default btn-warning" title="{$smarty.const.TXT_RESET}">
                                <i class="fa fa-refresh fa-fw"></i> {$smarty.const.TXT_RESET}
                            </button>
                            <button title="{$smarty.const.TXT_USERS_ASIGNAR}" type="submit" class="btn btn-default btn-success">
                                <i class="fa fa-user-plus fa-fw"></i> {$smarty.const.TXT_USERS_ASIGNAR}
                            </button>
                        </div>
                    </div>
                </form>
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
                <span class="panel-title"><i class="fa fa-users fa-fw"></i> {$smarty.const.TXT_USERS_ASIG}</span>
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
                                            <a title="{$usuario->usuario->login}" href='index.php?page=usuario_mostrar&id_usuario={$usuario->usuario->id}'>
                                                {$usuario->usuario->login}
                                            </a>
                                        </td>
                                        <td>{$usuario->rol->nombre}</td>
                                        <td>{$usuario->usuario->nombre}</td>
                                        <td>{$usuario->usuario->apellidos}</td>
                                        <td><a title="{$smarty.const.TXT_ENVIAR_CORREO}" href='mailto:{$usuario->usuario->correo}'>{$usuario->usuario->correo}</a></td>
                                        <td>{$usuario->usuario->telefono}</td>
                                        <td style="white-space:nowrap">
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_VER}" href='index.php?page=usuario_mostrar&id_usuario={$usuario->usuario->id}'><i class="fa fa-eye fa-fw"></i></a>                 
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