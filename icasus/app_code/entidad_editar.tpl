<h3>Editando unidad</h3>
<div class="box grid_16">
  <div class="toggle_container">
	   <div class="block">
				<form method='post' action='index.php?page=entidad_editar' name='formentidad' id='formentidad' class="datos">
				 
				 <fieldset class="label_side">
					<label>Nombre</label>
					<div>
						<input type='hidden' name='id_entidad' id='id_entidad' value='{$entidad->id}' />
					</div>
					</fieldset> 
				 
				<fieldset class="label_side">
					<label>Nombre unidad</label>
					<div>
						<input type='text' name='nombre' id='nombre' value='{$entidad->nombre}' /></p>
					</div>
				</fieldset> 
				 
				<fieldset class="label_side">
					<label>Código</label>
						<div>
							<input type='text' name='codigo' id='codigo' class='' value='{$entidad->codigo}' /></p>
						</div>
				</fieldset> 
				 
				 <fieldset class="label_side">
					<label>Unidad superior</label>
					<div>
						<select name='id_padre' id='id_padre' class=''>
						{foreach from=$entidades item=padre}
							<option value='{$padre->id_entidad}' {if $entidad->id_madre == $padre->id_entidad}selected{/if}>{$padre->nombre}</option>
						{/foreach}
						</select>
					</div>
				</fieldset> 
				
				<fieldset class="label_side">
					<label>Página web</label>
					<div>
						<input type='text' name='web' id='web' class="" value='{$entidad->web}' /></p>
					</div>
				</fieldset> 

				<div class="button_bar clearfix">
					<button class="green" type="submit" value="Grabar" name="entidad_submit">
						<span>Grabar</span>
					</button>
			  </div>
			</form>
		</div>
	</div>
</div>
