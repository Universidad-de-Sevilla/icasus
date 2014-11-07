<div class="flat_area grid_16">
	<h2>{$smarty.const.TXT_NEW_PAGE}</h2>
</div>
<div class="toggle_container">
	
		<form name='formpagina' id='formpagina' action='index.php?page=pagina_crear' class='datos' method='post'>
			<fieldset class="label_side">
				<label>{$smarty.const.FIELD_TITULO}</label>
				<div class="clearfix">
					<input type='text' id='titulo' name='titulo' />
					<div class="required_tag tooltip hover left" title="{$smarty.const.MSG_FIELD_REQ}"></div>
				</div>
			</fieldset>
			<fieldset class="label_side">
				<label>{$smarty.const.FIELD_ALIAS}</label>
				<div class="clearfix">
					<input type='text' id='alias' name='alias' />
					<div class="required_tag tooltip hover left" title="{$smarty.const.MSG_FIELD_REQ}"></div>
				</div>
				
				
			</fieldset>
			<fieldset class="label_side">
				<label>{$smarty.const.FIELD_PAGE_CONTENT}</label>
				<div class="clearfix">
					<textarea name='contenido' class='inp' rows='25'></textarea>
					<div class="required_tag tooltip hover left" title="{$smarty.const.MSG_FIELD_REQ}"></div>
				</div>
			</fieldset>
			<fieldset class="label_side">
				<div class="clearfix">
					<input type='submit' class='submit' name='submit' value='{$smarty.const.TXT_BTN_GUARDAR}' />
				</div>
			</fieldset>
		</form>
	
</div>
