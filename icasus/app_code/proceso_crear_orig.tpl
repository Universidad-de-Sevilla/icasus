<h3>Nuevo proceso</h3>
<form method="post" action="index.php?page=proceso_grabar" id="formproceso" class="datos">
  <input type="hidden" name="id_entidad" id="id_entidad" value="{$entidad->id}" />

  <p><label for='madre'>Proceso madre</label><span class='grey'>(requerido)</span>
  <select name='madre' id='madre' class='inp'>
  <option value="0">Es un Proceso Madre</option>
  {foreach from=$procesos_madre item=proceso_madre}
    <option value="{$proceso_madre->id}">
    {$proceso_madre->codigo} - {$proceso_madre->nombre}</option>
  {/foreach} 
  </select>
  </p>                           
  <p>
  <table width="100%">
    <tr>
      <th><label for='codigo'>C&oacute;digo</label><span class='grey'>(requerido)</span></th>
      <th><label for='codigo'>Revisi&oacute;n</label><span class='grey'>(requerido)</span></th>
      <th><label for='codigo'>Fecha</label><span class='grey'>(requerido)</span></th>
    </tr>
    <tr>
      <td><input style="width:100%" type='text' name='codigo' id='codigo' /></td>
      <td><input style="width:100%" type='text' name='revision' id='revision' /></td>
      <td><input style="width:100%" type='text' name='fecha_revision' id='fecha_revision' /></td>
    </tr>
  </table>
  </p>                
  <p>
  <table width="100%">
    <tr>
      <th><label for='nombre'>Nombre proceso</label> &nbsp; <span class='grey'>(requerido)</span></th>
      <th><label for="id_propietario">Propietario</label></th>
    </tr>
    <tr>
      <td><input style="width:100%" type='text' name='nombre' id='nombre' /></td>
      <td><select style="width:100%" name="id_propietario" id="id_propietario">
        {foreach from=$usuarios_entidad item=usuario_entidad}
          <option value="{$usuario_entidad->usuario->id}">{$usuario_entidad->usuario->nombre} {$usuario_entidad->usuario->apellidos} {if $usuario_entidad->usuario->puesto} - {$usuario_entidad->usuario->puesto} {/if}
          </option>
        {/foreach}              
        </select></td>
    </tr>
  </table>
  </p>
  <p><label for="mision">Misi&oacute;n</label><br />
     <textarea rows="2" class='inp' name='mision' id='mision'></textarea>
  </p>
  <p><label for="equipo_de_proceso">Equipo de proceso</label><br />
     <textarea rows="3" class='inp' name='equipo_de_proceso' id='equipo_de_proceso'></textarea>
  </p>
  <p><label for="resultados_clave">Resultados clave</label><br />
     <textarea rows="3" class='inp' name='resultados_clave' id='resultados_clave'></textarea>
  </p>
  <p>
  <table width="100%">
    <tr>
      <th><label for='entradas'>Entradas</label></th>
      <th><label for='proveedores'>Proveedores</label></th>
    </tr>
    <tr>
      <td><textarea rows="5" style="width:100%" name='entradas' id='entradas'></textarea></td>
      <td><textarea rows="5" style="width:100%" name='proveedores' id='proveedores'></textarea></td>
    </tr>
  </table>
  </p>
  <p>
  <table width="100%">
    <tr>
      <th><label for='salidas'>Salidas</label></th>
      <th><label for='clientes'>Clientes</label></th>
    </tr>
    <tr>
      <td><textarea rows="5" style="width:100%" name='salidas' id='salidas'></textarea></td>
      <td><textarea rows="5" style="width:100%" name='clientes' id='clientes'></textarea></td>
    </tr>
  </table>
  </p>
  <p><label for="actividades">Actividades</label><br />
     <textarea rows="5" class='inp' name='actividades' id='actividades'></textarea>
  </p>
  <p><label for="documentacion">Documentaci&oacute;n</label><br />
     <input type='text' name='documentacion' id='documentacion'/>
  </p>
  <p><label for="mediciones">Mediciones</label><br />
     <textarea rows="3" class='inp' name='mediciones' id='mediciones'></textarea>
  </p>
  <p><label for="registros">Registros</label><br />
     <textarea rows="3" class='inp' name='registros' id='registros'></textarea>
  </p>
  <p><label for="alcance">Tipo de proceso</label><br />
  <select name="alcance" id="alcance" class="inp">
    <option value="Indefinido">Indefinido ...</option>
    <option value="Apoyo">Apoyo</option>
    <option value="Operativo">Operativo</option>
    <option value="Directivo/Gestion">Directivo/Gestión</option>
  </select>       
  </p>
  <p><input type="submit" class="btn" value="Grabar" name="proceso_submit" /></p>
</form>
