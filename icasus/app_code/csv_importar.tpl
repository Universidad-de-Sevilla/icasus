<div class="box grid_16">
    <div class="toggle_container">
        <div class="block">
            <!-- enctype='text/csv' -->
            <form name='subida_ficheros' class='datos' enctype='multipart/form-data' action='index.php?page=csv_grabar' method='post'>
                <input type='hidden' name='id_entidad' value='{$id_entidad}'>
                <fieldset class="label_side">
                    <label for='fichero'>
                        {$smarty.const.TXT_SEL_FILE_TO_IMPORT}
                    </label>
                    <div>
                        <input name='fichero_csv[]' type='file'>
                        <div class="required_tag"></div>
                    </div>
                </fieldset>
                <fieldset class="label_side">
                    <label for='fichero'>
                        {$smarty.const.TXT_SEL_FILE_TO_IMPORT}
                    </label>
                    <div>
                        <input name='fichero_csv[]' type='file'>
                    </div>
                </fieldset>
                <fieldset class="label_side">
                    <label for='fichero'>
                        {$smarty.const.TXT_SEL_FILE_TO_IMPORT}
                    </label>
                    <div>
                        <input name='fichero_csv[]' type='file'>
                    </div>
                </fieldset>
                <fieldset class="label_side">
                    <label for='fichero'>
                        {$smarty.const.TXT_SEL_FILE_TO_IMPORT}
                    </label>
                    <div>
                        <input name='fichero_csv[]' type='file'>
                    </div>
                </fieldset>
                <div class="button_bar clearfix">
                    <button class="green" type="submit" value="{$smarty.const.TXT_PROC_FILE}" name="csv_submit">
                        <div class="ui-icon ui-icon-check"></div>
                        <span>{$smarty.const.TXT_PROC_FILES}</span>
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
