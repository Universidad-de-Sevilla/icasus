<div class="box grid_16">
    <div class="toggle_container">
        <div class="block">
            <form method="post" action="index.php?page=panel_editar&id_panel={$id_panel}&id_cuadro={$id_cuadro}" id="panel_editar" name="panel_editar">
                <fieldset class="label_side">
                    <label>{$smarty.const.FIELD_NOMBRE}</label>
                    <div>
                        <input value="{$panel->nombre}" class="required text" type="text" name="nombre">
                        <div class="required_tag tooltip hover left"></div>
                    </div>
                </fieldset>
                <fieldset class="label_side">
                    <label>{$smarty.const.FIELD_ORDEN}</label>
                    <div class="clearfix">
                        <div class="col_25">
                            <input value="{$panel->orden}" class="text required" type="text" name="orden">
                        </div>
                        <div class="required_tag tooltip hover left"></div>
                    </div>
                </fieldset>
                <fieldset class="label_side">
                    <label>{$smarty.const.FIELD_ANCHO}<span></span></label>
                    <div class="clearfix">
                        <select name="ancho" class="required">
                            {section start=2 loop=17 name="size"}
                                <option value="{$smarty.section.size.index}"
                                        {if $smarty.section.size.index == {$panel->ancho}}selected="selected"{/if} >
                                    {$smarty.section.size.index}</option>
                                {/section}
                        </select>
                        <div class="required_tag tooltip hover left"></div>
                    </div>
                </fieldset>
                <div class="button_bar clearfix" id="footer_tabs">
                    <button class="green send_right img_icon has_text" type="submit">
                        <span>{$smarty.const.TXT_GRABAR}</span>
                    </button>
                    <button class="btnPrev red send_left img_icon has_text" onclick="history.back();" type="button">
                        <span>{$smarty.const.TXT_CANCEL}</span>
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

{literal}
    <script>
        $(function () {
            $('#panel_editar').validate();
        });
    </script>
{/literal}