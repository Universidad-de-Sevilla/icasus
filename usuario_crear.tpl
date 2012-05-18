{if $aviso}<p class='aviso'>{$aviso}</p>{/if} 
{if $error}<p class='error'>{$error}</p>{/if} 
<h3>Crear usuario</h3>
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
	<p><label for="nombre">Nombre</label> &nbsp;<span class="grey">(requerido)</span>
	<input name="nombre" id="nombre" class="inp" /></p>

	<p><label for="apellidos">Apellidos </label> &nbsp;<span class="grey">(requerido)</span>
	<input name="apellidos" id="apellidos" class="inp" /></p>

	<p><label for="nif">D.N.I.(con letra)</label> &nbsp;<span class="grey">(requerido)</span>
	<input name="nif" id="nif" class="inp" /></p>

	<p><label for="correo">Correo electr&oacute;nico</label> &nbsp;
	<input name="correo" id="correo" class="inp" /></p>

	<p><label for="telefono">Tel&eacute;fono</label> &nbsp;
	<input name="telefono" id="telefono" class="inp" /></p>

	<p><label for="login">Login </label> &nbsp;<span class="grey">(requerido)</span>
	<input name="login" id="login" class="inp" /></p>

	<p><label for="clave">Clave de acceso </label> &nbsp;<span class="grey">(requerido)</span>
	<input type="password" name="clave" id="clave" class="inp" /></p>

	<p><label for="clave2">Repetir clave de acceso </label> &nbsp;<span class="grey">(requerido)</span>
	<input type ="password" name="clave2" id="clave2" class="inp" /></p>

	<p><input type="button" class="submit" value="Enviar" name="usuario_submit" onclick="javascript:usuario_validar();" /></p>

</form>
