{if $modulo == 'editarfila'}
    <table class="table table-striped table-hover">
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
                        <td style="white-space: nowrap">
                            {if $valor->id == $valor_edit}
                                <input name="v_{$valor->id}" type="text" value="{$valor->valor_parcial}">
                                <a class="btn btn-default btn-circle btn-xs" href="javascript:void(0)" onclick="fila_grabar('{$valor->id}', '{$medicion->id}');"><i title='{$smarty.const.TXT_GRABAR}' class="fa fa-floppy-o fa-fw"></i></a>
                                <a class="btn btn-default btn-circle btn-xs" href="javascript:void(0)" onclick="fila_cancelar('{$medicion->id}');"><i title='{$smarty.const.TXT_CANCEL}' class="fa fa-times fa-fw"></i></a>
                                {else}
                                <a href="javascript:void(0)" onclick="fila_editar('{$medicion->id}', '{$valor->id}');">{if $valor->valor == NULL}---{else}{$valor->valor|round:"2"}{/if}</a>
                            {/if}
                        </td>
                        <td class="text-center"> 
                            ---
                        </td>
                        <td>{$valor->fecha_recogida|date_format:"%d-%m-%Y"}</td>
                        <td style="font-size: 12px">{$valor->usuario->nombre} {$valor->usuario->apellidos}</td>  
                    </tr>
                {/if}
                {*El indicador/dato es no agregado*}
                {if $indicador->id_tipo_agregacion== 0}
                    <tr style="font-weight: bold" {if isset($medicion_lim) AND isset($medicion_obj)}
                        {if  $valor->valor < $medicion_lim}
                            class="danger"
                        {else if $valor->valor >= $medicion_obj}
                            class="success"
                        {else}
                            class="warning"
                        {/if}
                    {/if}
                    {if isset($medicion_obj) AND !isset($medicion_lim)}
                        {if $valor->valor >= $medicion_obj}
                            class="success"
                        {else}
                            class="danger"
                        {/if}
                    {/if}
                    {if isset($medicion_lim) AND !isset($medicion_obj)}
                        {if $valor->valor < $medicion_lim}
                            class="danger"
                        {else}
                            class="success"
                        {/if}
                    {/if}>
                    <td>{$smarty.const.FIELD_TOTAL}: {$valor->entidad->etiqueta}</td>
                    <td>
                        {if $valor->id == $valor_edit}
                            {if $indicador->calculo}{$indicador->calculo}<br />{/if}
                            <input name="v_{$valor->id}" type="text" value="{$valor->valor_parcial}">
                            <a class="btn btn-default btn-circle btn-xs" href="javascript:void(0)" onclick="javascript:fila_grabar('{$valor->id}', '{$medicion->id}');"><i title='{$smarty.const.TXT_GRABAR}' class="fa fa-floppy-o fa-fw"></i></a>
                            <a class="btn btn-default btn-circle btn-xs" href="javascript:void(0)" onclick="javascript:fila_cancelar('{$medicion->id}');"><i title='{$smarty.const.TXT_CANCEL}' class="fa fa-times fa-fw"></i></a>
                            {else}
                            <a href="javascript:void(0)" onclick="fila_editar('{$medicion->id}', '{$valor->id}');">{if $valor->valor == NULL}---{else}{$valor->valor|round:"2"}{/if}</a>
                        {/if}
                    </td>
                    <td class="text-center"> 
                        {if $valor->valor != NULL}
                            {if isset($medicion_lim) AND isset($medicion_obj)}
                                {if  $valor->valor < $medicion_lim}
                                    <i title="{$smarty.const.TXT_VAL_MEJORABLE}" class="fa fa-circle fa-fw" style="color:red"></i>
                                {else if $valor->valor >= $medicion_obj}
                                    <i title="{$smarty.const.TXT_VAL_LOGRADO}" class="fa fa-circle fa-fw" style="color:green"></i>
                                {else}
                                    <i title="{$smarty.const.TXT_VAL_ACEPTABLE}" class="fa fa-circle fa-fw" style="color:yellow"></i>
                                {/if}
                            {else if isset($medicion_obj)}
                                {if $valor->valor >= $medicion_obj }
                                    <i title="{$smarty.const.TXT_VAL_LOGRADO}" class="fa fa-circle fa-fw" style="color:green"></i>
                                {else}
                                    <i title="{$smarty.const.TXT_VAL_MEJORABLE}" class="fa fa-circle fa-fw" style="color:red"></i>
                                {/if}
                            {else if isset($medicion_lim)}
                                {if $valor->valor < $medicion_lim }
                                    <i title="{$smarty.const.TXT_VAL_MEJORABLE}" class="fa fa-circle fa-fw" style="color:red"></i>
                                {else}
                                    <i title="{$smarty.const.TXT_VAL_LOGRADO}" class="fa fa-circle fa-fw" style="color:green"></i>
                                {/if}
                            {else}
                                ---
                            {/if}
                        {else}
                            ---
                        {/if}
                    </td>
                    <td>{$valor->fecha_recogida|date_format:"%d-%m-%Y"}</td>
                    <td style="font-size: 12px">{$valor->usuario->nombre} {$valor->usuario->apellidos}</td>  
                </tr>
                {/if}
                    {/foreach}
                        <!-- TOTALES -->
                        {*El indicador/dato es agregado y no se calcula por mediana*}
                        {if $indicador->id_tipo_agregacion!= 0 && $indicador->id_tipo_agregacion!= 4}
                            <tr style="font-weight: bold"
                                {if isset($medicion_lim) AND isset($medicion_obj)}
                                    {if  $total < $medicion_lim}
                                        class="danger"
                                    {else if $total >= $medicion_obj}
                                        class="success"
                                    {else}
                                        class="warning"
                                    {/if}
                                {/if}
                                {if isset($medicion_obj) AND !isset($medicion_lim)}
                                    {if $total >= $medicion_obj}
                                        class="success"
                                    {else}
                                        class="danger"
                                    {/if}
                                {/if}
                                {if isset($medicion_lim) AND !isset($medicion_obj)}
                                    {if $total < $medicion_lim}
                                        class="danger"
                                    {else}
                                        class="success"
                                    {/if}
                                {/if}>
                                <td style="border-left:solid 2px #950717;border-top:solid 2px #950717;border-bottom:solid 2px #950717;">{$smarty.const.FIELD_TOTAL}: {$entidad->etiqueta} ({$agregacion})</td>
                                <td style="border-top:solid 2px #950717;border-bottom:solid 2px #950717">
                                    {if $total === NULL}
                                        ---
                                    {else}
                                        {$total|round:"2"}
                                    {/if}
                                </td>
                                <td class="text-center" style="border-top:solid 2px #950717;border-bottom:solid 2px #950717"> 
                                    {if $total != NULL}
                                        {if isset($medicion_lim) AND isset($medicion_obj)}
                                            {if  $total < $medicion_lim}
                                                <i title="{$smarty.const.TXT_VAL_MEJORABLE}" class="fa fa-circle fa-fw" style="color:red"></i>
                                            {else if $total >= $medicion_obj}
                                                <i title="{$smarty.const.TXT_VAL_LOGRADO}" class="fa fa-circle fa-fw" style="color:green"></i>
                                            {else}
                                                <i title="{$smarty.const.TXT_VAL_ACEPTABLE}" class="fa fa-circle fa-fw" style="color:yellow"></i>
                                            {/if}
                                        {else if isset($medicion_obj)}
                                            {if $total >= $medicion_obj }
                                                <i title="{$smarty.const.TXT_VAL_LOGRADO}" class="fa fa-circle fa-fw" style="color:green"></i>
                                            {else}
                                                <i title="{$smarty.const.TXT_VAL_MEJORABLE}" class="fa fa-circle fa-fw" style="color:red"></i>
                                            {/if}
                                        {else if isset($medicion_lim)}
                                            {if $total < $medicion_lim }
                                                <i title="{$smarty.const.TXT_VAL_MEJORABLE}" class="fa fa-circle fa-fw" style="color:red"></i>
                                            {else}
                                                <i title="{$smarty.const.TXT_VAL_LOGRADO}" class="fa fa-circle fa-fw" style="color:green"></i>>
                                            {/if}
                                        {else}
                                            ---
                                        {/if}
                                    {else}
                                        ---
                                    {/if}
                                </td>
                                <td style="border-top:solid 2px #950717;border-bottom:solid 2px #950717">---</td>
                                <td style="border-right:solid 2px #950717;border-top:solid 2px #950717;border-bottom:solid 2px #950717">---</td>  
                            </tr>
                        {/if}
                        {*El indicador/dato es agregado y se calcula por mediana*}
                        {if $indicador->id_tipo_agregacion!= 0 && $indicador->id_tipo_agregacion== 4}
                            {foreach $valores as $valor}
                                {if $valor->id_entidad==$entidad->id}
                                    <tr style="font-weight: bold"
                                        {if isset($medicion_lim) AND isset($medicion_obj)}
                                            {if  $valor->valor < $medicion_lim}
                                                class="danger"
                                            {else if $valor->valor >= $medicion_obj}
                                                class="success"
                                            {else}
                                                class="warning"
                                            {/if}
                                        {/if}
                                        {if isset($medicion_obj) AND !isset($medicion_lim)}
                                            {if $valor->valor >= $medicion_obj}
                                                class="success"
                                            {else}
                                                class="danger"
                                            {/if}
                                        {/if}
                                        {if isset($medicion_lim) AND !isset($medicion_obj)}
                                            {if $valor->valor < $medicion_lim}
                                                class="danger"
                                            {else}
                                                class="success"
                                            {/if}
                                        {/if}>
                                        <td style="border-left:solid 2px #950717;border-top:solid 2px #950717;border-bottom:solid 2px #950717;">{$smarty.const.FIELD_TOTAL}: {$entidad->etiqueta} ({$agregacion})</td>
                                        <td style="border-top:solid 2px #950717;border-bottom:solid 2px #950717;white-space: nowrap">
                                            {if $valor->id == $valor_edit}
                                                {if $indicador->calculo}{$indicador->calculo}<br />{/if}
                                                <input name="v_{$valor->id}" type="text" value="{$valor->valor_parcial}">
                                                <a class="btn btn-default btn-circle btn-xs" href="javascript:void(0)" onclick="javascript:fila_grabar('{$valor->id}', '{$medicion->id}');"><i title='{$smarty.const.TXT_GRABAR}' class="fa fa-floppy-o fa-fw"></i></a>
                                                <a class="btn btn-default btn-circle btn-xs" href="javascript:void(0)" onclick="javascript:fila_cancelar('{$medicion->id}');"><i title='{$smarty.const.TXT_CANCEL}' class="fa fa-times fa-fw"></i></a>
                                                {else}
                                                <a href="javascript:void(0)" onclick="fila_editar('{$medicion->id}', '{$valor->id}');">{if $valor->valor == NULL}---{else}{$valor->valor|round:"2"}{/if}</a>
                                            {/if}
                                        </td>
                                        <td class="text-center" style="border-top:solid 2px #950717;border-bottom:solid 2px #950717"> 
                                            {if $valor->valor != NULL}
                                                {if isset($medicion_lim) AND isset($medicion_obj)}
                                                    {if  $valor->valor < $medicion_lim}
                                                        <i title="{$smarty.const.TXT_VAL_MEJORABLE}" class="fa fa-circle fa-fw" style="color:red"></i>
                                                    {else if $valor->valor >= $medicion_obj}
                                                        <i title="{$smarty.const.TXT_VAL_LOGRADO}" class="fa fa-circle fa-fw" style="color:green"></i>
                                                    {else}
                                                        <i title="{$smarty.const.TXT_VAL_ACEPTABLE}" class="fa fa-circle fa-fw" style="color:yellow"></i>
                                                    {/if}
                                                {else if isset($medicion_obj)}
                                                    {if $valor->valor >= $medicion_obj }
                                                        <i title="{$smarty.const.TXT_VAL_LOGRADO}" class="fa fa-circle fa-fw" style="color:green"></i>
                                                    {else}
                                                        <i title="{$smarty.const.TXT_VAL_MEJORABLE}" class="fa fa-circle fa-fw" style="color:red"></i>
                                                    {/if}
                                                {else if isset($medicion_lim)}
                                                    {if $valor->valor < $medicion_lim }
                                                        <i title="{$smarty.const.TXT_VAL_MEJORABLE}" class="fa fa-circle fa-fw" style="color:red"></i>
                                                    {else}
                                                        <i title="{$smarty.const.TXT_VAL_LOGRADO}" class="fa fa-circle fa-fw" style="color:green"></i>
                                                    {/if}
                                                {else}
                                                    ---
                                                {/if}
                                            {else}
                                                ---
                                            {/if}
                                        </td>
                                        <td style="border-top:solid 2px #950717;border-bottom:solid 2px #950717">
                                            {$valor->fecha_recogida|date_format:"%d-%m-%Y"}
                                        </td>
                                        <td style="font-size: 12px;border-right:solid 2px #950717;border-top:solid 2px #950717;border-bottom:solid 2px #950717">
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
    <table class="table table-striped table-hover">
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
                        <td class="text-center"> 
                            ---
                        </td>
                        <td>{$valor->fecha_recogida|date_format:"%d-%m-%Y"}</td>
                        <td style="font-size: 12px">{$valor->usuario->nombre} {$valor->usuario->apellidos}</td>  
                    </tr>
                {/if}
                {*El indicador/dato es no agregado*}
                {if $indicador->id_tipo_agregacion== 0}
                    <tr style="font-weight: bold" {if isset($medicion_lim) AND isset($medicion_obj)}
                        {if  $valor->valor < $medicion_lim}
                            class="danger"
                        {else if $valor->valor >= $medicion_obj}
                            class="success"
                        {else}
                            class="warning"
                        {/if}
                    {/if}
                    {if isset($medicion_obj) AND !isset($medicion_lim)}
                        {if $valor->valor >= $medicion_obj}
                            class="success"
                        {else}
                            class="danger"
                        {/if}
                    {/if}
                    {if isset($medicion_lim) AND !isset($medicion_obj)}
                        {if $valor->valor < $medicion_lim}
                            class="danger"
                        {else}
                            class="success"
                        {/if}
                    {/if}>
                        <td>{$smarty.const.FIELD_TOTAL}: {$valor->entidad->etiqueta}</td>
                        <td>
                            <a href="javascript:void(0)" onclick="fila_editar('{$medicion_edit}', '{$valor->id}');">
                                {if $valor->valor == NULL}---
                                {else}{$valor->valor|round:"2"}
                                {/if}
                            </a>
                        </td>
                        <td class="text-center"> 
                            {if $valor->valor != NULL}
                                {if isset($medicion_lim) AND isset($medicion_obj)}
                                    {if  $valor->valor < $medicion_lim}
                                        <i title="{$smarty.const.TXT_VAL_MEJORABLE}" class="fa fa-circle fa-fw" style="color:red"></i>
                                    {else if $valor->valor >= $medicion_obj}
                                        <i title="{$smarty.const.TXT_VAL_LOGRADO}" class="fa fa-circle fa-fw" style="color:green"></i>
                                    {else}
                                         <i title="{$smarty.const.TXT_VAL_ACEPTABLE}" class="fa fa-circle fa-fw" style="color:yellow"></i>
                                    {/if}
                                {else if isset($medicion_obj)}
                                    {if $valor->valor >= $medicion_obj }
                                        <i title="{$smarty.const.TXT_VAL_LOGRADO}" class="fa fa-circle fa-fw" style="color:green"></i>
                                    {else}
                                        <i title="{$smarty.const.TXT_VAL_MEJORABLE}" class="fa fa-circle fa-fw" style="color:red"></i>
                                    {/if}
                                {else if isset($medicion_lim)}
                                    {if $valor->valor < $medicion_lim }
                                        <i title="{$smarty.const.TXT_VAL_MEJORABLE}" class="fa fa-circle fa-fw" style="color:red"></i>
                                    {else}
                                        <i title="{$smarty.const.TXT_VAL_LOGRADO}" class="fa fa-circle fa-fw" style="color:green"></i>
                                    {/if}
                                {else}
                                    ---
                                {/if}
                            {else}
                                ---
                            {/if}
                        </td>
                        <td>{$valor->fecha_recogida|date_format:"%d-%m-%Y"}</td>
                        <td style="font-size: 12px">{$valor->usuario->nombre} {$valor->usuario->apellidos}</td>  
                    </tr>
                {/if}
            {/foreach}
            <!-- TOTALES -->
            {*El indicador/dato es agregado y no se calcula por mediana*}
            {if $indicador->id_tipo_agregacion!= 0 && $indicador->id_tipo_agregacion!= 4}
                <tr style="font-weight: bold"
                    {if isset($medicion_lim) AND isset($medicion_obj)}
                                    {if  $total < $medicion_lim}
                                        class="danger"
                                    {else if $total >= $medicion_obj}
                                        class="success"
                                    {else}
                                        class="warning"
                                    {/if}
                                {/if}
                                {if isset($medicion_obj) AND !isset($medicion_lim)}
                                    {if $total >= $medicion_obj}
                                        class="success"
                                    {else}
                                        class="danger"
                                    {/if}
                                {/if}
                                {if isset($medicion_lim) AND !isset($medicion_obj)}
                                    {if $total < $medicion_lim}
                                        class="danger"
                                    {else}
                                        class="success"
                                    {/if}
                                {/if}>
                    <td style="border-left:solid 2px #950717;border-top:solid 2px #950717;border-bottom:solid 2px #950717;">{$smarty.const.FIELD_TOTAL}: {$entidad->etiqueta} ({$agregacion})</td>
                    <td style="border-top:solid 2px #950717;border-bottom:solid 2px #950717">
                        {if $total === NULL}
                            ---
                        {else}
                            {$total|round:"2"}
                        {/if}
                    </td>
                    <td class="text-center" style="border-top:solid 2px #950717;border-bottom:solid 2px #950717"> 
                        {if $total != NULL}
                            {if isset($medicion_lim) AND isset($medicion_obj)}
                                {if  $total < $medicion_lim}
                                    <i title="{$smarty.const.TXT_VAL_MEJORABLE}" class="fa fa-circle fa-fw" style="color:red"></i>
                                {else if $total >= $medicion_obj}
                                    <i title="{$smarty.const.TXT_VAL_LOGRADO}" class="fa fa-circle fa-fw" style="color:green"></i>
                                {else}
                                     <i title="{$smarty.const.TXT_VAL_ACEPTABLE}" class="fa fa-circle fa-fw" style="color:yellow"></i>
                                {/if}
                            {else if isset($medicion_obj)}
                                {if $total >= $medicion_obj }
                                    <i title="{$smarty.const.TXT_VAL_LOGRADO}" class="fa fa-circle fa-fw" style="color:green"></i>
                                {else}
                                    <i title="{$smarty.const.TXT_VAL_MEJORABLE}" class="fa fa-circle fa-fw" style="color:red"></i>
                                {/if}
                            {else if isset($medicion_lim)}
                                {if $total < $medicion_lim }
                                    <i title="{$smarty.const.TXT_VAL_MEJORABLE}" class="fa fa-circle fa-fw" style="color:red"></i>
                                {else}
                                    <i title="{$smarty.const.TXT_VAL_LOGRADO}" class="fa fa-circle fa-fw" style="color:green"></i>
                                {/if}
                            {else}
                                ---
                            {/if}
                        {else}
                            ---
                        {/if}
                    </td>
                    <td style="border-top:solid 2px #950717;border-bottom:solid 2px #950717">---</td>
                    <td style="border-right:solid 2px #950717;border-top:solid 2px #950717;border-bottom:solid 2px #950717">---</td>  
                </tr>
            {/if}
            {*El indicador/dato es agregado y se calcula por mediana*}
            {if $indicador->id_tipo_agregacion!= 0 && $indicador->id_tipo_agregacion== 4}
                {foreach $valores as $valor}
                    {if $valor->id_entidad==$entidad->id}
                        <tr style="font-weight: bold"
                            {if isset($medicion_lim) AND isset($medicion_obj)}
                                            {if  $valor->valor < $medicion_lim}
                                                class="danger"
                                            {else if $valor->valor >= $medicion_obj}
                                                class="success"
                                            {else}
                                                class="warning"
                                            {/if}
                                        {/if}
                                        {if isset($medicion_obj) AND !isset($medicion_lim)}
                                            {if $valor->valor >= $medicion_obj}
                                                class="success"
                                            {else}
                                                class="danger"
                                            {/if}
                                        {/if}
                                        {if isset($medicion_lim) AND !isset($medicion_obj)}
                                            {if $valor->valor < $medicion_lim}
                                                class="danger"
                                            {else}
                                                class="success"
                                            {/if}
                                        {/if}>
                            <td style="border-left:solid 2px #950717;border-top:solid 2px #950717;border-bottom:solid 2px #950717;">{$smarty.const.FIELD_TOTAL}: {$entidad->etiqueta} ({$agregacion})</td>
                            <td style="border-top:solid 2px #950717;border-bottom:solid 2px #950717">
                                <a href="javascript:void(0)" onclick="fila_editar('{$medicion_edit}', '{$valor->id}');">
                                    {if $valor->valor == NULL}---
                                    {else}{$valor->valor|round:"2"}
                                    {/if}
                                </a>
                            </td>
                            <td class="text-center" style="border-top:solid 2px #950717;border-bottom:solid 2px #950717"> 
                                {if $valor->valor != NULL}
                                    {if isset($medicion_lim) AND isset($medicion_obj)}
                                        {if  $valor->valor < $medicion_lim}
                                            <i title="{$smarty.const.TXT_VAL_MEJORABLE}" class="fa fa-circle fa-fw" style="color:red"></i>
                                        {else if $valor->valor >= $medicion_obj}
                                            <i title="{$smarty.const.TXT_VAL_LOGRADO}" class="fa fa-circle fa-fw" style="color:green"></i>
                                        {else}
                                             <i title="{$smarty.const.TXT_VAL_ACEPTABLE}" class="fa fa-circle fa-fw" style="color:yellow"></i>
                                        {/if}
                                    {else if isset($medicion_obj)}
                                        {if $valor->valor >= $medicion_obj }
                                            <i title="{$smarty.const.TXT_VAL_LOGRADO}" class="fa fa-circle fa-fw" style="color:green"></i>
                                        {else}
                                            <i title="{$smarty.const.TXT_VAL_MEJORABLE}" class="fa fa-circle fa-fw" style="color:red"></i>
                                        {/if}
                                    {else if isset($medicion_lim)}
                                        {if $valor->valor < $medicion_lim }
                                            <i title="{$smarty.const.TXT_VAL_MEJORABLE}" class="fa fa-circle fa-fw" style="color:red"></i>
                                        {else}
                                            <i title="{$smarty.const.TXT_VAL_LOGRADO}" class="fa fa-circle fa-fw" style="color:green"></i>
                                        {/if}
                                    {else}
                                        ---
                                    {/if}
                                {else}
                                    ---
                                {/if}
                            </td>
                            <td style="border-top:solid 2px #950717;border-bottom:solid 2px #950717">
                                {$valor->fecha_recogida|date_format:"%d-%m-%Y"}
                            </td>
                            <td style="font-size: 12px;border-right:solid 2px #950717;border-top:solid 2px #950717;border-bottom:solid 2px #950717">
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
    <a class="btn btn-default btn-circle btn-xs" href="javascript:void(0)" onclick="javascript:referencia_grabar('{$referencia->id}');"><i title='{$smarty.const.TXT_GRABAR}' class="fa fa-floppy-o fa-fw"></i></a>
    <a class="btn btn-default btn-circle btn-xs" href="javascript:void(0)" onclick="javascript:referencia_cancelar('{$referencia->id}');"><i title='{$smarty.const.TXT_CANCEL}' class="fa fa-times fa-fw"></i></a>
{/if}

