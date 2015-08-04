<h3>	
    {if $_control}
        <a href='index.php?page=dato_crear&id_entidad={$entidad->id}'>
            <img src='/icons/ff16/chart_bar_add.png' /> {$smarty.const.TXT_DATO_CREAR}
        </a>&nbsp;&nbsp;
    {/if}
    {if $entidad->id == 14}
        <a href='index.php?page=datos_rebiun'>
            <img src='/icons/ff16/basket.png' /> {$smarty.const.TXT_DATOS_REBIUN_RECOGIDA}
        </a>
    {/if}
    <!--
    <a href='index.php?page=entidad_datos_excel&id_entidad={$entidad->id}'><img 
    src='/icons/ff16/page_excel.png' alt='icono' />Exportar datos</a>&nbsp; &nbsp;
    <a href='index.php?page=dato_publico'><img 
    src='/icons/ff16/chart_curve_world.png' alt='icono' />Mostrar datos públicos</a>
    -->
</h3>
{if $datos}
    <div class="box grid_16">
        <div id="dt1" class="no_margin">
            <table class='display datatable'>
                <thead>
                    <tr>
                        <th>{$smarty.const.FIELD_ID}</th>
                        <th>{$smarty.const.FIELD_COD}</th>
                        <th>{$smarty.const.FIELD_NOMBRE}</th>
                        <th>{$smarty.const.FIELD_HISTORICO}</th>
                        <th>{$smarty.const.FIELD_PERIOD}</th>
                        <th>{$smarty.const.FIELD_RESP}</th>
                        <th>{$smarty.const.FIELD_RESP_MED}</th>
                        <th>{$smarty.const.FIELD_ACCIONES}</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach from=$datos item=dato} 
                        <tr>
                            <td style="white-space:nowrap">{$dato->id}</td>
                            <td style="white-space:nowrap">{$dato->codigo}</td>
                            <td width="30%">
                                {if $dato->calculo}
                                    <img title="{$smarty.const.TXT_CALC_AUTO} {$dato->calculo}" src='/icons/ff16/calculator.png' />
                                {/if}
                                <a target="_blank" href='index.php?page=dato_mostrar&id_dato={$dato->id}&id_entidad={$entidad->id}'
                                   title="{$smarty.const.TXT_DATO_MOSTRAR}: {$dato->nombre}">
                                    {$dato->nombre}</a>
                                <a href="javascript:void(0)" title='{$dato->descripcion}'>*</a>
                            </td>
                            <td>{$dato->historicos}</td>
                            <td>{$dato->periodicidad}</td>
                            <td>
                                <a title="{$smarty.const.TXT_USER_PERFIL}" href='index.php?page=usuario_mostrar&id_usuario={$dato->id_responsable}&id_entidad={$entidad->id}'>
                                    {$dato->responsable->nombre}
                                    {$dato->responsable->apellidos}</a>
                            </td>
                            <td>
                                <a title="{$smarty.const.TXT_USER_PERFIL}" href='index.php?page=usuario_mostrar&id_usuario={$dato->id_responsable_medicion}&id_entidad={$entidad->id}'>
                                    {$dato->responsable_medicion->nombre}
                                    {$dato->responsable_medicion->apellidos}</a>
                            </td>
                            <td style="white-space:nowrap">
                                {if $_control}
                                    <a title="{$smarty.const.TXT_EDIT}" href='index.php?page=dato_editar&id_dato={$dato->id}&id_entidad={$dato->id_entidad}' target="_blank">
                                        <img src='/icons/ff16/chart_bar_edit.png'  />
                                    </a>&nbsp;
                                    <a title="{$smarty.const.TXT_BORRAR}" href='index.php?page=dato_borrar&id_dato={$dato->id}&id_entidad={$dato->id_entidad}' 
                                       onClick="return confirm('{$smarty.const.MSG_DATO_CONFIRM_BORRAR}');">
                                        <img src='/icons/ff16/chart_bar_delete.png'  />
                                    </a>&nbsp;
                                    <a title="{$smarty.const.FIELD_RESP_MED}" href='index.php?page=medicion_responsable&id_dato={$dato->id}&id_entidad={$dato->id_entidad}' target="_blank">
                                        <img src='/icons/ff16/user_medicion.png' />
                                    </a>&nbsp;
                                    <a title="{$smarty.const.TXT_VAL_EDIT}" href='index.php?page=indicador_subunidad_valor&id_dato={$dato->id}&id_entidad={$dato->id_entidad}' target="_blank">
                                        <img src='/icons/ff16/tag_blue_edit.png' />
                                    </a>&nbsp;
                                {/if}
                                <a href="index.php?page=medicion_listar&id_dato={$dato->id}&id_entidad={$dato->id_entidad}" 
                                   title="{$smarty.const.TXT_DATO_MEDICIONES}: {$dato->nombre}" target="_blank">
                                    <img src="/icons/ff16/time.png" /></a>&nbsp;
                                <a title="{$smarty.const.TXT_VAL_REF}" href='index.php?page=valor_referencia_crear&id_dato={$dato->id}&id_entidad={$dato->id_entidad}' target="_blank">
                                    <img src='/icons/ff16/tag.png' /></a>
                            </td>
                        </tr>
                    {/foreach}
                </tbody>
            </table>
        </div>
    </div>  
{else}
    <div class="alert alert_blue"> 
        <img height="24" width="24" src="theme/danpin/images/icons/small/white/alert_2.png">
        {$smarty.const.MSG_UNID_NO_DATOS}
    </div>
{/if}
