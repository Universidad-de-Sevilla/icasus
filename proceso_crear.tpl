{if $aviso}<p class='aviso'>{$aviso}</p>{/if}
{if $error}<p class='error'>{$error}</p>{/if}
<h3>Nuevo proceso</h3>
<!--<form method='post' action='index.php?page=proceso_crear' id='formproceso' class='datos'>-->
<form method='post' action='index.php?page=proceso_grabar' id='formproceso' class='datos'>
<input type='hidden' name='id_entidad' id='id_entidad' value='{$entidad.id_entidad}' />

<p><label for='madre'>Proceso madre</label> &nbsp; <span class='grey'>(requerido)</span><br />
<select name='madre' id='madre' class='inp'>
<option value="0">Es un Proceso Madre</option>
{foreach from=$procesos item=proceso}
<option value="{$proceso->id_proceso}">{$proceso->codigo} | {$proceso->nombre}</option>
{/foreach}
</select>
</p>

<p><label for='codigo'>C&oacute;digo</label> &nbsp; <span class='grey'>(requerido)</span><br />
<input type='text' name='codigo' id='codigo' class='inp' value='' /></p>

<p><label for='nombre'>Nombre proceso</label> &nbsp; <span class='grey'>(requerido)</span><br />
<input type='text' name='nombre' id='nombre' class='inp' /></p>

<p><label for="id_propietario">Propietario</label> &nbsp; <span class='grey'>(requerido)</span><br />
<select name="id_propietario" id="id_propietario" class="inp">
{foreach from=$usuarios item=usuario}
        <option value='{$usuario.id_usuario}'>{$usuario.nombre} {$usuario.apellidos}</option>
{/foreach}
</select> </p>

<p><label for="alcance">Tipo de proceso</label> <br />
<select name="alcance" id="alcance" class="inp">
        <option value="Operativo" >Operativo</option>
        <option value="Indefinido" >Indefinido ...</option>
        <option value="Apoyo" >Apoyo</option>
        <option value="Directivos/Gestion" >Directivo/Gestión</option>
</select>
</p>
<p><input type='submit' class='btn' value='Grabar' name='proceso_submit' /></p>

