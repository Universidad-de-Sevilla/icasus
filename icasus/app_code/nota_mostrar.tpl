<form id="grabar" name="grabar" action="index.php?page=nota_grabar" METHOD="POST" >
    <div class="toggle_container">
        <fieldset>
            <div class="clearfix">
                <textarea id="notas" name="notas" rows="20" cols="75%" title="{$smarty.const.TXT_INTRO_TEXTO}" class="tooltip autogrow" placeholder="{$smarty.const.TXT_INTRO_TEXTO}">{$_usuario->mis_notas}</textarea>
                <div class="required_tag tooltip hover left" title="{$smarty.const.MSG_FIELD_REQ}"></div>
            </div>
        </fieldset>
        <fieldset>
            <div class="clearfix">
                <input type="button" id="imgEdit" name="imgEdit" value="{$smarty.const.TXT_EDIT}" onclick="
                                        document.forms[0].notas.readOnly = false;
                                        document.forms[0].notas.style.backgroundColor = '#eee';
                                        document.forms[0].notas.style.border = '1px solid #666';
                                        document.getElementById('imgEdit').style.display = 'none';
                                        document.getElementById('imgSave').style.display = 'inline';
                                        document.getElementById('notas').focus();
                       " />
            </div>
        </fieldset>
        <fieldset>
            <div class="clearfix">
                <button class="light send_left" type="reset" value="{$smarty.const.TXT_CANCEL}" name="proceso_cancel" 
                        onclick="history.back();">
                    <div class="ui-icon ui-icon-closethick"></div>
                    <span>{$smarty.const.TXT_CANCEL}</span>
                </button>
                <input type="submit" id="imgSave" name="imagSave" value="{$smarty.const.TXT_BTN_GRABAR_NOTA}" class="send_right" >
            </div>
        </fieldset>
    </div>
</form>	
