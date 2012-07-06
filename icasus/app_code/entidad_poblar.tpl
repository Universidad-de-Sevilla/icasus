{if $usuarios}
  <div class="box grid_16">
    <div class="block"> 
      <table class='static'>
        <thead>
          <tr><th>Rol</th><th>Nombre</th><th>Apellidos</th><th>Correo</th><th>Teléfono</th><th>Acciones</th></tr>
        </thead>
        <tbody>
        {foreach from=$usuarios item=usuario}
          <tr>
            <td>{$usuario->rol->nombre}</td>
            <td>{$usuario->usuario->nombre}</td>
            <td>{$usuario->usuario->apellidos}</td>
            <td><a href='mailto:{$usuario->usuario->correo}'>{$usuario->usuario->correo}</a></td>
            <td>{$usuario->usuario->telefono}</td>
            <td><a href='index.php?page=usuario_mostrar&id_usuario={$usuario->usuario->id}&id_entidad={$entidad->id}'>Detalle</a></td>
          </tr>
         {/foreach}
        </tbody>
      </table>
    </div>
  </div>  
{else}
<p class='aviso'>No se han vinculado usuarios a esta entidad</p>
{/if}

      <form action='index.php?page=entidad_poblar' method='post' name='formpoblar' class='validate_form'>     
        <input type='hidden' name='id_entidad' value='{$entidad->id}' />
        <!--<p><input type='submit' name='enviar' value='Asignar usuarios' /></p>-->

        <div class="box grid_16">         
	<div class="toggle_container">  
		<div class="block">
			<fieldset>
				<label>Usuarios disponibles</label>
				<div>
						<a href="#" class="grabber"></a>
						<a href="#" class="toggle"></a>
						<div id="dt1" class="no_margin">
								<table class="display datatable">
									<thead>
										<tr><th></th><th>Nombre</th><th>Apellidos</th><th>Correo</th><th>Unidad RPT</th><th>Puesto</th></tr>
									</thead>
									<tbody>
									{foreach from=$personas item=persona}
										<tr>
											<td><input type='checkbox' name='id_usuario[]' value='{$persona.id}' class=":e"/></td>
											<td>{$persona.nombre|upper}</td>
											<td>{$persona.apellidos|upper}</td>
											<td>{$persona.correo}</td>
											<td>{$persona.unidad_hominis}</td>
											<td>{$persona.puesto}</td>
										</tr>
									{/foreach}
									</tbody>
								</table>
						</div>
				</div>
			</fieldset>
			<fieldset>
          <label>Rol</label>
          <div> 
            <select name='id_rol' id='id_rol' class="required">
              <option value="">Seleccionar uno ...</option>
            {foreach from=$roles item='rol'}
              <option value="{$rol->id}">{$rol->nombre}</option>
            {/foreach }
            </select>
						<div class="required_tag"></div>
          </div>
      </fieldset>

			<div class="button_bar clearfix">
          <button class="green" type="button" value="Asignar usuarios" name="enviar" onclick="location.reload();">
            <span>Asignar usuarios</span>
          </button>
      </div>  
      </form>
    </div>
  </div>
</div>
