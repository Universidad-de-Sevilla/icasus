<h3>Notas de {$_operario.nombre} {$_operario.apellidos}</h3>
{if $smarty.get.aviso}<p class='aviso'>{$smarty.get.aviso}</p>{/if}
{if $smarty.get.error}<p class='error'>{$smarty.get.error}</p>{/if}

<form id="grabar" name="grabar" action="index.php?page=nota_grabar" METHOD="POST" >

<textarea id="notas" name="notas" rows="20" cols="75%" style="border:0;padding:10px;" readonly="readonly">{$notas}</textarea>
<br/ >
<input type="button" id="imgEdit" name="imgEdit" value="Editar" onclick="
  document.forms[0].notas.readOnly = false;
  document.forms[0].notas.style.backgroundColor='#eee';
  document.forms[0].notas.style.border='1px solid #666'; 
  document.getElementById('imgEdit').style.display='none';
  document.getElementById('imgSave').style.display='inline';
  document.getElementById('notas').focus();
" />
<input type="submit" id="imgSave" name="imagSave" value="Grabar nota" style="display:none" / >
</form>
