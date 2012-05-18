{if $aviso}<p class='aviso'>{$aviso}</p>{/if}
{if $error}<p class='error'>{$error}</p>{/if}
<h3>Nuevo Equipo</h3>

<form method='post' action='index.php?page=grupo/grupo_grabar' id='formentidad' class='datos' onsubmit="javascript:return confirm('Desea crear el equipo de trabajo con código: ET-'+document.getElementById('codigo').value);" >
<input type="hidden" id="name" name="graba" value="grupo" />
<input type='hidden' name='id_padre' id='id_padre' class='inp' value='221' />

<p><label for='nombre'>Nombre equipo</label> &nbsp; <span class='grey'>(requerido)</span><br />
<input type='text' name='nombre' id='nombre' class='inp' value='' /></p>

<p><label for='codigo'>C&oacute;digo</label> &nbsp; <br />
<input type='text' name='codigo' id='codigo' class='inp' value='UN***' />

<p><label for='objeto'>Finalidad</label> &nbsp; <br />
<input type='text' name='objeto' id='objeto' class='inp' value='' /></p>

<p><label for='frecuencia'>Frecuencia</label> &nbsp; <br />
<input type='text' name='frecuencia' id='frecuencia' class='inp' value='' /></p>

<p><input type='submit' class='submit' value='Grabar' name='entidad_submit' /></p>

</form>

{if $all_grupos == 'jjmc'}
<h3>Relación de Equipos</h3>
<table width="97%">     
    <thead><tr><th width="15%">C&oacute;digo</th><th>Nº Actas</th><th width="60%">Equipos</th><th width="25%">Acciones</th></tr></thead>
    <tbody>
{foreach from=$grupos_operario item=grupo}
   <tr>
    <td>{$grupo->codigo}</td>
    <td>{$grupo->numero_actas}</td>	
    <td>{$grupo->nombre}</td>
    <td>
        <a href='index.php?page=grupo/grupo_datos&id_entidad={$grupo->id_entidad}'>Ver</a> -
        <a href='index.php?page=grupo/acta_listar&id_entidad={$grupo->id_entidad}'>Actas</a>
    </td>
   </tr>
{/foreach}              
</tbody></table>
{/if}
