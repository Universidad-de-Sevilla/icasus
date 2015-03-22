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
    <a href='index.php?page=indicador_listar&id_entidad={$entidad->id}'><img 
    src='/icons/ff16/chart_curve.png' /> {$smarty.const.TXT_INDIC_LIST}</a>&nbsp;&nbsp;
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
                        <th>{$smarty.const.FIELD_COD}</th>
                        <th>{$smarty.const.FIELD_NOMBRE}</th>
                        <th>{$smarty.const.FIELD_PERIOD}</th>
                        <th>{$smarty.const.FIELD_RESP}</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach from=$datos item=dato} 
                        <tr>
                            <td>{$dato->codigo}</td>
                            <td>
                                <a href="index.php?page=medicion_listar&id_dato={$dato->id}&id_entidad={$entidad->id}&tipo=dato" 
                                   title="{$smarty.const.TXT_DATO_MEDICIONES} :: {$dato->nombre}" target="_blank">
                                    <img src="/icons/ff16/time.png" /></a>
                                <a target="_blank" href='index.php?page=dato_mostrar&id_dato={$dato->id}&id_entidad={$entidad->id}'
                                   title="{$smarty.const.TXT_DATO_MOSTRAR} :: {$dato->nombre}">{$dato->nombre}</a>
                                <a href="javascript:void(0)" title='{$dato->descripcion}'>*</a>
                            </td>
                            <td>{$dato->periodicidad}</td>
                            <td>
                                <a title="{$smarty.const.TXT_USER_VER}" href='index.php?page=usuario_datos&id_usuario={$dato->id_responsable}&id_entidad={$entidad->id}'>{$dato->responsable->nombre}
                                    {$dato->responsable->apellidos}</a>
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
