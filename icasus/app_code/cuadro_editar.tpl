<div class="box grid_16">
	<div class="toggle_container">
		<div class="block">
			<form action="index.php?page=cuadro_grabar" method="post" id="formcuadro" name="formcuadro" class="validate_form">
		    <input type="hidden" name="id" value="{$cuadro->id}" />

				<fieldset class="label_side">
					<label>Nombre cuadro de mandos</label>
					<div>
            <input name="nombre"class="required" type="text" value="{$cuadro->nombre}">
            <div class="required_tag tooltip hover left" title="Campo requerido"></div>
          </div>
				</fieldset>

				<fieldset class="label_side">
					<label>Comentarios</label>
					<div><textarea  class="inp" name="comentarios">{$cuadro->comentarios}</textarea></div>
				</fieldset>

				<fieldset class="label_side">
					<label>Visibilidad</label>
          <div>
            <label class="radio">
              <input type="radio" name="privado" id="privado1" value="0" {if $cuadro->privado == 0}checked{/if}>
              Público
            </label>
            <label class="radio">
              <input type="radio" name="privado" id="privado2" value="1" {if $cuadro->privado == 1}checked{/if}>
              Privado
            </label>
          </div>
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
