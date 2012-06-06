<h3><img src='/icons/ff32/cog_edit.png' alt='icono engranaje'> Editando Proceso</h3>
<form method='post' action='index.php?page=proceso_editar' id='formproceso' class='datos'>
  <input type='hidden' name='id_entidad' id='id_entidad' value='{$proceso->id_entidad}' />
  <input type='hidden' name='id_proceso' id='id_proceso' value='{$proceso->id}' />
          
  <p><label for='madre'>Proceso madre</label> &nbsp; <span class='grey'>(requerido)</span>
  <select name='madre' id='madre' class='inp'>
  <option value="0">Es un Proceso Madre</option>
  {foreach from=$procesos_madre item=proceso_madre}
    <option value="{$proceso_madre->id}" {if $proceso_madre->id == $proceso->id_madre} selected{/if}>
    {$proceso_madre->codigo} - {$proceso_madre->nombre} 
    </option>
  {/foreach} 
  </select>
  </p>            
                  
  <p><label for='codigo'>C&oacute;digo</label> &nbsp; <span class='grey'>(requerido)</span><br />
  <input type='text' name='codigo' id='codigo' class='inp' value='{$proceso->codigo}' /></p>
                  
  <p><label for='nombre'>Nombre proceso</label> &nbsp; <span class='grey'>(requerido)</span><br />
  <input type='text' name='nombre' id='nombre' class='inp' value='{$proceso->nombre}' /></p>
                  
  <p><label for="id_propietario">Propietario</label> &nbsp; <br />
  <select name="id_propietario" id="id_propietario" class="inp">
    {foreach from=$usuarios_entidad item=usuario_entidad}
      <option value='{$usuario_entidad->usuario->id}' 
        {if $proceso->id_propietario == $usuario_entidad->usuario->id}selected{/if}>{$usuario_entidad->usuario->nombre} {$usuario_entidad->usuario->apellidos}
      </option>
    {/foreach}              
  </select> </p>          
                          
  <p><label for="alcance">Tipo de proceso</label> &nbsp; <br />
  <select name="alcance" id="alcance" class="inp">
    <option value="Indefinido" {if $proceso->alcance == 'Indefinido'} selected {/if} >Indefinido ...</option>
    <option value="Apoyo" {if $proceso->alcance == 'Apoyo'} selected {/if}>Apoyo</option>
    <option value="Operativo" {if $proceso->alcance == 'Operativo'} selected {/if}>Operativo</option>
    <option value="Directivo/Gestion" {if $proceso->alcance == 'Directivo/Gestion'} selected {/if}>Directivo/Gestión</option>
  </select>       
  </p>            
                  
  <p><input type='submit' class='btn' value='Grabar' name='proceso_submit' /></p>
</form>
