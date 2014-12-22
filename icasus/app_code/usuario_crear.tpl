{if $aviso}<p class='aviso'>{$aviso}</p>{/if} 
{if $error}<p class='error'>{$error}</p>{/if} 
<h3>{$smarty.const.TXT_USER_CREAR}</h3>
<form action="index.php?page=usuario_crear" method="post" id="formusuario" name="formusuario" class="datos">
	<input name='id_entidad' id='id_entidad' type='hidden' value={$entidad.id_entidad} />
<!--
	<p><label for='entidad'>Entidad</label> <span class="grey">(pulse la primera letra del nombre para 
		moverse más rápido por la lista)</span><br />
	<select name='entidad' id='entidad' class='inp'>
	{foreach from=$entidades item='entidad'}
		<option value="{$entidad.id_entidad}">{$entidad.nombre}</option>
	{/foreach }
	</select></p>

	<p><label for='id_rol'>Rol</label> <br />
	<select name='id_rol' id='id_rol' class='inp'>
	{foreach from=$roles item='rol'}
		<option value="{$rol.id_rol}">{$rol.nombre}</option>
	{/foreach }
	</select></p>
-->
	<p><label for="nombre">{$smarty.const.FIELD_NOMBRE}</label> &nbsp;<span class="grey">{$smarty.const.MSG_FIELD_REQ}</span>
	<input name="nombre" id="nombre" class="inp" /></p>

	<p><label for="apellidos">{$smarty.const.FIELD_APEL}</label> &nbsp;<span class="grey">{$smarty.const.MSG_FIELD_REQ}</span>
	<input name="apellidos" id="apellidos" class="inp" /></p>

	<p><label for="nif">{$smarty.const.FIELD_DNI}</label> &nbsp;<span class="grey">{$smarty.const.MSG_FIELD_REQ}</span>
	<input name="nif" id="nif" class="inp" /></p>

	<p><label for="correo">{$smarty.const.FIELD_CORREO}</label> &nbsp;
	<input name="correo" id="correo" class="inp" /></p>

	<p><label for="telefono">{$smarty.const.FIELD_TEL}</label> &nbsp;
	<input name="telefono" id="telefono" class="inp" /></p>

	<p><label for="login">{$smarty.const.FIELD_LOGIN} </label> &nbsp;<span class="grey">{$smarty.const.MSG_FIELD_REQ}</span>
	<input name="login" id="login" class="inp" /></p>

	<p><label for="clave">{$smarty.const.FIELD_CLAVE} </label> &nbsp;<span class="grey">{$smarty.const.MSG_FIELD_REQ}</span>
	<input type="password" name="clave" id="clave" class="inp" /></p>

	<p><label for="clave2">{$smarty.const.FIELD_REP_CLAVE} </label> &nbsp;<span class="grey">{$smarty.const.MSG_FIELD_REQ}</span>
	<input type ="password" name="clave2" id="clave2" class="inp" /></p>

	<p><input type="button" class="submit" value="{$smarty.const.TXT_BTN_ENVIAR}" name="usuario_submit" onclick="javascript:usuario_validar();" /></p>

</form>
