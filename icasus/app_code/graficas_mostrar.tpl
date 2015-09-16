<!-- GRÁFICAS -->
<div style="margin:10px;">
    {if $pinta_grafico}
        {if $paneles}
            {foreach $paneles as $panel}
                <div class="box grid_{$panel->ancho}" style="float:left;">
                    <div class="block">
                        <div class="titulo-panel">
                            <strong>{$panel->nombre}</strong>&nbsp;{$smarty.const.TXT_GRAFICO_AUMENTAR}
                        </div>
                        <div class="section">
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
</div>
<!-- //GRÁFICAS -->