{if $modulo == 'editarfecha'}
    {if $contenedor == 'pi'}
        {html_select_date field_order='DMY' prefix="pi" month_format='%m' start_year="-10" end_year="+2" time=$medicion->periodo_inicio}
        <a class="btn btn-default btn-circle btn-xs" href="javascript:void(0)" onclick="javascript:fecha_grabar('{$medicion->id}', 'pi');"><i title='{$smarty.const.TXT_GRABAR}' class="fa fa-floppy-o fa-fw"></i></a>
        <a class="btn btn-default btn-circle btn-xs" href="javascript:void(0)" onclick="javascript:fecha_cancelar('pi', '{$medicion->id}');"><i title='{$smarty.const.TXT_CANCEL}' class="fa fa-times fa-fw"></i></a>
    {/if}
    {if $contenedor == 'pf'}
        {html_select_date field_order='DMY' prefix="pf" month_format='%m' start_year="-10" end_year="+2" time=$medicion->periodo_fin}
        <a class="btn btn-default btn-circle btn-xs" href="javascript:void(0)" onclick="javascript:fecha_grabar('{$medicion->id}', 'pf');"><i title='{$smarty.const.TXT_GRABAR}' class="fa fa-floppy-o fa-fw"></i></a>
        <a class="btn btn-default btn-circle btn-xs" href="javascript:void(0)" onclick="javascript:fecha_cancelar('pf', '{$medicion->id}');"><i title='{$smarty.const.TXT_CANCEL}' class="fa fa-times fa-fw"></i></a>
    {/if}
    {if $contenedor == 'gi'}
        {html_select_date field_order='DMY' prefix="gi" month_format='%m' start_year="-10" end_year="+2" time=$medicion->grabacion_inicio}
        <a class="btn btn-default btn-circle btn-xs" href="javascript:void(0)" onclick="javascript:fecha_grabar('{$medicion->id}', 'gi');"><i title='{$smarty.const.TXT_GRABAR}' class="fa fa-floppy-o fa-fw"></i></a>
        <a class="btn btn-default btn-circle btn-xs" href="javascript:void(0)" onclick="javascript:fecha_cancelar('gi', '{$medicion->id}');"><i title='{$smarty.const.TXT_CANCEL}' class="fa fa-times fa-fw"></i></a>
    {/if}
    {if $contenedor == 'gf'}
        {html_select_date field_order='DMY' prefix="gf" month_format='%m' start_year="-10" end_year="+2" time=$medicion->grabacion_fin}
        <a class="btn btn-default btn-circle btn-xs" href="javascript:void(0)" onclick="javascript:fecha_grabar('{$medicion->id}', 'gf');"><i title='{$smarty.const.TXT_GRABAR}' class="fa fa-floppy-o fa-fw"></i></a>
        <a class="btn btn-default btn-circle btn-xs" href="javascript:void(0)" onclick="javascript:fecha_cancelar('gf', '{$medicion->id}');"><i title='{$smarty.const.TXT_CANCEL}' class="fa fa-times fa-fw"></i></a>
    {/if}
{/if}

