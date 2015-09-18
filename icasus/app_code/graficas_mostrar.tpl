<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <h2 title="{$_nombre_pagina}" class="page-header">
            <i class="fa fa-area-chart fa-fw"></i> {$_nombre_pagina}
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
                <a title="{$smarty.const.TXT_MED_MOSTRAR}" class="btn btn-default btn-danger" href='index.php?page=medicion_listar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                    <i class="fa fa-clock-o fa-fw"></i> {$smarty.const.TXT_MED_MOSTRAR}
                </a>
                {if !$indicador->calculo}
                    <a title="{$smarty.const.TXT_VAL_EDIT}" class="btn btn-default btn-danger" href='index.php?page=indicador_subunidad_valor&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                        <i class="fa fa-pencil-square-o fa-fw"></i> {$smarty.const.TXT_VAL_EDIT}
                    </a>
                {/if}
                <a title="{$smarty.const.FIELD_RESP_MED}" class="btn btn-default btn-danger" href='index.php?page=medicion_responsable&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                    <i class="fa fa-user fa-fw"></i> {$smarty.const.FIELD_RESP_MED}
                </a>
            </div>
            <div class="btn-group" role="group" aria-label="">
                <a title="{$smarty.const.TXT_VAL_REF}" class="btn btn-default btn-danger" href='index.php?page=valor_referencia_crear&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                    <i class="fa fa-tags fa-fw"></i> {$smarty.const.TXT_VAL_REF}
                </a>
            </div>
            <div class="btn-group" role="group" aria-label="">
                <a title="{$smarty.const.TXT_VOLVER} {$tipo}" class="btn btn-default btn-danger" href='index.php?page={$tipo}_mostrar&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                    <i class="fa fa-arrow-left fa-fw"></i> {$smarty.const.TXT_VOLVER} {$tipo}
                </a>
            </div>
        </div>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<br>
<!-- /Barra de botones -->

<!-- Indicadores/datos calculados -->
{if $indicador->calculo}
    <div class="alert alert-info alert-dismissible">
        <i class="fa fa-info-circle fa-fw"></i> {$smarty.const.TXT_CALC_AUTO} - {$smarty.const.FIELD_FORMULA}: {$indicador->calculo}
        <br>
        {$smarty.const.TXT_DEPENDE}
        <br>
        {foreach $indicadores_influyentes as $indicador_influyente}
            {if $indicador_influyente->id_proceso}
                <a class="btn btn-default btn-primary" href='index.php?page=indicador_mostrar&id_indicador={$indicador_influyente->id}&id_entidad={$entidad->id}' 
                   title="{$smarty.const.TXT_INDIC_MOSTRAR}: {$indicador_influyente->nombre}">
                    <i class="fa fa-dashboard fa-fw"></i> <span class="badge">{$indicador_influyente->id}</span> - {$indicador_influyente->nombre}
                </a>
            {else}
                <a class="btn btn-default btn-primary" href='index.php?page=dato_mostrar&id_dato={$indicador_influyente->id}&id_entidad={$entidad->id}' 
                   title="{$smarty.const.TXT_DATO_MOSTRAR}: {$indicador_influyente->nombre}">
                    <i class="fa fa-database fa-fw"></i> <span class="badge">{$indicador_influyente->id}</span> - {$indicador_influyente->nombre}
                </a>
            {/if}   
        {/foreach}      
    </div> 
{/if}
<!-- /Indicadores/datos calculados -->

<!-- Indicadores/datos dependientes -->
{if $indicadores_dependientes}
    <div class="alert alert-info alert-dismissible">
        <i class="fa fa-info-circle fa-fw"></i>  {$smarty.const.TXT_INDIC_DAT_DEPENDIENTES}
        <br>
        {$smarty.const.TXT_INFLUYE}
        <br>
        {foreach $indicadores_dependientes as $indicador_dependiente}
            {if $indicador_dependiente->id_proceso}
                <a class="btn btn-default btn-primary" href='index.php?page=indicador_mostrar&id_indicador={$indicador_dependiente->id}&id_entidad={$entidad->id}' 
                   title="{$smarty.const.TXT_INDIC_MOSTRAR}: {$indicador_dependiente->nombre}">
                    <i class="fa fa-dashboard fa-fw"></i> <span class="badge">{$indicador_dependiente->id}</span> - {$indicador_dependiente->nombre}
                </a>
            {else}
                <a class="btn btn-default btn-primary" href='index.php?page=dato_mostrar&id_dato={$indicador_dependiente->id}&id_entidad={$entidad->id}' 
                   title="{$smarty.const.TXT_DATO_MOSTRAR}: {$indicador_dependiente->nombre}">
                    <i class="fa fa-database fa-fw"></i> <span class="badge">{$indicador_dependiente->id}</span> - {$indicador_dependiente->nombre}
                </a>
            {/if}   
        {/foreach}      
    </div> 
{/if}
<!-- /Indicadores/datos dependientes -->

<!-- Gráficas -->
<div class ="row">
    {if $pinta_grafico}

        {if $panel_res}
            <div class="col-lg-{$panel_res->ancho}" >
                <div class="panel panel-red">
                    <div class="panel-heading">
                        <span class="panel-title"><i class="fa fa-bar-chart fa-fw"></i><strong> {$panel_res->nombre}</strong> {$smarty.const.TXT_GRAFICO_AUMENTAR}</span>
                        <i class="fa fa-chevron-up pull-right clickable"></i>
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div  id="container" 
                              data-id_indicador="{$indicador->id}" 
                              data-nombre_indicador="{$indicador->nombre}" 
                              data-periodicidad="{$panel_res->periodicidad}"
                              data-valor_min="{$indicador->valor_min}" 
                              data-valor_max="{$indicador->valor_max}">
                        </div>
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-{$panel->ancho} -->    
        {/if}

        {if isset($paneles)}
            {foreach $paneles as $panel}
                <div class="col-lg-{$panel->ancho}" >
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <span class="panel-title"><i class="fa fa-line-chart fa-fw"></i><strong> {$panel->nombre}</strong> {$smarty.const.TXT_GRAFICO_AUMENTAR}</span>
                            <i class="fa fa-chevron-up pull-right clickable"></i>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">  
                            <div class="highchart {$panel->tipo->clase_css}" 
                                 id="panel_{$panel->id}" 
                                 data-id_indicador="{$indicador->id}" 
                                 data-nombre_indicador="{$indicador->nombre}" 
                                 data-valor_min="{$indicador->valor_min}" 
                                 data-valor_max="{$indicador->valor_max}" 
                                 data-fecha_inicio="{$panel->fecha_inicio}" 
                                 data-fecha_fin="{$panel->fecha_fin}" 
                                 data-periodicidad="{$panel->periodicidad}">
                            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-{$panel->ancho} -->
            {/foreach} 
        {/if}

    {else if !$mediciones}
        <div class="alert alert-info alert-dismissible">
            <i class="fa fa-info-circle fa-fw"></i> 
            {$smarty.const.MSG_MED_NO_TIPO} {$tipo}
        </div>
    {else}
        <div class="alert alert-info alert-dismissible">
            <i class="fa fa-info-circle fa-fw"></i> 
            {$smarty.const.MSG_INDIC_NO_VAL}
        </div>
    {/if}
</div>
<!-- /.row -->
<!-- /Gráficas -->