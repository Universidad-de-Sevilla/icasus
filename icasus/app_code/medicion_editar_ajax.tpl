{if $modulo == 'editarfila'}
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
                {*El indicador/dato es agregado pero por si se calcula por mediana nos cercioramos de no
                listar la Unidad madre en orden, la pondremos al final*}
                {if $valor->id_entidad!=$entidad->id && $indicador->id_tipo_agregacion!= 0}
                    <tr>
                        <td>{$valor->entidad->etiqueta}</td>
                        <td>
                            {if $valor->id == $valor_edit}
                                {if $indicador->calculo}{$indicador->calculo}<br />{/if}
                                <input name="v_{$valor->id}" type="text" value="{$valor->valor_parcial}"  style="margin: 5px 0; height: 20px; line-height: 20px; float: none;">
                                <a href="javascript:void(0)" onclick="javascript:fila_grabar('{$valor->id}', '{$medicion->id}');"><img title='{$smarty.const.TXT_GRABAR}' src='/icons/ff16/disk.png'align="absmiddle"></a>
                                <a href="javascript:void(0)" onclick="javascript:fila_cancelar('{$medicion->id}');"><img title='{$smarty.const.TXT_CANCEL}' src='/icons/ff16/cross.png'align="absmiddle"></a>
                                {else}
                                <a href="javascript:void(0)" onclick="fila_editar('{$medicion->id}', '{$valor->id}');">{if $valor->valor == NULL}---{else}{$valor->valor|round:"2"}{/if}</a>
                            {/if}
                        </td>
                        <td style="text-align: center"> 
                            ---
                        </td>
                        <td>{$valor->fecha_recogida|date_format:"%d-%m-%Y"}</td>
                        <td>{$valor->usuario->nombre} {$valor->usuario->apellidos}</td>  
                    </tr>
                {/if}
                {*El indicador/dato es no agregado*}
                {if $indicador->id_tipo_agregacion== 0}
                    <tr>
                        <td>{$valor->entidad->etiqueta}</td>
                        <td>
                            {if $valor->id == $valor_edit}
                                {if $indicador->calculo}{$indicador->calculo}<br />{/if}
                                <input name="v_{$valor->id}" type="text" value="{$valor->valor_parcial}"  style="margin: 5px 0; height: 20px; line-height: 20px; float: none;">
                                <a href="javascript:void(0)" onclick="javascript:fila_grabar('{$valor->id}', '{$medicion->id}');"><img title='{$smarty.const.TXT_GRABAR}' src='/icons/ff16/disk.png'align="absmiddle"></a>
                                <a href="javascript:void(0)" onclick="javascript:fila_cancelar('{$medicion->id}');"><img title='{$smarty.const.TXT_CANCEL}' src='/icons/ff16/cross.png'align="absmiddle"></a>
                                {else}
                                <a href="javascript:void(0)" onclick="fila_editar('{$medicion->id}', '{$valor->id}');">{if $valor->valor == NULL}---{else}{$valor->valor|round:"2"}{/if}</a>
                            {/if}
                        </td>
                        <td style="text-align: center"> 
                            {if $valor->valor != NULL}
                                {if isset($medicion_lim) AND isset($medicion_obj)}
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
                                    ---
                                {/if}
                            {else}
                                ---
                            {/if}
                        </td>
                        <td>{$valor->fecha_recogida|date_format:"%d-%m-%Y"}</td>
                        <td>{$valor->usuario->nombre} {$valor->usuario->apellidos}</td>  
                    </tr>
                {/if}
            {/foreach}
            <!-- TOTALES -->
            {*El indicador/dato es agregado y no se calcula por mediana*}
            {if $indicador->id_tipo_agregacion!= 0 && $indicador->id_tipo_agregacion!= 4}
                <tr style="font-weight: bold">
                    <td style="border-left:solid 2px #BF2453;border-top:solid 2px #BF2453;border-bottom:solid 2px #BF2453;">{$smarty.const.FIELD_TOTAL}: {$entidad->nombre} ({$agregacion})</td>
                    <td style="border-top:solid 2px #BF2453;border-bottom:solid 2px #BF2453">
                        {if $total === NULL}
                            ---
                        {else}
                            {$total|round:"2"}
                        {/if}
                    </td>
                    <td style="text-align: center;border-top:solid 2px #BF2453;border-bottom:solid 2px #BF2453"> 
                        {if $total != NULL}
                            {if isset($medicion_lim) AND isset($medicion_obj)}
                                {if  $total < $medicion_lim}
                                    <img src='/icons/ff16/bullet_red.png' />
                                {else if $total >= $medicion_obj}
                                    <img src='/icons/ff16/bullet_green.png' />
                                {else}
                                    <img src='/icons/ff16/bullet_yellow.png' />
                                {/if}
                            {else if isset($medicion_obj)}
                                {if $total >= $medicion_obj }
                                    <img src='/icons/ff16/bullet_green.png' />
                                {else}
                                    <img src='/icons/ff16/bullet_red.png' />
                                {/if}
                            {else if isset($medicion_lim)}
                                {if $total < $medicion_lim }
                                    <img src='/icons/ff16/bullet_red.png' />
                                {else}
                                    <img src='/icons/ff16/bullet_green.png' />
                                {/if}
                            {else}
                                ---
                            {/if}
                        {else}
                            ---
                        {/if}
                    </td>
                    <td style="border-top:solid 2px #BF2453;border-bottom:solid 2px #BF2453">---</td>
                    <td style="border-right:solid 2px #BF2453;border-top:solid 2px #BF2453;border-bottom:solid 2px #BF2453">---</td>  
                </tr>
            {/if}
            {*El indicador/dato es agregado y se calcula por mediana*}
            {if $indicador->id_tipo_agregacion!= 0 && $indicador->id_tipo_agregacion== 4}
                {foreach $valores as $valor}
                    {if $valor->id_entidad==$entidad->id}
                        <tr style="font-weight: bold">
                            <td style="border-left:solid 2px #BF2453;border-top:solid 2px #BF2453;border-bottom:solid 2px #BF2453;">{$smarty.const.FIELD_TOTAL}: {$entidad->nombre} ({$agregacion})</td>
                            <td style="border-top:solid 2px #BF2453;border-bottom:solid 2px #BF2453">
                                {if $valor->id == $valor_edit}
                                    {if $indicador->calculo}{$indicador->calculo}<br />{/if}
                                    <input name="v_{$valor->id}" type="text" value="{$valor->valor_parcial}"  style="margin: 5px 0; height: 20px; line-height: 20px; float: none;">
                                    <a href="javascript:void(0)" onclick="javascript:fila_grabar('{$valor->id}', '{$medicion->id}');"><img title='{$smarty.const.TXT_GRABAR}' src='/icons/ff16/disk.png'align="absmiddle"></a>
                                    <a href="javascript:void(0)" onclick="javascript:fila_cancelar('{$medicion->id}');"><img title='{$smarty.const.TXT_CANCEL}' src='/icons/ff16/cross.png'align="absmiddle"></a>
                                    {else}
                                    <a href="javascript:void(0)" onclick="fila_editar('{$medicion->id}', '{$valor->id}');">{if $valor->valor == NULL}---{else}{$valor->valor|round:"2"}{/if}</a>
                                {/if}
                            </td>
                            <td style="text-align: center;border-top:solid 2px #BF2453;border-bottom:solid 2px #BF2453"> 
                                {if $valor->valor != NULL}
                                    {if isset($medicion_lim) AND isset($medicion_obj)}
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
                                        ---
                                    {/if}
                                {else}
                                    ---
                                {/if}
                            </td>
                            <td style="border-top:solid 2px #BF2453;border-bottom:solid 2px #BF2453">
                                {$valor->fecha_recogida|date_format:"%d-%m-%Y"}
                            </td>
                            <td style="border-right:solid 2px #BF2453;border-top:solid 2px #BF2453;border-bottom:solid 2px #BF2453">
                                {$valor->usuario->nombre} {$valor->usuario->apellidos}
                            </td>  
                        </tr>
                    {/if}
                {/foreach}
            {/if}
            <!-- //TOTALES -->
        </tbody>
    </table>    
{/if}

