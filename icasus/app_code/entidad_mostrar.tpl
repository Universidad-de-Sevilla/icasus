<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <h3 title="{$smarty.const.FIELD_USER}: {$_usuario->login} - {$smarty.const.TXT_UNID}: {$entidad->nombre} - {$smarty.const.FIELD_ROL}: {$_rol}" class="page-header">
            <i class="fa fa-folder fa-fw"></i> {$entidad->nombre} / <i class="fa fa-user fa-fw"></i> {$_rol}
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
            <li title="{$_nombre_pagina}" class="active">{$_nombre_pagina}</li>
        </ol>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- /Breadcrumbs -->

{if ($entidad->madre->id!=0 AND $entidad->madre->id!=1)}
    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-info alert-dismissible">
                <i class="fa fa-info-circle fa-fw"></i> 
                {$smarty.const.FIELD_UNID_SUP}: 
                <a title="{$entidad->madre->nombre}" href="index.php?page=entidad_mostrar&id_entidad={$entidad->madre->id}">{$entidad->madre->nombre}</a>
            </div> 
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
{/if}

<div class="row">
    <div class="col-md-4">
        <a title="{$smarty.const.TXT_PROCS_DESCRIPCION}" href="index.php?page=proceso_listar&id_entidad={$entidad->id}">
            <div class="panel panel-procesos">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-gears fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div class="huge">{$num_procesos}</div>
                            <div class="h4">{$smarty.const.TXT_PROCS}</div>
                        </div>
                    </div>
                </div>
            </div>
        </a>
    </div>
    <!-- /.col-md-4 -->
    <div class="col-md-4">
        <a title="{$smarty.const.TXT_INDICS_DESCRIPCION}" href="index.php?page=indicador_listar&id_entidad={$entidad->id}">
            <div class="panel panel-indicadores">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-dashboard fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div class="huge">{$num_indicadores}</div>
                            <div class="h4">{$smarty.const.FIELD_INDICS}</div>
                        </div>
                    </div>
                </div>
            </div>
        </a>
    </div>
    <!-- /.col-md-4 -->
    <div class="col-md-4">
        <a title="{$smarty.const.TXT_DATOS_DESCRIPCION}" href="index.php?page=dato_listar&id_entidad={$entidad->id}">
            <div class="panel panel-datos">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-database fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div class="huge">{$num_datos}</div>
                            <div class="h4">{$smarty.const.FIELD_DATOS}</div>
                        </div>
                    </div>
                </div>
            </div>
        </a>
    </div>
    <!-- /.col-md-4 -->
</div>
<!-- /.row -->

<div class="row">
    <div class="col-md-4">
        <a title="{$smarty.const.TXT_CONSULTA_DESCRIPCION}" class="btn btn-warning btn-block" href="index.php?page=consulta_avanzada&id_entidad={$entidad->id}">
            <h4><i class="fa fa-commenting fa-fw"></i> {$smarty.const.TXT_CONSULT}</h4>
        </a>
    </div>
    <!-- /.col-md-4 -->
    <div class="col-md-4">
        <a title="{$smarty.const.TXT_CUADRO_MANDO_DESCRIPCION}" class="btn btn-success btn-block" href='index.php?page=cuadro_listar'>
            <h4><i class="fa fa-th fa-fw"></i> {$smarty.const.TXT_CUADROS_MANDO}</h4>
        </a>
    </div>
    <!-- /.col-md-4 -->
    {if $_control}
        <div class="col-md-4">
            <a title="{$smarty.const.TXT_CONTROL_DESCRIPCION}" class="btn btn-info btn-block" href="index.php?page=control&modulo=inicio&id_entidad={$entidad->id}">
                <h4><i class="fa fa-sliders fa-fw"></i> {$smarty.const.TXT_CONTROL}</h4>
            </a>     
        </div>
        <!-- /.col-md-4 -->
    {/if}
</div>
<br>
<!-- /.row -->

<!-- Parámetros de la unidad -->
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
                            <td><span class="label label-primary">{$entidad->codigo}</span></td>
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
                        {if $entidad->madre->id !=0 && $entidad->madre->id !=1}
                            <tr>
                                <th>{$smarty.const.FIELD_UNID_SUP}</th>
                                <td>
                                    <a title="{$entidad->madre->nombre}" href="index.php?page=entidad_mostrar&id_entidad={$entidad->madre->id}">{$entidad->madre->nombre}</a>
                                </td>
                            </tr>
                        {/if}
                    </tbody>
                </table>
                {if $_control}
                    <div class="btn-toolbar" role="toolbar" aria-label="">
                        <div class="btn-group" role="group" aria-label="">
                            <a title="{$smarty.const.TXT_UNID_EDIT}" class="btn btn-default btn-danger" href='index.php?page=entidad_editar&id_entidad={$entidad->id}'>
                                <i class="fa fa-pencil fa-fw"></i> {$smarty.const.TXT_UNID_EDIT}
                            </a>
                        </div>
                        <div class="btn-group" role="group" aria-label="">
                            <a title="{$smarty.const.TXT_VAL_IMPORT}" class="btn btn-default btn-danger" href='index.php?page=csv_importar&id_entidad={$entidad->id}'>
                                <i class="fa fa-upload fa-fw"></i> {$smarty.const.TXT_VAL_IMPORT}
                            </a>
                        </div>
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
<!-- /Parámetros de la unidad -->

