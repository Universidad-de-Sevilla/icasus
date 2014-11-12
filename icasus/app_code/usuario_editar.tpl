{if $aviso}<p class='aviso'> {$aviso}</p>{/if}
{if $error}<p class='error'> {$error}</p>{/if}
<h3>{$smarty.const.TXT_USER_EDIT}</h3>
<form action="index.php?page=usuario_editar&id_usuario_url={$usuario.id_usuario}" method="post" id="formusuario" name="formusuario" class="datos">
    <input type='hidden' name='id_usuario' id='id_usuario' value='{$usuario.id_usuario}' />
    <input type='hidden' name='id_entidad' id='id_entidad' value='{$id_operario}' />

    <p><label for="nombre">{$smarty.const.FIELD_NAME}</label> &nbsp;<span class="grey">{$smarty.const.TXT_REQ}</span>
        <input name="nombre" id="nombre" class="inp" value="{$usuario.nombre}" /></p>

    <p><label for="apellidos">{$smarty.const.FIELD_APEL} </label> &nbsp;<span class="grey">{$smarty.const.TXT_REQ}</span>
        <input name="apellidos" id="apellidos" class="inp" value="{$usuario.apellidos}" /></p>

    <p><label for="nif">{$smarty.const.FIELD_DNI}</label> &nbsp;
        <input name="nif" id="nif" class="inp" value="{$usuario.nif}" /></p>

    <p><label for="correo">{$smarty.const.FIELD_CORREO}</label> &nbsp;
        <input name="correo" id="correo" class="inp" value="{$usuario.correo}" /></p>

    <p><label for="telefono">{$smarty.const.FIELD_TEL}</label> &nbsp;
        <input name="telefono" id="telefono" class="inp" value="{$usuario.telefono}" /></p>

    <p><label for="login">{$smarty.const.FIELD_LOGIN}</label> &nbsp;<span class="grey">{$smarty.const.TXT_REQ}</span>
        <input name="login" id="login" class="inp" value="{$usuario.login}" /></p>

    <p><label for="clave">{$smarty.const.FIELD_CLAVE}</label> &nbsp;<span class="grey">{$smarty.const.TXT_REQ}</span>
        <input type="password" name="clave" id="clave" class="inp" value="{$usuario.clave}" /></p>

    <p><label for="clave2">{$smarty.const.FIELD_REP_CLAVE} </label> &nbsp;<span class="grey">{$smarty.const.TXT_REQ}</span>
        <input type ="password" name="clave2" id="clave2" class="inp" value="{$usuario.clave}" /></p>

    <p><input type="button" class="submit-btn" value="{$smarty.const.TXT_BTN_ENVIAR}" name="usuario_submit" onclick="javascript:usuario_validar();" /></p>
</form>
