<div class="flat_area grid_16">
    <h2>{$smarty.const.TXT_PAG_EDIT}</h2>
</div>
<div class="toggle_container">
    <form name='formpagina' id='formpagina' action='index.php?page=pagina_editar&id_pagina={$pagina->id}' class='datos' method='post'> 
        <fieldset class="label_side">
            <label>{$smarty.const.FIELD_TITULO}</label>
            <div class="clearfix">
                <input class='inp' type='text' id='titulo' name='titulo' value='{$pagina->titulo}' />
                <div class="required_tag tooltip hover left" title="{$smarty.const.MSG_FIELD_REQ}"></div>
            </div>
        </fieldset>
        <fieldset class="label_side">
            <label>{$smarty.const.FIELD_ALIAS}</label>
            <div class="clearfix">
                <input type='text' id='alias' name='alias'  value='{$pagina->alias}' />
                <div class="required_tag tooltip hover left" title="{$smarty.const.MSG_FIELD_REQ}"></div>
            </div>
        </fieldset>
        <fieldset class="label_side">
            <label>{$smarty.const.FIELD_PAG_CONTENIDO}</label>
            <div class="clearfix">
                <textarea name="contenido" class="inp" rows="25">{$pagina->contenido}</textarea>
                <div class="required_tag tooltip hover left" title="{$smarty.const.MSG_FIELD_REQ}"></div>
            </div>
        </fieldset>
        <fieldset class="label_side">
            <div class="clearfix">
                <button class="light send_left" type="reset" value="{$smarty.const.TXT_CANCEL}" name="proceso_cancel" 
                        onclick="history.back();">
                    <div class="ui-icon ui-icon-closethick"></div>
                    <span>{$smarty.const.TXT_CANCEL}</span>
                </button>
                <input type='submit' class='submit send_right' name='submit' value='{$smarty.const.TXT_BTN_GUARDAR}' />
            </div>
        </fieldset>	
    </form>
</div>