{if $modulo == 'cancelarfila'}
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
                {*El indicador/dato es agregado pero por si se calcula por mediana nos cercioramos de no
                listar la Unidad madre en orden, la pondremos al final*}
                {if $valor->id_entidad!=$entidad->id && $indicador->id_tipo_agregacion!= 0}
                    <tr>
                        <td>{$valor->entidad->etiqueta}</td>
                        <td>
                            <a href="javascript:void(0)" onclick="fila_editar('{$medicion_edit}', '{$valor->id}');">
                                {if $valor->valor == NULL}---
                                {else}{$valor->valor|round:"2"}
                                {/if}
                            </a>
                        </td>
                        <td style="text-align: center"> 
                            ---
                        </td>
                        <td>{$valor->fecha_recogida|date_format:"%d-%m-%Y"}</td>
                        <td>{$valor->usuario->nombre} {$valor->usuario->apellidos}</td>  
                    </tr>
                {/if}
                {*El indicador/dato es no agregado*}
                {if $indicador->id_tipo_agregacion== 0}
                    <tr>
                        <td>{$valor->entidad->etiqueta}</td>
                        <td>
                            <a href="javascript:void(0)" onclick="fila_editar('{$medicion_edit}', '{$valor->id}');">
                                {if $valor->valor == NULL}---
                                {else}{$valor->valor|round:"2"}
                                {/if}
                            </a>
                        </td>
                        <td style="text-align: center"> 
                            {if $valor->valor != NULL}
                                {if isset($medicion_lim) AND isset($medicion_obj)}
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
                                    ---
                                {/if}
                            {else}
                                ---
                            {/if}
                        </td>
                        <td>{$valor->fecha_recogida|date_format:"%d-%m-%Y"}</td>
                        <td>{$valor->usuario->nombre} {$valor->usuario->apellidos}</td>  
                    </tr>
                {/if}
            {/foreach}
            <!-- TOTALES -->
            {*El indicador/dato es agregado y no se calcula por mediana*}
            {if $indicador->id_tipo_agregacion!= 0 && $indicador->id_tipo_agregacion!= 4}
                <tr style="font-weight: bold">
                    <td style="border-left:solid 2px #BF2453;border-top:solid 2px #BF2453;border-bottom:solid 2px #BF2453;">{$smarty.const.FIELD_TOTAL}: {$entidad->nombre} ({$agregacion})</td>
                    <td style="border-top:solid 2px #BF2453;border-bottom:solid 2px #BF2453">
                        {if $total === NULL}
                            ---
                        {else}
                            {$total|round:"2"}
                        {/if}
                    </td>
                    <td style="text-align: center;border-top:solid 2px #BF2453;border-bottom:solid 2px #BF2453"> 
                        {if $total != NULL}
                            {if isset($medicion_lim) AND isset($medicion_obj)}
                                {if  $total < $medicion_lim}
                                    <img src='/icons/ff16/bullet_red.png' />
                                {else if $total >= $medicion_obj}
                                    <img src='/icons/ff16/bullet_green.png' />
                                {else}
                                    <img src='/icons/ff16/bullet_yellow.png' />
                                {/if}
                            {else if isset($medicion_obj)}
                                {if $total >= $medicion_obj }
                                    <img src='/icons/ff16/bullet_green.png' />
                                {else}
                                    <img src='/icons/ff16/bullet_red.png' />
                                {/if}
                            {else if isset($medicion_lim)}
                                {if $total < $medicion_lim }
                                    <img src='/icons/ff16/bullet_red.png' />
                                {else}
                                    <img src='/icons/ff16/bullet_green.png' />
                                {/if}
                            {else}
                                ---
                            {/if}
                        {else}
                            ---
                        {/if}
                    </td>
                    <td style="border-top:solid 2px #BF2453;border-bottom:solid 2px #BF2453">---</td>
                    <td style="border-right:solid 2px #BF2453;border-top:solid 2px #BF2453;border-bottom:solid 2px #BF2453">---</td>  
                </tr>
            {/if}
            {*El indicador/dato es agregado y se calcula por mediana*}
            {if $indicador->id_tipo_agregacion!= 0 && $indicador->id_tipo_agregacion== 4}
                {foreach $valores as $valor}
                    {if $valor->id_entidad==$entidad->id}
                        <tr style="font-weight: bold">
                            <td style="border-left:solid 2px #BF2453;border-top:solid 2px #BF2453;border-bottom:solid 2px #BF2453;">{$smarty.const.FIELD_TOTAL}: {$entidad->nombre} ({$agregacion})</td>
                            <td style="border-top:solid 2px #BF2453;border-bottom:solid 2px #BF2453">
                                <a href="javascript:void(0)" onclick="fila_editar('{$medicion_edit}', '{$valor->id}');">
                                    {if $valor->valor == NULL}---
                                    {else}{$valor->valor|round:"2"}
                                    {/if}
                                </a>
                            </td>
                            <td style="text-align: center;border-top:solid 2px #BF2453;border-bottom:solid 2px #BF2453"> 
                                {if $valor->valor != NULL}
                                    {if isset($medicion_lim) AND isset($medicion_obj)}
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
                                        ---
                                    {/if}
                                {else}
                                    ---
                                {/if}
                            </td>
                            <td style="border-top:solid 2px #BF2453;border-bottom:solid 2px #BF2453">
                                {$valor->fecha_recogida|date_format:"%d-%m-%Y"}
                            </td>
                            <td style="border-right:solid 2px #BF2453;border-top:solid 2px #BF2453;border-bottom:solid 2px #BF2453">
                                {$valor->usuario->nombre} {$valor->usuario->apellidos}
                            </td>  
                        </tr>
                    {/if}
                {/foreach}
            {/if}
            <!-- //TOTALES -->
        </tbody>
    </table>
{/if}