{if $modulo == 'editaretiqueta'}
    <input name="etiqueta" type="text" value="{$medicion->etiqueta}">
    <a class="btn btn-default btn-circle btn-xs" href="javascript:void(0)" onclick="javascript:etiqueta_editar_grabar('et', '{$medicion->id}', 'etiqueta');"><i title='{$smarty.const.TXT_GRABAR}' class="fa fa-floppy-o fa-fw"></i></a>
    <a class="btn btn-default btn-circle btn-xs" href="javascript:void(0)" onclick="javascript:etiqueta_editar_cancelar('et', '{$medicion->id}');"><i title='{$smarty.const.TXT_CANCEL}' class="fa fa-times fa-fw"></i></a>
{/if}

{if $modulo == 'editarobservaciones'}
    <textarea name="observaciones" id="observaciones">{$medicion->observaciones}</textarea>
    <a class="btn btn-default btn-circle btn-xs" href="javascript:void(0)" onclick="javascript:observaciones_editar_grabar('ob', '{$medicion->id}', 'observaciones');"><i title='{$smarty.const.TXT_GRABAR}' class="fa fa-floppy-o fa-fw"></i></a>
    <a class="btn btn-default btn-circle btn-xs" href="javascript:void(0)" onclick="javascript:observaciones_editar_cancelar('ob', '{$medicion->id}');"><i title='{$smarty.const.TXT_CANCEL}' class="fa fa-times fa-fw"></i></a>
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