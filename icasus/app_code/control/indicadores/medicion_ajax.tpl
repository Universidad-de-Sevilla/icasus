{if $modulo == 'editarfila'}
    <table class="table table-striped table-hover" id="tabla_valores">
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
                {*El indicador/dato es agregado pero por si su total se introduce 
                manualmente nos cercioramos de no listar la Unidad madre en orden, la pondremos al final*}
                {if $valor->id_entidad!=$entidad->id && $indicador->id_tipo_agregacion!= 0}
                    <tr>
                        <td><span class="label label-primary">{$valor->entidad->etiqueta}</span></td>
                        <td style="white-space: nowrap">
                            {if $valor->id == $valor_edit && $valor->activo}
                                <input name="v_{$valor->id}" class="actualizar_dato" type="text" value="{$valor->valor_parcial}">
                                <a class="btn btn-default btn-circle btn-xs" href="javascript:void(0)" onclick="fila_grabar('{$valor->id}', '{$medicion->id}');"><i title='{$smarty.const.TXT_GRABAR}' class="fa fa-floppy-o fa-fw"></i></a>
                                <a class="btn btn-default btn-circle btn-xs" href="javascript:void(0)" onclick="fila_cancelar('{$medicion->id}');"><i title='{$smarty.const.TXT_CANCEL}' class="fa fa-times fa-fw"></i></a>
                                {elseif $valor->activo}
                                <a href="javascript:void(0)" onclick="fila_editar('{$medicion->id}', '{$valor->id}');">{if $valor->valor == NULL}---{else}{$valor->valor|round:"2"}{/if}</a>
                            {else}
                            {if $valor->valor == NULL}---{else}{$valor->valor|round:"2"}{/if}
                        {/if}
                    </td>
                    <td>{$valor->fecha_recogida|date_format:"%d-%m-%Y"}</td>
                    <td style="font-size: 12px">{$valor->usuario->nombre} {$valor->usuario->apellidos}</td>  
                </tr>
            {/if}
            {*El indicador/dato es centralizado*}
            {if $indicador->id_tipo_agregacion== 0}
                <tr {if isset($status)}class="{$status}"{/if}>
                    <th>{$smarty.const.FIELD_TOTAL}: {$valor->entidad->etiqueta}</th>
                    <td>
                        {if $valor->id == $valor_edit}
                            <input name="v_{$valor->id}" class="actualizar_dato" type="text" value="{$valor->valor_parcial}">
                            <a class="btn btn-default btn-circle btn-xs" href="javascript:void(0)" onclick="javascript:fila_grabar('{$valor->id}', '{$medicion->id}');"><i title='{$smarty.const.TXT_GRABAR}' class="fa fa-floppy-o fa-fw"></i></a>
                            <a class="btn btn-default btn-circle btn-xs" href="javascript:void(0)" onclick="javascript:fila_cancelar('{$medicion->id}');"><i title='{$smarty.const.TXT_CANCEL}' class="fa fa-times fa-fw"></i></a>
                            {else}
                            <a href="javascript:void(0)" onclick="fila_editar('{$medicion->id}', '{$valor->id}');">
                                {if $valor->valor!== NULL}
                                    {if isset($status)}
                                        {if $status == 'danger'}
                                            <span title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_MEJORABLE} ({$smarty.const.FIELD_LIMITE}: {$medicion_lim}, {$smarty.const.FIELD_META}: {$medicion_obj})" class="label label-{$status}">{$valor->valor|round:"2"}</span>
                                        {elseif $status == 'success'}
                                            <span title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_LOGRADO} ({$smarty.const.FIELD_LIMITE}: {$medicion_lim}, {$smarty.const.FIELD_META}: {$medicion_obj})" class="label label-{$status}">{$valor->valor|round:"2"}</span>
                                        {else}
                                            <span title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_ACEPTABLE} ({$smarty.const.FIELD_LIMITE}: {$medicion_lim}, {$smarty.const.FIELD_META}: {$medicion_obj})" class="label label-{$status}">{$valor->valor|round:"2"}</span>
                                        {/if}
                                    {else}
                                        <span class="label label-default">{$total|round:"2"}</span>
                                    {/if}
                                {else}
                                    ---
                                {/if}
                            </a>
                        {/if}
                    </td>
                    <td>{$valor->fecha_recogida|date_format:"%d-%m-%Y"}</td>
                    <td style="font-size: 12px">{$valor->usuario->nombre} {$valor->usuario->apellidos}</td>  
                </tr>
            {/if}
        {/foreach}
    </tbody>
    <tfoot>
        <!-- TOTALES -->
        {*El indicador/dato es agregado y su total no se introduce manualmente*}
        {if $indicador->id_tipo_agregacion!= 0 && $indicador->id_tipo_agregacion!= 4}
            <tr {if isset($status)}class="{$status}"{/if}>
                <th>{$smarty.const.FIELD_TOTAL}: {$entidad->etiqueta} ({$agregacion})</th>
                <td>
                    {if $total!== NULL}
                        {if isset($status)}
                            {if $status == 'danger'}
                                <span title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_MEJORABLE} ({$smarty.const.FIELD_LIMITE}: {$medicion_lim}, {$smarty.const.FIELD_META}: {$medicion_obj})" class="label label-{$status}">{$total|round:"2"}</span>
                            {elseif $status == 'success'}
                                <span title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_LOGRADO} ({$smarty.const.FIELD_LIMITE}: {$medicion_lim}, {$smarty.const.FIELD_META}: {$medicion_obj})" class="label label-{$status}">{$total|round:"2"}</span>
                            {else}
                                <span title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_ACEPTABLE} ({$smarty.const.FIELD_LIMITE}: {$medicion_lim}, {$smarty.const.FIELD_META}: {$medicion_obj})" class="label label-{$status}">{$total|round:"2"}</span>
                            {/if}
                        {else}
                            <span class="label label-default">{$total|round:"2"}</span>
                        {/if}
                    {else}
                        ---
                    {/if}
                </td>
                <td>---</td>
                <td>---</td>  
            </tr>
        {/if}
        {*El indicador/dato es agregado y su total se introduce manualmente*}
        {if $indicador->id_tipo_agregacion!= 0 && $indicador->id_tipo_agregacion== 4}
            {foreach $valores as $valor}
                {if $valor->id_entidad==$entidad->id}
                    <tr {if isset($status)}class="{$status}"{/if}>
                        <th>{$smarty.const.FIELD_TOTAL}: {$entidad->etiqueta} ({$agregacion})</th>
                        <td>
                            {if $valor->id == $valor_edit}
                                <input name="v_{$valor->id}" class="actualizar_dato" type="text" value="{$valor->valor_parcial}">
                                <a class="btn btn-default btn-circle btn-xs" href="javascript:void(0)" onclick="javascript:fila_grabar('{$valor->id}', '{$medicion->id}');"><i title='{$smarty.const.TXT_GRABAR}' class="fa fa-floppy-o fa-fw"></i></a>
                                <a class="btn btn-default btn-circle btn-xs" href="javascript:void(0)" onclick="javascript:fila_cancelar('{$medicion->id}');"><i title='{$smarty.const.TXT_CANCEL}' class="fa fa-times fa-fw"></i></a>
                                {else}
                                <a href="javascript:void(0)" onclick="fila_editar('{$medicion->id}', '{$valor->id}');">
                                    {if $valor->valor!== NULL}
                                        {if isset($status)}
                                            {if $status == 'danger'}
                                                <span title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_MEJORABLE} ({$smarty.const.FIELD_LIMITE}: {$medicion_lim}, {$smarty.const.FIELD_META}: {$medicion_obj})" class="label label-{$status}">{$valor->valor|round:"2"}</span>
                                            {elseif $status == 'success'}
                                                <span title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_LOGRADO} ({$smarty.const.FIELD_LIMITE}: {$medicion_lim}, {$smarty.const.FIELD_META}: {$medicion_obj})" class="label label-{$status}">{$valor->valor|round:"2"}</span>
                                            {else}
                                                <span title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_ACEPTABLE} ({$smarty.const.FIELD_LIMITE}: {$medicion_lim}, {$smarty.const.FIELD_META}: {$medicion_obj})" class="label label-{$status}">{$valor->valor|round:"2"}</span>
                                            {/if}
                                        {else}
                                            <span class="label label-default">{$total|round:"2"}</span>
                                        {/if}
                                    {else}
                                        ---
                                    {/if}
                                </a>
                            {/if}
                        </td>
                        <td>
                            {$valor->fecha_recogida|date_format:"%d-%m-%Y"}
                        </td>
                        <td style="font-size: 12px">
                            {$valor->usuario->nombre} {$valor->usuario->apellidos}
                        </td>  
                    </tr>
                {/if}
            {/foreach}
        {/if}
        <!-- //TOTALES -->
    </tfoot>
