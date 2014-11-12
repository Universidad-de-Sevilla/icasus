{if $aviso}<p class='aviso'>{$aviso}</p>{/if}
{if $error}<p class='error'>{$error}</p>{/if}
<h3>{$smarty.const.FIELD_INDIC}: {$indicador->nombre}</h3>
<p><a
        href='index.php?page=indicador_datos&id_indicador={$indicador->id_indicador}&id_entidad={$indicador->id_entidad}'><img 
            src='iconos/16x16/chart_curve.png' /> {$smarty.const.TXT_VOLVER_INDIC}</a></p> 
<h3><img src='iconos/32x32/tag_blue_add.png' />{$smarty.const.TXT_ADD_VAL}</h3>
<form method='post' action='index.php?page=valor_grabar' id='formvalor' name='formvalor' class='datos'>
    <input type='hidden' name='id_indicador' id='id_indicador' value='{$indicador->id_indicador}' /> 
    <input type='hidden' name='id_entidad' id='id_entidad' value='{$indicador->id_entidad}' /> 

    <p><label for='calculo'>{$smarty.const.FIELD_CALCULO}</label><br />
        <span class='grey'>{$indicador->formulacion}</span><br />
        <input type='text' name='calculo' id='calculo' class='inp' 
               value='{$valor->calculo}' onchange='calcular();' /></p>

    <p><label for='dato_valor'>{$smarty.const.FIELD_VAL}</label> &nbsp; <span class='grey'>{$smarty.const.TXT_REQ}</span></p>
    <p><input type='text' name='dato_valor' id='dato_valor' class='inp' value='' /></p>

    <p><label for='periodo'>{$smarty.const.FIELD_PERIODO}</label> &nbsp;<span class='grey'></span></p>
    <p>{html_select_date field_order='MY' month_format='%m' start_year='-9'}</p>

    <p><label for='objetivo'>{$smarty.const.FIELD_OBJ} </label> &nbsp; <span class='grey'>{$smarty.const.TXT_REQ}</span></p>
    <p><input type='text' name='objetivo' id='objetivo' class='inp' value='{$indicador->objetivo}' /></p>

    <p><label for='objetivo'>{$smarty.const.FIELD_OBJP}</label></p>
    <p><input type='text' name='objetivo_estrategico' id='objetivo_estrategico' class='inp' 
              value='{$indicador->objetivo_estrategico}' /></p>

    <p><label for='objetivo_carta'>{$smarty.const.FIELD_OBJC}</label></p>
    <p><input type='text' name='objetivo_carta' id='objetivo_carta' class='inp' 
              value='{$indicador->objetivo_carta}' /></p>

    <p><label for='observaciones'>{$smarty.const.FIELD_OBSERV}</label></p>
    <p><textarea name='observaciones' id='observaciones' class='inp'></textarea></p>

    <p><input type='button' class='submit-btn' value='{$smarty.const.TXT_BTN_ENVIAR}' name='indicador_submit'
              onclick='javascript:valor_validar();' /></p>
</form>
