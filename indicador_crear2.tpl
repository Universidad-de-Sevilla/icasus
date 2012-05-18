{if $aviso}<p class='aviso'>{$aviso}</p>{/if}
{if $error}<p class='error'>{$error}</p>{/if}
<h3>Nuevo ADO indicador</h3>
<form method="post" action="index.php?page=indicador_grabar" id="formindicador" name="formindicador" class="datos">
	<input type='hidden' name='id_entidad' id='id_entidad' value='{$entidad.id_entidad}' />

	<p><label for="id_proceso">Proceso</label> &nbsp; <span class="grey">(requerido)</span>
	<select name="id_proceso" id="id_proceso" class="inp">
	<option value=''></option>
	{foreach from=$procesos item=proceso}
		<option value='{$proceso.id_proceso}'>{$proceso.nombre}</option>
	{/foreach}		
	</select> </p>

	<p><label for="id_responsable">Responsable de tomar el dato</label> &nbsp; <span class="grey">(requerido)</span>
	<select name="id_responsable" id="id_responsable" class="inp">
	<option value=''></option>
	{foreach from=$usuarios item=usuario}
		<option value='{$usuario.id_usuario}'>{$usuario.nombre} {$usuario.apellidos}</option>
	{/foreach}		
	</select> </p>
	
	<p><label for="id_dimension">Dimensión</label> &nbsp; 
	<select name="id_dimension" class="inp">
	<option value=''></option>
	{foreach from=$dimensiones item=dimension}
		<option value='{$dimension.id}'>{$dimension.nombre|htmlentities}</option> 
	{/foreach}
	</select> </p>
	
	<p><label for="codigo">Código </label> &nbsp; <span class="grey">(requerido)</span>
	<input type="text" name="codigo" id="codigo" class="inp" /></p>

	<p><label for="nombre">Nombre indicador </label> &nbsp; <span class="grey">(requerido)</span>
	<input type="text" name="nombre" id="nombre" class="inp" /></p>

	<p><label for="descripcion">Descripci&oacute;n </label> &nbsp; <span class="grey">(requerido)</span></p>
	<p><textarea name="descripcion" id="descripcion" class="inp" rows="5" cols="50"></textarea></p>

	<p><label for="formulacion">Formulaci&oacute;n </label> &nbsp;<span class="grey">(requerido)</span></p>
	<p><textarea name="formulacion" id="formulacion" class="inp" rows="5" cols="50"></textarea></p>

	<p><label for="umbral">Umbral </label> &nbsp;<span class="grey">(requerido)</span>
	<input type="text" name="umbral" id="umbral" class="inp" /></p>

	<p><label for="objetivo">Objetivo </label> &nbsp;<span class="grey">(requerido)</span>
	<input type="text" name="objetivo" id="objetivo" class="inp" /></p>

	<p><label for="fuente">Fuente de obtenci&oacute;n </label> &nbsp;<span class="grey">(requerido)</span>
	<input type="text" name="fuente" id="fuente" class="inp" /></p>

	<p><label for="periodicidad">Periodicidad de medida </label> &nbsp;<span class="grey">(requerido)</span>
	<select name="periodicidad" id="periodicidad" class="inp" />
		<option value=''></option>
		<option value='1'>Mensual</option>
		<option value='3'>Trimestral</option>
		<option value='4'>Cuatrimestral</option>
		<option value='6'>Semestral</option>
		<option value='12'>Anual</option>
	</select>
	</p>

	<p><input type="button" class="submit-btn" value="Enviar" name="indicador_submit" onclick="javascript:indicador_validar();" /></p>

</form>

