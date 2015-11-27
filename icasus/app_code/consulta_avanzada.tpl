<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <h3 title="{$_nombre_pagina}" class="page-header">
            <i class="fa fa-commenting fa-fw"></i> {$_nombre_pagina}
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
                        <a title="{$smarty.const.TXT_PROCS_DESCRIPCION}" href='index.php?page=proceso_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-gears fa-fw"></i> {$smarty.const.TXT_PROCS} <span title="{$smarty.const.FIELD_TOTAL}: {$num_procesos} {$smarty.const.TXT_PROCS}">({$num_procesos})</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_INDICS_DESCRIPCION}" href='index.php?page=indicador_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-dashboard fa-fw"></i> {$smarty.const.FIELD_INDICS} <span title="{$smarty.const.FIELD_TOTAL}: {$num_indicadores} {$smarty.const.FIELD_INDICS}">({$num_indicadores})</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_DATOS_DESCRIPCION}" href='index.php?page=dato_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-database fa-fw"></i> {$smarty.const.FIELD_DATOS} <span title="{$smarty.const.FIELD_TOTAL}: {$num_datos} {$smarty.const.FIELD_DATOS}">({$num_datos})</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_CONSULTA_DESCRIPCION}" href="index.php?page=consulta_avanzada&id_entidad={$entidad->id}">
                            <i class="fa fa-commenting fa-fw"></i> {$smarty.const.TXT_CONSULT}
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_CUADRO_MANDO_DESCRIPCION}" href='index.php?page=cuadro_listar'>
                            <i class="fa fa-th fa-fw"></i> {$smarty.const.TXT_CUADROS_MANDO}
                        </a>
                    </li>
                    {if $_control}
                        <li class="divider"></li>
                        <li>
                            <a title="{$smarty.const.TXT_CONTROL_DESCRIPCION}" href="index.php?page=control&modulo=inicio&id_entidad={$entidad->id}">
                                <i class="fa fa-sliders fa-fw"></i> {$smarty.const.TXT_CONTROL}
                            </a>
                        </li>
                    {/if}
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
        <div class="panel panel-red">
            <div class="panel-heading">
                <span class="panel-title"><i class="fa fa-commenting fa-fw"></i> {$smarty.const.TXT_CONSULT_PARAM}</span>
                <i class="fa fa-chevron-up pull-right clickable"></i>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <!-- Listado de indicadores/datos de la unidad -->
                <div class="col-lg-7">
                    {if $indicadores}
                        <div class="table-responsive">
                            <table class="table datatable table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>{$smarty.const.FIELD_COD}</th>
                                        <th>{$smarty.const.FIELD_NOMBRE}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {foreach $indicadores as $indicador}
                                        <tr>
                                            <td><span class="label label-primary">{$indicador->codigo}</span></td>
                                            <td><a href="javascript:void(0)" class="indicador" id_indicador="{$indicador->id}">{$indicador->nombre}</a></td>
                                        </tr>
                                    {/foreach}
                                </tbody>
                            </table>
                        </div>
                    {else}
                        <div class="alert alert-info alert-dismissible">
                            <i class="fa fa-info-circle fa-fw"></i> 
                            {$smarty.const.MSG_UNID_NO_IND_NO_DAT}
                        </div> 
                    {/if}
                </div>
                <!-- /.col-lg-7 -->
                <!-- /Listado de indicadores/datos de la unidad -->
                <!-- Indicadores/datos agregados a la consulta -->
                <div class="col-lg-5">
                    <div class="well receptor" data-serie="0"></div>
                    <div class="form-group">
                        <select class="operador form-control chosen-select" data-serie="0">
                            {foreach $operaciones as $operacion}
                                <option value="{$operacion.0}">{$operacion.1}</option>
                            {/foreach}
                        </select>
                    </div>
                    <div class="well receptor" data-serie="1"></div>
                    <div class="form-group">
                        <select class="operador form-control chosen-select" data-serie="1">
                            {foreach $operaciones as $operacion}
                                <option value="{$operacion.0}">{$operacion.1}</option>
                            {/foreach}
                        </select>
                    </div>
                    <div class="well receptor" data-serie="2"></div>
                    <div class="form-group">
                        <select class="operador form-control chosen-select" data-serie="2">
                            {foreach $operaciones as $operacion}
                                <option value="{$operacion.0}">{$operacion.1}</option>
                            {/foreach}
                        </select>
                    </div>
                    <div class="well receptor" data-serie="3"> </div>
                    <div class="form-group">
                        <select class="operador form-control chosen-select" data-serie="3">
                            {foreach $operaciones as $operacion}
                                <option value="{$operacion.0}">{$operacion.1}</option>
                            {/foreach}
                        </select>
                    </div>
                    <div class="well receptor" data-serie="4"></div>
                    <button title="{$smarty.const.TXT_MOSTRAR_RESUL}" class="btn btn-success pull-right" id="btn_mostrar_resultado"><i class="fa fa-search fa-fw"></i> {$smarty.const.TXT_MOSTRAR_RESUL}</button>
                </div>
                <!-- /.col-lg-5 -->
                <!-- /Indicadores/datos agregados a la consulta -->
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
                <span class="panel-title"><i class="fa fa-table fa-fw"></i><i class="fa fa-area-chart fa-fw"></i> {$smarty.const.TXT_CONSULT_RESUL}</span>
                <i class="fa fa-chevron-up pull-right clickable"></i>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <!-- Tabla con los resultados obtenidos y los datos de partida -->
                <div class="col-lg-4">
                    <div class="table-responsive" id="tablar">
                    </div>
                    {for $i = 0 to 4}
                        <div class="table-responsive" id="tabla{$i}">
                        </div>
                    {/for}
                </div>
                <!-- /.col-lg-4 -->
                <!-- /Tabla con los resultados obtenidos y los datos de partida -->
                <!-- Gráfica con los resultados obtenidos -->
                <div class="col-lg-8">
                    <ul class="nav nav-pills mediciones">
                        <li>
                            <a class="btn btn-default" href="#" class="medicion actual">{$smarty.const.TXT_TODOS}</a>
                        </li>
                        {$anyo_actual = $smarty.now|date_format:'%Y'}
                        {for $anyo = $anyo_actual - 5 to $anyo_actual}
                            <li>
                                <a class="btn btn-default" href="javascript:void(0)" class="medicion">{$anyo}</a>
                            </li>
                        {/for}
                    </ul>
                    <div id="grafica"></div>
                </div>
                <!-- /.col-lg-8 -->
                <!-- /Gráfica con los resultados obtenidos -->
            </div>
            <!-- /.panel-body -->        
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<script src="lib/flot/jquery.flot.min.js"></script>