<!-- Diálogo Confirmar Borrado proceso -->
<div class="modal fade" id="dialogo_confirmar_borrado_proceso" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h3 class="modal-title" id="myModalLabel"><i
                            class="fa fa-trash fa-fw"></i> {$smarty.const.TXT_PROC_BORRAR}: <span
                            id="nombre_proceso"></span></h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_PROC_CONFIRM_BORRAR}</p>
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
<!-- /Diálogo Confirmar Borrado proceso -->

<!-- Diálogo Confirmar Borrado indicador -->
<div class="modal fade" id="dialogo_confirmar_borrado_indicador" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h3 class="modal-title" id="myModalLabel"><i
                            class="fa fa-trash fa-fw"></i> {$smarty.const.TXT_INDIC_BORRAR}: <span
                            id="nombre_indicador"></span></h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_INDIC_CONFIRM_BORRAR}</p>
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
<!-- /Diálogo Confirmar Borrado indicador -->

<!-- Diálogo Confirmar Borrado cuadro -->
<div class="modal fade" id="dialogo_confirmar_borrado_cuadro" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h3 class="modal-title" id="myModalLabel"><i
                            class="fa fa-trash fa-fw"></i> {$smarty.const.TXT_CUADRO_BORRAR}: <span
                            id="nombre_cuadro"></span></h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_CUADRO_MANDO_CONFIRM_BORRAR}</p>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_NO}" class="btn btn-default btn-danger"
                        data-dismiss="modal"><i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_NO}</button>
                <a title="{$smarty.const.TXT_SI}" class="btn btn-default btn-success" name="borrar" id="borrar"><i
                            class="fa fa-check fa-fw"></i> {$smarty.const.TXT_SI}</a>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Confirmar Borrado cuadro -->

<!-- Diálogo Confirmar Borrado Objetivo Operacional -->
<div class="modal fade" id="dialogo_confirmar_borrado_objop" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel"><i
                            class="fa fa-trash fa-fw"></i> {$smarty.const.TXT_OBJOP_BORRAR}: <span
                            id="nombre_objop"></span></h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_OBJOP_CONFIRM_BORRAR}</p>
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
<!-- /Diálogo Confirmar Borrado Objetivo Operacional -->

<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <div class="page-header">
            <div class="row">
                <div class="col-md-10">
                    <i class="fa fa-user fa-fw"></i> {$_nombre_pagina}
                </div>
                <!-- /.col-md-10 -->
                <!-- Navegación -->
                {if count($usuarios)> 1}
                    <div class="col-md-2">
                        <div style="font-size:10px">{$indice+1} {$smarty.const.TXT_DE} {count($usuarios)} {$smarty.const.TXT_USERS}</div>
                        <div class="btn-toolbar" role="toolbar" aria-label="">
                            <div class="btn-group" role="group" aria-label="">
                                <a title="{$smarty.const.TXT_PRIMER} {$smarty.const.FIELD_USER}"
                                   class="btn btn-danger btn-xs {if $indice == 0}disabled{/if}"
                                   href='index.php?page=usuario_mostrar&id_usuario={$usuarios[0]->id}'>
                                    <i class="fa fa-step-backward fa-fw"></i>
                                </a>
                                <a title="{$smarty.const.TXT_ANT} {$smarty.const.FIELD_USER}"
                                   class="btn btn-danger btn-xs {if $indice == 0}disabled" href="#"{else}"
                                   href='index.php?page=usuario_mostrar&id_usuario={$usuarios[$indice-1]->id}'{/if}>
                                    <i class="fa fa-play fa-rotate-180 fa-fw"></i>
                                </a>
                                <a title="{$smarty.const.TXT_SIG} {$smarty.const.FIELD_USER}"
                                   class="btn btn-danger btn-xs {if $indice == (count($usuarios)-1)}disabled" href="#"{else}"
                                   href='index.php?page=usuario_mostrar&id_usuario={$usuarios[$indice+1]->id}'{/if}>
                                    <i class="fa fa-play fa-fw"></i>
                                </a>
                                <a title="{$smarty.const.TXT_ULTIMO} {$smarty.const.FIELD_USER}"
                                   class="btn btn-danger btn-xs {if $indice == (count($usuarios)-1)}disabled{/if}"
                                   href='index.php?page=usuario_mostrar&id_usuario={$usuarios[(count($usuarios)-1)]->id}'>
                                    <i class="fa fa-step-forward fa-fw"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                    <!-- /.col-md-2 -->
                {/if}
                <!-- /Navegación -->
            </div>
            <!-- /.row -->
        </div>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- /Nombre página -->

