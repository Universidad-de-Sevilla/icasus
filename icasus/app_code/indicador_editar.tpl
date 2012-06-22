<h3>Editando indicador: {$indicador->nombre}</h3>
<form method="post" action="index.php?page=indicador_grabar" id="formindicador" name="formindicador" class="datos">
	<input type='hidden' name='id_indicador' value='{$indicador->id_indicador}' />
	<input type='hidden' name='id_entidad' value='{$indicador->id_entidad}' />
    <table>
    <tr>
      <th>Proceso</th>
      <td>
        <select name="id_proceso" id="id_proceso" class="inp">
          {foreach $procesos as $proceso}
            <option value='{$proceso->id}' {if $indicador->id_proceso == $proceso->id}selected{/if}>
              {$proceso->nombre}
            </option>
          {/foreach}
        </select>
      </td>
    </tr>
    <tr>
      <th>Responsable de medici&oacute;n</td>
      <td>
        <select name="id_responsable">
          {foreach $usuarios_entidades as $usuario_entidad}
            <option value='{$usuario_entidad->usuario->id}' {if $indicador->id_responsable == $usuario_entidad->usuario->id}selected{/if}>{$usuario_entidad->usuario->nombre} {$usuario_entidad->usuario->apellidos} {if $usuario_entidad->usuario->puesto} - {$usuario_entidad->usuario->puesto} {/if}
            </option>
          {/foreach}              
        </select>
      </td>
    </tr>
    <tr>
      <th>Código indicador</th>
      <td><input type='text' name='codigo' id='codigo'value='{$indicador->codigo}' /></td>
    </tr>
    <tr>
      <th>Nombre indicador</th>
      <td><b><input type='text' name='nombre' id='nombre'value='{$indicador->nombre}' /></b></td>
    </tr>
    <tr>
      <th>Descripci&oacute;n</th>
      <td><textarea rows="3" class='inp' name='descripcion' id='descripcion'>{$indicador->descripcion}</textarea></td>
    </tr>
    <tr>
      <th>Formulaci&oacute;n</th>
      <td><textarea rows="3" class='inp' name='formulacion' id='formulacion'>{$indicador->formulacion}</textarea></td>
    </tr>
    <tr>
      <th>Valor de referencia</th>
      <td><input type='text' name='valor_referencia' id='valor_referencia'value='{$indicador->valor_referencia}' /></td>
    </tr>
    <tr>
      <th>Fuente de informaci&oacute;n</th>
      <td><input type='text' name='fuente_informacion' id='fuente_informacion'value='{$indicador->fuente_informacion}' /></td>	
    </tr>
    <tr>
      <th>Fuente de datos</th>
      <td><input type='text' name='fuente_datos' id='fuente_datos'value='{$indicador->fuente_datos}' /></td>	
    </tr>
    <tr>
      <th>Unidad generadora</th>
      <td><input type='text' name='unidad_generadora' id='unidad_generadora'value='{$indicador->unidad_generadora}' /></td>
    </tr>
    <tr>
      <th>Metodo de comprobaci&oacute;n/Evidencia</th>
      <td><input type='text' name='evidencia' id='evidencia'value='{$indicador->evidencia}' /></td>		
    </tr>
    <tr>
      <th>Hist&oacute;rico</th>
      <td><input type='text' name='historicos' id='historicos'value='{$indicador->historicos}' /></td>
    </tr>

    <tr>
      <th>Interpretaci&oacute;n</th>
      <td><input type='text' name='interpretacion' id='interpretacion'value='{$indicador->interpretacion}' /></td>
    </tr>
    <tr>
      <th>Indicadores relacionados</th>
      <td><input type='text' name='indicadores_relacionados' id='indicadores_relacionados'value='{$indicador->indicadores_relacionados}' /></td>
    </tr>
    <tr>
      <th>Criterios EFQM</th>
      <td>
        <select name="criterios_efqm[]" id="criterios_efqm" class="inp">
          <option value=''></option>
          {foreach $criterios_efqm as $criterio_efqm}
            <option value='{$criterio_efqm->id}' 
            {if $indicador->criterios_efqm}
                {if $indicador->criterios_efqm[0]->criterio_efqm->id == $criterio_efqm->id}selected{/if}
            {/if}
            >{$criterio_efqm->codigo} - {$criterio_efqm->nombre}
            </option>
          {/foreach}
        </select>
        <select name="criterios_efqm[]" id="criterios_efqm" class="inp">
          <option value=''></option>
          {foreach $criterios_efqm as $criterio_efqm}
            <option value='{$criterio_efqm->id}' 
            {if $indicador->criterios_efqm}
                {if $indicador->criterios_efqm[1]->criterio_efqm->id == $criterio_efqm->id}selected{/if}
            {/if}
            >{$criterio_efqm->codigo} - {$criterio_efqm->nombre}
            </option>
          {/foreach}
        </select>
      </td>
    <tr>
      <th>Periodicidad</td>
      <td>{$indicador->periodicidad}</td>
    </tr>
    <tr>
      <th>Visibilidad</td>	
      <td>{$indicador->visibilidad->nombre|htmlentities}</td>
    </tr>
    <tr>
      <th>Valores de referencia</th>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <th>Nivel de desagregacion</th>
      <td><input type='text' name='nivel_desagregacion' id='nivel_desagregacion'value='{$indicador->nivel_desagregacion}' /></td>
    </tr>
    <tr>
      <th>Subunidades afectadas</th>
    <td>
    <input type="checkbox" name="id_unidades[]" checked /> {$entidad->nombre}<hr />
      {foreach $subunidades as $subunidad}
        <input type="checkbox" name="id_unidades[]" value="{$subunidad->id}" checked /> {$subunidad->nombre}<br />
      {/foreach}
    </td>
    </tr>
  </table>

	<p><input type="button" class="submit-btn" value="Enviar" name="indicador_submit" onclick="javascript:indicador_validar();" /></p>

</form>
