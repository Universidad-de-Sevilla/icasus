{if $aviso}<p class='aviso'>{$aviso}</p>{/if}
{if $error}<p class='error'>{$error}</p>{/if}
<h2>{$smarty.const.TXT_VAL_EDIT}</h2>
<p><a href='index.php?page=indicador_datos&id_indicador={$valor->id_indicador}'><img 
            src='theme/usevilla/iconos/chart_bar.gif' alt='{$smarty.const.TXT_ICON}' />{$smarty.const.TXT_VOLVER_INDIC}</a></p> 
<form method='post' action='index.php?page=valor_grabar' id='formvalor' name='formvalor' class='datos'>
    <input type='hidden' name='id_valor' id='id_valor' value='{$valor->id_valor}' /> 
    <input type='hidden' name='id_indicador' id='id_indicador' value='{$valor->id_indicador}' /> 
    <input type='hidden' name='id_entidad' id='id_entidad' value='{$id_entidad}' /> 

    <p><label for='calculo'>{$smarty.const.FIELD_CALCULO}</label><br />
        <span class='grey'>{$indicador->formulacion}</span><br />
        <input type='text' name='calculo' id='calculo' class='inp' 
               value='{$valor->calculo}' onchange='calcular();' /></p>

    <p><label for='dato_valor'>{$smarty.const.FIELD_VAL} </label> &nbsp; <span class='grey'>{$smarty.const.TXT_REQ}</span><br />
        <input type='text' name='dato_valor' id='dato_valor' class='inp' value='{$valor->valor}' /></p>

    <p><label for='fecha_recogida'> {$smarty.const.FIELD_FECHA_OBTENCION}</label> &nbsp;<span class='grey'>{$smarty.const.TXT_REQ}</span><br />
        {html_select_date field_order='MY' month_format='%m' start_year='-9' time=$valor->fecha_recogida}</p>

    <p><label for='objetivo'>{$smarty.const.FIELD_OBJ}</label> &nbsp; <span class='grey'>{$smarty.const.TXT_REQ}</span><br />
        <input type='text' name='objetivo' id='objetivo' class='inp' value='{$valor->objetivo}' /></p>

    <p><label for='objetivo_estrategico'>{$smarty.const.FIELD_OBJP}</label> &nbsp; <span class='grey'>{$smarty.const.TXT_REQ}</span><br />
        <input type='text' name='objetivo_estrategico' id='objetivo_estrategico' class='inp'
               value='{$valor->objetivo_estrategico}' /></p>

    <p><label for='objetivo_carta'>{$smarty.const.FIELD_OBJC}</label> &nbsp; 
        <span class='grey'>{$smarty.const.TXT_REQ}</span><br />
        <input type='text' name='objetivo_carta' id='objetivo' class='inp' value='{$valor->objetivo_carta}' /></p>

    <p><label for='observaciones'>{$smarty.const.FIELD_OBSERV}</label><br />
        <textarea name='observaciones' id='observaciones' class='inp'>{$valor->observaciones}</textarea></p>

    <p><input type='button' class='submit-btn' value='{$smarty.const.TXT_BTN_ENVIAR}' name='indicador_submit' onclick='javascript:valor_validar();' /></p>
</form>