<!-- Breadcrumbs -->
<div class="row">
    <div class="col-lg-12">
        <ol class="breadcrumb">
            <li><i title="{$smarty.const.TXT_ESTA}" class="fa fa-map-marker fa-fw"></i></li>
            <li><a title="{$smarty.const.TXT_USERS}" href='index.php?page=usuario_listar'>{$smarty.const.TXT_USERS}</a>
            </li>
            <li title="{$_nombre_pagina}" class="active">{$_nombre_pagina}</li>
        </ol>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- /Breadcrumbs -->

{if $_usuario->id == $persona->id || $admin}
    <div class="row">
        <div class="col-lg-12">
            <!-- Nav tabs -->
            <ul class="nav nav-tabs" role="tablist">
                {if $_usuario->id == $persona->id}
                    <li role="presentation" class="active">
                        <a href="#user" title="{$smarty.const.TXT_FICHA}" aria-controls="{$smarty.const.TXT_FICHA}"
                           role="tab" data-toggle="tab"><i class="fa fa-folder fa-fw"></i> {$smarty.const.TXT_FICHA}</a>
                    </li>
                    <li role="presentation">
                        <a href="#user_unids" title="{$smarty.const.TXT_USER_UNIDS}"
                           aria-controls="{$smarty.const.TXT_USER_UNIDS}" role="tab" data-toggle="tab"><i
                                    class="fa fa-sitemap fa-fw"></i><sub
                                    class="fa fa-user fa-fw"></sub> {$smarty.const.TXT_USER_UNIDS}</a>
                    </li>
                    <li role="presentation">
                        <a href="#user_procs" title="{$smarty.const.TXT_USER_PROCS}"
                           aria-controls="{$smarty.const.TXT_USER_PROCS}" role="tab" data-toggle="tab"><i
                                    class="fa fa-gears fa-fw"></i><sub
                                    class="fa fa-user fa-fw"></sub> {$smarty.const.TXT_USER_PROCS}</a>
                    </li>
                    <li role="presentation">
                        <a href="#user_indic" title="{$smarty.const.TXT_USER_INDIC}"
                           aria-controls="{$smarty.const.TXT_USER_INDIC}" role="tab" data-toggle="tab"><i
                                    class="fa fa-dashboard fa-fw"></i><sub
                                    class="fa fa-user fa-fw"></sub> {$smarty.const.TXT_USER_INDIC}</a>
                    </li>
                    <li role="presentation">
                        <a href="#user_cuadro" title="{$smarty.const.TXT_USER_CUADROS}"
                           aria-controls="{$smarty.const.TXT_USER_CUADROS}" role="tab" data-toggle="tab"><i
                                    class="fa fa-th fa-fw"></i><sub
                                    class="fa fa-user fa-fw"></sub> {$smarty.const.TXT_USER_CUADROS}</a>
                    </li>
                    <li role="presentation">
                        <a href="#user_objops" title="{$smarty.const.TXT_USER_OBJOPS}"
                           aria-controls="{$smarty.const.TXT_USER_OBJOPS}" role="tab" data-toggle="tab"><i
                                    class="fa fa-bullseye fa-fw"></i><sub
                                    class="fa fa-user fa-fw"></sub> {$smarty.const.TXT_USER_OBJOPS}</a>
                    </li>
                {else}
                    <li role="presentation" class="active">
                        <a href="#user" title="{$smarty.const.TXT_USER_PERFIL}"
                           aria-controls="{$smarty.const.TXT_USER_PERFIL}" role="tab" data-toggle="tab"><i
                                    class="fa fa-folder fa-fw"></i> {$smarty.const.TXT_USER_PERFIL}</a>
                    </li>
                    <li role="presentation">
                        <a href="#user_unids" title="{$smarty.const.FIELD_UNIDS}"
                           aria-controls="{$smarty.const.FIELD_UNIDS}" role="tab" data-toggle="tab"><i
                                    class="fa fa-sitemap fa-fw"></i><sub
                                    class="fa fa-user fa-fw"></sub> {$smarty.const.FIELD_UNIDS}</a>
                    </li>
                    <li role="presentation">
                        <a href="#user_procs" title="{$smarty.const.FIELD_PROCS}"
                           aria-controls="{$smarty.const.FIELD_PROCS}" role="tab" data-toggle="tab"><i
                                    class="fa fa-gears fa-fw"></i><sub
                                    class="fa fa-user fa-fw"></sub> {$smarty.const.FIELD_PROCS}</a>
                    </li>
                    <li role="presentation">
                        <a href="#user_indic" title="{$smarty.const.FIELD_INDICS}"
                           aria-controls="{$smarty.const.FIELD_INDICS}" role="tab" data-toggle="tab"><i
                                    class="fa fa-dashboard fa-fw"></i><sub
                                    class="fa fa-user fa-fw"></sub> {$smarty.const.FIELD_INDICS}</a>
                    </li>
                    <li role="presentation">
                        <a href="#user_cuadro" title="{$smarty.const.FIELD_CUADROS_MANDO}"
                           aria-controls="{$smarty.const.FIELD_CUADROS_MANDO}" role="tab" data-toggle="tab"><i
                                    class="fa fa-th fa-fw"></i><sub
                                    class="fa fa-user fa-fw"></sub> {$smarty.const.FIELD_CUADROS_MANDO}</a>
                    </li>
                    <li role="presentation">
                        <a href="#user_objops" title="{$smarty.const.FIELD_OBJS_OP}"
                           aria-controls="{$smarty.const.FIELD_OBJS_OP}" role="tab" data-toggle="tab"><i
                                    class="fa fa-bullseye fa-fw"></i><sub
                                    class="fa fa-user fa-fw"></sub> {$smarty.const.FIELD_OBJS_OP}</a>
                    </li>
                {/if}
            </ul>
            <!-- /Nav tabs -->
            <br>
            <!-- Tab panes -->
            <div class="tab-content">

                <!-- Perfil del usuario -->
                <div role="tabpanel" class="tab-pane active" id="user">
                    <table class="table table-striped table-hover ficha">
                        <thead>
                        <tr>
                            <th></th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th>{$smarty.const.FIELD_NOMBRE}</th>
                            <td>{$persona->nombre}</td>
                        </tr>
                        <tr>
                            <th>{$smarty.const.FIELD_APEL}</th>
                            <td>{$persona->apellidos}</td>
                        </tr>
                        <tr>
                            <th>{$smarty.const.FIELD_LOGIN}</th>
                            <td>{$persona->login}</td>
                        </tr>
                        <tr>
                            <th>{$smarty.const.FIELD_CORREO}</th>
                            <td>
                                {if $persona->correo}
                                    <a title="{$smarty.const.TXT_ENVIAR_CORREO}"
                                       href='mailto:{$persona->correo}'>{$persona->correo}</a>
                                {else}
                                    ---
                                {/if}
                            </td>
                        </tr>
                        <tr>
                            <th>{$smarty.const.FIELD_TEL}</th>
                            <td>
                                {if $persona->telefono}
                                    <a title="{$smarty.const.TXT_LLAMAR_TLF}"
                                       href='tel:+34{$persona->telefono}'>{$persona->telefono}</a>
                                {else}
                                    ---
                                {/if}
                            </td>
                        </tr>
                        <tr>
                            <th>{$smarty.const.FIELD_PUESTO}</th>
                            <td>
                                {if $persona->puesto}
                                    {$persona->puesto}
                                {else}
                                    ---
                                {/if}
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div id="botones_ficha_usuario" class="btn-toolbar hidden" role="toolbar" aria-label="">
                        <a title="{$smarty.const.TXT_USER_EDIT}" class="btn btn-default btn-danger"
                           href='index.php?page=usuario_editar&id_usuario={$persona->id}'>
                            <i class="fa fa-user fa-fw"></i><sub class="fa fa-pencil fa-fw"></sub>
                        </a>
                    </div>
                </div>
                <!-- /Perfil del usuario -->

                <!-- Unidades del usuario -->
                <div role="tabpanel" class="tab-pane" id="user_unids">
                    {if $persona->entidades}
                        <div class="table-responsive">
                            <table class="table datatable table-striped table-hover">
                                <thead>
                                <tr>
                                    <th>{$smarty.const.FIELD_COD}</th>
                                    <th>{$smarty.const.FIELD_UNID}</th>
                                    <th>{$smarty.const.FIELD_ROL}</th>
                                    <th>{$smarty.const.FIELD_ACCIONES}</th>
                                </tr>
                                </thead>
                                <tbody>
                                {foreach from=$persona->entidades item=entidad}
                                    <tr>
                                        <td><span class="label label-primary">{$entidad->entidad->codigo}</span></td>
                                        <td>{if $entidad->principal}<i title="{$smarty.const.TXT_UNID_PRINCIPAL}"
                                                                       class="fa fa-star fa-fw"></i>{else}<i
                                                title="{$smarty.const.TXT_UNID_ASIG_PRINCIPAL}"
                                                data-id_usuario="{$persona->id}" data-id_user_unid="{$entidad->id}"
                                                class="fa fa-star-o fa-fw principal clickable"></i>{/if} <a
                                                    title="{$entidad->entidad->nombre}"
                                                    href='index.php?page=entidad_mostrar&id_entidad={$entidad->entidad->id}'>{$entidad->entidad->nombre}</a>
                                        </td>
                                        <td>{$entidad->rol->nombre}</td>
                                        <td>
                                            <a class="btn btn-default btn-circle btn-xs"
                                               title="{$smarty.const.TXT_FICHA}"
                                               href='index.php?page=entidad_mostrar&id_entidad={$entidad->entidad->id}'><i
                                                        class="fa fa-folder fa-fw"></i></a>
                                            <a class="btn btn-default btn-circle btn-xs"
                                               title="{$smarty.const.FIELD_PLANES}"
                                               href='index.php?page=plan_listar&id_entidad={$entidad->entidad->id}'><i
                                                        class="fa fa-book fa-fw"></i></a>
                                            <a class="btn btn-default btn-circle btn-xs"
                                               title="{$smarty.const.FIELD_CARTAS}"
                                               href='index.php?page=carta_listar&id_entidad={$entidad->entidad->id}'><i
                                                        class="fa fa-map-o fa-fw"></i></a>
                                            <a class="btn btn-default btn-circle btn-xs"
                                               title="{$smarty.const.FIELD_PROCS}"
                                               href='index.php?page=proceso_listar&id_entidad={$entidad->entidad->id}'><i
                                                        class="fa fa-gears fa-fw"></i></a>
                                            <a class="btn btn-default btn-circle btn-xs"
                                               title="{$smarty.const.FIELD_INDICS}"
                                               href='index.php?page=indicador_listar&id_entidad={$entidad->entidad->id}'><i
                                                        class="fa fa-dashboard fa-fw"></i></a>
                                            <a class="btn btn-default btn-circle btn-xs"
                                               title="{$smarty.const.FIELD_CUADROS_MANDO}"
                                               href='index.php?page=cuadro_listar&id_entidad={$entidad->entidad->id}'><i
                                                        class="fa fa-th fa-fw"></i></a>
                                            <a class="btn btn-default btn-circle btn-xs"
                                               title="{$smarty.const.TXT_CONSULT}"
                                               href='index.php?page=consulta_avanzada&id_entidad={$entidad->entidad->id}'><i
                                                        class="fa fa-commenting fa-fw"></i></a>
                                            <a class="btn btn-default btn-circle btn-xs"
                                               title="{$smarty.const.TXT_CONTROL}"
                                               href='index.php?page=control&modulo=inicio&id_entidad={$entidad->entidad->id}'><i
                                                        class="fa fa-sliders fa-fw"></i></a>
                                        </td>
                                    </tr>
                                {/foreach}
                                </tbody>
                            </table>
                        </div>
                    {else}
                        <div class="alert alert-info alert-dismissible">
                            <i class="fa fa-info-circle fa-fw"></i>
                            {$smarty.const.MSG_UNID_NO_ASIG}
                        </div>
                    {/if}
                </div>
                <!-- /Unidades del usuario -->

                <!-- Procesos del usuario -->
                <div role="tabpanel" class="tab-pane" id="user_procs">
                    {if $procesos_propios}
                        <div class="table-responsive">
                            <table class="table datatable table-striped table-hover">
                                <thead>
                                <tr>
                                    <th>{$smarty.const.FIELD_COD}</th>
                                    <th>{$smarty.const.FIELD_PROC}</th>
                                    <th>{$smarty.const.FIELD_UNID}</th>
                                    <th>{$smarty.const.FIELD_TIPO_PROC}</th>
                                    <th>{$smarty.const.FIELD_PROC_MADRE}</th>
                                    <th>{$smarty.const.FIELD_ACCIONES}</th>
                                </tr>
                                </thead>
                                <tbody>
                                {foreach from=$procesos_propios item=proceso}
                                    <tr>
                                        <td><span class="label label-primary">{$proceso->codigo}</span></td>
                                        <td>
                                            <a title="{$proceso->nombre}: {$proceso->mision|replace:"\r\n":" "}"
                                               href="index.php?page=proceso_mostrar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}">
                                                {$proceso->nombre}
                                            </a>
                                        </td>
                                        <td><a title="{$smarty.const.TXT_FICHA}"
                                               href='index.php?page=entidad_mostrar&id_entidad={$proceso->entidad->id}'>{$proceso->entidad->etiqueta}</a>
                                        </td>
                                        <td>{$proceso->alcance}</td>
                                        <td>
                                            {if $proceso->madre}
                                                <a title="{$proceso->madre->nombre}"
                                                   href="index.php?page=proceso_mostrar&id_proceso={$proceso->madre->id}&id_entidad={$proceso->madre->id_entidad}">
                                                    {$proceso->madre->nombre}
                                                </a>
                                            {else}
                                                ---
                                            {/if}
                                        </td>
                                        <td>
                                            <a class="btn btn-default btn-circle btn-xs"
                                               title="{$smarty.const.TXT_FICHA}"
                                               href="index.php?page=proceso_mostrar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}">
                                                <i class="fa fa-folder fa-fw"></i>
                                            </a>
                                            <a class="btn btn-default btn-circle btn-xs"
                                               title="{$smarty.const.TXT_ARCHIVOS_GESTION}"
                                               href='index.php?page=archivo_gestionar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}'>
                                                <i class="fa fa-archive fa-fw"></i>
                                            </a>
                                            <a class="btn btn-default btn-circle btn-xs"
                                               title="{$smarty.const.TXT_EDIT}"
                                               href='index.php?page=proceso_editar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}'>
                                                <i class="fa fa-pencil fa-fw"></i>
                                            </a>
                                            <a class="btn btn-default btn-circle btn-xs"
                                               title="{$smarty.const.TXT_BORRAR}"
                                               href='javascript:void(0)' data-toggle="modal"
                                               data-target="#dialogo_confirmar_borrado_proceso"
                                               data-id_proceso="{$proceso->id}" data-nombre_proceso="{$proceso->nombre}"
                                               data-id_entidad="{$proceso->id_entidad}">
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

                <!-- Indicadores del usuario -->
                <div role="tabpanel" class="tab-pane" id="user_indic">
                    {if $indicadores_propios}
                        <div class="table-responsive">
                            <table class="table table-condensed datatable table-striped table-hover">
                                <thead>
                                <tr>
                                    <th>{$smarty.const.FIELD_COD}</th>
                                    <th></th>
                                    <th></th>
                                    <th>{$smarty.const.FIELD_INDIC}</th>
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
                                {foreach from=$indicadores_propios item=indicador}
                                    <tr {if isset($status[$indicador->id])}class="{$status[$indicador->id]}"{/if}>
                                        <td><span class="label label-primary">{$indicador->codigo}</span></td>
                                        <td>
                                            {if $indicador->calculo}
                                                <i class="fa fa-calculator fa-fw"
                                                   title="{$smarty.const.TXT_CALC_AUTO}: {$indicador->calculo}"></i>
                                            {/if}
                                        </td>
                                        <td>
                                            {if $indicador->id_tipo_agregacion!= 0}
                                                <i class="fa fa-sitemap fa-fw" title="{$smarty.const.FIELD_AGREG}"></i>
                                            {/if}
                                        </td>
                                        <td>
                                            <a target="_blank"
                                               href='index.php?page=indicador_mostrar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'
                                               title="{$indicador->nombre}: {$indicador->descripcion|replace:"\r\n":" "}">
                                                {$indicador->nombre}</a>
                                        </td>
                                        <td><a title="{$smarty.const.TXT_FICHA}"
                                               href='index.php?page=entidad_mostrar&id_entidad={$indicador->id_entidad}'>{$indicador->entidad->etiqueta}</a>
                                        </td>
                                        <td>{$indicador->periodicidad}</td>
                                        <td style="font-size: 12px">
                                            <a title="{$smarty.const.TXT_USER_PERFIL}"
                                               href='index.php?page=usuario_mostrar&id_usuario={$indicador->id_responsable}'>
                                                {$indicador->responsable->nombre} {$indicador->responsable->apellidos}</a>
                                        </td>
                                        <td style="font-size: 12px">
                                            <a title="{$smarty.const.TXT_USER_PERFIL}"
                                               href='index.php?page=usuario_mostrar&id_usuario={$indicador->id_responsable_medicion}'>
                                                {$indicador->responsable_medicion->nombre} {$indicador->responsable_medicion->apellidos}</a>
                                        </td>
                                        <td>{if $indicador->medicion->etiqueta}{$indicador->medicion->etiqueta}{else}---{/if}</td>
                                        <td style="white-space: nowrap">
                                            {if ($totales[$indicador->id])!== NULL}
                                                {if isset($status[$indicador->id])}
                                                    {if $status[$indicador->id] == 'danger'}
                                                        <span title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_MEJORABLE} ({$smarty.const.FIELD_LIMITE}: {$medicion_lim[$indicador->id]}, {$smarty.const.FIELD_META}: {$medicion_obj[$indicador->id]})"
                                                              class="label label-{$status[$indicador->id]}">{$totales[$indicador->id]|round:"2"}</span>
                                                    {elseif $status[$indicador->id] == 'success'}
                                                        <span title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_LOGRADO} ({$smarty.const.FIELD_LIMITE}: {$medicion_lim[$indicador->id]}, {$smarty.const.FIELD_META}: {$medicion_obj[$indicador->id]})"
                                                              class="label label-{$status[$indicador->id]}">{$totales[$indicador->id]|round:"2"}</span>
                                                    {else}
                                                        <span title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_ACEPTABLE} ({$smarty.const.FIELD_LIMITE}: {$medicion_lim[$indicador->id]}, {$smarty.const.FIELD_META}: {$medicion_obj[$indicador->id]})"
                                                              class="label label-{$status[$indicador->id]}">{$totales[$indicador->id]|round:"2"}</span>
                                                    {/if}
                                                {else}
                                                    <span class="label label-default">{$totales[$indicador->id]|round:"2"}</span>
                                                {/if}
                                            {else}
                                                ---
                                            {/if}
                                            {if $indicador->medicion->etiqueta}
                                                <a class="btn btn-default btn-circle btn-xs"
                                                   href="index.php?page=medicion&id_medicion={$indicador->medicion->id}&id_entidad={$indicador->id_entidad}#med_valores">
                                                    {if $indicador->calculo}
                                                        <i title='{$smarty.const.TXT_MED_VER}'
                                                           class="fa fa-pencil fa-fw"></i>
                                                    {else}
                                                        <i title='{$smarty.const.TXT_GRABAR}'
                                                           class="fa fa-floppy-o fa-fw"></i>
                                                    {/if}
                                                </a>
                                            {/if}
                                        </td>
                                        <td>
                                            <a class="btn btn-default btn-circle btn-xs"
                                               title="{$smarty.const.TXT_FICHA}" target="_blank"
                                               href='index.php?page=indicador_mostrar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                                                <i class="fa fa-folder fa-fw"></i>
                                            </a>
                                            <a class="btn btn-default btn-circle btn-xs"
                                               title="{$smarty.const.TXT_REP_GRAFIC}" target="_blank"
                                               href='index.php?page=graficas_mostrar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                                                <i class="fa fa-area-chart fa-fw"></i>
                                            </a>
                                            <a class="btn btn-default btn-circle btn-xs"
                                               href='index.php?page=medicion_listar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'
                                               title="{$smarty.const.FIELD_MEDICIONES}" target="_blank">
                                                <i class="fa fa-hourglass fa-fw"></i>
                                            </a>
                                            <a class="btn btn-default btn-circle btn-xs"
                                               title="{$smarty.const.TXT_ANALISIS}"
                                               href='index.php?page=analisis&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'
                                               target="_blank">
                                                <i class="fa fa-connectdevelop fa-fw"></i>
                                            </a>
                                            <a class="btn btn-default btn-circle btn-xs"
                                               title="{$smarty.const.TXT_VAL_REF}"
                                               href='index.php?page=valor_referencia&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'
                                               target="_blank">
                                                <i class="fa fa-tags fa-fw"></i>
                                            </a>
                                            {if $_control OR $_usuario->id==$indicador->id_responsable OR $permiso_proceso[$indicador->id]}
                                                <a class="btn btn-default btn-circle btn-xs"
                                                   title="{$smarty.const.TXT_EDIT}"
                                                   href='index.php?page=indicador_editar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'
                                                   target="_blank">
                                                    <i class="fa fa-pencil fa-fw"></i>
                                                </a>
                                                <a class="btn btn-default btn-circle btn-xs"
                                                   title="{$smarty.const.TXT_VAL_EDIT}"
                                                   href='index.php?page=valores&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'
                                                   target="_blank">
                                                    <i class="fa fa-pencil-square-o fa-fw"></i>
                                                </a>
                                                <a class="btn btn-default btn-circle btn-xs"
                                                   title="{$smarty.const.FIELD_RESP_MED}"
                                                   href='index.php?page=medicion_responsable&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'
                                                   target="_blank">
                                                    <i class="fa fa-user fa-fw"></i>
                                                </a>
                                                <a class="btn btn-default btn-circle btn-xs"
                                                   title="{$smarty.const.TXT_BORRAR}" href='javascript:void(0)'
                                                   data-toggle="modal"
                                                   data-target="#dialogo_confirmar_borrado_indicador"
                                                   data-id_indicador="{$indicador->id}"
                                                   data-nombre_indicador="{$indicador->nombre}"
                                                   data-id_entidad="{$indicador->id_entidad}">
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
                            {$smarty.const.MSG_INDIC_NO_ASIG}
                        </div>
                    {/if}
                </div>
                <!-- /Indicadores del usuario -->

                <!-- Cuadros de mando del usuario -->
                <div role="tabpanel" class="tab-pane" id="user_cuadro">
                    {if $cuadros_propios|count > 0}
                        <div class="table-responsive">
                            <table class="table datatable table-striped table-hover">
                                <thead>
                                <tr>
                                    <th>{$smarty.const.FIELD_CUADRO_MANDO}</th>
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
                                            <a title="{$cuadro->nombre}"
                                               href="index.php?page=cuadro_mostrar&id={$cuadro->id}&id_entidad={$cuadro->id_entidad}">{$cuadro->nombre}</a>
                                        </td>
                                        <td><a title="{$smarty.const.TXT_FICHA}"
                                               href='index.php?page=entidad_mostrar&id_entidad={$cuadro->entidad->id}'>{$cuadro->entidad->etiqueta}</a>
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
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_VER}"
                                               href="index.php?page=cuadro_mostrar&id={$cuadro->id}&id_entidad={$cuadro->id_entidad}"><i
                                                        class="fa fa-th fa-fw"></i></a>
                                            <a class="btn btn-default btn-circle btn-xs"
                                               title="{$smarty.const.TXT_EDIT}"
                                               href='index.php?page=cuadro_editar&id_cuadro={$cuadro->id}&id_entidad={$cuadro->id_entidad}'><i
                                                        class="fa fa-pencil fa-fw"></i></a>
                                            <a class="btn btn-default btn-circle btn-xs" data-toggle="modal"
                                               data-target="#dialogo_confirmar_borrado_cuadro"
                                               title="{$smarty.const.TXT_BORRAR}" data-nombre_cuadro="{$cuadro->nombre}"
                                               data-id_cuadro="{$cuadro->id}"
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

                <!-- Objetivos operacionales del usuario -->
                <div role="tabpanel" class="tab-pane" id="user_objops">
                    {if $objops_propios}
                        <div class="table-responsive">
                            <table class="table datatable table-striped table-hover">
                                <thead>
                                <tr>
                                    <th>{$smarty.const.FIELD_INDICE}</th>
                                    <th></th>
                                    <th>{$smarty.const.FIELD_OBJ_OP}</th>
                                    <th>{$smarty.const.FIELD_PLAN}</th>
                                    <th>{$smarty.const.FIELD_UNID}</th>
                                    <th>{$smarty.const.FIELD_DURACION}</th>
                                    <th>{$smarty.const.FIELD_EJECUCION}</th>
                                    <th>Nº {$smarty.const.FIELD_UNIDS}</th>
                                    <th>{$smarty.const.FIELD_ACCIONES}</th>
                                </tr>
                                </thead>
                                <tbody>
                                {foreach from=$objops_propios item=objop}
                                    <tr>
                                        <td>
                                            <span class="label label-default">{$objop->objest->linea->indice}
                                                .{$objop->objest->indice}.{$objop->indice}</span>
                                        </td>
                                        <td>
                                            {if $objop->descendente}
                                                <i class="fa fa-sitemap fa-fw"
                                                   title="{$smarty.const.TXT_OBJOP_DESC}"></i>
                                            {/if}
                                        </td>
                                        <td>
                                            <a title="{$smarty.const.TXT_FICHA}"
                                               href="index.php?page=objop_mostrar&id_objop={$objop->id}&id_entidad={$objop->objest->linea->plan->id_entidad}">{$objop->nombre}</a>
                                        </td>
                                        <td>
                                            <a title="{$smarty.const.TXT_FICHA}"
                                               href="index.php?page=plan_mostrar&id_plan={$objop->objest->linea->id_plan}&id_entidad={$objop->objest->linea->plan->id_entidad}">{$objop->objest->linea->plan->anyo_inicio}
                                                - {$objop->objest->linea->plan->anyo_inicio + $objop->objest->linea->plan->duracion - 1}</a>
                                        </td>
                                        <td><a title="{$smarty.const.TXT_FICHA}"
                                               href='index.php?page=entidad_mostrar&id_entidad={$objop->objest->linea->plan->id_entidad}'>{$objop->objest->linea->plan->entidad->etiqueta}</a>
                                        </td>
                                        <td>
                                            {if $objops_anyos[$objop->id]}
                                                {foreach $objops_anyos[$objop->id] as $anyo}
                                                    {if $anyo@first}
                                                        {$anyo}{$escrito=true}
                                                    {elseif $anyo_anterior+1 == $anyo and !$anyo@last}
                                                        {$escrito=false}
                                                    {elseif $anyo_anterior+1 != $anyo and !$escrito}
                                                        - {$anyo_anterior}, {$anyo}
                                                        {$escrito=true}
                                                    {elseif $anyo_anterior+1 != $anyo}
                                                        , {$anyo}
                                                        {$escrito=true}
                                                    {elseif $anyo@last && $objops_anyos[$objop->id]|@count>1}
                                                        - {$anyo}
                                                    {/if}
                                                    {$anyo_anterior=$anyo}
                                                {/foreach}
                                            {else}
                                                ---
                                            {/if}
                                        </td>
                                        <td style="white-space:nowrap">
                                            <div class="progress">
                                                <div class="progress-bar {if $objop->ejecucion|round:"2" < 25}progress-bar-danger{elseif $objop->ejecucion|round:"2" >= 25 && $objop->ejecucion|round:"2" < 75}progress-bar-warning{elseif $objop->ejecucion|round:"2" == 100}progress-bar-success{/if}"
                                                     role="progressbar" aria-valuenow="{$objop->ejecucion|round:"2"}"
                                                     aria-valuemin="0" aria-valuemax="100"
                                                     style="min-width: 4em;width:{$objop->ejecucion|round:"2"}%">
                                                    {$objop->ejecucion|round:"2"} %
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            {if $objop->descendente}
                                                {$objops_unids[$objop->id]|@count}
                                            {else}
                                                1
                                            {/if}
                                        </td>
                                        <td>
                                            <a class="btn btn-default btn-circle btn-xs"
                                               title="{$smarty.const.TXT_FICHA}"
                                               href="index.php?page=objop_mostrar&id_objop={$objop->id}&id_entidad={$objop->objest->linea->plan->id_entidad}">
                                                <i class="fa fa-folder fa-fw"></i>
                                            </a>
                                            <a class="btn btn-default btn-circle btn-xs"
                                               title="{$smarty.const.TXT_EDIT}"
                                               href="index.php?page=objop_editar&id_objop={$objop->id}&id_entidad={$objop->objest->linea->plan->id_entidad}">
                                                <i class="fa fa-pencil fa-fw"></i>
                                            </a>
                                            <a class="btn btn-default btn-circle btn-xs"
                                               title="{$smarty.const.TXT_OBJOP_BORRAR}" href='javascript:void(0)'
                                               data-toggle="modal" data-target="#dialogo_confirmar_borrado_objop"
                                               data-id_entidad="{$objop->objest->linea->plan->id_entidad}"
                                               data-nombre="{$objop->objest->linea->indice}.{$objop->objest->indice}.{$objop->indice}. {$objop->nombre}"
                                               data-id_objop="{$objop->id}">
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
                            {$smarty.const.MSG_OBJOP_NO_ASIG}
                        </div>
                    {/if}
                </div>
                <!-- /Objetivos operacionales del usuario -->

            </div>
            <!-- /Tab panes -->
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
{else}
    <div class="row">
        <div class="col-lg-12">
            <table class="table table-striped table-hover ficha">
                <thead>
                <tr>
                    <th>&nbsp;</th>
                </tr>
                <tr>
                    <th>&nbsp;</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th>{$smarty.const.FIELD_NOMBRE}</th>
                    <td>{$persona->nombre}</td>
                </tr>
                <tr>
                    <th>{$smarty.const.FIELD_APEL}</th>
                    <td>{$persona->apellidos}</td>
                </tr>
                <tr>
                    <th>{$smarty.const.FIELD_LOGIN}</th>
                    <td>{$persona->login}</td>
                </tr>
                <tr>
                    <th>{$smarty.const.FIELD_CORREO}</th>
                    <td>
                        {if $persona->correo}
                            <a title="{$smarty.const.TXT_ENVIAR_CORREO}"
                               href='mailto:{$persona->correo}'>{$persona->correo}</a>
                        {else}
                            ---
                        {/if}
                    </td>
                </tr>
                <tr>
                    <th>{$smarty.const.FIELD_TEL}</th>
                    <td>
                        {if $persona->telefono}
                            <a title="{$smarty.const.TXT_LLAMAR_TLF}"
                               href='tel:+34{$persona->telefono}'>{$persona->telefono}</a>
                        {else}
                            ---
                        {/if}
                    </td>
                </tr>
                <tr>
                    <th>{$smarty.const.FIELD_PUESTO}</th>
                    <td>
                        {if $persona->puesto}
                            {$persona->puesto}
                        {else}
                            ---
                        {/if}
                    </td>
                </tr>
                </tbody>
            </table>
            {if $_usuario->id == $persona->id}
                <div id="botones_ficha" class="btn-toolbar hidden" role="toolbar" aria-label="">
                    <a title="{$smarty.const.TXT_USER_EDIT}" class="btn btn-default btn-danger"
                       href='index.php?page=usuario_editar&id_usuario={$persona->id}'>
                        <i class="fa fa-user fa-fw"></i><sub class="fa fa-pencil fa-fw"></sub>
                    </a>
                </div>
            {/if}
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
{/if}