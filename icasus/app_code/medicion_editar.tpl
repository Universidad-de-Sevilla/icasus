<!-- NAVEGACIÓN-->
{if count($mediciones)> 1}
    <div class="box grid_16">   
        <div class="button_bar clearfix">
            {if $indice > 0} 
                <a href='index.php?page=medicion_editar&id_entidad={$entidad->id}&id_medicion={$mediciones[0]->id}&tipo={$tipo}'>
                    <img src='/icons/ff16/resultset_first.png' /> {$smarty.const.TXT_PRIMER}
                </a>&nbsp;&nbsp;
                <a href='index.php?page=medicion_editar&id_entidad={$entidad->id}&id_medicion={$mediciones[$indice-1]->id}&tipo={$tipo}'>
                    <img src='/icons/ff16/resultset_previous.png' /> {$smarty.const.TXT_ANT}
                </a>&nbsp;&nbsp;
            {/if}
            {if $indice < (count($mediciones)-1)}
                <a href='index.php?page=medicion_editar&id_entidad={$entidad->id}&id_medicion={$mediciones[$indice+1]->id}&tipo={$tipo}'>
                    <img src='/icons/ff16/resultset_next.png' /> {$smarty.const.TXT_SIG}
                </a>&nbsp;&nbsp;
                <a href='index.php?page=medicion_editar&id_entidad={$entidad->id}&id_medicion={$mediciones[(count($mediciones)-1)]->id}&tipo={$tipo}'>
                    <img src='/icons/ff16/resultset_last.png' /> {$smarty.const.TXT_ULTIMO}
                </a>
            {/if} 
        </div>
    </div>
{/if}
<!-- //NAVEGACIÓN-->

