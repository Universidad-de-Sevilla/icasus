<div>
    {if $indicador->calculo}
        <div class="alert alert_blue">
            <img height="24" width="24" src="theme/danpin/images/icons/small/white/alert_2.png">
            {$smarty.const.TXT_CALC_AUTO}
        </div>
    {/if}
</div>

<div class="box grid_16">
    <div class="toggle_container">
        <h2 class="box_head grad_grey_dark">{$smarty.const.FIELD_MEDICIONES}</h2>
        <a href="#" class="grabber"></a>
        <a href="#" class="toggle"></a>
        <div class="block">
            <div class="button_bar clearfix">
                {if !$indicador->calculo}
                    <a href="index.php?page=medicion_crear&id_{$tipo}={$indicador->id}">
                        <img src='/icons/ff16/time_add.png' /> {$smarty.const.TXT_MED_AGREGAR}
                    </a>&nbsp;&nbsp;
                    <a href='index.php?page=indicador_subunidad_valor&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                        <img src='/icons/ff16/tag_blue_edit.png' /> {$smarty.const.TXT_VAL_EDIT}
                    </a>&nbsp;&nbsp;
                {/if}
                <a href='index.php?page=medicion_responsable&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                    <img src='/icons/ff16/user_medicion.png' /> {$smarty.const.FIELD_RESP_MED}
                </a>&nbsp;&nbsp;
                <a href='index.php?page=valor_referencia_crear&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                    <img src='/icons/ff16/tag.png' /> {$smarty.const.TXT_VAL_REF}</a>&nbsp;&nbsp;
                <a href='index.php?page={$tipo}_mostrar&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                    <img src='/icons/ff16/chart_curve.png' /> {$smarty.const.TXT_VOLVER} {$tipo}</a>
            </div>

            <!-- GRÁFICAS -->
            <div style="margin:10px;">
                {if $pinta_grafico}
                    {if $panel_res}
                        <div class="box grid_{$panel_res->ancho}"  style="float:left;">
                            <div class="block">
                                <div class="titulo-panel">
                                    <strong>{$panel_res->nombre}</strong>
                                </div>
                                <div  id="container" 
                                      data-id_indicador="{$indicador->id}" 
                                      data-nombre_indicador="{$indicador->nombre}" 
                                      data-periodicidad="{$panel_res->periodicidad}">
                                </div>
                            </div>
                        </div>
                    {/if}
                    {if isset($paneles)}
                        {foreach $paneles as $panel}
                            <div class="box grid_{$panel->ancho}" style="float:left;">
                                <div class="block">
                                    <div class="titulo-panel">
                                        <strong>{$panel->nombre}</strong>
                                    </div>
                                    <div class="highchart {$panel->tipo->clase_css}" 
                                         id="panel_{$panel->id}" 
                                         data-id_indicador="{$indicador->id}" 
                                         data-nombre_indicador="{$indicador->nombre}"  
                                         data-fecha_inicio="{$panel->fecha_inicio}" 
                                         data-fecha_fin="{$panel->fecha_fin}" 
                                         data-periodicidad="{$panel->periodicidad}">
                                    </div>
                                </div>
                            </div>
                        {/foreach}
                    {/if}
                {else if !$mediciones}
                    <div class="alert alert_blue">
                        <img height="24" width="24" src="theme/danpin/images/icons/small/white/alert_2.png">
                        {$smarty.const.MSG_MED_NO_TIPO} {$tipo}
                    </div>
                {else}
                    <div class="alert alert_blue">
                        <img height="24" width="24" src="theme/danpin/images/icons/small/white/alert_2.png">
                        {$smarty.const.MSG_INDIC_NO_VAL}
                    </div>
                {/if}
            </div>
            <!-- //GRÁFICAS -->

        </div>
    </div>
</div>

