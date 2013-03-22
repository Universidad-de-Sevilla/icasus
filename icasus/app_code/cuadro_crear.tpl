<div class="box grid_16">
	<div class="toggle_container">
		<div class="block">
			<form action='index.php?page=cuadro_grabar' method='post' id='formcuadro' name='formcuadro' class='validate_form'>
				<fieldset class="label_side">
					<label>Nombre cuadro de mandor</label>
					<div><input name='nombre'class="required" type="text" /><div class="required_tag tooltip hover left" title="Campo requerido"></div></div>
				</fieldset>
				<fieldset class="label_side">
					<label>Comentarios</label>
					<div><textarea  class='inp' name='comentarios'></textarea></div>
				</fieldset>
				<fieldset class="label_side">
					<label>Indicadores seleccionados</label>
					<div>&nbsp;</div>
				</fieldset>
				<fieldset class="label_side">
					<label>Unidades del usuario</label>
					<div>
						<div class="box grid_12">
							<ul class="block content_accordion no_rearrange">
							{Foreach from=$entidades item=item}
								<li>
									<a href="#" class="handle"></a>
									<h3 class="bar">{$item->entidad->nombre}</h3>
									<div class="content">
											{foreach from=$item->indicadores_entidad item=item2}
											{$item2->indicador->nombre}<br />
											{/foreach}
									</div>
								</li>
							{/foreach}
							</ul>
						</div>
					</div>
				</fieldset>
				<fieldset class="label_side">
					<label>Indicadores públicos</label>
					<div></div></div>
				</fieldset>
        <div class="button_bar clearfix">
					<button class="green" type="submit" value="Grabar" name="indicador_submit">
					<span>Grabar</span>
					</button>
        </div>
			</form>
		</div>
	</div>
</div>
