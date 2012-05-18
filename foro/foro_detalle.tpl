<h3>Detalle Foro de Icasus</h3>
<!--          Inicio padre             -->
<table width="100%" >
  <tr>
    <td colspan="2" scope="row">{$padre->fecha_entrada|date_format:"%d/%m/%Y"}</td>
  </tr>
  <tr>
    <td width="18%" scope="row">
	<span style="font-size:.9em;"><i>Usuario:</i></span><br /><span style="font-size:.8em;color:#d60">{$padre->usuario->login}</span><br />
	<img src="iconos/user_gray.gif" /><br /><span><i>Entidades</i></span>
    </td>
    <td width="82%" valign="top" >
       <div style="background:#fff;padding:5px">Asunto: {$padre->asunto}</div>
       <div style="padding:5px">{$padre->texto}</div>
   </td>
  </tr>
  <tr>
    <td colspan="2" scpoe="row"><span style="font-size:.9em;">{foreach from=$padre->usuario->entidades item=entidad}
        <span style="font-size:.8em;color:#d60">{if $entidad->nombre != 'Pruebas Icasus' } {$entidad->nombre} | {/if} </span>{/foreach}
        <div style="float:right">
		<img src="iconos/16x16/comments_add.png" title="Responder a esta entrada"  onclick="javascript: document.getElementById('qf{$padre->id}').style.display='inline'; "/>
	</div>
        </td>
  </tr> 
</table>
<!--          Inicio respuesta padre             -->

<div id="qf{$padre->id}" style="display:none;">
<form id="form-resp{$padre->id}" method="post" action="index.php?page=foro/foro_detalle&id={$padre->id}&foro={$padre->tipo}&asunto={$padre->asunto}" onsubmit="return  publicar ('texto{$padre->id}'); /*confirm('Desea publicar este comentario')*/">
<div>
<input type="button" name="" id="" style="font-size:.8em;border:0px;background:#fff url('iconos/16x16/comment_delete.png') no-repeat;cursor:pointer" value="" onclick="javascript: document.getElementById('qf{$padre->id}').style.display='none'" title="Cerrar y no publicar comentarios de esta entrada" />
<input type="reset" name="" id="" style="font-size:.8em;border:0px;background:#fff url('iconos/16x16/comment_edit.png')no-repeat;cursor:pointer" value="" title="Borrar todo el texto del comentario"/>
<input type="submit" name="" id="" style="font-size:.8em;border:0px;background:#fff url('iconos/16x16/comment.png') no-repeat;cursor:pointer" value="" title="Publicar este comentario en el foro" />
<!-- onclick="return confirm('Desea publicar este comentario')" -->
</div>
<textarea id="texto{$padre->id}" name="texto" cols="76%" rows="4" style="margin-top:5px;border:0px solid #e4e4e4;padding:10px;background:#eee"></textarea>
</form>
</div>
<!--          Fin respuesta padre             -->
<!--          Fin padre            -->
<!-- Inicio respuestas a este padre -->
{if $hijos}
{foreach from=$hijos item=hijo}
<table width="100%" >
  <tr>
    <td colspan="2" scope="row">{$hijo->fecha_entrada|date_format:"%d/%m/%Y"}</td>
  </tr>
  <tr>
    <td width="18%" scope="row">
	<span style="font-size:.9em;"><i>Usuario:</i></span><br /><span style="font-size:.8em;color:#d60">{$hijo->login}</span><br />
	<img src="iconos/user_gray.gif" /><br />
	<i>Entidades:</i><br />
    </td>
    <td width="82%" valign="top">
    <div style="background:#fff;padding:5px">Asunto: {$padre->asunto}</div>
    {$hijo->texto}
    </td>
  </tr>
  <tr>
    <td colspan="2" scpoe="row"><span style="font-size:.9em;">
{foreach from=$padre->usuario->entidades item=entidad}
     <span style="font-size:.8em;color:#d60">
      {if $entidad->nombre != 'Pruebas Icasus' } 
      {$entidad->nombre} |
      {/if} 
     </span>
{/foreach}
     <div style="float:right">
	<img src="iconos/16x16/comments_add.png" title="Responder a esta entrada"  onclick="javascript: document.getElementById('respuesta{$hijo->id}').style.display='inline'; "/>
     </div>
   </td>
  </tr> 
</table>
<div id="respuesta{$hijo->id}" style="display:none;">
<form id="form-resp{$hijo->id}" method="post" action="index.php?page=foro/foro_detalle&id={$padre->id}&foro={$padre->tipo}&asunto={$padre->asunto}" onsubmit="return  publicar ('texto{$hijo->id}'); /* confirm('Desea publicar este comentario')*/" >
<div>
<input type="button" name="" id="" style="font-size:.8em;border:0px;background:#fff url('iconos/16x16/comment_delete.png') no-repeat;cursor:pointer" value="" onclick="javascript: document.getElementById('respuesta{$hijo->id}').style.display='none'" title="Cerrar y no publicar comentarios de esta entrada" />
<input type="reset" name="" id="" style="font-size:.8em;border:0px;background:#fff url('iconos/16x16/comment_edit.png')no-repeat;cursor:pointer" value="" title="Borrar todo el texto del comentario"/>
<input type="submit" name="" id="" style="font-size:.8em;border:0px;background:#fff url('iconos/16x16/comment.png') no-repeat;cursor:pointer" value="" title="Publicar este comentario en el foro" />
</div>
<textarea id="texto{$hijo->id}" name="texto" cols="76%" rows="4" style="margin-top:5px;border:0px solid #e4e4e4;padding:10px;background:#eee"></textarea>
</form>
</div>
{/foreach}
{else}
No hay comentarios a esta entrada.
{/if}
