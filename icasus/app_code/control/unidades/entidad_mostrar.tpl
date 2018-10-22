<!-- Diálogo Carga de Paneles -->
<div class="modal fade" id="dialogo_cargando_paneles" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h3 class="modal-title" id="myModalLabel"><i class="fa fa-sitemap fa-fw"></i> {$_nombre_pagina}</h3>
            </div>
            <div class="modal-body">
                <h4 class="text-center"><i class='fa fa-spinner fa-pulse'></i> {$smarty.const.MSG_PANEL_CARGANDO}</h4>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Carga de Paneles -->

<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <h3 title="{$smarty.const.FIELD_USER}: {$_usuario->login} - {$smarty.const.TXT_UNID}: {$entidad->nombre} - {$smarty.const.FIELD_ROL}: {$_rol}"
            class="page-header">
            <div class="row">
                <div class="col-md-10">
                    <i class="fa fa-sitemap fa-fw"></i>{if $principal}<sub title="{$smarty.const.TXT_UNID_PRINCIPAL}"
                                                                           class="fa fa-star fa-fw"></sub>{/if} {$smarty.const.FIELD_UNID}
                    : {$entidad->nombre} / <i class="fa fa-user fa-fw"></i> {$_rol}
                </div>
                <!-- /.col-md-10 -->
                <!-- Navegación -->
                {if count($unidades)> 1 && $entidad->es_organica}
                    <div class="col-md-2">
                        <div style="font-size:10px">{$indice+1} {$smarty.const.TXT_DE} {count($unidades)} {$smarty.const.FIELD_UNIDS}</div>
                        <div class="btn-toolbar" role="toolbar" aria-label="">
                            <div class="btn-group" role="group" aria-label="">
                                <a title="{$smarty.const.TXT_PRIMER} {$smarty.const.FIELD_UNID}"
                                   class="btn btn-danger btn-xs {if $indice == 0}disabled{/if}"
                                   href='index.php?page=entidad_mostrar&id_entidad={$unidades[0]->id}'>
                                    <i class="fa fa-step-backward fa-fw"></i>
                                </a>
                                <a title="{$smarty.const.TXT_ANT} {$smarty.const.FIELD_UNID}"
                                   class="btn btn-danger btn-xs {if $indice == 0}disabled" href="#"{else}"
                                   href='index.php?page=entidad_mostrar&id_entidad={$unidades[$indice-1]->id}'{/if}>
                                    <i class="fa fa-play fa-rotate-180 fa-fw"></i>
                                </a>
                                <a title="{$smarty.const.TXT_SIG} {$smarty.const.FIELD_UNID}"
                                   class="btn btn-danger btn-xs {if $indice == (count($unidades)-1)}disabled" href="#"{else}"
                                   href='index.php?page=entidad_mostrar&id_entidad={$unidades[$indice+1]->id}'{/if}>
                                    <i class="fa fa-play fa-fw"></i>
                                </a>
                                <a title="{$smarty.const.TXT_ULTIMO} {$smarty.const.FIELD_UNID}"
                                   class="btn btn-danger btn-xs {if $indice == (count($unidades)-1)}disabled{/if}"
                                   href='index.php?page=entidad_mostrar&id_entidad={$unidades[(count($unidades)-1)]->id}'>
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
                <a href="#unid_ficha" title="{$smarty.const.TXT_FICHA}" aria-controls="{$smarty.const.TXT_FICHA}"
                   role="tab" data-toggle="tab"><i class="fa fa-folder fa-fw"></i> {$smarty.const.TXT_FICHA}</a>
            </li>
            <li role="presentation">
                <a href="#unid_users" title="{$smarty.const.TXT_USERS}" aria-controls="{$smarty.const.TXT_USERS}"
                   role="tab" data-toggle="tab"><i class="fa fa-users fa-fw"></i> {$smarty.const.TXT_USERS}</a>
            </li>
            <li role="presentation">
                <a href="#unid_subs" title="{$smarty.const.FIELD_SUBUNIDS}"
                   aria-controls="{$smarty.const.FIELD_SUBUNIDS}" role="tab" data-toggle="tab"><i
                            class="fa fa-sitemap fa-fw"></i> {$smarty.const.FIELD_SUBUNIDS}</a>
            </li>
            <li role="presentation">
                <a href="#unid_archivos" title="{$smarty.const.TXT_ARCHIVOS}"
                   aria-controls="{$smarty.const.TXT_ARCHIVOS}" role="tab" data-toggle="tab"><i
                            class="fa fa-archive fa-fw"></i> {$smarty.const.TXT_ARCHIVOS}</a>
            </li>
            <li role="presentation">
                <a href="#unid_res"
                   title="{$smarty.const.TXT_SEGUIMIENTO} ({$smarty.const.FIELD_PROCS}, {$smarty.const.FIELD_INDICS}, {$smarty.const.FIELD_DATOS})"
                   aria-controls="{$smarty.const.TXT_SEGUIMIENTO} ({$smarty.const.FIELD_PROCS}, {$smarty.const.FIELD_INDICS}, {$smarty.const.FIELD_DATOS})"
                   role="tab" data-toggle="tab"><i class="fa fa-tasks fa-fw"></i> {$smarty.const.TXT_SEGUIMIENTO}</a>
            </li>
        </ul>
        <!-- /Nav tabs -->
        <br>
        <!-- Tab panes -->
        <div class="tab-content">

            <!-- Ficha de la unidad -->
            <div role="tabpanel" class="tab-pane active" id="unid_ficha">

                {if ($entidad->madre->id!=0 AND $entidad->madre->id!=1)}
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="alert alert-info alert-dismissible">
                                <i class="fa fa-info-circle fa-fw"></i>
                                {$smarty.const.FIELD_UNID_SUP}:
                                <a title="{$entidad->madre->nombre}"
                                   href="index.php?page=entidad_mostrar&id_entidad={$entidad->madre->id}">{$entidad->madre->nombre}</a>
                            </div>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->
                {/if}

                <div class="row">
                    <div class="col-md-6">
                        <table class="table table-striped table-hover ficha">
                            <thead>
                            <th></th>
                            <th></th>
                            </thead>
                            <tbody>
                            <tr>
                                <th>{$smarty.const.FIELD_COD}</th>
                                <td><span class="label label-primary">{$entidad->codigo}</span></td>
                            </tr>
                            <tr>
                                <th>{$smarty.const.FIELD_NOMBRE}</th>
                                <td>{$entidad->nombre}</td>
                            </tr>
                            <tr>
                                <th>{$smarty.const.FIELD_ETIQUETA} ({$smarty.const.FIELD_ETIQUETA_MINI})</th>
                                <td>{$entidad->etiqueta} ({$entidad->etiqueta_mini})</td>
                            </tr>
                            <tr>
                                <th>{$smarty.const.FIELD_UNID_SUP}</th>
                                <td>
                                    {if $entidad->madre->id !=0 && $entidad->madre->id !=1}
                                        <a title="{$entidad->madre->nombre}"
                                           href="index.php?page=entidad_mostrar&id_entidad={$entidad->madre->id}">{$entidad->madre->nombre}</a>
                                    {else}
                                        ---
                                    {/if}
                                </td>
                            </tr>
                            <tr>
                                <th>{$smarty.const.FIELD_WEB}</th>
                                <td>
                                    {if $entidad->web}
                                        <a title="{$entidad->web}" href='{$entidad->web}'
                                           target="_blank">{$entidad->web}</a>
                                    {else}
                                        ---
                                    {/if}
                                </td>
                            </tr>
                            <tr>
                                <th>{$smarty.const.FIELD_ORGANICA}</th>
                                <td>
                                    {if $_control}
                                        <input data-id_entidad="{$entidad->id}" type="checkbox" class="grafica"
                                               data-toggle="toggle" data-on="{$smarty.const.TXT_SI}"
                                               data-onstyle="success" data-offstyle="danger" data-size="mini"
                                               data-off="{$smarty.const.TXT_NO}" {if $entidad->es_organica}checked{/if}
                                               id="organica">
                                    {else}
                                        <input type="checkbox" data-toggle="toggle" data-on="{$smarty.const.TXT_SI}"
                                               data-onstyle="success" data-offstyle="danger" data-size="mini"
                                               data-off="{$smarty.const.TXT_NO}" {if $entidad->es_organica}checked{/if}
                                               disabled>
                                    {/if}
                                </td>
                            </tr>
                            <tr>
                                <th>{$smarty.const.FIELD_ANOTACION}</th>
                                <td>
                                    {if $entidad->anotaciones}
                                        {$entidad->anotaciones|nl2br}
                                    {else}
                                        ---
                                    {/if}
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        {if $_control}
                            <div id="botones_ficha" class="btn-toolbar hidden" role="toolbar" aria-label="">
                                <a title="{$smarty.const.TXT_UNID_EDIT}" class="btn btn-default btn-danger"
                                   href='index.php?page=entidad_editar&id_entidad={$entidad->id}'>
                                    <i class="fa fa-sitemap fa-fw"></i><sub class="fa fa-pencil fa-fw"></sub>
                                </a>
                            </div>
                        {/if}
                    </div>
                    <!-- /.col-md-6 -->
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-6">
                                <a title="{$smarty.const.TXT_PLANES_DESCRIPCION}"
                                   href="index.php?page=plan_listar&id_entidad={$entidad->id}">
                                    <div class="panel panel-resumen">
                                        <div class="panel-heading">
                                            <div class="row">
                                                <div class="col-xs-12 text-center">
                                                    <i class="fa fa-book fa-2x"></i>
                                                    <span class="huge counter">{$num_planes}</span>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-xs-12 text-center">
                                                    <span class="h4">{$smarty.const.FIELD_PLANES}</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <!-- /.col-md-6 -->
                            <div class="col-md-6">
                                <a title="{$smarty.const.TXT_CARTAS_DESCRIPCION}"
                                   href="index.php?page=carta_listar&id_entidad={$entidad->id}">
                                    <div class="panel panel-resumen">
                                        <div class="panel-heading">
                                            <div class="row">
                                                <div class="col-xs-12 text-center">
                                                    <i class="fa fa-map-o fa-2x"></i>
                                                    <span class="huge counter">{$num_cartas}</span>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-xs-12 text-center">
                                                    <span class="h4">{$smarty.const.FIELD_CARTAS}</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <!-- /.col-md-6 -->
                        </div>
                        <!-- /.row -->
                        <div class="row">
                            <div class="col-md-6">
                                <a title="{$smarty.const.TXT_PROCS_DESCRIPCION}"
                                   href="index.php?page=proceso_listar&id_entidad={$entidad->id}">
                                    <div class="panel panel-resumen">
                                        <div class="panel-heading">
                                            <div class="row">
                                                <div class="col-xs-12 text-center">
                                                    <i class="fa fa-gears fa-2x"></i>
                                                    <span class="huge counter">{$num_procesos}</span>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-xs-12 text-center">
                                                    <span class="h4">{$smarty.const.FIELD_PROCS}</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <!-- /.col-md-6 -->
                            <div class="col-md-6">
                                <a title="{$smarty.const.TXT_INDICS_DESCRIPCION}"
                                   href="index.php?page=indicador_listar&id_entidad={$entidad->id}">
                                    <div class="panel panel-resumen">
                                        <div class="panel-heading">
                                            <div class="row">
                                                <div class="col-xs-12 text-center">
                                                    <i class="fa fa-dashboard fa-2x"></i>
                                                    <span class="huge counter">{$num_indicadores}</span>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-xs-12 text-center">
                                                    <span class="h4">{$smarty.const.FIELD_INDICS}
                                                        /{$smarty.const.FIELD_DATOS}</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <!-- /.col-md-6 -->
                        </div>
                        <!-- /.row -->
                        <div class="row">
                            <div class="col-md-12">
                                <a title="{$smarty.const.TXT_CUADRO_MANDO_DESCRIPCION}"
                                   href='index.php?page=cuadro_listar&id_entidad={$entidad->id}'>
                                    <div class="panel panel-resumen">
                                        <div class="panel-heading">
                                            <div class="row">
                                                <div class="col-xs-12 text-center">
                                                    <i class="fa fa-th fa-2x"></i>
                                                    <span class="huge counter">{$num_cuadros}</span>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-xs-12 text-center">
                                                    <span class="h4">{$smarty.const.FIELD_CUADROS_MANDO}</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <!-- /.col-md-6 -->
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.col-md-6 -->
                </div>
                <!-- /.row -->
                <div class="row">
                    <div class="col-md-4">
                        <a title="{$smarty.const.TXT_CONSULTA_DESCRIPCION}" class="btn btn-danger btn-block"
                           href="index.php?page=consulta_avanzada&id_entidad={$entidad->id}">
                            <h4><i class="fa fa-commenting fa-fw"></i> {$smarty.const.TXT_CONSULT}</h4>
                        </a>
                    </div>
                    <!-- /.col-md-4 -->
                    <div class="col-md-4">
                        <a title="{$smarty.const.TXT_INICIO_DESCRIPCION}" class="btn btn-danger btn-block"
                           href='index.php?page=inicio'>
                            <h4><i class="fa fa-home fa-fw"></i> {$smarty.const.TXT_INICIO}</h4>
                        </a>
                    </div>
                    <!-- /.col-md-4 -->
                    <div class="col-md-4">
                        <a title="{$smarty.const.TXT_CONTROL_DESCRIPCION}" class="btn btn-danger btn-block"
                           href="index.php?page=control&modulo=inicio&id_entidad={$entidad->id}">
                            <h4><i class="fa fa-sliders fa-fw"></i> {$smarty.const.TXT_CONTROL}</h4>
                        </a>
                    </div>
                    <!-- /.col-md-4 -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /Ficha de la unidad -->

            <!-- Usuarios de la unidad -->
            <div role="tabpanel" class="tab-pane" id="unid_users">
                {if $_control}
                    <div id="botones_user" class="btn-toolbar hidden" role="toolbar" aria-label="">
                        <div class="btn-group" role="group" aria-label="">
                            <a title="{$smarty.const.TXT_USER_GESTION}" class="btn btn-default btn-danger"
                               href='index.php?page=entidad_usuarios&id_entidad={$entidad->id}'>
                                <i class="fa fa-users fa-fw"></i><sub class="fa fa-pencil fa-fw"></sub>
                            </a>
                        </div>
                    </div>
                {/if}
                {if $usuarios}
                    <div class="table-responsive">
                        <table id="tabla_usuarios" class="table datatable table-striped table-hover">
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
                                        <a title="{$smarty.const.TXT_USER_PERFIL}"
                                           href='index.php?page=usuario_mostrar&id_usuario={$usuario->usuario->id}'>
                                            {$usuario->usuario->login}
                                        </a>
                                    </td>
                                    <td>{$usuario->rol->nombre}</td>
                                    <td style="font-size: 12px">{$usuario->usuario->nombre}</td>
                                    <td style="font-size: 12px">{$usuario->usuario->apellidos}</td>
                                    <td><a title="{$smarty.const.TXT_ENVIAR_CORREO}"
                                           href='mailto:{$usuario->usuario->correo}'>{$usuario->usuario->correo}</a>
                                    </td>
                                    <td>{$usuario->usuario->telefono}</td>
                                    <td>
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
                {else}
                    <div class="row">
                        <div class="col-sm-11">
                            <div class="alert alert-info alert-dismissible">
                                <i class="fa fa-info-circle fa-fw"></i>
                                {$smarty.const.MSG_UNID_NO_USERS}
                            </div>
                        </div>
                        <!-- /.col-sm-11 -->
                        <div class="col-sm-1">
                            {if $_control}
                                <div class="btn-toolbar" role="toolbar" aria-label="">
                                    <div class="btn-group" role="group" aria-label="">
                                        <a title="{$smarty.const.TXT_USER_GESTION}" class="btn btn-default btn-danger"
                                           href='index.php?page=entidad_usuarios&id_entidad={$entidad->id}'>
                                            <i class="fa fa-users fa-fw"></i><sub class="fa fa-pencil fa-fw"></sub>
                                        </a>
                                    </div>
                                </div>
                            {/if}
                        </div>
                        <!-- /.col-sm-1 -->
                    </div>
                    <!-- /.row -->
                {/if}
            </div>
            <!-- /Usuarios de la unidad -->

            <!-- Subunidades -->
            <div role="tabpanel" class="tab-pane" id="unid_subs">
                {if $subentidades}
                    <div class="table-responsive">
                        <table class="table datatable table-striped table-hover">
                            <thead>
                            <tr>
                                <th>{$smarty.const.FIELD_COD}</th>
                                <th>{$smarty.const.FIELD_UNID}</th>
                                <th>{$smarty.const.FIELD_ACCIONES}</th>
                            </tr>
                            </thead>
                            <tbody>
                            {foreach from=$subentidades item=subentidad}
                                <tr>
                                    <td><span class="label label-primary">{$subentidad->codigo}</span></td>
                                    <td>
                                        <a title="{$subentidad->nombre}"
                                           href='index.php?page=entidad_mostrar&id_entidad={$subentidad->id}'>{$subentidad->nombre}</a>
                                    </td>
                                    <td>
                                        <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_FICHA}"
                                           href='index.php?page=entidad_mostrar&id_entidad={$subentidad->id}'><i
                                                    class="fa fa-folder fa-fw"></i></a>
                                        <a class="btn btn-default btn-circle btn-xs"
                                           title="{$smarty.const.FIELD_PLANES}"
                                           href='index.php?page=plan_listar&id_entidad={$subentidad->id}'><i
                                                    class="fa fa-book fa-fw"></i></a>
                                        <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.FIELD_PROCS}"
                                           href='index.php?page=proceso_listar&id_entidad={$subentidad->id}'><i
                                                    class="fa fa-gears fa-fw"></i></a>
                                        <a class="btn btn-default btn-circle btn-xs"
                                           title="{$smarty.const.FIELD_INDICS}"
                                           href='index.php?page=indicador_listar&id_entidad={$subentidad->id}'><i
                                                    class="fa fa-dashboard fa-fw"></i></a>
                                        <a class="btn btn-default btn-circle btn-xs"
                                           title="{$smarty.const.FIELD_CUADROS_MANDO}"
                                           href='index.php?page=cuadro_listar&id_entidad={$subentidad->id}'><i
                                                    class="fa fa-th fa-fw"></i></a>
                                        <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_CONSULT}"
                                           href='index.php?page=consulta_avanzada&id_entidad={$subentidad->id}'><i
                                                    class="fa fa-commenting fa-fw"></i></a>
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
            <!-- /Subunidades -->

            <!-- Archivos de la unidad -->
            <div role="tabpanel" class="tab-pane" id="unid_archivos">
                <!-- Barra de botones -->
                {if $_control}
                    <div id="botones_archivo" class="btn-toolbar hidden" role="toolbar" aria-label="">
                        <div class="btn-group" role="group" aria-label="">
                            <a class="btn btn-danger" href='index.php?page=archivo_gestionar&id_entidad={$entidad->id}'
                               title="{$smarty.const.TXT_ARCHIVOS_GESTION}">
                                <i class="fa fa-archive fa-fw"></i>
                            </a>
                        </div>
                    </div>
                {/if}
                <!-- /Barra de botones -->
                {if $archivos}
                    <div class="table-responsive">
                        <table id="tabla_archivos" class="table datatable table-striped table-hover">
                            <thead>
                            <tr>
                                <th>{$smarty.const.FIELD_ARCHIVO}</th>
                                <th>{$smarty.const.FIELD_USER}</th>
                                <th>{$smarty.const.FIELD_ACCIONES}</th>
                            </tr>
                            </thead>
                            <tbody>
                            {foreach from=$archivos item=archivo}
                                {if $archivo->visible}
                                    <tr>
                                        <td>
                                            <a title='{$archivo->titulo}: {$archivo->descripcion|replace:"\r\n":" "}'
                                               href="index.php?page=archivo_descargar&id={$archivo->id}">{$archivo->titulo}</a>
                                        </td>
                                        <td style="font-size: 12px">
                                            <a title="{$smarty.const.TXT_USER_PERFIL}"
                                               href='index.php?page=usuario_mostrar&id_usuario={$archivo->usuario->id}'>{$archivo->usuario->nombre} {$archivo->usuario->apellidos}</a>
                                        </td>
                                        <td style="white-space:nowrap">
                                            <a class="btn btn-default btn-circle btn-xs"
                                               title="{$smarty.const.TXT_ARCHIVO_DESCARGA}"
                                               href="index.php?page=archivo_descargar&id={$archivo->id}"><i
                                                        class="fa fa-download fa-fw"></i></a>
                                            <a class="btn btn-default btn-circle btn-xs"
                                               title="{$smarty.const.TXT_USER_PERFIL}"
                                               href='index.php?page=usuario_mostrar&id_usuario={$archivo->usuario->id}'><i
                                                        class="fa fa-user fa-fw"></i></a>
                                        </td>
                                    </tr>
                                {/if}
                            {/foreach}
                            </tbody>
                        </table>
                    </div>
                {else}
                    <div class="row">
                        <div class="col-sm-11">
                            <div class="alert alert-info alert-dismissible">
                                <i class="fa fa-info-circle fa-fw"></i>
                                {$smarty.const.MSG_UNID_NO_ARCHIVOS}
                            </div>
                        </div>
                        <!-- /.col-sm-11 -->
                        <div class="col-sm-1">
                            {if $_control}
                                <div class="btn-toolbar" role="toolbar" aria-label="">
                                    <div class="btn-group" role="group" aria-label="">
                                        <a class="btn btn-danger"
                                           href='index.php?page=archivo_gestionar&id_entidad={$entidad->id}'
                                           title="{$smarty.const.TXT_ARCHIVOS_GESTION}">
                                            <i class="fa fa-archive fa-fw"></i>
                                        </a>
                                    </div>
                                </div>
                            {/if}
                        </div>
                        <!-- /.col-sm-1 -->
                    </div>
                    <!-- /.row -->
                {/if}
            </div>
            <!-- /Archivos de la unidad -->

            <!-- Resumen -->
            <div role="tabpanel" class="tab-pane" id="unid_res">
                <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">

                    <!-- Indicadores agrupados por procesos -->
                    {if $procesos}
                        {foreach from=$procesos item=proceso}
                            <div class="panel panel-info" style="margin-top: 0;">
                                <div class="panel-heading" role="tab" id="">
                                    <div class="row">
                                        <div class="col-md-10">
                                            <h4 class="panel-title">
                                                <a title="{$proceso->nombre}: {$proceso->mision}" role="button"
                                                   data-toggle="collapse" data-parent="#accordion"
                                                   href="#{$proceso->id}" aria-expanded="false" aria-controls="">
                                                    <i class="fa fa-gear fa-fw"></i> {$smarty.const.FIELD_PROC}
                                                    : {$proceso->nombre}
                                                </a>
                                            </h4>
                                        </div>
                                        <!-- /.col-md-10 -->
                                        <div class="col-md-2">
                                            <a title="{$smarty.const.TXT_FICHA}"
                                               href="index.php?page=proceso_mostrar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}"><i
                                                        class="fa fa-folder fa-fw"></i></a>
                                            {if $proceso->id_cuadro}
                                                <a title="{$smarty.const.FIELD_CUADRO_MANDO}"
                                                   href="index.php?page=cuadro_mostrar&id_cuadro={$proceso->id_cuadro}&id_entidad={$proceso->id_entidad}"><i
                                                            class="fa fa-th fa-fw"></i></a>
                                            {/if}
                                            <span title="{$proceso->nombre}: {$indicadores[$proceso->id]|@count} {$smarty.const.FIELD_INDICS}"
                                                  class="badge pull-right">{$indicadores[$proceso->id]|@count} {$smarty.const.FIELD_INDICS}</span>
                                        </div>
                                        <!-- /.col-md-2 -->
                                    </div>
                                    <!-- /.row -->
                                </div>
                                <!-- /.panel-heading -->
                                <div id="{$proceso->id}" class="panel-collapse collapse proceso" role="tabpanel"
                                     aria-labelledby="" data-num_indic="{$indicadores[$proceso->id]|@count}">
                                    <div class="panel-body">
                                        {if $indicadores[$proceso->id]}
                                            <div id="carousel-{$proceso->id}" class="carousel slide"
                                                 data-ride="carousel" data-interval="15000">
                                                <!-- Wrapper for slides -->
                                                <div class="carousel-inner" role="listbox">
                                                    {foreach $indicadores[$proceso->id] as $indicador}
                                                        <div class="item {if $indicador@first}active{/if}">
                                                            <div class="{$proceso->id} highchart"
                                                                 id="panel_{$indicador->id}"
                                                                 data-id_indicador="{$indicador->id}"
                                                                 data-nombre_indicador="{$indicador->nombre}"
                                                                 data-valor_min="{$indicador->valor_min}"
                                                                 data-valor_max="{$indicador->valor_max}"
                                                                 data-fecha_inicio="{$anio_inicio}-01-01"
                                                                 data-fecha_fin="{$anio_fin}-12-31"
                                                                    {if $indicador->periodicidad=='Bienal'}
                                                                data-periodicidad="bienal"
                                                                    {else}
                                                                data-periodicidad="anual"
                                                                    {/if}>
                                                            </div>
                                                            <div class="carousel-caption">
                                                                <h3>
                                                                    <a href='index.php?page=indicador_mostrar&id_indicador={$indicador->id}&id_entidad={$entidad->id}'
                                                                       title="{$indicador->nombre}: {$indicador->descripcion|replace:"\r\n":" "}"><i
                                                                                class="fa fa-dashboard fa-fw"></i></a>
                                                                </h3>
                                                                <p style="color: #337AB7;">{$smarty.const.TXT_GRAFICO_AUMENTAR}</p>
                                                            </div>
                                                        </div>
                                                    {/foreach}
                                                </div>
                                                <!-- Controls -->
                                                <a class="left carousel-control" title="{$smarty.const.TXT_ANT}"
                                                   href="#carousel-{$proceso->id}" role="button" data-slide="prev">
                                                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"
                                                          style="color: #337AB7;"></span>
                                                    <span class="sr-only">{$smarty.const.TXT_ANT}</span>
                                                </a>
                                                <a class="right carousel-control" title="{$smarty.const.TXT_SIG}"
                                                   href="#carousel-{$proceso->id}" role="button" data-slide="next">
                                                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"
                                                          style="color: #337AB7;"></span>
                                                    <span class="sr-only">{$smarty.const.TXT_SIG}</span>
                                                </a>
                                            </div>
                                            <!-- /.carousel -->
                                        {else}
                                            <div class="alert alert-info alert-dismissible">
                                                <i class="fa fa-info-circle fa-fw"></i>
                                                {$smarty.const.MSG_PROC_NO_INDIC}
                                            </div>
                                        {/if}
                                    </div>
                                    <!-- /.panel-body -->
                                </div>
                                <!-- /.panel-collapse -->
                            </div>
                            <!-- /.panel -->
                        {/foreach}
                    {else}
                        <div class="alert alert-info alert-dismissible" style="margin: 0;">
                            <i class="fa fa-info-circle fa-fw"></i>
                            {$smarty.const.MSG_UNID_NO_PROC}
                        </div>
                    {/if}
                    <!-- /Indicadores agrupados por procesos -->

                    <!-- Indicadores (control) -->
                    {if $controles}
                        <div class="panel panel-success" style="margin-top: 0;">
                            <div class="panel-heading" role="tab">
                                <div class="row">
                                    <div class="col-md-10">
                                        <h4 class="panel-title">
                                            <a title="{$smarty.const.FIELD_INDICS} ({$smarty.const.TXT_CONTROL})"
                                               role="button" data-toggle="collapse" data-parent="#accordion"
                                               href="#control" aria-expanded="false" aria-controls="">
                                                <i class="fa fa-dashboard fa-fw"></i><sub
                                                        class="fa fa-sliders fa-fw"></sub> {$smarty.const.FIELD_INDICS}
                                                ({$smarty.const.TXT_CONTROL})
                                            </a>
                                        </h4>
                                    </div>
                                    <!-- /.col-md-10 -->
                                    <div class="col-md-2">
                                        <span title="{$smarty.const.FIELD_INDICS} ({$smarty.const.TXT_CONTROL}): {$controles|@count} {$smarty.const.FIELD_INDICS}"
                                              class="badge pull-right">{$controles|@count} {$smarty.const.FIELD_INDICS}</span>
                                    </div>
                                    <!-- /.col-md-2 -->
                                </div>
                                <!-- /.row -->
                            </div>
                            <!-- /.panel-heading -->
                            <div id="control" class="panel-collapse collapse proceso" role="tabpanel" aria-labelledby=""
                                 data-num_indic="{$controles|@count}">
                                <div class="panel-body">
                                    <div id="carousel-control" class="carousel slide" data-ride="carousel"
                                         data-interval="15000">
                                        <!-- Wrapper for slides -->
                                        <div class="carousel-inner" role="listbox">
                                            {foreach $controles as $control}
                                                <div class="item {if $control@first}active{/if}">
                                                    <div class="control highchart"
                                                         id="panel_{$control->id}"
                                                         data-id_indicador="{$control->id}"
                                                         data-nombre_indicador="{$control->nombre}"
                                                         data-valor_min="{$control->valor_min}"
                                                         data-valor_max="{$control->valor_max}"
                                                         data-fecha_inicio="{$anio_inicio}-01-01"
                                                         data-fecha_fin="{$anio_fin}-12-31"
                                                            {if $control->periodicidad=='Bienal'}
                                                        data-periodicidad="bienal"
                                                            {else}
                                                        data-periodicidad="anual"
                                                            {/if}>
                                                    </div>
                                                    <div class="carousel-caption">
                                                        <h3>
                                                            <a href='index.php?page=indicador_mostrar&id_indicador={$control->id}&id_entidad={$entidad->id}'
                                                               title="{$control->nombre}: {$control->descripcion|replace:"\r\n":" "}"><i
                                                                        class="fa fa-dashboard fa-fw"></i></a>
                                                        </h3>
                                                        <p style="color: #337AB7;">{$smarty.const.TXT_GRAFICO_AUMENTAR}</p>
                                                    </div>
                                                </div>
                                            {/foreach}
                                        </div>
                                        <!-- Controls -->
                                        <a class="left carousel-control" title="{$smarty.const.TXT_ANT}"
                                           href="#carousel-control" role="button" data-slide="prev">
                                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"
                                                  style="color: #337AB7;"></span>
                                            <span class="sr-only">{$smarty.const.TXT_ANT}</span>
                                        </a>
                                        <a class="right carousel-control" title="{$smarty.const.TXT_SIG}"
                                           href="#carousel-control" role="button" data-slide="next">
                                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"
                                                  style="color: #337AB7;"></span>
                                            <span class="sr-only">{$smarty.const.TXT_SIG}</span>
                                        </a>
                                    </div>
                                    <!-- /.carousel -->
                                </div>
                                <!-- /.panel-body-->
                            </div>
                            <!-- /.panel-collapse -->
                        </div>
                        <!-- /.panel -->
                    {else}
                        <div class="alert alert-info alert-dismissible" style="margin: 0;">
                            <i class="fa fa-info-circle fa-fw"></i>
                            {$smarty.const.MSG_UNID_NO_INDIC_CONTROL}
                        </div>
                    {/if}
                    <!-- /Indicadores (control) -->

                    <!-- Indicadores (datos) -->
                    {if $datos}
                        <div class="panel panel-danger" style="margin-top: 0;">
                            <div class="panel-heading" role="tab">
                                <div class="row">
                                    <div class="col-md-10">
                                        <h4 class="panel-title">
                                            <a title="{$smarty.const.FIELD_INDICS} ({$smarty.const.FIELD_DATOS})"
                                               role="button" data-toggle="collapse" data-parent="#accordion"
                                               href="#datos" aria-expanded="false" aria-controls="">
                                                <i class="fa fa-dashboard fa-fw"></i><sub
                                                        class="fa fa-database fa-fw"></sub> {$smarty.const.FIELD_INDICS}
                                                ({$smarty.const.FIELD_DATOS})
                                            </a>
                                        </h4>
                                    </div>
                                    <!-- /.col-md-10 -->
                                    <div class="col-md-2">
                                        <span title="{$smarty.const.FIELD_INDICS} ({$smarty.const.FIELD_DATOS}): {$datos|@count} {$smarty.const.FIELD_INDICS}"
                                              class="badge pull-right">{$datos|@count} {$smarty.const.FIELD_INDICS}</span>
                                    </div>
                                    <!-- /.col-md-2 -->
                                </div>
                                <!-- /.row -->
                            </div>
                            <!-- /.panel-heading -->
                            <div id="datos" class="panel-collapse collapse proceso" role="tabpanel" aria-labelledby=""
                                 data-num_indic="{$datos|@count}">
                                <div class="panel-body">
                                    <div id="carousel-datos" class="carousel slide" data-ride="carousel"
                                         data-interval="15000">
                                        <!-- Wrapper for slides -->
                                        <div class="carousel-inner" role="listbox">
                                            {foreach $datos as $dato}
                                                <div class="item {if $dato@first}active{/if}">
                                                    <div class="datos highchart"
                                                         id="panel_{$dato->id}"
                                                         data-id_indicador="{$dato->id}"
                                                         data-nombre_indicador="{$dato->nombre}"
                                                         data-valor_min="{$dato->valor_min}"
                                                         data-valor_max="{$dato->valor_max}"
                                                         data-fecha_inicio="{$anio_inicio}-01-01"
                                                         data-fecha_fin="{$anio_fin}-12-31"
                                                            {if $dato->periodicidad=='Bienal'}
                                                        data-periodicidad="bienal"
                                                            {else}
                                                        data-periodicidad="anual"
                                                            {/if}>
                                                    </div>
                                                    <div class="carousel-caption">
                                                        <h3>
                                                            <a href='index.php?page=indicador_mostrar&id_indicador={$dato->id}&id_entidad={$entidad->id}'
                                                               title="{$dato->nombre}: {$dato->descripcion|replace:"\r\n":" "}"><i
                                                                        class="fa fa-dashboard fa-fw"></i></a>
                                                        </h3>
                                                        <p style="color: #337AB7;">{$smarty.const.TXT_GRAFICO_AUMENTAR}</p>
                                                    </div>
                                                </div>
                                            {/foreach}
                                        </div>
                                        <!-- Controls -->
                                        <a class="left carousel-control" title="{$smarty.const.TXT_ANT}"
                                           href="#carousel-datos" role="button" data-slide="prev">
                                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"
                                                  style="color: #337AB7;"></span>
                                            <span class="sr-only">{$smarty.const.TXT_ANT}</span>
                                        </a>
                                        <a class="right carousel-control" title="{$smarty.const.TXT_SIG}"
                                           href="#carousel-datos" role="button" data-slide="next">
                                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"
                                                  style="color: #337AB7;"></span>
                                            <span class="sr-only">{$smarty.const.TXT_SIG}</span>
                                        </a>
                                    </div>
                                    <!-- /.carousel -->
                                </div>
                                <!-- /.panel-body-->
                            </div>
                            <!-- /.panel-collapse -->
                        </div>
                        <!-- /.panel -->
                    {else}
                        <div class="alert alert-info alert-dismissible" style="margin: 0;">
                            <i class="fa fa-info-circle fa-fw"></i>
                            {$smarty.const.MSG_UNID_NO_DATOS}
                        </div>
                    {/if}
                    <!-- /Indicadores (datos) -->

                </div>
            </div>
            <!-- /Resumen -->

        </div>
        <!-- /Tab panes -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->