<form id="grabar" name="grabar" action="index.php?page=nota_grabar" METHOD="POST" >
	<div class="toggle_container">
		<fieldset>
			<div class="clearfix">
				<textarea id="notas" name="notas" rows="20" cols="75%" title="Introduce texto" class="tooltip autogrow" placeholder="Introduce texto">{$_usuario->mis_notas}</textarea>
				<div class="required_tag tooltip hover left" title="Campo requerido"></div>
			</div>
		</fieldset>
		<fieldset>
			<div class="clearfix">
				<input type="button" id="imgEdit" name="imgEdit" value="Editar" onclick="
				  document.forms[0].notas.readOnly = false;
				  document.forms[0].notas.style.backgroundColor='#eee';
				  document.forms[0].notas.style.border='1px solid #666'; 
				  document.getElementById('imgEdit').style.display='none';
				  document.getElementById('imgSave').style.display='inline';
				  document.getElementById('notas').focus();
				" />
			</div>
		</fieldset>
		<fieldset>
			<div class="clearfix">
				<input type="submit" id="imgSave" name="imagSave" value="Grabar nota" style="display:none" / >
			</div>
		</fieldset>
	</div>
</form>	
