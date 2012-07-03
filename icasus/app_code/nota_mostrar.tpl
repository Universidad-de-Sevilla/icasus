<div><h1 style="color: #999999; font-weight: normal;">ICASUS - APLICACIÓN WEB PARA LA GESTIÓN DE CALIDAD DE LOS SERVICIOS DE LA UNIVERSIDAD DE SEVILLA</h1>
<h2>Título de p&aacute;gina</h2>
</div>
<h3>Notas personales</h3>

<form id="grabar" name="grabar" action="index.php?page=nota_grabar" METHOD="POST" >

<textarea id="notas" name="notas" rows="20" cols="75%" style="border:0;padding:10px;" readonly="readonly">{$_usuario->mis_notas}</textarea>
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