</table>
<script>
    //Tablas de valores
    tablas_valores = $('#tabla_valores').DataTable({
        "bPaginate": false,
        "bSort": false,
        fixedHeader: true,
        dom: "<'row'<'col-sm-12'>>" +
                "<'row'<'col-sm-12'tr>>" +
                "<'row'<'col-sm-12'>>"
    });

    //Reajustamos las cabeceras de las datatables al cambiar de pestaña
    $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
        tablas_valores.fixedHeader.adjust();
    });

    //Reajustamos las cabeceras de las datatables al hacer scroll
    $('.table-responsive').on('scroll', function () {
        tablas_valores.fixedHeader.adjust();
    });
</script>
{/if}

{if $modulo == 'cancelarfila'}
    <table class="table table-striped table-hover" id="tabla_valores">
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
                {*El indicador/dato es agregado pero si su total se introduce manualmente nos cercioramos de no
                listar la Unidad madre en orden, la pondremos al final*}
                {if $valor->id_entidad!=$entidad->id && $indicador->id_tipo_agregacion!= 0}
                    <tr>
                        <td><span class="label label-primary">{$valor->entidad->etiqueta}</span></td>
                        <td>
                            {if $valor->activo}
                                <a href="javascript:void(0)" title="{$smarty.const.TXT_EDIT}" onclick="fila_editar('{$medicion_edit}', '{$valor->id}');">
                                    {if $valor->valor == NULL}---
                                    {else}{$valor->valor|round:"2"}
                                    {/if}
                                </a>
                            {else}
                                {if $valor->valor == NULL}---
                                {else}{$valor->valor|round:"2"}
                                {/if}
                            {/if}
                        </td>
                        <td>{$valor->fecha_recogida|date_format:"%d-%m-%Y"}</td>
                        <td style="font-size: 12px">{$valor->usuario->nombre} {$valor->usuario->apellidos}</td>  
                    </tr>
                {/if}
                {*El indicador/dato es centralizado*}
                {if $indicador->id_tipo_agregacion== 0}
                    <tr {if isset($status)}class="{$status}"{/if}>
                        <th>{$smarty.const.FIELD_TOTAL}: {$valor->entidad->etiqueta}</th>
                        <td>
                            <a href="javascript:void(0)" title="{$smarty.const.TXT_EDIT}" onclick="fila_editar('{$medicion_edit}', '{$valor->id}');">
                                {if $valor->valor!== NULL}
                                    {if isset($status)}
                                        {if $status == 'danger'}
                                            <span title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_MEJORABLE} ({$smarty.const.FIELD_LIMITE}: {$medicion_lim}, {$smarty.const.FIELD_META}: {$medicion_obj})" class="label label-{$status}">{$valor->valor|round:"2"}</span>
                                        {elseif $status == 'success'}
                                            <span title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_LOGRADO} ({$smarty.const.FIELD_LIMITE}: {$medicion_lim}, {$smarty.const.FIELD_META}: {$medicion_obj})" class="label label-{$status}">{$valor->valor|round:"2"}</span>
                                        {else}
                                            <span title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_ACEPTABLE} ({$smarty.const.FIELD_LIMITE}: {$medicion_lim}, {$smarty.const.FIELD_META}: {$medicion_obj})" class="label label-{$status}">{$valor->valor|round:"2"}</span>
                                        {/if}
                                    {else}
                                        <span class="label label-default">{$total|round:"2"}</span>
                                    {/if}
                                {else}
                                    ---
                                {/if}
                            </a>
                        </td>
                        <td>{$valor->fecha_recogida|date_format:"%d-%m-%Y"}</td>
                        <td style="font-size: 12px">{$valor->usuario->nombre} {$valor->usuario->apellidos}</td>  
                    </tr>
                {/if}
            {/foreach}
        </tbody>
        <tfoot>
            <!-- TOTALES -->
            {*El indicador/dato es agregado y su total no se introduce manualmente*}
            {if $indicador->id_tipo_agregacion!= 0 && $indicador->id_tipo_agregacion!= 4}
                <tr {if isset($status)}class="{$status}"{/if}>
                    <th>{$smarty.const.FIELD_TOTAL}: {$entidad->etiqueta} ({$agregacion})</th>
                    <td>
                        {if $total!== NULL}
                            {if isset($status)}
                                {if $status == 'danger'}
                                    <span title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_MEJORABLE} ({$smarty.const.FIELD_LIMITE}: {$medicion_lim}, {$smarty.const.FIELD_META}: {$medicion_obj})" class="label label-{$status}">{$total|round:"2"}</span>
                                {elseif $status == 'success'}
                                    <span title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_LOGRADO} ({$smarty.const.FIELD_LIMITE}: {$medicion_lim}, {$smarty.const.FIELD_META}: {$medicion_obj})" class="label label-{$status}">{$total|round:"2"}</span>
                                {else}
                                    <span title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_ACEPTABLE} ({$smarty.const.FIELD_LIMITE}: {$medicion_lim}, {$smarty.const.FIELD_META}: {$medicion_obj})" class="label label-{$status}">{$total|round:"2"}</span>
                                {/if}
                            {else}
                                <span class="label label-default">{$total|round:"2"}</span>
                            {/if}
                        {else}
                            ---
                        {/if}
                    </td>
                    <td>---</td>
                    <td>---</td>  
                </tr>
            {/if}
            {*El indicador/dato es agregado y su total se introduce manualmente*}
            {if $indicador->id_tipo_agregacion!= 0 && $indicador->id_tipo_agregacion== 4}
                {foreach $valores as $valor}
                    {if $valor->id_entidad==$entidad->id}
                        <tr {if isset($status)}class="{$status}"{/if}>
                            <th>{$smarty.const.FIELD_TOTAL}: {$entidad->etiqueta} ({$agregacion})</th>
                            <td>
                                <a href="javascript:void(0)" title="{$smarty.const.TXT_EDIT}" onclick="fila_editar('{$medicion_edit}', '{$valor->id}');">
                                    {if $valor->valor!== NULL}
                                        {if isset($status)}
                                            {if $status == 'danger'}
                                                <span title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_MEJORABLE} ({$smarty.const.FIELD_LIMITE}: {$medicion_lim}, {$smarty.const.FIELD_META}: {$medicion_obj})" class="label label-{$status}">{$valor->valor|round:"2"}</span>
                                            {elseif $status == 'success'}
                                                <span title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_LOGRADO} ({$smarty.const.FIELD_LIMITE}: {$medicion_lim}, {$smarty.const.FIELD_META}: {$medicion_obj})" class="label label-{$status}">{$valor->valor|round:"2"}</span>
                                            {else}
                                                <span title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_ACEPTABLE} ({$smarty.const.FIELD_LIMITE}: {$medicion_lim}, {$smarty.const.FIELD_META}: {$medicion_obj})" class="label label-{$status}">{$valor->valor|round:"2"}</span>
                                            {/if}
                                        {else}
                                            <span class="label label-default">{$total|round:"2"}</span>
                                        {/if}
                                    {else}
                                        ---
                                    {/if}
                                </a>
                            </td>
                            <td>
                                {$valor->fecha_recogida|date_format:"%d-%m-%Y"}
                            </td>
                            <td style="font-size: 12px">
                                {$valor->usuario->nombre} {$valor->usuario->apellidos}
                            </td>  
                        </tr>
                    {/if}
                {/foreach}
            {/if}
            <!-- //TOTALES -->
        </tfoot>
    </table>
    <script>
        //Tablas de valores
        tablas_valores = $('#tabla_valores').DataTable({
            "bPaginate": false,
            "bSort": false,
            fixedHeader: true,
            dom: "<'row'<'col-sm-12'>>" +
                    "<'row'<'col-sm-12'tr>>" +
                    "<'row'<'col-sm-12'>>"
        });

        //Reajustamos las cabeceras de las datatables al cambiar de pestaña
        $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
            tablas_valores.fixedHeader.adjust();
        });

        //Reajustamos las cabeceras de las datatables al hacer scroll
        $('.table-responsive').on('scroll', function () {
            tablas_valores.fixedHeader.adjust();
        });
    </script>
{/if}