{if $mediciones}
    <div class="box grid_16">
        <div class="toggle_container">    
            <h2 class="box_head grad_grey_dark">{$smarty.const.TXT_MED_TABLA}</h2>
            <a href="#" class="grabber"></a>
            <a href="#" class="toggle"></a> 
            <div class="block">
                <div class="button_bar clearfix">
                    {if !$indicador->calculo}
                        <a href="index.php?page=medicion_crear&id_{$tipo}={$indicador->id}"><img src='/icons/ff16/time_add.png' /> {$smarty.const.TXT_MED_AGREGAR}
                        </a>&nbsp;&nbsp;
                        <a href='index.php?page=indicador_subunidad_valor&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                            <img src='/icons/ff16/tag_blue_edit.png' /> {$smarty.const.TXT_VAL_EDIT}
                        </a>&nbsp;&nbsp;
                    {/if}
                    <a href='index.php?page=medicion_responsable&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                        <img src='/icons/ff16/user_medicion.png' /> {$smarty.const.FIELD_RESP_MED}
                    </a>&nbsp;&nbsp;
                    <a href='index.php?page=valor_referencia_crear&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'><img 
                            src='/icons/ff16/tag.png' /> {$smarty.const.TXT_VAL_REF}</a>&nbsp;&nbsp;
                    <a href='index.php?page={$tipo}_mostrar&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'><img src='/icons/ff16/chart_curve.png' /> {$smarty.const.TXT_VOLVER} {$tipo}</a>
                </div>
                <div id="dt1" class="no_margin">
                    <table class="display datatable" id="listado_mediciones">
                        <thead>
                            <tr>
                                <th>{$smarty.const.FIELD_ETIQUETA}</th>
                                <th>{$smarty.const.FIELD_INICIO_PERIODO}</th>
                                <th>{$smarty.const.FIELD_FIN_PERIODO}</th>
                                <th>{$smarty.const.FIELD_OBSERV}</th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach $mediciones as $medicion}
                                <tr class="gradeX">
                                    <td nowrap>
                                        <a title="{$smarty.const.TXT_MED_VER}" href="index.php?page=medicion_editar&id_entidad={$entidad->id}&id_medicion={$medicion->id}&tipo={$tipo}">{$medicion->etiqueta}</a>
                                    </td>
                                    <td>{$medicion->periodo_inicio|date_format:"%d-%m-%Y"}</td>
                                    <td>{$medicion->periodo_fin|date_format:"%d-%m-%Y"}</td>
                                    <td>{$medicion->observaciones|truncate:60}</td>
                                </tr>
                            {/foreach}
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <div class="box grid_16">
        <h2 class="box_head grad_grey_dark">{$smarty.const.TXT_VAL_TABLA}</h2>
        <a href="#" class="grabber"></a>
        <a href="#" class="toggle"></a>
        <div class="block">
            <div class="button_bar clearfix">
                {if !$indicador->calculo}
                    <a href="index.php?page=medicion_crear&id_{$tipo}={$indicador->id}"><img src='/icons/ff16/time_add.png' /> {$smarty.const.TXT_MED_AGREGAR}
                    </a>&nbsp;&nbsp;
                    <a href='index.php?page=indicador_subunidad_valor&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'><img
                            src='/icons/ff16/tag_blue_edit.png' /> {$smarty.const.TXT_VAL_EDIT}
                    </a>&nbsp;&nbsp;
                {/if}
                <a href='index.php?page=medicion_responsable&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                    <img src='/icons/ff16/user_medicion.png' /> {$smarty.const.FIELD_RESP_MED}
                </a>&nbsp;&nbsp;
                <a href='index.php?page=valor_referencia_crear&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'><img 
                        src='/icons/ff16/tag.png' /> {$smarty.const.TXT_VAL_REF}</a>&nbsp;&nbsp;
                <a href='index.php?page={$tipo}_mostrar&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'><img src='/icons/ff16/chart_curve.png' /> {$smarty.const.TXT_VOLVER} {$tipo}</a>
            </div>
            <div class="block">
                <div id="dt1" class="no_margin">
                    <table class="display datatable">
                        <thead>
                            <tr>
                                <th>{$smarty.const.FIELD_UNID}</th>
                                    {foreach from=$mediciones item=medicion}
                                    <th>{$medicion->etiqueta}</th>
                                    {/foreach}
                            </tr>
                        </thead>
                        <tbody>
                            {foreach from=$subunidades_mediciones item=subunidades}
                                <tr>
                                    <td>{$subunidades->etiqueta}</td>
                                    {foreach from=$subunidades->mediciones item=medicion}
                                        <td>
                                            {if $medicion->medicion_valor->valor == NULL} 
                                                --- 
                                            {else}
                                                {$medicion->medicion_valor->valor|round:"2"}
                                                {if isset($medicion_lim[$medicion->id])AND isset($medicion_lim[$medicion->id])}
                                                    {if  $medicion->medicion_valor->valor < $medicion_lim[$medicion->id]}
                                                        <img src='/icons/ff16/bullet_red.png' />
                                                    {else if $medicion->medicion_valor->valor >= $medicion_obj[$medicion->id]}
                                                        <img src='/icons/ff16/bullet_green.png' />
                                                    {else}
                                                        <img src='/icons/ff16/bullet_yellow.png' />
                                                    {/if}
                                                {else if isset($medicion_obj[$medicion->id])}
                                                    {if $medicion->medicion_valor->valor >= $medicion_obj[$medicion->id] }
                                                        <img src='/icons/ff16/bullet_green.png' />
                                                    {else}
                                                        <img src='/icons/ff16/bullet_red.png' />
                                                    {/if}
                                                {else if isset($medicion_lim[$medicion->id])}
                                                    {if $medicion->medicion_valor->valor < $medicion_lim[$medicion->id] }
                                                        <img src='/icons/ff16/bullet_red.png' />
                                                    {else}
                                                        <img src='/icons/ff16/bullet_green.png' />
                                                    {/if}
                                                {else}
                                                    <img src='/icons/ff16/bullet_green.png' />
                                                {/if}
                                            {/if}
                                        </td>
                                    {/foreach}
                                </tr>
                            {/foreach}
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
{/if}

<script src="js/highcharts.js" type="text/javascript"></script>
<script src="js/highcharts-3d.js" type="text/javascript"></script>
<script src="js/exporting.js" type="text/javascript"></script>
<script src="js/Conjunto.js" type="text/javascript"></script>
<script src="js/HighchartSerie.js" type="text/javascript"></script>
<script src="js/medicion_listar.js" type="text/javascript"></script>
