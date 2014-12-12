<div class="button_bar clearfix">
    <a href="index.php?page=medicion_crear&id_{$tipo}={$indicador->id}"><img src='/icons/ff16/time_add.png' />{$smarty.const.TXT_MED_AGREGAR}</a> &nbsp; &nbsp;
    <a href='index.php?page=indicador_subunidad_valor&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'><img
            src='/icons/ff16/tag_blue.png' /> {$smarty.const.TXT_VAL_EDIT}</a> &nbsp; &nbsp;
    <a href='index.php?page={$tipo}_mostrar&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'><img src='/icons/ff16/chart_curve.png' /> {$smarty.const.TXT_VOLVER} {$tipo}</a> &nbsp;
</div>

<!-- GRÁFICAS -->
{if $mediciones}
    {if isset($paneles)}
        {foreach $paneles as $panel}
            <div class="box grid_{$panel->ancho}" style="float:left; margin-top:10px;">
                <div class="block alturo" style="height:320px">
                    <!--
                    <div class="titulo-panel">
                      <strong>{$panel->nombre}</strong>
                    </div>
                    -->
                    <div class="highchart {$panel->tipo->clase_css}" id="panel_{$panel->id}" data-id_indicador="{$indicador->id}" data-nombre_indicador="{$indicador->nombre}"  data-fecha_inicio="{$panel->fecha_inicio}" data-fecha_fin="{$panel->fecha_fin}" data-periodicidad="{$panel->periodicidad}"></div>
                </div>
            </div>
        {/foreach}
    {/if}
    <!-- //GRÁFICAS -->

    <div class="box grid_16 single_datatable">
        <div id="container" data-id_indicador="{$indicador->id}" data-nombre_indicador="{$indicador->nombre}" data-fecha_inicio="" data-fecha_fin="" data-periodicidad="anual" style="margin:0px">
        </div>
        <div id="dt1" class="no_margin">
            <table class="display datatable" id="listado_mediciones">
                <thead>
                    <tr>
                        <th>{$smarty.const.FIELD_ETIQUETA}</th>
                        <th>{$smarty.const.FIELD_INICIO_PERIODO}</th>
                        <th>{$smarty.const.FIELD_FIN_PERIODO}</th>
                        <th>{$smarty.const.FIELD_INICIO_GRABACION}</th>
                        <th>{$smarty.const.FIELD_FIN_GRABACION}</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach $mediciones as $medicion}
                        <tr class="gradeX">
                            <td nowrap><a href="index.php?page=medicion_editar&id_medicion={$medicion->id}&tipo={$tipo}">{$medicion->etiqueta}</a></td>
                            <td>{$medicion->periodo_inicio}</td>
                            <td>{$medicion->periodo_fin}</td>
                            <td>{$medicion->grabacion_inicio}</td>
                            <td>{$medicion->grabacion_fin}</td>
                        </tr>
                    {/foreach}
                </tbody>
            </table>
        </div>
    {else}
        <div class="alert alert_blue">
            <img height="24" width="24" src="theme/danpin/images/icons/small/white/alert_2.png">
            {$smarty.const.MSG_MED_NO_TIPO} {$tipo}
        </div>
    {/if}
</div>

<div style="opacity: 1;" class="box grid_16">

    <h2 class="box_head">{$smarty.const.TXT_VAL_TABLA}</h2>
    <div style="opacity: 1;" class="block">
        <table class="static">
            <thead>
                <tr>
                    <th></th>
                        {foreach from=$mediciones item=medicion}
                        <th>{$medicion->etiqueta}</th>
                        {/foreach}
                </tr>
            </thead>
            <tbody>
                {foreach from=$subunidades_mediciones item=subunidades}
                    <tr><td>{$subunidades->etiqueta}</td>
                        {foreach from=$subunidades->mediciones item=medicion}
                            <td>{if $medicion->medicion_valor == '--'} -- {else}{if $medicion->medicion_valor->valor != NULL}{$medicion->medicion_valor->valor|round:"2"}{/if}{/if}</td>
                        {/foreach}
                    </tr>
                {/foreach}
            </tbody>
        </table>
    </div>
</div>

<script src="js/highcharts.js" type="text/javascript"></script>
<script src="js/highchartStruct.js" type="text/javascript"></script>
<script src="js/exporting.js"></script>
<script src="js/medicion_listar.js" type="text/javascript"></script>