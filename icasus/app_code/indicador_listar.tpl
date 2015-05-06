<h3>	 
    {if $_control}
        <a title="{$smarty.const.TXT_INDIC_CREAR}" href='index.php?page=indicador_crear&id_entidad={$entidad->id}'>
            <img src='/icons/ff16/chart_curve_add.png' /> {$smarty.const.TXT_INDIC_CREAR}
        </a>&nbsp;&nbsp;
    {/if}
<!-- <a href='index.php?page=dato_listar&id_entidad={$entidad->id}'><img 
    src='/icons/ff16/chart_bar.png' /> {$smarty.const.TXT_DATOS_LIST}</a>
<a href='index.php?page=entidad_indicadores_excel&id_entidad={$entidad->id}'><img 
src='/icons/ff16/page_excel.png' alt='icono' />Exportar indicadores</a>&nbsp; &nbsp;
<a href='index.php?page=indicador_publico'><img 
src='/icons/ff16/chart_curve_world.png' alt='icono' />Mostrar indicadores públicos</a>
    -->
</h3>
{if $indicadores}
    <div class="box grid_16">
        <div id="dt1" class="no_margin">
            <table class='display datatable'>
                <thead>
                    <tr>
                        <th>{$smarty.const.FIELD_ID}</th>
                        <th>{$smarty.const.FIELD_PROC}</th>
                        <th>{$smarty.const.FIELD_COD}</th>
                        <th>{$smarty.const.FIELD_INDIC}</th>
                        <th>{$smarty.const.FIELD_PERIOD}</th>
                        <th>{$smarty.const.FIELD_RESP}</th>
                        <th>{$smarty.const.FIELD_ACCIONES}</th>
                    </tr>
                </thead>

                <tbody>
                    {foreach from=$indicadores item=indicador} 
                        <tr>
                            <td style="white-space:nowrap">{$indicador->id}</td>
                            <td>
                                <a title="{$smarty.const.TXT_PROC_VER}" href='index.php?page=proceso_mostrar&id_proceso={$indicador->id_proceso}&id_entidad={$entidad->id}'>
                                    <img src='/icons/ff16/cog.png' /> {$indicador->proceso->nombre}
                                </a>
                            </td>
                            <td style="white-space:nowrap">{$indicador->codigo}</td>
                            <td width="30%">
                                {if $indicador->calculo}
                                    <img title="{$smarty.const.TXT_CALC_AUTO} {$indicador->calculo}" src='/icons/ff16/calculator.png' />
                                {/if}
                                <a target="_blank" href='index.php?page=indicador_mostrar&id_indicador={$indicador->id}&id_entidad={$entidad->id}' 
                                   title="{$smarty.const.TXT_INDIC_MOSTRAR}: {$indicador->nombre}">
                                    <img src='/icons/ff16/chart_curve.png' /> {$indicador->nombre}</a> 
                                <a href="javascript:void(0)" title='{$indicador->descripcion}'>*</a>
                            </td>
                            <td>{$indicador->periodicidad}</td>
                            <td>
                                <a title="{$smarty.const.TXT_USER_VER}" href='index.php?page=usuario_mostrar&id_usuario={$indicador->id_responsable}&id_entidad={$entidad->id}'>
                                    <img src='/icons/ff16/user.png' /> {$indicador->responsable->nombre} 
                                    {$indicador->responsable->apellidos}</a>
                            </td>
                            <td style="white-space:nowrap">
                                {if $_control}
                                    <a title="{$smarty.const.TXT_EDIT}" href='index.php?page=indicador_editar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}' target="_blank">
                                        <img src='/icons/ff16/chart_curve_edit.png'  />
                                    </a>&nbsp;
                                    <a title="{$smarty.const.TXT_BORRAR}" href='index.php?page=indicador_borrar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}' 
                                       onClick="return confirm('{$smarty.const.MSG_INDIC_CONFIRM_BORRAR}');">
                                        <img src='/icons/ff16/chart_curve_delete.png'  /> 
                                    </a>&nbsp;
                                    <a title="{$smarty.const.FIELD_RESP_MED}" href='index.php?page=medicion_responsable&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}' target="_blank">
                                        <img src='/icons/ff16/user_medicion.png' /> 
                                    </a>&nbsp;
                                    <a title="{$smarty.const.TXT_VAL_EDIT}" href='index.php?page=indicador_subunidad_valor&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}' target="_blank">
                                        <img src='/icons/ff16/tag_blue_edit.png' /> 
                                    </a>&nbsp;
                                {/if}
                                <a href='index.php?page=medicion_listar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}' 
                                   title="{$smarty.const.TXT_INDIC_MED}: {$indicador->nombre}" target="_blank">
                                    <img src='/icons/ff16/time.png' align="absmiddle"/></a>&nbsp;
                                <a title="{$smarty.const.TXT_VAL_REF}" href='index.php?page=valor_referencia_crear&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}' target="_blank">
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
        {$smarty.const.MSG_UNID_NO_INDIC}
    </div>
{/if}
