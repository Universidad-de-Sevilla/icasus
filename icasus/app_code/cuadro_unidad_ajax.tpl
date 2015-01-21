{if $modulo == 'propio'}
    {if $indicadores}
        {foreach $indicadores as $item}
            <div style="margin-top:5px;border:1px solid #c9c9c9">
                <div style="padding:5px; background: #f6f6f6;">
                    <a href="index.php?page=indicador_mostrar&id_indicador={$item->id}&id_entidad={$item->id_entidad}">{$item->codigo}</a> - 
                    <b>{$item->nombre}</b><br />
                    <b>{$smarty.const.FIELD_INTERP}:</b> {$item->interpretacion}
                </div>

                <!-- GRÁFICAS -->
                {if $mediciones_indicador[$item->id]}
                    {if $paneles_indicador[$item->id]}
                        {foreach $paneles_indicador[$item->id] as $panel}
                            <div class="box grid_{$panel->ancho}">
                                <div class="block">
                                    <div class="titulo-panel">
                                        <strong>{$panel->nombre}</strong>
                                    </div>
                                    <div class="section">
                                        <div class="highchart {$panel->tipo->clase_css}" 
                                             id="panel_{$panel->id}" 
                                             data-id_indicador="{$item->id}" 
                                             data-nombre_indicador="{$item->nombre}" 
                                             data-fecha_inicio="{$panel->fecha_inicio}" 
                                             data-fecha_fin="{$panel->fecha_fin}" 
                                             data-periodicidad="{$panel->periodicidad}">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        {/foreach}
                    {/if}
                {else}
                    <div class="alert alert_blue">
                        <img height="24" width="24" src="theme/danpin/images/icons/small/white/alert_2.png">
                        {$smarty.const.MSG_INDIC_NO_VAL}
                    </div>
                {/if}
                <!-- //GRÁFICAS -->
                                       <!-- <img src="index.php?page=grafica_indicador_agregado&id_indicador={$item->id}" alt="gráfica completa con los valores medios del indicador"/> -->
            </div>
        {/foreach}
    {else}
        <div class="alert alert_blue">
            <img height="24" width="24" src="theme/danpin/images/icons/small/white/alert_2.png">
            {$smarty.const.MSG_PROC_NO_INDIC}
        </div>
    {/if}

{/if}

{if $modulo == 'segregado'}
    {if $indicadores_segregados}
        {foreach from=$indicadores_segregados item=item}
            <div style="margin-top:10px;border:1px solid #c9c9c9">
                <div style="padding:5px; background: #f6f6f6;">
                    <a href="index.php?page=indicador_mostrar&id_indicador={$item.id}&id_entidad={$item.id_entidad}">{$item.codigo}</a> - 
                    <b>{$item.nombre}</b><br />
                    <b>{$smarty.const.FIELD_INTERP}:</b> {$item.interpretacion}
                </div>
                <div>
                    <img src="index.php?page=grafica_indicador_segregado&id_indicador={$item.id}" alt="{$smarty.const.TXT_GRAFIC_VAL_MED}"/>
                </div>
            </div>
        {/foreach}
    {else}
        <div class="alert alert_blue">
            <img height="24" width="24" src="theme/danpin/images/icons/small/white/alert_2.png">
            {$smarty.const.MSG_PROC_NO_INDIC}
        </div>
    {/if}
{/if}

{if $modulo == 'superior'}
    {if $indicadores_superior}
        {foreach from=$indicadores_superior item=item}
            <div style="margin-top:5px;border:1px solid #c9c9c9">
                <div style="padding:5px; background: #f6f6f6;">
                    <a href="index.php?page=indicador_mostrar&id_indicador={$item->id}&id_entidad={$item->id_entidad}">{$item->codigo}</a> - 
                    <b>{$item->nombre}</b><br />
                    <b>{$smarty.const.FIELD_INTERP}:</b> {$item->interpretacion}
                </div>

                <!-- GRÁFICAS -->
                {if $mediciones_indicador[$item->id]}
                    {if $paneles_indicador[$item->id]}
                        {foreach $paneles_indicador[$item->id] as $panel}
                            <div class="box grid_{$panel->ancho}">
                                <div class="block">
                                    <div class="titulo-panel">
                                        <strong>{$panel->nombre}</strong>
                                    </div>
                                    <div class="section">
                                        <div class="highchart {$panel->tipo->clase_css}" 
                                             id="panel_{$panel->id}" 
                                             data-id_indicador="{$item->id}" 
                                             data-nombre_indicador="{$item->nombre}" 
                                             data-fecha_inicio="{$panel->fecha_inicio}" 
                                             data-fecha_fin="{$panel->fecha_fin}" 
                                             data-periodicidad="{$panel->periodicidad}">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        {/foreach}
                    {/if}
                {else}
                    <div class="alert alert_blue">
                        <img height="24" width="24" src="theme/danpin/images/icons/small/white/alert_2.png">
                        {$smarty.const.MSG_INDIC_NO_VAL}
                    </div>
                {/if}
                <!-- //GRÁFICAS -->
                                       <!-- <img src="index.php?page=grafica_indicador_agregado&id_indicador={$item->id}" alt="gráfica completa con los valores medios del indicador"/> -->
            </div>
        {/foreach}
    {else}
        <div class="alert alert_blue">
            <img height="24" width="24" src="theme/danpin/images/icons/small/white/alert_2.png">
            {$smarty.const.MSG_PROC_NO_INDIC}
        </div>
    {/if}
{/if}

<script src="js/highcharts.js" type="text/javascript"></script>
<script src="js/highchartStruct.js" type="text/javascript"></script>
<script src="js/exporting.js"></script>
<script src="js/indicador_dato_mostrar.js" type="text/javascript"></script>