<div class="box grid_16">
    <h2 class="box_head grad_grey_dark">{$smarty.const.TXT_MED_DATOS}</h2>
    <a href="#" class="grabber"></a>
    <a href="#" class="toggle"></a>
    <div class="toggle_container">
        <div class="button_bar clearfix">
            <a href="index.php?page=medicion_crear&id_{$tipo}={$indicador->id}"><img src='/icons/ff16/time_add.png' /> {$smarty.const.TXT_MED_AGREGAR}</a>&nbsp;&nbsp;
            <a href='index.php?page=indicador_subunidad_valor&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                <img src='/icons/ff16/tag_blue_edit.png' /> {$smarty.const.TXT_VAL_EDIT}</a>&nbsp;&nbsp;
            <a href='index.php?page=valor_referencia_crear&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'><img 
                    src='/icons/ff16/tag.png' /> {$smarty.const.TXT_VAL_REF}
            </a>&nbsp;&nbsp;
            {if $permiso_editar}
                <a class='confirmar' href='index.php?page=medicion_borrar&id_medicion={$medicion->id}&tipo={$tipo}&id_entidad={$indicador->id_entidad}'>
                    <img src='/icons/ff16/time_delete.png' /> {$smarty.const.TXT_MED_BORRAR}
                </a>&nbsp;&nbsp;
            {/if}
            <a href='index.php?page=medicion_listar&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'><img src='/icons/ff16/time.png' /> {$smarty.const.TXT_MED_VOLVER}</a>&nbsp;&nbsp;
            <a href='index.php?page={$tipo}_mostrar&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'><img src='/icons/ff16/chart_curve.png' /> {$smarty.const.TXT_VOLVER} {$tipo}</a>&nbsp;&nbsp;
        </div>
        <div class="box grid_8">
            <div class="block" style="margin:10px;">
                {if $permiso_editar == true}
                    <fieldset class="label_side">
                        <label>{$smarty.const.FIELD_ETIQUETA}</label>
                        <div>
                            <span id="et">
                                <a href="javascript:void(0)" onclick="javascript:etiqueta_editar('{$medicion->id}', 'et', 'etiqueta');">{if $medicion->etiqueta != NULL}{$medicion->etiqueta}{else}---{/if}</a>
                            </span>
                        </div>
                    </fieldset>
                    <fieldset>
                        <label>{$smarty.const.FIELD_OBSERV}</label>
                        <div>
                            <span id="ob">
                                <a href="javascript:void(0)" onclick="javascript:observaciones_editar('{$medicion->id}', 'ob', 'observaciones');">{if $medicion->observaciones != ''}{$medicion->observaciones}{else}---{/if}</a>
                            </span>
                        </div>
                    </fieldset>
                    <fieldset class="label_side">
                        <label>{$smarty.const.FIELD_INICIO_PERIODO}</label>
                        <div>
                            <span id="pi">
                                <a href="javascript:void(0)" onclick="fecha_editar('{$medicion->id}', 'pi');">{if $medicion->periodo_inicio}{$medicion->periodo_inicio|date_format:"%d-%m-%Y"}{else}---{/if}</a>
                            </span>
                        </div>
                    </fieldset>
                    <fieldset class="label_side">
                        <label>{$smarty.const.FIELD_FIN_PERIODO}</label>
                        <div>
                            <span id="pf">
                                <a href="javascript:void(0)" onclick="fecha_editar('{$medicion->id}', 'pf');">{if $medicion->periodo_fin}{$medicion->periodo_fin|date_format:"%d-%m-%Y"}{else}---{/if}</a>
                            </span>
                        </div>
                    </fieldset>
                    <fieldset class="label_side">
                        <label>{$smarty.const.FIELD_INICIO_GRABACION}</label>
                        <div>
                            <span id="gi">
                                <a href="javascript:void(0)" onclick="fecha_editar('{$medicion->id}', 'gi');">{if $medicion->grabacion_inicio}{$medicion->grabacion_inicio|date_format:"%d-%m-%Y"}{else}---{/if}</a>
                            </span>
                        </div>
                    </fieldset>
                    <fieldset class="label_side">
                        <label>{$smarty.const.FIELD_FIN_GRABACION}</label>
                        <div>
                            <span id="gf">
                                <a href="javascript:void(0)" onclick="fecha_editar('{$medicion->id}', 'gf');">{if $medicion->grabacion_fin}{$medicion->grabacion_fin|date_format:"%d-%m-%Y"}{else}---{/if}</a>
                            </span>
                        </div>
                    </fieldset>
                    {if isset($valores_referencia_medicion)}
                        {foreach $valores_referencia_medicion as $valor_referencia_medicion}
                            {if $valor_referencia_medicion->valor_referencia->activo}
                                <fieldset class="label_side">
                                    <label>{$valor_referencia_medicion->valor_referencia->etiqueta}</label>
                                    <div>
                                        <span id="referencia_{$valor_referencia_medicion->id}">
                                            <a href="javascript:void(0)" onclick="referencia_editar('{$valor_referencia_medicion->id}');">
                                                {if $valor_referencia_medicion->valor == NULL}
                                                    ---
                                                {else}
                                                    {$valor_referencia_medicion->valor|round:"2"}
                                                {/if}
                                            </a>
                                        </span>
                                    </div>
                                </fieldset>
                            {/if}
                        {/foreach}
                    {else}
                        <fieldset class="label_side">
                            <div>{$smarty.const.MSG_INDIC_NO_VAL_REF}</div>
                        </fieldset>
                    {/if}
                {else}
                    <fieldset class="label_side">
                        <label>{$smarty.const.FIELD_ETIQUETA}</label>
                        <div>{$medicion->etiqueta}</div>
                    </fieldset>
                    <fieldset class="label_side">
                        <label>{$smarty.const.FIELD_OBSERV}</label>
                        <div>{$medicion->observaciones}</div>
                    </fieldset>
                    <fieldset class="label_side">
                        <label>{$smarty.const.FIELD_INICIO_PERIODO}</label>
                        <div>{$medicion->periodo_inicio|date_format:"%d-%m-%Y"}</div>
                    </fieldset>
                    <fieldset class="label_side">
                        <label>{$smarty.const.FIELD_FIN_PERIODO}</label>
                        <div>{$medicion->periodo_fin|date_format:"%d-%m-%Y"}</div>
                    </fieldset>
                    <fieldset class="label_side">
                        <label>{$smarty.const.FIELD_INICIO_GRABACION}</label>
                        <div>{$medicion->grabacion_inicio|date_format:"%d-%m-%Y"}</div>
                    </fieldset>
                    <fieldset class="label_side">
                        <label>{$smarty.const.FIELD_FIN_GRABACION}</label>
                        <div>{$medicion->grabacion_fin|date_format:"%d-%m-%Y"}</div>
                    </fieldset>
                    {if isset($valores_referencia_medicion)}
                        {foreach $valores_referencia_medicion as $valor_referencia_medicion}
                            {if $valor_referencia_medicion->valor_referencia->activo}
                                <fieldset class="label_side">
                                    <label>{$valor_referencia_medicion->valor_referencia->etiqueta}</label>
                                    <div>  
                                        {if $valor_referencia_medicion->valor == NULL}
                                            ---
                                        {else}
                                            {$valor_referencia_medicion->valor|round:"2"}
                                        {/if}
                                    </div>
                                </fieldset>
                            {/if}
                        {/foreach}
                    {else}
                        <fieldset class="label_side">
                            <div>{$smarty.const.MSG_INDIC_NO_VAL_REF}</div>
                        </fieldset>
                    {/if}
                {/if}
            </div>
        </div>
        <div class="box grid_8">

            <!-- GRÁFICA -->
            <div id="grafica" style="margin:10px;">
                {if $pinta_grafico}
                    <div class="block">
                        <div class="titulo-panel">
                            <strong>{$panel->nombre}</strong>
                        </div>
                        <div class="section">
                            <div id="container" 
                                 data-id_indicador="{$indicador->id}" 
                                 data-nombre_indicador="{$indicador->nombre}" 
                                 data-id_medicion="{$medicion->id}">
                            </div>
                        </div>
                    </div>
                {else}
                    <div class="alert alert_blue">
                        <img height="24" width="24" src="theme/danpin/images/icons/small/white/alert_2.png">
                        {$smarty.const.MSG_VAL_NO_ASIG}
                    </div>
                {/if}
            </div>
            <!-- //GRÁFICA -->

        </div><!-- //box grid_8 -->
    </div>
