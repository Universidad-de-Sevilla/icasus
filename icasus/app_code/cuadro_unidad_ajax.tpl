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
                                <div class="block alturo" style="height:320px">
                                    <!--
                                    <div class="titulo-panel">
                                      <strong>{$panel->nombre}</strong>
                                    </div>
                                    -->
                                    <div class="section">
                                        <div class="highchart {$panel->tipo->clase_css}" id="panel_{$panel->id}" data-id_indicador="{$item->id}" data-nombre_indicador="{$item->nombre}" data-fecha_inicio="{$panel->fecha_inicio}" data-fecha_fin="{$panel->fecha_fin}" data-periodicidad="{$panel->periodicidad}"></div>
                                    </div>
                                </div>
                            </div>
                        {/foreach}
                    {/if}
                {else}
                    <p class="aviso">{$smarty.const.MSG_INDIC_NO_VAL}</p>
                {/if}
                <!-- //GRÁFICAS -->
                                       <!-- <img src="index.php?page=grafica_indicador_agregado&id_indicador={$item->id}" alt="gráfica completa con los valores medios del indicador"/> -->
            </div>
        {/foreach}
    {else}
        <p>
            {$smarty.const.MSG_PROC_NO_INDIC}
        </p>
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
        <p> 
            {$smarty.const.MSG_PROC_NO_INDIC}
        </p>
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
                <div>
                    <div style="background: white; padding:20px 40px; margin:10px;">
                        <div class="panel_flot" id="{$item->id}" data-id_indicador="{$item->id}" data-nombre_indicador="{$item->nombre}" data-fecha_inicio="{$item->historicos}-01-01" data-fecha_fin="{$smarty.now|date_format:'%Y' - 1}-12-31" data-periodicidad="anual"></div>
                        <div class="leyenda"></div>
                    </div>
                                                          <!-- <img src="index.php?page=grafica_indicador_agregado&id_indicador={$item->id}" alt="gráfica completa con los valores medios del indicador"/> -->
                </div>
            </div>
        {/foreach}
    {else}
        <p> 
            {$smarty.const.MSG_PROC_NO_INDIC}
        </p>
    {/if}
{/if}

<script src="js/highcharts.js" type="text/javascript"></script>
<script src="js/highchartStruct.js" type="text/javascript"></script>
<script src="js/exporting.js"></script>
<script src="js/indicador_dato_mostrar.js" type="text/javascript"></script>