{if $modulo == 'cancelarvalorreferencia'}
    <a href="javascript:void(0)" title="{$smarty.const.TXT_EDIT}" onclick="referencia_editar('{$valor_referencia_medicion->id}', '{$medicion->id}');">
        {if $valor_referencia_medicion->valor == NULL}
            ---
        {else}
            {$valor_referencia_medicion->valor|round:"2"}
        {/if}
    </a>
{/if}

{if $modulo == 'editarvalorreferencia'}
    <input id="input_referencia_{$referencia->id}" name="input_referencia_{$referencia->id}" class="actualizar_dato" type="text" value="{$referencia->valor}">
    <a class="btn btn-default btn-circle btn-xs" href="javascript:void(0)" onclick="javascript:referencia_grabar('{$referencia->id}', '{$medicion->id}', '{$referencia->valor_referencia->nombre}');">
        <i title='{$smarty.const.TXT_GRABAR}' class="fa fa-floppy-o fa-fw"></i>
    </a>
    <a class="btn btn-default btn-circle btn-xs" href="javascript:void(0)" onclick="javascript:referencia_cancelar('{$referencia->id}', '{$medicion->id}');">
        <i title='{$smarty.const.TXT_CANCEL}' class="fa fa-times fa-fw"></i>
    </a>
{/if}

