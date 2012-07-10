<div class="flat_area grid_16">
	<h2>Nueva página</h2>
</div>
<div class="toggle_container">
	
		<form name='formpagina' id='formpagina' action='index.php?page=pagina_crear' class='datos' method='post'>
			<fieldset class="label_side">
				<label>Título</label>
				<div class="clearfix">
					<input type='text' id='titulo' name='titulo' />
					<div class="required_tag tooltip hover left" title="Campo requerido"></div>
				</div>
			</fieldset>
			<fieldset class="label_side">
				<label>Alias</label>
				<div class="clearfix">
					<input type='text' id='alias' name='alias' />
					<div class="required_tag tooltip hover left" title="Campo requerido"></div>
				</div>
				
				
			</fieldset>
			<fieldset class="label_side">
				<label>Contenido de la página</label>
				<div class="clearfix">
					<textarea name='contenido' class='inp' rows='25'></textarea>
					<div class="required_tag tooltip hover left" title="Campo requerido"></div>
				</div>
			</fieldset>
			<fieldset class="label_side">
				<div class="clearfix">
					<input type='submit' class='submit' name='submit' value='Guardar' />
				</div>
			</fieldset>
		</form>
	
</div>
