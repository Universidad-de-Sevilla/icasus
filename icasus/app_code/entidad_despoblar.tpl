<div class="box grid_16 single_datatable">
    <h2 class="box_head grad_grey_dark">{$smarty.const.TXT_USERS_ASIG}</h2>
    <a href="#" class="grabber"></a>
    <a href="#" class="toggle"></a>
    <form action='index.php?page=entidad_despoblar&id_entidad={$entidad->id}' method='post' class='formdiv' name='formdiv' onsubmit="return confirm('{$smarty.const.MSG_USERS_CONFIRM_DESVINC}');">
        <div id="dt1" class="no_margin">
            <table class="display datatable">
                <thead>
                    <tr><th></th><th>{$smarty.const.FIELD_ROL}</th><th>{$smarty.const.FIELD_NOMBRE}</th><th>{$smarty.const.FIELD_APEL}</th><th>{$smarty.const.FIELD_CORREO}</th></tr>
                </thead>
                <tbody>
                    {foreach from=$usuarios item=usuario}
                        <tr class="gradex">
                            <td><input type='checkbox' name='id_usuario[]' value='{$usuario->id_usuario}' /></td>
                            <td>{$usuario->rol->nombre}</td>
                            <td>{$usuario->usuario->nombre}</td>
                            <td>{$usuario->usuario->apellidos}</td>
                            <td><a href='mailto:{$usuario->usuario->correo}'>{$usuario->usuario->correo}</a></td>
                        </tr>
                    {/foreach}
                </tbody>
            </table>			    
        </div>
        <div class="button_bar clearfix">
            <button class="light send_left" type="reset" value="{$smarty.const.TXT_CANCEL}" name="proceso_cancel" 
                    onclick="location.href = 'index.php?page=entidad_datos&id_entidad={$entidad->id}';">
                <div class="ui-icon ui-icon-closethick"></div>
                <span>{$smarty.const.TXT_CANCEL}</span>
            </button>
            <button class="green send_right" type="submit" value="" name="enviar">
                <span>{$smarty.const.TXT_USERS_DESASIGNAR}</span>
            </button>
        </div>
    </form>
</div>
