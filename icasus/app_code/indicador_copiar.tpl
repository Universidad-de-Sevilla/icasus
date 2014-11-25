{if $aviso}<p class='aviso'>{$aviso}</p>{/if}
{if $error}<p class='error'>{$error}</p>{/if}
<h2>{$smarty.const.TXT_INDICS_DIC}</h2>
<p><a href="index.php?page=indicador_listar&id_entidad={$id_entidad}"><img 
            src='iconos/16x16/chart_curve.png' alt='{$smarty.const.TXT_ICON}' />{$smarty.const.TXT_INDICS_MIO}</a> &nbsp;

</p>
{if $indicadores}
    <form id='copia' name='copia' method='post' class='datos' action='index.php?page=indicador_copiar'>
        <input type='submit' name='enviar' value='{$smarty.const.TXT_INDICS_COPIAR}' />
        <input type='hidden' name='id_entidad' value='{$id_entidad}' />
        <table class='listing' id='sortable'>
            <thead>
                <tr><th></th><th>{$smarty.const.FIELD_COD}</th><th>{$smarty.const.FIELD_INDIC}</th><th>{$smarty.const.FIELD_DESC}</th><th>{$smarty.const.FIELD_FORM}</th></tr>
            </thead>
            <tbody>
                {foreach from=$indicadores item=indicador} 
                    <tr><td><input type='checkbox' name='indicadores[]' value='{$indicador.id_indicador}' /></td>
                        <td>{$indicador.codigo}</td>
                        <td>{$indicador.nombre_indicador}</td>
                        <td>{$indicador.descripcion}</td>
                        <td>{$indicador.formulacion}</td>
                    </tr>
                {/foreach}
            </tbody>
        </table>
        <input type='submit' name='enviar' value='{$smarty.const.TXT_INDICS_COPIAR}' />
    </form>
{else}
    <p class='aviso'>{$smarty.const.MSG_INDIC_NO_UNID_SUP}</p>
{/if}
