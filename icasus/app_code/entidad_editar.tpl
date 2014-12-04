<h3>{$smarty.const.TXT_UNID_EDIT}</h3>
<div class="box grid_16">
    <div class="toggle_container">
        <div class="block">
            <form method='post' action='index.php?page=entidad_editar' name='formentidad' id='formentidad' class="datos">
                <input type='hidden' name='id_entidad' id='id_entidad' value='{$entidad->id}' />

                <fieldset class="label_side">
                    <label>{$smarty.const.FIELD_NOMBRE}</label>
                    <div>
                        <input type='text' name='nombre' id='nombre' value='{$entidad->nombre}' class="required"/></p>
                        <div class="required_tag"></div>
                    </div>
                </fieldset> 

                <fieldset class="label_side">
                    <label>{$smarty.const.FIELD_COD}</label>
                    <div>
                        <input type='text' name='codigo' id='codigo' class='' value='{$entidad->codigo}' /></p>
                    </div>
                </fieldset> 

                <fieldset class="label_side">
                    <label>{$smarty.const.FIELD_UNID_SUP}</label>
                    <div>
                        <select name='id_padre' id='id_padre' class=''>
                            {foreach from=$entidades item=padre}
                                <option value='{$padre->id_entidad}' {if $entidad->id_madre == $padre->id_entidad}selected{/if}>{$padre->nombre}</option>
                            {/foreach}
                        </select>
                    </div>
                </fieldset> 

                <fieldset class="label_side">
                    <label>{$smarty.const.FIELD_WEB}</label>
                    <div>
                        <input type='text' name='web' id='web' class="" value='{$entidad->web}' /></p>
                    </div>
                </fieldset> 

                <div class="button_bar clearfix">
                    <button class="green" type="submit" value="{$smarty.const.TXT_GRABAR}" name="entidad_submit">
                        <div class="ui-icon ui-icon-check"></div>
                        <span>{$smarty.const.TXT_GRABAR}</span>
                    </button>
                    <button class="light send_right" type="reset" value="{$smarty.const.TXT_CANCEL}" name="proceso_cancel" 
                            onclick="history.back();">
                        <div class="ui-icon ui-icon-closethick"></div>
                        <span>{$smarty.const.TXT_CANCEL}</span>
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