{if $modulo == 'cancelarvalorreferencia'}
    <a href="javascript:void(0)" onclick="referencia_editar('{$valor_referencia_medicion->id}');">
        {if $valor_referencia_medicion->valor == NULL}
            ---
        {else}
            {$valor_referencia_medicion->valor|round:"2"}
        {/if}
    </a>
{/if}

{if $modulo == 'editarvalorreferencia'}
    <input id="input_referencia_{$referencia->id}" name="input_referencia_{$referencia->id}" type="text" value="{$referencia->valor}">
    <a href="javascript:void(0)" onclick="javascript:referencia_grabar('{$referencia->id}');"><img title='{$smarty.const.TXT_GRABAR}' src='/icons/ff16/disk.png'align="absmiddle">
    </a>
    <a href="javascript:void(0)" onclick="javascript:referencia_cancelar('{$referencia->id}');"><img title='{$smarty.const.TXT_CANCEL}' src='/icons/ff16/cross.png'align= "absmiddle">
    </a>
{/if}

{if $modulo == 'editarfecha'}
    {if $contenedor == 'pi'}
        {html_select_date field_order='DMY' prefix="pi" month_format='%m' start_year="-10" end_year="+2" time=$medicion->periodo_inicio}
        <a href="javascript:void(0)" onclick="javascript:fecha_grabar('{$medicion->id}', 'pi');"><img title='{$smarty.const.TXT_GRABAR}' src='/icons/ff16/disk.png'align="absmiddle">
        </a>
        <a href="javascript:void(0)" onclick="javascript:fecha_cancelar('pi', '{$medicion->id}');"><img title='{$smarty.const.TXT_CANCEL}' src='/icons/ff16/cross.png'align="absmiddle">
        </a>
    {/if}
    {if $contenedor == 'pf'}
        {html_select_date field_order='DMY' prefix="pf" month_format='%m' start_year="-10" end_year="+2" time=$medicion->periodo_fin}
        <a href="javascript:void(0)" onclick="javascript:fecha_grabar('{$medicion->id}', 'pf');"><img title='{$smarty.const.TXT_GRABAR}' src='/icons/ff16/disk.png'align="absmiddle">
        </a>
        <a href="javascript:void(0)" onclick="javascript:fecha_cancelar('pf', '{$medicion->id}');"><img title='{$smarty.const.TXT_CANCEL}' src='/icons/ff16/cross.png'align="absmiddle">
        </a>
    {/if}
    {if $contenedor == 'gi'}
        {html_select_date field_order='DMY' prefix="gi" month_format='%m' start_year="-10" end_year="+2" time=$medicion->grabacion_inicio}
        <a href="javascript:void(0)" onclick="javascript:fecha_grabar('{$medicion->id}', 'gi');"><img title='{$smarty.const.TXT_GRABAR}' src='/icons/ff16/disk.png'align="absmiddle">
        </a>
        <a href="javascript:void(0)" onclick="javascript:fecha_cancelar('gi', '{$medicion->id}');"><img title='{$smarty.const.TXT_CANCEL}' src='/icons/ff16/cross.png'align="absmiddle">
        </a>
    {/if}
    {if $contenedor == 'gf'}
        {html_select_date field_order='DMY' prefix="gf" month_format='%m' start_year="-10" end_year="+2" time=$medicion->grabacion_fin}
        <a href="javascript:void(0)" onclick="javascript:fecha_grabar('{$medicion->id}', 'gf');"><img title='{$smarty.const.TXT_GRABAR}' src='/icons/ff16/disk.png'align="absmiddle">
        </a>
        <a href="javascript:void(0)" onclick="javascript:fecha_cancelar('gf', '{$medicion->id}');"><img title='{$smarty.const.TXT_CANCEL}' src='/icons/ff16/cross.png'align="absmiddle">
        </a>
    {/if}
{/if}

