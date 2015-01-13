<h3>	 
    <a href='index.php?page=indicador_crear&id_entidad={$entidad->id}'><img 
            src='/icons/ff16/chart_curve_add.png' alt='{$smarty.const.TXT_ICON}' /> {$smarty.const.TXT_INDIC_CREAR}</a>&nbsp;&nbsp;
   <!-- <a href='index.php?page=dato_listar&id_entidad={$entidad->id}'><img 
            src='/icons/ff16/chart_bar.png' /> {$smarty.const.TXT_DATOS_LIST}</a>
    <a href='index.php?page=entidad_indicadores_excel&id_entidad={$entidad->id}'><img 
    src='/icons/ff16/page_excel.png' alt='icono' />Exportar indicadores</a>&nbsp; &nbsp;
    <a href='index.php?page=indicador_publico'><img 
    src='/icons/ff16/chart_curve_world.png' alt='icono' />Mostrar indicadores públicos</a>
    -->
</h3>
{if $indicadores}
    <div class="box grid_16 single_datatable">
        <div id="dt1" class="no_margin">
            <table class='display datatable'>
                <thead>
                    <tr><th>{$smarty.const.FIELD_PROC}</th><th>{$smarty.const.FIELD_COD}</th><th>{$smarty.const.FIELD_INDIC}</th>
                        <th>{$smarty.const.FIELD_RESP}</th>
                        <!--
                        <th>Acciones</th>
                        -->
                    </tr>
                </thead>

                <tbody>
                    {foreach from=$indicadores item=indicador} 
                        <tr>
                            <td><a href='index.php?page=proceso_mostrar&id_proceso={$indicador->id_proceso}&id_entidad={$entidad->id}'>{$indicador->proceso->nombre}</a></td>
                            <td>{$indicador->codigo}</td>
                            <td><a href='index.php?page=medicion_listar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}' title="{$smarty.const.TXT_INDIC_MED} :: {$indicador->nombre}">
                                    <img src='/icons/ff16/time.png' align="absmiddle"/></a> <a href='index.php?page=indicador_mostrar&id_indicador={$indicador->id}&id_entidad={$entidad->id}' title="{$smarty.const.TXT_INDIC_MOSTRAR} :: {$indicador->nombre}">{$indicador->nombre}</a> 
                                <a href='#'title='{$indicador->descripcion}'>*</a></td>
                            <td><a href='index.php?page=usuario_mostrar&id_usuario={$indicador->id_responsable}&id_entidad={$entidad->id}'>{$indicador->responsable->nombre} 
                                    {$indicador->responsable->apellidos}</a></td>
                            <!--
                                              <td nowrap>
                                                    <a
                                                    href='index.php?page=indicador_mostrar&id_indicador={$indicador->id}&id_entidad={$entidad->id}'>Mostrar</a><br />
                                                    <a href='index.php?page=indicador_editar&id_indicador={$indicador->id}&id_entidad={$entidad->id}'>Editar</a>
                                                    <br /> 
                                                    <a href='index.php?page=indicador_borrar&id_indicador={$indicador->id}&id_entidad={$entidad->id}' 
                                                    onClick="return confirmar();">Borrar</a>
                                                    </td>
                            --> 
                        </tr>
                    {/foreach}
                </tbody>
            </table>
        </div>
    </div>  
{else}
    <p class='aviso'>{$smarty.const.MSG_UNID_NO_INDIC}</p>
{/if}
