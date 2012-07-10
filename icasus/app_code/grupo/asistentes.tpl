<table width="95%" style="margin:20px;border:1px dotted #07a">
<thead>
<tr><th>Si</th><th>No</th><th>Nombre</th><th>Apellidos</th></tr>
</thead>
<tbody>
{foreach from=$acta->usuarios item=usuario}
<tr>    
<td >
<input type="radio" name="si{$usuario->id_usuario}" id="si{$usuario->id_usuario}" value="1" 
onclick="javascript:marcar_asistencia('{$usuario->id_usuario}','{$acta->id_acta}',1);" 
{if $usuario->asiste == 1} checked{/if}/> 
</td>
<td>
<input type="radio" name="si{$usuario->id_usuario}" id="si{$usuario->id_usuario}" value="0"  
onclick="javascript:marcar_asistencia('{$usuario->id_usuario}','{$acta->id_acta}',0);" 
{if $usuario->asiste == ''} {elseif $usuario->asiste  == 0} checked {/if}/>
</td>
<td width="40%" >{$usuario->nombre_usuario}</td><td width="100%">{$usuario->apellidos_usuario}</td>
</tr>
{/foreach}
</table>