<!-- Usuarios -->
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
                                        <td>
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_USER_PERFIL}" href='index.php?page=usuario_mostrar&id_usuario={$usuario->usuario->id}'><i class="fa fa-user fa-fw"></i></a>                 
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_ENVIAR_CORREO}" href='mailto:{$usuario->usuario->correo}'><i class="fa fa-envelope fa-fw"></i></a>
                                        </td>
                                    </tr>
                                {/foreach}
                            </tbody>
                        </table>
                    </div>
                    {if $_control}
                        <br>
                        <div class="btn-toolbar" role="toolbar" aria-label="">
                            <div class="btn-group" role="group" aria-label="">
                                <a title="{$smarty.const.TXT_USERS_VINC}" class="btn btn-default btn-danger" href='index.php?page=entidad_poblar&id_entidad={$entidad->id}'>
                                    <i class="fa fa-user-plus fa-fw"></i> {$smarty.const.TXT_USERS_VINC}
                                </a>
                            </div>
                            <div class="btn-group" role="group" aria-label="">
                                <a title="{$smarty.const.TXT_USERS_DESVINC}" class="btn btn-default btn-danger" href='index.php?page=entidad_despoblar&id_entidad={$entidad->id}'>
                                    <i class="fa fa-user-times fa-fw"></i> {$smarty.const.TXT_USERS_DESVINC}
                                </a>
                            </div>
                        </div>
                    {/if}
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
<!-- /Usuarios -->

<!-- Subunidades -->
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
                                        <td><span class="label label-primary">{$subentidad->codigo}</span></td>
                                        <td>
                                            <a title="{$subentidad->nombre}" href='index.php?page=entidad_mostrar&id_entidad={$subentidad->id}'>{$subentidad->nombre}</a>
                                        </td>
                                        <td>
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_UNID_FICHA}" href='index.php?page=entidad_mostrar&id_entidad={$subentidad->id}'><i class="fa fa-folder fa-fw"></i></a>
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
<!-- /Subunidades -->