{if $modulo == 'editarfecha'}
    {if $contenedor == 'pi'}
        {html_select_date field_order='DMY' prefix="pi" month_format='%m' start_year="-10" end_year="+4" time=$medicion->periodo_inicio}
        <a class="btn btn-default btn-circle btn-xs" href="javascript:void(0)" onclick="javascript:fecha_grabar('{$medicion->id}', 'pi');">
            <i title='{$smarty.const.TXT_GRABAR}' class="fa fa-floppy-o fa-fw"></i>
        </a>
        <a class="btn btn-default btn-circle btn-xs" href="javascript:void(0)" onclick="javascript:fecha_cancelar('pi', '{$medicion->id}');">
            <i title='{$smarty.const.TXT_CANCEL}' class="fa fa-times fa-fw"></i>
        </a>
    {/if}
    {if $contenedor == 'pf'}
        {html_select_date field_order='DMY' prefix="pf" month_format='%m' start_year="-10" end_year="+4" time=$medicion->periodo_fin}
        <a class="btn btn-default btn-circle btn-xs" href="javascript:void(0)" onclick="javascript:fecha_grabar('{$medicion->id}', 'pf');">
            <i title='{$smarty.const.TXT_GRABAR}' class="fa fa-floppy-o fa-fw"></i>
        </a>
        <a class="btn btn-default btn-circle btn-xs" href="javascript:void(0)" onclick="javascript:fecha_cancelar('pf', '{$medicion->id}');">
            <i title='{$smarty.const.TXT_CANCEL}' class="fa fa-times fa-fw"></i>
        </a>
    {/if}
    {if $contenedor == 'gi'}
        {html_select_date field_order='DMY' prefix="gi" month_format='%m' start_year="-10" end_year="+4" time=$medicion->grabacion_inicio}
        <a class="btn btn-default btn-circle btn-xs" href="javascript:void(0)" onclick="javascript:fecha_grabar('{$medicion->id}', 'gi');">
            <i title='{$smarty.const.TXT_GRABAR}' class="fa fa-floppy-o fa-fw"></i>
        </a>
        <a class="btn btn-default btn-circle btn-xs" href="javascript:void(0)" onclick="javascript:fecha_cancelar('gi', '{$medicion->id}');">
            <i title='{$smarty.const.TXT_CANCEL}' class="fa fa-times fa-fw"></i>
        </a>
    {/if}
    {if $contenedor == 'gf'}
        {html_select_date field_order='DMY' prefix="gf" month_format='%m' start_year="-10" end_year="+4" time=$medicion->grabacion_fin}
        <a class="btn btn-default btn-circle btn-xs" href="javascript:void(0)" onclick="javascript:fecha_grabar('{$medicion->id}', 'gf');">
            <i title='{$smarty.const.TXT_GRABAR}' class="fa fa-floppy-o fa-fw"></i>
        </a>
        <a class="btn btn-default btn-circle btn-xs" href="javascript:void(0)" onclick="javascript:fecha_cancelar('gf', '{$medicion->id}');">
            <i title='{$smarty.const.TXT_CANCEL}' class="fa fa-times fa-fw"></i>
        </a>
    {/if}
{/if}

