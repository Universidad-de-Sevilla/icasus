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
                <a title="{$entidad->madre->nombre}" href="index.php?page=entidad_mostrar&id_entidad={$entidad->madre->id}&principal=1">{$entidad->madre->nombre}</a>
            </div> 
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
{/if}

<div class="row">
    <div class="col-lg-3 col-md-6">
        <a title="{$smarty.const.TXT_UNID_FICHA_DESCRIPCION}" href="index.php?page=entidad_datos&id_entidad={$entidad->id}">
            <div class="panel panel-ficha-unidad">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-xs-3">
                            <i class="fa fa-folder fa-5x"></i>
                        </div>
                        <div class="col-xs-9 text-right">
                            <div class="huge">&nbsp;</div>
                            <div class="h4">{$smarty.const.TXT_UNID_FICHA}</div>
                        </div>
                    </div>
                </div>
            </div>
        </a>
    </div>
    <!-- /.col-lg-3 col-md-6 -->
    <div class="col-lg-3 col-md-6">
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
    <!-- /.col-lg-3 col-md-6 -->
    <div class="col-lg-3 col-md-6">
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
    <!-- /.col-lg-3 col-md-6 -->
    <div class="col-lg-3 col-md-6">
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
    <!-- /.col-lg-3 col-md-6 -->
</div>
<!-- /.row -->

<div class="row">
    <div class="col-lg-12">
        <a title="{$smarty.const.TXT_CUADRO_MANDO_DESCRIPCION}" class="btn btn-warning btn-block" href='index.php?page=cuadro_listar'>
            <h4><i class="fa fa-th fa-fw"></i> {$smarty.const.TXT_CUADROS_MANDO}</h4>
        </a>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<!-- Indicadores agrupados por procesos -->
<div class="row">
    <div class="col-lg-12">
        <h3 title="{$smarty.const.TXT_INDIC_PROC}" class="page-header">
            <i class="fa fa-dashboard fa-fw"></i> {$smarty.const.TXT_INDIC_PROC}
        </h3>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
    <div class="col-lg-12">
        {if $procesos_propios}
            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                {foreach from=$procesos_propios item=proceso}
                    <div class="panel panel-info">
                        <div class="panel-heading" role="tab" id="">
                            <div class="row">
                                <div class="col-lg-10">
                                    <h4 class="panel-title">
                                        <a title="{$proceso->nombre}: {$proceso->mision}" role="button" data-toggle="collapse" data-parent="#accordion" href="#{$proceso->id}" aria-expanded="false" aria-controls="">
                                            <i class="fa fa-gear fa-fw"></i> {$smarty.const.FIELD_PROC}: {$proceso->nombre}
                                        </a></h4>
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
                            {if ($indicadores[$proceso->id]|@count)>1}
                                <div class="panel-body">
                                    <div id="carousel-{$proceso->id}" class="carousel slide" data-ride="carousel">
                                        <!-- Wrapper for slides -->
                                        <div class="carousel-inner" role="listbox">
                                            {foreach $indicadores[$proceso->id] as $indicador}
                                                <div class="item {if $indicador@index eq 0}active{/if}">
                                                    <div class="highchart" 
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
                                                               title="{$indicador->nombre}: {$indicador->descripcion}">{$indicador->nombre}</a>
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
                                </div>
                                <!-- /.panel-body --> 
                            {else}
                                {foreach $indicadores[$proceso->id] as $indicador}
                                    <div class="panel-body">
                                        <div class="text-center">
                                            <h4>
                                                <a href='index.php?page=indicador_mostrar&id_indicador={$indicador->id}&id_entidad={$entidad->id}' 
                                                   title="{$indicador->nombre}: {$indicador->descripcion}">{$indicador->nombre}</a> 
                                                <span style="color: #337AB7">{$smarty.const.TXT_GRAFICO_AUMENTAR}</span>
                                            </h4>
                                        </div>
                                        <div class="highchart" 
                                             id="panel_{$indicador->id}" 
                                             data-id_indicador="{$indicador->id}" 
                                             data-nombre_indicador="{$indicador->nombre}"
                                             data-valor_min="{$indicador->valor_min}" 
                                             data-valor_max="{$indicador->valor_max}" 
                                             data-fecha_inicio="{$indicador->historicos}-01-01" 
                                             data-fecha_fin="{$anio_fin}-12-31"
                                             data-periodicidad="anual">
                                        </div>
                                    </div>
                                    <!-- /.panel-body -->
                                {/foreach}
                            {/if}
                        </div>
                    </div>
                    <!-- /.panel -->
                {/foreach}
            </div>
        {else}
            <div class="alert alert-info alert-dismissible">
                <i class="fa fa-info-circle fa-fw"></i> 
                {$smarty.const.MSG_UNID_NO_PROC}
            </div> 
        {/if}
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- /Indicadores agrupados por procesos -->

<!-- Resumen de datos 
<div class="row">
    <div class="col-lg-12">
        <h3 title="{$smarty.const.FIELD_DATOS}" class="page-header">
            <i class="fa fa-database fa-fw"></i> {$smarty.const.FIELD_DATOS}
        </h3>
    </div>
<!-- /.col-lg-12 
</div>
<!-- /.row 
<div class="row">
    <div class="col-lg-12">  
        <div class="panel panel-default">
            <div class="panel-body">
{if $datos}  
    <div id="carousel-datos" class="carousel slide" data-ride="carousel">
    <!-- Wrapper for slides
    <div class="carousel-inner" role="listbox">
    {foreach $datos as $dato}
        <div class="item {if $dato@first}active{/if}">
            <div class="highchart" 
                 id="panel_{$dato->id}" 
                 data-id_indicador="{$dato->id}" 
                 data-nombre_indicador="{$dato->nombre}"
                 data-valor_min="{$dato->valor_min}" 
                 data-valor_max="{$dato->valor_max}" 
                 data-fecha_inicio="{$dato->historicos}-01-01" 
                 data-fecha_fin="{$anio_fin}-12-31"
                 data-periodicidad="anual">
            </div>
            <div class="carousel-caption" style="color:#950717">
                <h3><a href='index.php?page=dato_mostrar&id_dato={$dato->id}&id_entidad={$entidad->id}' 
                       title="{$dato->nombre}: {$dato->descripcion}">{$dato->nombre}</a></h3>
                <p>{$smarty.const.TXT_GRAFICO_AUMENTAR}</p>
            </div>
        </div>
    {/foreach}
</div>
    <!-- Controls 
    <a class="left carousel-control" title="{$smarty.const.TXT_ANT}" href="#carousel-datos" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true" style="color:#950717"></span>
        <span class="sr-only">{$smarty.const.TXT_ANT}</span>
    </a>
    <a class="right carousel-control" title="{$smarty.const.TXT_SIG}" href="#carousel-datos" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true" style="color:#950717"></span>
        <span class="sr-only">{$smarty.const.TXT_SIG}</span>
    </a>
</div>
{else}
    <div class="alert alert-info alert-dismissible">
        <i class="fa fa-info-circle fa-fw"></i> 
    {$smarty.const.MSG_UNID_NO_DATOS}
</div> 
{/if} 
</div>
<!-- /.panel-body
</div>
<!-- /.panel    
</div>
<!-- /.col-lg-12 
</div>
<!-- /.row -->
<!-- /Resumen de datos -->