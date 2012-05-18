{if $aviso}<p class='aviso'>{$aviso}</p>{/if}
{if $error}<p class='error'>{$error}</p>{/if}
<h3><img src='iconos/32x32/cog_edit.png' alt='icono engranaje'> Editando Proceso</h3>
<form method='post' action='index.php?page=proceso_editar' id='formproceso' class='datos'>
<input type='hidden' name='id_entidad' id='id_entidad' value='{$entidad.id_entidad}' />
<input type='hidden' name='id_proceso' id='id_proceso' value='{$proceso->id_proceso}' />
        
<p><label for='madre'>Proceso madre</label> &nbsp; <span class='grey'>(requerido)</span>
<select name='madre' id='madre' class='inp'>
<option value="0">Es un Proceso Madre</option>
{foreach from=$process item=proces}
<option value="{$proces->id_proceso}" {if $proces->id_proceso == $proceso->id_madre} selected{/if}>
{$proces->codigo} :: {$proces->nombre} {$proces->id_proceso}-{$proceso->id_madre}</option>
{/foreach} 
</select>
</p>            
                
<p><label for='codigo'>C&oacute;digo</label> &nbsp; <span class='grey'>(requerido)</span><br />
<input type='text' name='codigo' id='codigo' class='inp' value='{$proceso->codigo}' /></p>
                
<p><label for='nombre'>Nombre proceso</label> &nbsp; <span class='grey'>(requerido)</span><br />
<input type='text' name='nombre' id='nombre' class='inp' value='{$proceso->nombre}' /></p>
                
<p><label for="id_propietario">Propietario</label> &nbsp; <br />
<select name="id_propietario" id="id_propietario" class="inp">
        {foreach from=$usuarios item=usuario}
                <option value='{$usuario.id_usuario}' 
                        {if $proceso->id_propietario == $usuario.id_usuario}selected{/if}>{$usuario.nombre}
                        {$usuario.apellidos}</option>
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

