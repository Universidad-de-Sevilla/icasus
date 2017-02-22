<!-- Panel de Valores/Subunidad -->
<div class="col-lg-{$panel_res->ancho}">
    <div class="panel panel-red">
        <div class="panel-heading">
            <span class="panel-title"><i class="fa fa-bar-chart fa-fw"></i><strong> {$panel_res->nombre}</strong> {$smarty.const.TXT_GRAFICO_AUMENTAR}</span>
            <i class="fa fa-chevron-up pull-right clickable"></i>
        </div>
        <!-- /.panel-heading -->
        <div class="panel-body">
            {if $grafica_valores}
                <div  id="container"
                      data-id_indicador="{$indicador->id}"
                      data-nombre_indicador="{$indicador->nombre}"
                      data-periodicidad="{$panel_res->periodicidad}"
                      data-valor_min="{$indicador->valor_min}"
                      data-valor_max="{$indicador->valor_max}"
                      data-fecha_inicio="{$panel_res->fecha_inicio}"
                      data-fecha_fin="{$panel_res->fecha_fin}"
                      data-id_entidad="{$indicador->id_entidad}"
                      data-agregacion="{$indicador->id_tipo_agregacion}">
                </div>
            {else}
                <div class="alert alert-info alert-dismissible">
                    <i class="fa fa-info-circle fa-fw"></i> 
                    {$smarty.const.MSG_INDIC_NO_VAL_PERIODO}
                </div>
            {/if}
        </div>
        <!-- /.panel-body -->
    </div>
    <!-- /.panel -->
</div>
<!-- /.col-lg-{$panel->ancho} -->
<!-- /Panel de Valores/Subunidad -->

<!-- Paneles de líneas -->
{foreach $paneles as $panel}
    <div class="col-lg-{$panel->ancho}" >
        <div class="panel panel-red">
            <div class="panel-heading">
                <span class="panel-title"><i class="fa fa-line-chart fa-fw"></i><strong> {$panel->nombre}</strong> {$smarty.const.TXT_GRAFICO_AUMENTAR}</span>
                <i class="fa fa-chevron-up pull-right clickable"></i>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                {if $panel->id==1 && $grafica_historico || $panel->id==2 && $grafica_intranual}
                    <div class="highchart {*$panel->tipo->clase_css*}"
                         id="panel_{$panel->id}"
                         data-id_indicador="{$indicador->id}"
                         data-nombre_indicador="{$indicador->nombre}"
                         data-valor_min="{$indicador->valor_min}"
                         data-valor_max="{$indicador->valor_max}"
                         data-fecha_inicio="{$panel->fecha_inicio}"
                         data-fecha_fin="{$panel->fecha_fin}"
                         data-periodicidad="{$panel->periodicidad}">
                    </div>
                {else}
                    <div class="alert alert-info alert-dismissible">
                        <i class="fa fa-info-circle fa-fw"></i> 
                        {$smarty.const.MSG_INDIC_NO_VAL_PERIODO}
                    </div>
                {/if}
            </div>
            <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-{$panel->ancho} -->
{/foreach} 
<!-- /Paneles de líneas -->