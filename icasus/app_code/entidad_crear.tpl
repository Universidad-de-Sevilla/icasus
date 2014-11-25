{if $aviso}<p class='aviso'>{$aviso}</p>{/if}
{if $error}<p class='error'>{$error}</p>{/if}
<h3>{$smarty.const.TXT_UNID_NUEVA}</h3>
<form method='post' action='index.php?page=entidad_crear' id='formentidad' class='datos'>
    <input type='hidden' name='id_entidad' id='id_entidad' value=1 />
    <p><label for='nombre'>{$smarty.const.FIELD_NAME}</label> &nbsp; <span class='grey'>{$smarty.const.MSG_FIELD_REQ}</span>
        <input type='text' name='nombre' id='nombre' class='inp' value='{$entidad.nombre}' /></p>

    <p><label for='codigo'>{$smarty.const.FIELD_COD}</label> &nbsp;<br /> 
        <input type='text' name='codigo' id='codigo' class='inp' value='{$entidad.codigo}' /></p>

    <p><label for='id_padre'>{$smarty.const.FIELD_UNID_SUP}</label> &nbsp; <br />
        <select name='id_padre' id='id_padre' class='inp'>
            {foreach from=$entidades item=padre}
                <option value='{$padre.id_entidad}'>{$padre.nombre} ({$padre.codigo})
                </option>
            {/foreach}
        </select></p>

    <p><label for='web'>{$smarty.const.FIELD_WEB}</label> &nbsp; <br />
        <input type='text' name='web' id='web' class='inp' value='{$entidad.web}' /></p>

    <p><input type='submit' class='submit' value='{$smarty.const.TXT_GRABAR}' name='entidad_submit' /></p>
</form>