{if $modulo == 'editaretiqueta'}
    <input name="etiqueta" type="text" value="{$medicion->etiqueta}">
    <a href="javascript:void(0)" onclick="javascript:etiqueta_editar_grabar('et', '{$medicion->id}', 'etiqueta');"><img title='{$smarty.const.TXT_GRABAR}' src='/icons/ff16/disk.png'align="absmiddle">
    </a>
    <a href="javascript:void(0)" onclick="javascript:etiqueta_editar_cancelar('et', '{$medicion->id}');"><img title='{$smarty.const.TXT_CANCEL}' src='/icons/ff16/cross.png'align= "absmiddle">
    </a>
{/if}

{if $modulo == 'editarobservaciones'}
    <textarea name="observaciones" id="observaciones" rows="7" cols="120">{$medicion->observaciones}</textarea>
    <a href="javascript:void(0)" onclick="javascript:observaciones_editar_grabar('ob', '{$medicion->id}', 'observaciones');"><img title='{$smarty.const.TXT_GRABAR}' src='/icons/ff16/disk.png'align="absmiddle">
    </a>
    <a href="javascript:void(0)" onclick="javascript:observaciones_editar_cancelar('ob', '{$medicion->id}');"><img title='{$smarty.const.TXT_CANCEL}' src='/icons/ff16/cross.png'align= "absmiddle">
    </a>
{/if}