</div>

<div class="box grid_16">
    <h2 class="box_head grad_grey_dark">{$smarty.const.TXT_MED_VALORES}</h2>
    <a href="#" class="grabber"></a>
    <a href="#" class="toggle"></a>
    <div class="toggle_container">
        <div class="button_bar clearfix">
            <a href="index.php?page=medicion_crear&id_{$tipo}={$indicador->id}"><img src='/icons/ff16/time_add.png' /> {$smarty.const.TXT_MED_AGREGAR}</a>&nbsp;&nbsp;
            <a href='index.php?page=indicador_subunidad_valor&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                <img src='/icons/ff16/tag_blue_edit.png' /> {$smarty.const.TXT_VAL_EDIT}</a>&nbsp;&nbsp;
            <a href='index.php?page=valor_referencia_crear&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'><img 
                    src='/icons/ff16/tag.png' /> {$smarty.const.TXT_VAL_REF}
            </a>&nbsp;&nbsp;
            {if $permiso_editar}
                <a class='confirmar' href='index.php?page=medicion_borrar&id_medicion={$medicion->id}&tipo={$tipo}&id_entidad={$indicador->id_entidad}'>
                    <img src='/icons/ff16/time_delete.png' /> {$smarty.const.TXT_MED_BORRAR}
                </a>&nbsp;&nbsp;
            {/if}
            <a href='index.php?page=medicion_listar&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'><img src='/icons/ff16/time.png' /> {$smarty.const.TXT_MED_VOLVER}</a>&nbsp;&nbsp;
            <a href='index.php?page={$tipo}_mostrar&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'><img src='/icons/ff16/chart_curve.png' /> {$smarty.const.TXT_VOLVER} {$tipo}</a>&nbsp;&nbsp;
        </div> 
        {if $valores}
            <div id="valors">
                <table class="static">
                    <thead>
                        <tr>
                            <th>{$smarty.const.FIELD_UNID}</th>
                            <th>{$smarty.const.FIELD_VAL}</th>
                            <th>{$smarty.const.FIELD_STATUS}</th>
                            <th>{$smarty.const.FIELD_FECHA_RECOGIDA}</th>
                            <th>{$smarty.const.FIELD_USER_GRABA}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach $valores as $valor}
                            <tr>
                                <td>{$valor->entidad->etiqueta}</td>
                                <td>
                                    {if $permiso_editar}
                                        <a href="javascript:void(0)" onclick="fila_editar('{$medicion->id}', '{$valor->id}');">
                                            {if $valor->valor == NULL}
                                                ---
                                            {else}
                                                {$valor->valor|round:"2"}
                                            {/if}
                                        </a>
                                    {else}
                                        {if $valor->valor == NULL}
                                            ---
                                        {else}
                                            {$valor->valor|round:"2"}
                                        {/if}
                                    {/if}
                                </td>
                                <td style="text-align: center"> 
                                    {if $valor->valor != NULL}
                                        {if isset($medicion_lim)AND isset($medicion_lim)}
                                            {if  $valor->valor < $medicion_lim}
                                                <img src='/icons/ff16/bullet_red.png' />
                                            {else if $valor->valor >= $medicion_obj}
                                                <img src='/icons/ff16/bullet_green.png' />
                                            {else}
                                                <img src='/icons/ff16/bullet_yellow.png' />
                                            {/if}
                                        {else if isset($medicion_obj)}
                                            {if $valor->valor >= $medicion_obj }
                                                <img src='/icons/ff16/bullet_green.png' />
                                            {else}
                                                <img src='/icons/ff16/bullet_red.png' />
                                            {/if}
                                        {else if isset($medicion_lim)}
                                            {if $valor->valor < $medicion_lim }
                                                <img src='/icons/ff16/bullet_red.png' />
                                            {else}
                                                <img src='/icons/ff16/bullet_green.png' />
                                            {/if}
                                        {else}
                                            <img src='/icons/ff16/bullet_green.png' />
                                        {/if}
                                    {else}
                                        ---
                                    {/if}
                                </td>
                                <td>{$valor->fecha_recogida|date_format:"%d-%m-%Y"}</td>
                                <td>{$valor->usuario->nombre} {$valor->usuario->apellidos}</td>  
                            </tr>
                        {/foreach}
                    </tbody>
                </table>
            </div>
        {else}
            <div class="alert alert_red">{$smarty.const.ERR_MED_NO_VAL}</div>
        {/if}
    </div>