<!-- Resumen -->
<div class="row">
    <div class="col-lg-12">
        <h4 title="{$smarty.const.TXT_RESUMEN} ({$smarty.const.TXT_PROCS}, {$smarty.const.FIELD_INDICS}, {$smarty.const.FIELD_DATOS})" class="page-header">
            <i class="fa fa-gears fa-fw"></i><i class="fa fa-dashboard fa-fw"></i><i class="fa fa-database fa-fw"></i> {$smarty.const.TXT_RESUMEN} ({$smarty.const.TXT_PROCS}, {$smarty.const.FIELD_INDICS}, {$smarty.const.FIELD_DATOS})
        </h4>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
    <div class="col-lg-12">
        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
            <!-- Indicadores agrupados por procesos -->
            {if $procesos}
                {foreach from=$procesos item=proceso}
                    <div class="panel panel-info">
                        <div class="panel-heading" role="tab" id="">
                            <div class="row">
                                <div class="col-lg-10">
                                    <h4 class="panel-title">
                                        <a title="{$proceso->nombre}: {$proceso->mision}" role="button" data-toggle="collapse" data-parent="#accordion" href="#{$proceso->id}" aria-expanded="false" aria-controls="" class="proceso" data-id_proceso="{$proceso->id}">
                                            <i class="fa fa-gear fa-fw"></i> {$smarty.const.FIELD_PROC}: {$proceso->nombre}
                                        </a>
                                    </h4>
                                </div>
                                <!-- /.col-lg-10 -->
                                <div class="col-lg-2">
                                    <span title="{$proceso->nombre}: {$indicadores[$proceso->id]|@count} {$smarty.const.FIELD_INDICS}" class="badge">{$indicadores[$proceso->id]|@count} {$smarty.const.FIELD_INDICS}</span>
                                    <a class="panel-title pull-right" title="{$smarty.const.TXT_PROC_FICHA}" href="index.php?page=proceso_mostrar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}">
                                        <i class="fa fa-folder fa-fw"></i>
                                    </a> 
                                </div>
                                <!-- /.col-lg-2 -->
                            </div>
                            <!-- /.row -->
                        </div>
                        <!-- /.panel-heading -->
                        <div id="{$proceso->id}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="">
                            <div class="panel-body">
                                {if $indicadores[$proceso->id]}
                                    <div id="carousel-{$proceso->id}" class="carousel slide" data-ride="carousel">
                                        <!-- Wrapper for slides -->
                                        <div class="carousel-inner" role="listbox">
                                            {foreach $indicadores[$proceso->id] as $indicador}
                                                <div class="item {if $indicador@index eq 0}active{/if}">
                                                    <div class="{$proceso->id} highchart" 
                                                         id="panel_{$indicador->id}" 
                                                         data-id_indicador="{$indicador->id}" 
                                                         data-nombre_indicador="{$indicador->nombre}"
                                                         data-valor_min="{$indicador->valor_min}" 
                                                         data-valor_max="{$indicador->valor_max}" 
                                                         data-fecha_inicio="{$indicador->historicos}-01-01" 
                                                         data-fecha_fin="{$anio_fin}-12-31"
                                                         data-periodicidad="anual">
                                                    </div>
                                                    <div class="carousel-caption">
                                                        <h3>
                                                            <a href='index.php?page=indicador_mostrar&id_indicador={$indicador->id}&id_entidad={$entidad->id}' 
                                                               title="{$indicador->nombre}: {$indicador->descripcion}"><i class="fa fa-line-chart fa-fw"></i> {$indicador->nombre}</a>
                                                        </h3>
                                                        <p style="color: #337AB7">{$smarty.const.TXT_GRAFICO_AUMENTAR}</p>
                                                    </div>
                                                </div>
                                            {/foreach}
                                        </div>
                                        <!-- Controls -->
                                        <a class="left carousel-control" title="{$smarty.const.TXT_ANT}" href="#carousel-{$proceso->id}" role="button" data-slide="prev">
                                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true" style="color: #337AB7"></span>
                                            <span class="sr-only">{$smarty.const.TXT_ANT}</span>
                                        </a>
                                        <a class="right carousel-control" title="{$smarty.const.TXT_SIG}" href="#carousel-{$proceso->id}" role="button" data-slide="next">
                                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true" style="color: #337AB7"></span>
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
                <div class="alert alert-info alert-dismissible">
                    <i class="fa fa-info-circle fa-fw"></i> 
                    {$smarty.const.MSG_UNID_NO_PROC}
                </div> 
            {/if}
            <!-- /Indicadores agrupados por procesos -->
            <!-- Datos -->
            {if $datos} 
                <div class="panel panel-danger">
                    <div class="panel-heading" role="tab" id="">
                        <div class="row">
                            <div class="col-lg-10">
                                <h4 class="panel-title">
                                    <a title="{$smarty.const.FIELD_DATOS}" role="button" data-toggle="collapse" data-parent="#accordion" href="#datos" aria-expanded="false" aria-controls="" class="proceso" data-id_proceso="datos">
                                        <i class="fa fa-database fa-fw"></i> {$smarty.const.FIELD_DATOS}
                                    </a>
                                </h4>
                            </div>
                            <!-- /.col-lg-10 -->
                            <div class="col-lg-2">
                                <span title="{$entidad->nombre}: {$datos|@count} {$smarty.const.FIELD_DATOS}" class="badge">{$datos|@count} {$smarty.const.FIELD_DATOS}</span> 
                            </div>
                            <!-- /.col-lg-2 -->
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.panel-heading -->
                    <div id="datos" class="panel-collapse collapse" role="tabpanel" aria-labelledby="">
                        <div class="panel-body">

                            <div id="carousel-datos" class="carousel slide" data-ride="carousel">
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
                                                 data-fecha_inicio="{$dato->historicos}-01-01" 
                                                 data-fecha_fin="{$anio_fin}-12-31"
                                                 data-periodicidad="anual">
                                            </div>
                                            <div class="carousel-caption">
                                                <h3>
                                                    <a href='index.php?page=dato_mostrar&id_dato={$dato->id}&id_entidad={$entidad->id}' 
                                                       title="{$dato->nombre}: {$dato->descripcion}"><i class="fa fa-line-chart fa-fw"></i> {$dato->nombre}</a>
                                                </h3>
                                                <p style="color: #337AB7">{$smarty.const.TXT_GRAFICO_AUMENTAR}</p>
                                            </div>
                                        </div>
                                    {/foreach}
                                </div>
                                <!-- Controls -->
                                <a class="left carousel-control" title="{$smarty.const.TXT_ANT}" href="#carousel-datos" role="button" data-slide="prev">
                                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true" style="color: #337AB7"></span>
                                    <span class="sr-only">{$smarty.const.TXT_ANT}</span>
                                </a>
                                <a class="right carousel-control" title="{$smarty.const.TXT_SIG}" href="#carousel-datos" role="button" data-slide="next">
                                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true" style="color: #337AB7"></span>
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
                <br>
                <div class="alert alert-info alert-dismissible">
                    <i class="fa fa-info-circle fa-fw"></i> 
                    {$smarty.const.MSG_UNID_NO_DATOS}
                </div> 
            {/if}
            <!-- /Datos -->
        </div>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- /Resumen -->