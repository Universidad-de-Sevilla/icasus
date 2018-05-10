<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <h3 title="{$_nombre_pagina}" class="page-header">
            <i class="fa fa-users fa-fw"></i><sub class="fa fa-pencil fa-fw"></sub> {$_nombre_pagina}
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
            <li><a title="{$smarty.const.FIELD_UNIDS}"
                   href='index.php?page=entidad_listar'>{$smarty.const.FIELD_UNIDS}</a></li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" data-target="#" title="{$entidad->nombre}"
                   href="index.php?page=entidad_mostrar&id_entidad={$entidad->id}">
                    {$entidad->nombre|truncate:30} <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu">
                    <li>
                        <a title="{$smarty.const.FIELD_USER}: {$_usuario->login} - {$smarty.const.TXT_UNID}: {$entidad->nombre} - {$smarty.const.FIELD_ROL}: {$_rol}"
                           href="index.php?page=entidad_mostrar&id_entidad={$entidad->id}"><i
                                    class="fa fa-folder fa-fw"></i> {$entidad->nombre} / <i
                                    class="fa fa-user fa-fw"></i> {$_rol}</a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a title="{$smarty.const.TXT_PLANES_DESCRIPCION}"
                           href='index.php?page=plan_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-book fa-fw"></i> {$smarty.const.FIELD_PLANES} <span
                                    title="{$smarty.const.FIELD_TOTAL}: {$num_planes} {$smarty.const.FIELD_PLANES}">({$num_planes}
                                )</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_CARTAS_DESCRIPCION}"
                           href='index.php?page=carta_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-map-o fa-fw"></i> {$smarty.const.FIELD_CARTAS} <span
                                    title="{$smarty.const.FIELD_TOTAL}: {$num_cartas} {$smarty.const.FIELD_CARTAS}">({$num_cartas}
                                )</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_PROCS_DESCRIPCION}"
                           href='index.php?page=proceso_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-gears fa-fw"></i> {$smarty.const.FIELD_PROCS} <span
                                    title="{$smarty.const.FIELD_TOTAL}: {$num_procesos} {$smarty.const.FIELD_PROCS}">({$num_procesos}
                                )</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_INDICS_DESCRIPCION}"
                           href='index.php?page=indicador_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-dashboard fa-fw"></i> {$smarty.const.FIELD_INDICS}
                            /{$smarty.const.FIELD_DATOS} <span
                                    title="{$smarty.const.FIELD_TOTAL}: {$num_indicadores} {$smarty.const.FIELD_INDICS}/{$smarty.const.FIELD_DATOS}">({$num_indicadores}
                                )</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_CONSULTA_DESCRIPCION}"
                           href="index.php?page=consulta_avanzada&id_entidad={$entidad->id}">
                            <i class="fa fa-commenting fa-fw"></i> {$smarty.const.TXT_CONSULT}
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_CUADRO_MANDO_DESCRIPCION}"
                           href='index.php?page=cuadro_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-th fa-fw"></i> {$smarty.const.FIELD_CUADROS_MANDO}
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_CONTROL_DESCRIPCION}"
                           href="index.php?page=control&modulo=inicio&id_entidad={$entidad->id}">
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
                <a href="#user_asig" title="{$smarty.const.TXT_USERS_ASIG}"
                   aria-controls="{$smarty.const.TXT_USERS_ASIG}" role="tab" data-toggle="tab"><i
                            class="fa fa-users fa-fw"></i> {$smarty.const.TXT_USERS_ASIG}</a>
            </li>
            <li role="presentation">
                <a href="#user_disp" title="{$smarty.const.TXT_USERS_ASIGNAR}"
                   aria-controls="{$smarty.const.TXT_USERS_ASIGNAR}" role="tab" data-toggle="tab"><i
                            class="fa fa-user-plus fa-fw"></i> {$smarty.const.TXT_USERS_ASIGNAR}</a>
            </li>
        </ul>
        <!-- /Nav tabs -->
        <br>
        <!-- Tab panes -->
        <div class="tab-content">

            <!-- Usuarios asignados actualmente -->
            <div role="tabpanel" class="tab-pane active" id="user_asig">
                {if $usuarios}
                    <form action='index.php?page=entidad_usuarios&id_entidad={$entidad->id}'
                          method='post' name='formdiv' class="form-horizontal">
                        <input type="hidden" name="baja" value="Baja">
                        <div class="form-group">
                            <div class="col-sm-12">
                                <a class="btn btn-danger pull-left" title="{$smarty.const.TXT_CANCEL}"
                                   href='index.php?page=entidad_mostrar&id_entidad={$entidad->id}'>
                                    <i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_CANCEL}
                                </a>
                                <div class="pull-right">
                                    <button type="reset" class="btn btn-warning" title="{$smarty.const.TXT_RESET}">
                                        <i class="fa fa-refresh fa-fw"></i> {$smarty.const.TXT_RESET}
                                    </button>
                                    <button title="{$smarty.const.TXT_USERS_DESASIGNAR}" type="button"
                                            class="btn btn-success" data-toggle="modal"
                                            data-target="#dialogo_confirmar_baja">
                                        <i class="fa fa-user-times fa-fw"></i> {$smarty.const.TXT_USERS_DESASIGNAR}
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table datatable table-striped table-hover">
                                <thead>
                                <tr>
                                    <th></th>
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
                                        <td><input title="{$smarty.const.TXT_SEL}" type='checkbox' name='id_usuario[]'
                                                   value='{$usuario->id_usuario}'/></td>
                                        <td>
                                            <a title="{$smarty.const.TXT_USER_PERFIL}"
                                               href='index.php?page=usuario_mostrar&id_usuario={$usuario->usuario->id}'>
                                                {$usuario->usuario->login}
                                            </a>
                                        </td>
                                        <td>
                                            <select class="form-control chosen-select rol_usuario"
                                                    data-id_usuario="{$usuario->id_usuario}"
                                                    data-id_entidad="{$usuario->id_entidad}">
                                                {foreach from=$roles item='rol'}
                                                    <option value="{$rol->id}" {if $usuario->id_rol==$rol->id} selected {/if}>{$rol->nombre}</option>
                                                {/foreach }
                                            </select>
                                        </td>
                                        <td style="font-size: 12px">{$usuario->usuario->nombre}</td>
                                        <td style="font-size: 12px">{$usuario->usuario->apellidos}</td>
                                        <td><a title="{$smarty.const.TXT_ENVIAR_CORREO}"
                                               href='mailto:{$usuario->usuario->correo}'>{$usuario->usuario->correo}</a>
                                        </td>
                                        <td>{$usuario->usuario->telefono}</td>
                                        <td style="white-space:nowrap">
                                            <a class="btn btn-default btn-circle btn-xs"
                                               title="{$smarty.const.TXT_USER_PERFIL}"
                                               href='index.php?page=usuario_mostrar&id_usuario={$usuario->usuario->id}'><i
                                                        class="fa fa-user fa-fw"></i></a>
                                            <a class="btn btn-default btn-circle btn-xs"
                                               title="{$smarty.const.TXT_ENVIAR_CORREO}"
                                               href='mailto:{$usuario->usuario->correo}'><i
                                                        class="fa fa-envelope fa-fw"></i></a>
                                        </td>
                                    </tr>
                                {/foreach}
                                </tbody>
                            </table>
                        </div>

                        <!-- Diálogo Confirmar Baja -->
                        <div class="modal fade" id="dialogo_confirmar_baja" tabindex="-1" role="dialog"
                             aria-labelledby="myModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span></button>
                                        <h3 class="modal-title" id="myModalLabel"><i
                                                    class="fa fa-user-times fa-fw"></i> {$smarty.const.TXT_USERS_BAJA}
                                            : {$entidad->nombre}</h3>
                                    </div>
                                    <div class="modal-body">
                                        <p>{$smarty.const.MSG_USERS_CONFIRM_DESVINC}</p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" title="{$smarty.const.TXT_NO}" class="btn btn-danger"
                                                data-dismiss="modal"><i
                                                    class="fa fa-times fa-fw"></i> {$smarty.const.TXT_NO}</button>
                                        <button type="submit" title="{$smarty.const.TXT_SI}" class="btn btn-success"
                                                name="baja" id="baja"><i
                                                    class="fa fa-check fa-fw"></i> {$smarty.const.TXT_SI}</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /Diálogo Confirmar Baja -->

                    </form>
                {else}
                    <div class="alert alert-info alert-dismissible">
                        <i class="fa fa-info-circle fa-fw"></i>
                        {$smarty.const.MSG_UNID_NO_USERS}
                    </div>
                {/if}
            </div>
            <!-- /Usuarios asignados actualmente -->

            <!-- Usuarios disponibles -->
            <div role="tabpanel" class="tab-pane" id="user_disp">
                {if $personas}
                    <form action='index.php?page=entidad_usuarios&id_entidad={$entidad->id}'
                          method='post' name='formpoblar' class="form-horizontal">
                        <input type="hidden" name="alta" value="Alta">
                        <div class="form-group">
                            <div class="col-sm-2">
                                <a class="btn btn-danger" title="{$smarty.const.TXT_CANCEL}"
                                   href='index.php?page=entidad_mostrar&id_entidad={$entidad->id}'>
                                    <i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_CANCEL}
                                </a>
                            </div>
                            <label for="id_rol" class="col-sm-2 control-label">{$smarty.const.FIELD_ROL}</label>
                            <div class="col-sm-3">
                                <select class="form-control chosen-select" name='id_rol' id='id_rol'>
                                    {foreach from=$roles item='rol'}
                                        <option value="{$rol->id}">{$rol->nombre}</option>
                                    {/foreach }
                                </select>
                            </div>
                            <div class="col-sm-5">
                                <div class="pull-right">
                                    <button type="reset" class="btn btn-warning" title="{$smarty.const.TXT_RESET}">
                                        <i class="fa fa-refresh fa-fw"></i> {$smarty.const.TXT_RESET}
                                    </button>
                                    <button title="{$smarty.const.TXT_USERS_ASIGNAR}" type="button"
                                            class="btn btn-success" data-toggle="modal"
                                            data-target="#dialogo_confirmar_alta">
                                        <i class="fa fa-user-plus fa-fw"></i> {$smarty.const.TXT_USERS_ASIGNAR}
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table datatable table-striped table-hover">
                                <thead>
                                <tr>
                                    <th></th>
                                    <th>{$smarty.const.FIELD_NOMBRE}</th>
                                    <th>{$smarty.const.FIELD_APEL}</th>
                                    <th>{$smarty.const.FIELD_CORREO}</th>
                                    <th>{$smarty.const.FIELD_PUESTO}</th>
                                </tr>
                                </thead>
                                <tbody>
                                {foreach from=$personas item=persona}
                                    <tr>
                                        <td><input title="{$smarty.const.TXT_SEL}" type='checkbox' name='id_usuario[]'
                                                   value='{$persona->id}'/></td>
                                        <td style="font-size: 12px">{$persona->nombre|upper}</td>
                                        <td style="font-size: 12px">{$persona->apellidos|upper}</td>
                                        <td>{$persona->correo}</td>
                                        <td>{$persona->puesto}</td>
                                    </tr>
                                {/foreach}
                                </tbody>
                            </table>
                        </div>

                        <!-- Diálogo Confirmar Alta -->
                        <div class="modal fade" id="dialogo_confirmar_alta" tabindex="-1" role="dialog"
                             aria-labelledby="myModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span></button>
                                        <h3 class="modal-title" id="myModalLabel"><i
                                                    class="fa fa-user-plus fa-fw"></i> {$smarty.const.TXT_USERS_ALTA}
                                            : {$entidad->nombre}</h3>
                                    </div>
                                    <div class="modal-body">
                                        <p>{$smarty.const.MSG_USERS_CONFIRM_VINC}</p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" title="{$smarty.const.TXT_NO}" class="btn btn-danger"
                                                data-dismiss="modal"><i
                                                    class="fa fa-times fa-fw"></i> {$smarty.const.TXT_NO}</button>
                                        <button type="submit" title="{$smarty.const.TXT_SI}" class="btn btn-success"
                                                name="alta" id="alta"><i
                                                    class="fa fa-check fa-fw"></i> {$smarty.const.TXT_SI}</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /Diálogo Confirmar Alta -->

                    </form>
                {else}
                    <div class="alert alert-info alert-dismissible">
                        <i class="fa fa-info-circle fa-fw"></i>
                        {$smarty.const.MSG_UNID_USERS_TODOS}
                    </div>
                {/if}

            </div>
            <!-- /Usuarios disponibles -->
        </div>
        <!-- /Tab panes -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->