{if $aviso}<p class='aviso'>{$aviso}</p>{/if}
{if $error}<p class='error'>{$error}</p>{/if}
<h3>{$smarty.const.TXT_INDIC_DAT}: {$indicador.nombre}</h3>
{if $indicador.id_visibilidad == 2}
    <a href='index.php?page=indicador_publico'><img 
            src='iconos/16x16/chart_curve_world.png' /> {$smarty.const.TXT_LIST_TODOS}</a> &nbsp;
    <a href='index.php?page=indicador_datos_rtf&id_indicador={$indicador.id_indicador}&id_entidad={$indicador.id_entidad}' title={$smarty.const.TXT_INDIC_GEN_INFO_WORD}>
        <img src='iconos/16x16/page_word.png'  /> {$smarty.const.TXT_RTF}</a> &nbsp;
    <a href='index.php?page=indicador_datos_excel&id_indicador={$indicador.id_indicador}&id_entidad={$indicador.id_entidad}' title={$smarty.const.TXT_INDIC_EXPORT_EXCEL}>
        <img src='iconos/16x16/page_excel.png'  /> {$smarty.const.TXT_EXCEL}</a>

    <table>
        <tr>
            <th>{$smarty.const.FIELD_COD} {$smarty.const.FIELD_PROC}</th>
            <th colspan='5'>{$smarty.const.FIELD_PROC}</th>
        </tr>
        <tr>
            <td>{$indicador.codigo_proceso}</a></td>  
            <td colspan='5'>{$indicador.proceso}</td>
        </tr>

        <tr>
            <th>{$smarty.const.FIELD_COD} {$smarty.const.FIELD_INDIC}</th>
            <th colspan='5'>{$smarty.const.FIELD_NOMBRE}</th>
        </tr>
        <tr>
            <td>{$indicador.codigo}</td>
            <td colspan='5'><b>{$indicador.nombre}</b></td>
        </tr>

        <tr><th colspan='6'>{$smarty.const.FIELD_DESC}</th></tr>
        <tr><td colspan='6'>{$indicador.descripcion}</td></tr>

        <tr><th colspan='6'>{$smarty.const.FIELD_FORM}</th></tr>
        <tr><td colspan='6'>{$indicador.formulacion}</td></tr>

        <tr>
            <th>{$smarty.const.FIELD_OBJ}</th>
            <th colspan='2'>{$smarty.const.FIELD_OBJP}</th>
            <th>{$smarty.const.FIELD_OBJC}</th>
            <th colspan='2'>{$smarty.const.FIELD_STANDARD}</th>
        </tr>
        <tr>
            <td>{$indicador.objetivo}</td>
            <td colspan='2'>{$indicador.objetivo_estrategico}</td>
            <td>{$indicador.objetivo_carta}</td>
            <td colspan='2'>{*$indicador.estandar*}</td>
        </tr>

        <tr>
            <th colspan='3'>{$smarty.const.FIELD_FUENTE}</th>
            <th>{$smarty.const.FIELD_PERIOD}</th>
            <th colspan='2'>{$smarty.const.FIELD_VISIBILIDAD}</th>
        </tr>
        <tr>
            <td colspan='3'>{$indicador.fuente}</td>	
            <td>{$indicador.periodicidad}</td>	
            <td colspan='2'>{$indicador.visibilidad|htmlentities}</td>
        </tr>	
        <tr><th colspan='6'>{$smarty.const.FIELD_RESP}</tr>
        <tr><td colspan='6'><a href='index.php?page=usuario_datos&id_usuario={$indicador.id_responsable}'>{$indicador.nombre_responsable}
                    {$indicador.apellidos_responsable}</a></td></tr>
    </table>

    <h3>{$smarty.const.TXT_VAL_REC}</h3>
    {if $valores}
        <p><img src='theme/usevilla/leyenda650.png' alt='{$smarty.const.TXT_LEYENDA}' /><br />
            <img src='{$ruta_imagen}' alt={$smarty.const.TXT_REP_GRAFIC} iwidth="630" iheight="240"/></p>

        <table class='listing' id='sortable'>
            <thead><tr><th>{$smarty.const.FIELD_PERIODO}</th><th>{$smarty.const.FIELD_VAL}</th><th>{$smarty.const.FIELD_CALCULO}</th><th>{$smarty.const.FIELD_OBJ}</th><th>{$smarty.const.FIELD_OBJP}</th>
                    <th>{$smarty.const.TXT_INDIC_DAT}</th></tr></thead>
            <tbody>
                {foreach from=$valores item=valor}
                    <tr>
                        <td>{$valor.fecha_recogida|date_format:"%m/%Y"}</td>
                        <td>{$valor.valor}
                            {if $valor.observaciones}
                                <a href='#' title='{$valor.observaciones}'>*</a>
                            {/if}
                        </td>
                        <td>{$valor.calculo}</td>
                        <td>{$valor.objetivo}</td>
                        <td>{$valor.objetivo_estrategico}</td>
                        <td>{$valor.objetivo_carta}</td>
                    </tr> 
                {/foreach}
            </tbody>
        </table>
    {else} 
        <p>{$smarty.const.MSG_INDIC_NO_DATOS}</p>
    {/if}
{else}
    <p>{$smarty.const.MSG_INDIC_NO_PUBLIC}</p>
{/if}
