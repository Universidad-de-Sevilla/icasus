{if $aviso}<p class='aviso'>{$aviso}</p>{/if}
{if $error}<p class='error'>{$error}</p>{/if}
<h3>Editando indicador</h3>
<form method="post" action="index.php?page=indicador_editar" id="formindicador" name="formindicador" class="datos">
	
	<input type='hidden' name='id_indicador' value='{$indicador.id_indicador}' />
	<input type='hidden' name='id_entidad' value='{$indicador.id_entidad}' />
	
	<p><label for="id_proceso">Proceso</label> &nbsp;<br /> 
	<select name="id_proceso" id="id_proceso" class="inp">
	<option value=''></option>
	{foreach from=$procesos item=proceso}
		<option value='{$proceso.id_proceso}' 
			{if $indicador.id_proceso == $proceso.id_proceso}selected{/if}>{$proceso.nombre}</option>
	{/foreach}		
	</select> </p>
	
	<p><label for="id_responsable">Responsable de tomar el dato</label> &nbsp;<br /> 
	<select name="id_responsable" id="id_responsable" class="inp">
	<option value=''></option>
	{foreach from=$usuarios item=usuario}
		<option value='{$usuario.id_usuario}' 
			{if $indicador.id_responsable == $usuario.id_usuario}selected{/if}>{$usuario.nombre} {$usuario.apellidos}</option>
	{/foreach}		
	</select> </p>
	<!--
	<p><label for="id_dimension">Dimensión</label> &nbsp; 
	<select name="id_dimension" class="inp">
	<option value=''></option>
	{foreach from=$dimensiones item=dimension}
		<option value='{$dimension.id}' 
			{if $indicador.id_dimension == $dimension.id}selected{/if}>{$dimension.nombre|htmlentities}</option> 
	{/foreach}
	-->
	</select> </p>
	
	<p><label for="codigo">Código </label> &nbsp; <span class="grey">(requerido)</span><br />
	<input type="text" name="codigo" id="codigo" class="inp" value="{$indicador.codigo}"/></p>
	
	<p><label for="nombre">Nombre indicador </label> &nbsp; <span class="grey">(requerido)</span><br />
	<input type="text" name="nombre" id="nombre" class="inp" value="{$indicador.nombre}"/></p>

	<p><label for="visibilidad">Visibilidad </label> &nbsp; <span class="grey">(requerido)</span><br />
        <select name="visibilidad" id="visibilidad" class="inp">
        {foreach from=$visibilidades item=visibilidad}
                <option value='{$visibilidad->id}' {if $indicador.id_visibilidad == $visibilidad->id} selected {/if}>{$visibilidad->nombre|htmlentities}</option>
        {/foreach}
        </select> </p>


	<p><label for="descripcion">Descripci&oacute;n </label> &nbsp; <span class="grey">(requerido)</span><br />
	<textarea name="descripcion" id="descripcion" class="inp" rows="5" cols="50">{$indicador.descripcion}</textarea></p>

	<p><label for="formulacion">Formulaci&oacute;n </label> &nbsp;<span class="grey">(requerido)</span><br />
	<textarea name="formulacion" id="formulacion" class="inp" rows="5" cols="50">{$indicador.formulacion}</textarea></p>

	<!--
	<p><label for="umbral">Umbral </label> &nbsp;<span class="grey">(requerido)</span>
	<input type="text" name="umbral" id="umbral" class="inp" value="{$indicador.umbral}"/></p>
	-->

	<p><label for="objetivo">Objetivo </label> &nbsp;<span class="grey">(requerido)</span><br />
	<input type="text" name="objetivo" id="objetivo" class="inp" value="{$indicador.objetivo}"/></p>

	<p><label for="objetivo_estrategico">Objetivo Estrat&eacute;gico</label> &nbsp;<br />
	<input type="text" name="objetivo_estrategico" id="objetivo_estrategico" class="inp"
	value="{$indicador.objetivo_estrategico}"/></p>

	<p><label for="objetivo_carta">Objetivo Carta de Servicio</label> &nbsp;<br />
	<input type="text" name="objetivo_carta" id="objetivo_carta" class="inp" value="{$indicador.objetivo_carta}"/></p>

	<p><label for="fuente">Fuente de obtenci&oacute;n </label> &nbsp;<span class="grey">(requerido)</span><br />
	<input type="text" name="fuente" id="fuente" class="inp" value="{$indicador.fuente}" /></p>

	<p><label for="periodicidad">Periodicidad de medida </label> &nbsp;<span class="grey">(requerido)</span><br />
	<select name="periodicidad" id="periodicidad" class="inp" />
		<option value=''></option>
		<option value='1' {if $indicador.periodicidad == 1}selected{/if}>Mensual</option>
		<option value='3' {if $indicador.periodicidad == 3}selected{/if}>Trimestral</option>
		<option value='4' {if $indicador.periodicidad == 4}selected{/if}>Cuatrimestral</option>
		<option value='6' {if $indicador.periodicidad == 6}selected{/if}>Semestral</option>
		<option value='12' {if $indicador.periodicidad == 12}selected{/if}>Anual</option>
	</select>
	</p>
	<p><input type="button" class="submit-btn" value="Enviar" name="indicador_submit" onclick="javascript:indicador_validar();" /></p>

</form>
