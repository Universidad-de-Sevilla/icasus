<div class="box grid_16">
    <h2 class="box_head grad_grey_dark">{$smarty.const.TXT_USERS_ASIG}</h2>
    <a href="#" class="grabber"></a>
    <a href="#" class="toggle"></a>
    <div class="block"> 
        {if $usuarios}
            <table class='static'>
                <thead>
                    <tr><th>{$smarty.const.FIELD_ROL}</th><th>{$smarty.const.FIELD_NAME}</th><th>{$smarty.const.FIELD_APEL}</th><th>{$smarty.const.FIELD_CORREO}</th><th>{$smarty.const.FIELD_TEL}</th><th>{$smarty.const.FIELD_ACCIONES}</th></tr>
                </thead>
                <tbody>
                    {foreach from=$usuarios item=usuario}
                        <tr>
                            <td>{$usuario->rol->nombre}</td>
                            <td>{$usuario->usuario->nombre}</td>
                            <td>{$usuario->usuario->apellidos}</td>
                            <td><a href='mailto:{$usuario->usuario->correo}'>{$usuario->usuario->correo}</a></td>
                            <td>{$usuario->usuario->telefono}</td>
                            <td><a href='index.php?page=usuario_mostrar&id_usuario={$usuario->usuario->id}&id_entidad={$entidad->id}'>Detalle</a></td>
                        </tr>
                    {/foreach}
                </tbody>
            </table>
        {else}
            <div class='alert alert_blue'>{$smarty.const.MSG_UNID_NO_USERS}</div>
        {/if}
    </div>
</div>  

<div class="box grid_16">         
    <h2 class="box_head grad_grey_dark">{$smarty.const.TXT_USERS_DISP}</h2>
    <a href="#" class="grabber"></a>
    <a href="#" class="toggle"></a>
    <div class="toggle_container">  
        <div class="block">
            <form action='index.php?page=entidad_poblar' method='post' name='formpoblar' class='validate_form'>     
                <input type='hidden' name='id_entidad' value='{$entidad->id}' />
                <div id="dt1" class="no_margin">
                    <table class="display datatable">
                        <thead>
                            <tr><th></th><th>{$smarty.const.FIELD_NAME}</th><th>{$smarty.const.FIELD_APEL}</th><th>{$smarty.const.FIELD_CORREO}</th><th>{$smarty.const.FIELD_UNID_RPT}</th><th>{$smarty.const.FIELD_PUESTO}</th></tr>
                        </thead>
                        <tbody>
                            {foreach from=$personas item=persona}
                                <tr>
                                    <td><input type='checkbox' name='id_usuario[]' value='{$persona.id}' class=""/></td>
                                    <td>{$persona.nombre|upper}</td>
                                    <td>{$persona.apellidos|upper}</td>
                                    <td>{$persona.correo}</td>
                                    <td>{$persona.unidad_hominis}</td>
                                    <td>{$persona.puesto}</td>
                                </tr>
                            {/foreach}
                        </tbody>
                    </table>
                </div>
                <fieldset>
                    <label>{$smarty.const.FIELD_ROL}</label>
                    <div> 
                        <select name='id_rol' id='id_rol' class="required">
                            <option value="">{$smarty.const.TXT_SEL_UNO}</option>
                            {foreach from=$roles item='rol'}
                                <option value="{$rol->id}">{$rol->nombre}</option>
                            {/foreach }
                        </select>
                        <div class="required_tag"></div>
                    </div>
                </fieldset>
                <div class="button_bar clearfix">
                    <button class="green" type="submit" value="Asignar usuarios" name="enviar">
                        <span>{$smarty.const.TXT_ASIGNAR_USERS}</span>
                    </button>
                </div>  
            </form>
        </div>
    </div>
</div>
