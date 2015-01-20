{if $modulo == 'editarfila'}
        <table class="static">
            <thead>
                <tr>
                    <th>{$smarty.const.FIELD_UNID}</th>
                    <th>{$smarty.const.FIELD_VAL}</th>
                    <th>{$smarty.const.FIELD_FECHA_RECOGIDA}</th>
                    <th>{$smarty.const.FIELD_USER_GRABA}</th>
                </tr>
            </thead>
            <tbody>
                {foreach $valores as $valor}
                    <tr>
                        <td>{$valor->entidad->nombre}</td>
                        <td>
                            {if $valor->autorizado == 1 OR $indicador->id_responsable == $usuario->id OR $indicador->id_responsable_medicion == $usuario->id}
                                {if $valor->id == $valor_edit}
                                    {if $indicador->calculo}{$indicador->calculo}<br />{/if}
                                    <input name="v_{$valor->id}" type="text" value="{$valor->valor_parcial}"  style="margin: 5px 0; height: 20px; line-height: 20px; float: none;">
                                    <a href="javascript:void(0)" onclick="javascript:fila_grabar('{$valor->id}', '{$medicion->id}');"><img title='{$smarty.const.TXT_GRABAR}' src='/icons/ff16/disk.png'align="absmiddle"></a>
                                    <a href="javascript:void(0)" onclick="javascript:fila_cancelar('{$medicion->id}');"><img title='{$smarty.const.TXT_CANCEL}' src='/icons/ff16/cross.png'align="absmiddle"></a>
                                    {else}
                                    <a href="javascript:void(0)" onclick="fila_editar('{$medicion->id}', '{$valor->id}');">{if $valor->valor == NULL}---{else}{$valor->valor|round:"2"}{/if}</a>
                                {/if}
                            {else}
                            {if $valor->valor == NULL}---{else}{$valor->valor|round:"2"}{/if}
                        {/if}
                    </td>
                    <td>{$valor->fecha_recogida|date_format:"%d-%m-%Y"}</td>
                    <td>{$valor->usuario->nombre} {$valor->usuario->apellidos}</td>
                </tr>
            {/foreach}
        </tbody>
    </table>
{/if}

{if $modulo == 'cancelarfila'}
        <table class="static">
            <thead>
                <tr>
                    <th>{$smarty.const.FIELD_UNID}</th>
                    <th>{$smarty.const.FIELD_VAL}</th>
                    <th>{$smarty.const.FIELD_FECHA_RECOGIDA}</th>
                    <th>{$smarty.const.FIELD_USER_GRABA}</th>
                </tr>
            </thead>
            <tbody>
                {foreach $valores as $valor}
                    <tr>
                        <td>{$valor->entidad->nombre}</td>
                        <td>
                            {if $valor->autorizado == 1 OR  $indicador->id_responsable == $usuario->id OR $indicador->id_responsable_medicion == $usuario->id}
                                <a href="javascript:void(0)" onclick="fila_editar('{$medicion_edit}', '{$valor->id}');">{if $valor->valor == NULL}---{else}{$valor->valor|round:"2"}{/if}</a>
                            {else}
                            {if $valor->valor == NULL}---{else}{$valor->valor|round:"2"}{/if}
                        {/if}
                    </td>
                    <td>{$valor->fecha_recogida|date_format:"%d-%m-%Y"}</td>
                    <td>{$valor->usuario->nombre} {$valor->usuario->apellidos}</td>
                </tr>
            {/foreach}
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

{if $modulo == 'cancelaretiqueta'}
    {if $contenedor == 'et'}
        <a href="javascript:void(0)" onclick="javascript:etiqueta_editar('{$medicion->id}', 'et', 'etiqueta');">
            {if $medicion->etiqueta != NULL}
                {$medicion->etiqueta}
            {else}
                ----
            {/if}
        </a>
    {/if}
    {if $contenedor == 'pi'}
        <a href="javascript:void(0)" onclick="fecha_editar('{$medicion->id}', 'pi');">
            {if $medicion->periodo_inicio != NULL}
                {$medicion->periodo_inicio|date_format:"%d-%m-%Y"}
            {else}
                ----
            {/if}
        </a>
    {/if}
    {if $contenedor == 'pf'}
        <a href="javascript:void(0)" onclick="fecha_editar('{$medicion->id}', 'pf');">
            {if $medicion->periodo_fin != NULL}{$medicion->periodo_fin|date_format:"%d-%m-%Y"}
            {else}
                ----
            {/if}
        </a>
    {/if}
    {if $contenedor == 'gi'}
        <a href="javascript:void(0)" onclick="fecha_editar('{$medicion->id}', 'gi');">
            {if $medicion->grabacion_inicio != NULL}
                {$medicion->grabacion_inicio|date_format:"%d-%m-%Y"}
            {else}
                ----
            {/if}
        </a>
    {/if}
    {if $contenedor == 'gf'}
        <a href="javascript:void(0)" onclick="fecha_editar('{$medicion->id}', 'gf');">
            {if $medicion->grabacion_fin != NULL}
                {$medicion->grabacion_fin|date_format:"%d-%m-%Y"}
            {else}
                ----
            {/if}
        </a>
    {/if}
{/if}