</div>

<!-- NAVEGACIÓN-->
{if count($mediciones)> 1}
    <div class="box grid_16">   
        <div class="button_bar clearfix">
            {if $indice > 0} 
                <a href='index.php?page=medicion_editar&id_entidad={$entidad->id}&id_medicion={$mediciones[0]->id}&tipo={$tipo}'>
                    <img src='/icons/ff16/resultset_first.png' /> {$smarty.const.TXT_PRIMER}
                </a>&nbsp;&nbsp;
                <a href='index.php?page=medicion_editar&id_entidad={$entidad->id}&id_medicion={$mediciones[$indice-1]->id}&tipo={$tipo}'>
                    <img src='/icons/ff16/resultset_previous.png' /> {$smarty.const.TXT_ANT}
                </a>&nbsp;&nbsp;
            {/if}
            {if $indice < (count($mediciones)-1)}
                <a href='index.php?page=medicion_editar&id_entidad={$entidad->id}&id_medicion={$mediciones[$indice+1]->id}&tipo={$tipo}'>
                    <img src='/icons/ff16/resultset_next.png' /> {$smarty.const.TXT_SIG}
                </a>&nbsp;&nbsp;
                <a href='index.php?page=medicion_editar&id_entidad={$entidad->id}&id_medicion={$mediciones[(count($mediciones)-1)]->id}&tipo={$tipo}'>
                    <img src='/icons/ff16/resultset_last.png' /> {$smarty.const.TXT_ULTIMO}
                </a>
            {/if} 
        </div>
    </div>
{/if}
<!-- //NAVEGACIÓN-->

<script src="js/highcharts.js" type="text/javascript"></script>
<script src="js/highcharts-3d.js" type="text/javascript"></script>
<script src="js/exporting.js" type="text/javascript"></script>
<script src="js/Conjunto.js" type="text/javascript"></script>
<script src="js/HighchartSerie.js" type="text/javascript"></script>
<script src="js/medicion_editar.js" type="text/javascript"></script>