{if $modulo == 'cancelaretiqueta'}
    {if $contenedor == 'et'}
        <a href="javascript:void(0)" onclick="javascript:etiqueta_editar('{$medicion->id}', 'et', 'etiqueta');">
            {if $medicion->etiqueta != NULL}
                {$medicion->etiqueta}
            {else}
                ---
            {/if}
        </a>
    {/if}
    {if $contenedor == 'pi'}
        <a href="javascript:void(0)" onclick="fecha_editar('{$medicion->id}', 'pi');">
            {if $medicion->periodo_inicio != NULL}
                {$medicion->periodo_inicio|date_format:"%d-%m-%Y"}
            {else}
                ---
            {/if}
        </a>
    {/if}
    {if $contenedor == 'pf'}
        <a href="javascript:void(0)" onclick="fecha_editar('{$medicion->id}', 'pf');">
            {if $medicion->periodo_fin != NULL}{$medicion->periodo_fin|date_format:"%d-%m-%Y"}
            {else}
                ---
            {/if}
        </a>
    {/if}
    {if $contenedor == 'gi'}
        <a href="javascript:void(0)" onclick="fecha_editar('{$medicion->id}', 'gi');">
            {if $medicion->grabacion_inicio != NULL}
                {$medicion->grabacion_inicio|date_format:"%d-%m-%Y"}
            {else}
                ---
            {/if}
        </a>
    {/if}
    {if $contenedor == 'gf'}
        <a href="javascript:void(0)" onclick="fecha_editar('{$medicion->id}', 'gf');">
            {if $medicion->grabacion_fin != NULL}
                {$medicion->grabacion_fin|date_format:"%d-%m-%Y"}
            {else}
                ---
            {/if}
        </a>
    {/if}
{/if}

{if $modulo == 'cancelarobservaciones'}
    {if $contenedor == 'ob'}
        <a href="javascript:void(0)" onclick="javascript:observaciones_editar('{$medicion->id}', 'ob', 'observaciones');">
            {if $medicion->observaciones != ''}
                {$medicion->observaciones}
            {else}
                ---
            {/if}
        </a>
    {/if}
    {if $contenedor == 'pi'}
        <a href="javascript:void(0)" onclick="fecha_editar('{$medicion->id}', 'pi');">
            {if $medicion->periodo_inicio != NULL}
                {$medicion->periodo_inicio|date_format:"%d-%m-%Y"}
            {else}
                ---
            {/if}
        </a>
    {/if}
    {if $contenedor == 'pf'}
        <a href="javascript:void(0)" onclick="fecha_editar('{$medicion->id}', 'pf');">
            {if $medicion->periodo_fin != NULL}{$medicion->periodo_fin|date_format:"%d-%m-%Y"}
            {else}
                ---
            {/if}
        </a>
    {/if}
    {if $contenedor == 'gi'}
        <a href="javascript:void(0)" onclick="fecha_editar('{$medicion->id}', 'gi');">
            {if $medicion->grabacion_inicio != NULL}
                {$medicion->grabacion_inicio|date_format:"%d-%m-%Y"}
            {else}
                ---
            {/if}
        </a>
    {/if}
    {if $contenedor == 'gf'}
        <a href="javascript:void(0)" onclick="fecha_editar('{$medicion->id}', 'gf');">
            {if $medicion->grabacion_fin != NULL}
                {$medicion->grabacion_fin|date_format:"%d-%m-%Y"}
            {else}
                ---
            {/if}
        </a>
    {/if}
{/if}