{if $modulo == 'editaretiqueta'}
    <input name="etiqueta" type="text" class="actualizar_etiqueta" value="{$medicion->etiqueta}">
    <a class="btn btn-default btn-circle btn-xs" href="javascript:void(0)" onclick="javascript:etiqueta_editar_grabar('et', '{$medicion->id}', 'etiqueta');">
        <i title='{$smarty.const.TXT_GRABAR}' class="fa fa-floppy-o fa-fw"></i>
    </a>
    <a class="btn btn-default btn-circle btn-xs" href="javascript:void(0)" onclick="javascript:etiqueta_editar_cancelar('et', '{$medicion->id}');">
        <i title='{$smarty.const.TXT_CANCEL}' class="fa fa-times fa-fw"></i>
    </a>
{/if}

{if $modulo == 'editarobservaciones'}
    <textarea name="observaciones" id="observaciones">{$medicion->observaciones}</textarea>
    <a class="btn btn-default btn-circle btn-xs" href="javascript:void(0)" onclick="javascript:observaciones_editar_grabar('ob', '{$medicion->id}', 'observaciones');">
        <i title='{$smarty.const.TXT_GRABAR}' class="fa fa-floppy-o fa-fw"></i>
    </a>
    <a class="btn btn-default btn-circle btn-xs" href="javascript:void(0)" onclick="javascript:observaciones_editar_cancelar('ob', '{$medicion->id}');">
        <i title='{$smarty.const.TXT_CANCEL}' class="fa fa-times fa-fw"></i>
    </a>
{/if}

