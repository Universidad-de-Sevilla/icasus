<h3>Foro {$smarty.get.foro} de Icasus</h3>

<form method="post" action="" id="formtop" onsubmit="return publicar_entrada('top')">
<input type="button" id="nueva" name="nueva" title="Crear nueva entrada" 
style="border:0px;background:#fff url('iconos/16x16/comments_add.png') no-repeat" 
onclick="javascript:id_nueva();">
<input type="button"  id="cerrar" name="cerrar" title="Cerrar el cuadro de nuevas entradas" 
style="border:0px;display:none;background:#fff url('iconos/16x16/comments_delete.png') no-repeat"
onclick="id_cerrar();"> 
<input type="submit" id="publicar" title="Publicar la nueva entrada" value="" 
style="border:0px;display:none;background: #fff url('iconos/16x16/comments_accept.png') no-repeat">
<input type="hidden" name="id_usuario" value="{$_operario.id_usuario}">
<input type="hidden" name="tipo_foro" value="{$smarty.get.foro}">
<input type="hidden" name="formulario" value="top">
<table width="100%" id="nuevotop" style="display:none">
<tr>
<th width="10%">Asunto:</th><td><input type="text" id="asuntotop" name="asuntotop" style="width:100%;border:1px solid #eee" /></td>
</tr>
<tr><th>Texto:</th><td><textarea  type="text" name="textotop" id="textotop" style="width:100%;border:1px solid #eee"></textarea></td>
</tr>
</table>
</form>
<!-- incio entradas  -->
<table width="100%">
<tr>
<th width="10%">Usuario
<th width="70%">Asunto
</th>
<th width="10%">Ultimo<br /> mensaje
</th>
<th width="10%">Respuestas
</th>
<th width="10%">Visitas
</th>
</tr>
{foreach from=$hilos item=hilo}
<tr>
<td>{$hilo->login}
</td>
<td><a href="index.php?page=foro/foro_detalle&id={$hilo->id}&foro={$smarty.get.foro}" onclick="javascript:suma_visitas({$hilo->id});">{$hilo->asunto}</a> 
</td>
<td>{$hilo->fecha_entrada|date_format:"%d/%m/%Y"}
</td>
<td>{$hilo->hijos}
</td>
<td>{$hilo->visitas}
</td>
{/foreach}
</table>
<!-- fin entradas -->
<form method="post" action="" id="formbottom" onsubmit="return publicar_entrada('bottom')">
<input type="button" id="nuevabottom" title="Crear nueva entrada"
style="border:0px;background:#fff url('iconos/16x16/comments_add.png') no-repeat"
onclick="id_nuevabottom();">
<input type="button"  id="cerrarbottom" title="Cerrar el cuadro de nuevas entradas"
style="border:0px;display:none;background:#fff url('iconos/16x16/comments_delete.png') no-repeat"
onclick="id_cerrarbottom();">
<input type="submit" id="publicarbottom" title="Publicar la nueva entrada" value=""
style="border:0px;display:none;background: #fff url('iconos/16x16/comments_accept.png') no-repeat"
onclick="javascript:/*document.getElementById('nuevobottom').style.display='none';*/">
<input type="hidden" name="id_usuario" value="{$_operario.id_usuario}">
<input type="hidden" name="tipo_foro" value="{$smarty.get.foro}">
<input type="hidden" name="formulario" value="bottom">
<table width="100%" id="nuevobottom" style="display:none">
<tr>
<th width="10%">Asunto:</th><td><input type="text" id="asuntobottom" name="asuntobottom" style="width:100%;border:1px solid #eee" /></td>
</tr>
<tr><th>Texto:</th><td><textarea type="text" id="textobottom" name="textobottom" style="width:100%;border:1px solid #eee" ></textarea></td>
</tr>
</table>
</form>