{if $modulo == 'cancelaretiqueta'}
    {if $contenedor == 'et'}
        <a href="javascript:void(0)" title="{$smarty.const.TXT_EDIT}" onclick="javascript:etiqueta_editar('{$medicion->id}', 'et', 'etiqueta');">
            {if $medicion->etiqueta != NULL}
                {$medicion->etiqueta}
            {else}
                ---
            {/if}
        </a>
    {/if}
    {if $contenedor == 'pi'}
        <a href="javascript:void(0)" title="{$smarty.const.TXT_EDIT}" onclick="fecha_editar('{$medicion->id}', 'pi');">
            {if $medicion->periodo_inicio != NULL}
                {$medicion->periodo_inicio|date_format:"%d-%m-%Y"}
            {else}
                ---
            {/if}
        </a>
    {/if}
    {if $contenedor == 'pf'}
        <a href="javascript:void(0)" title="{$smarty.const.TXT_EDIT}" onclick="fecha_editar('{$medicion->id}', 'pf');">
            {if $medicion->periodo_fin != NULL}{$medicion->periodo_fin|date_format:"%d-%m-%Y"}
            {else}
                ---
            {/if}
        </a>
    {/if}
    {if $contenedor == 'gi'}
        <a href="javascript:void(0)" title="{$smarty.const.TXT_EDIT}" onclick="fecha_editar('{$medicion->id}', 'gi');">
            {if $medicion->grabacion_inicio != NULL}
                {$medicion->grabacion_inicio|date_format:"%d-%m-%Y"}
            {else}
                ---
            {/if}
        </a>
    {/if}
    {if $contenedor == 'gf'}
        <a href="javascript:void(0)" title="{$smarty.const.TXT_EDIT}" onclick="fecha_editar('{$medicion->id}', 'gf');">
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
        <a href="javascript:void(0)" title="{$smarty.const.TXT_EDIT}" onclick="javascript:observaciones_editar('{$medicion->id}', 'ob', 'observaciones');">
            {if $medicion->observaciones != ''}
                {$medicion->observaciones}
            {else}
                ---
            {/if}
        </a>
    {/if}
    {if $contenedor == 'pi'}
        <a href="javascript:void(0)" title="{$smarty.const.TXT_EDIT}" onclick="fecha_editar('{$medicion->id}', 'pi');">
            {if $medicion->periodo_inicio != NULL}
                {$medicion->periodo_inicio|date_format:"%d-%m-%Y"}
            {else}
                ---
            {/if}
        </a>
    {/if}
    {if $contenedor == 'pf'}
        <a href="javascript:void(0)" title="{$smarty.const.TXT_EDIT}" onclick="fecha_editar('{$medicion->id}', 'pf');">
            {if $medicion->periodo_fin != NULL}{$medicion->periodo_fin|date_format:"%d-%m-%Y"}
            {else}
                ---
            {/if}
        </a>
    {/if}
    {if $contenedor == 'gi'}
        <a href="javascript:void(0)" title="{$smarty.const.TXT_EDIT}" onclick="fecha_editar('{$medicion->id}', 'gi');">
            {if $medicion->grabacion_inicio != NULL}
                {$medicion->grabacion_inicio|date_format:"%d-%m-%Y"}
            {else}
                ---
            {/if}
        </a>
    {/if}
    {if $contenedor == 'gf'}
        <a href="javascript:void(0)" title="{$smarty.const.TXT_EDIT}" onclick="fecha_editar('{$medicion->id}', 'gf');">
            {if $medicion->grabacion_fin != NULL}
                {$medicion->grabacion_fin|date_format:"%d-%m-%Y"}
            {else}
                ---
            {/if}
        </a>
    {/if}
{/if}

{if $modulo == 'grafica'}
    {if $pinta_grafico}
        <strong class="panel-title"><i class="fa fa-pie-chart fa-fw"></i> {$panel->nombre}</strong> {$smarty.const.TXT_GRAFICO_AUMENTAR}
        <div id="container" 
             data-id_indicador="{$indicador->id}" 
             data-nombre_indicador="{$indicador->nombre}" 
             data-id_medicion="{$medicion->id}">
        </div>
    {else}
        <div class="alert alert-info alert-dismissible">
            <i class="fa fa-info-circle fa-fw"></i> 
            {$smarty.const.MSG_VAL_NO_ASIG}
        </div>
    {/if}
{/if}