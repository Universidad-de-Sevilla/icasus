<div class="flat_area grid_16">
	<h2>Datos del usuario</h2>
</div>

<div class="box grid_16">
	<div class="toggle_container">
		<div class="block">
			<fieldset class="label_side">
				<label>Nombre</label>
				<div class="clearfix">
						<span>{$persona->nombre}</span>
				</div>
			</fieldset>	
			<fieldset class="label_side">
				<label>Apellidos</label>
				<div class="clearfix">
						<span>{$persona->apellidos}</span>
				</div>
			</fieldset>	
			<fieldset class="label_side">
				<label>Login</label>
				<div class="clearfix">
						<span>{$persona->login}</span>
				</div>
			</fieldset>	
			<fieldset class="label_side">
				<label>Correo</label>
				<div class="clearfix">
						<span>{$persona->correo}</span>
				</div>
			</fieldset>	
			<fieldset class="label_side">
				<label>Tel&eacute;fono</label>
				<div class="clearfix">
						<span>{$persona->telefono}</span>
				</div>
			</fieldset>	
			<fieldset class="label_side">
				<label>Unidad de destino</label>
				<div class="clearfix">
						<span>{$persona->unidad_hominis}</span>
				</div>
			</fieldset>	
			<fieldset class="label_side">
				<label>Pueto de trabajo</label>
				<div class="clearfix">
						<span>{$persona->puesto}</span>
				</div>
			</fieldset>	
		</div>
	</div>
</div>			

<div class="flat_area grid_16">
	<h2>Unidades asignadas</h2>
</div>

<div class="box grid_16">
	<div class="block">	
		<table class="static"> 
			<thead>
				<th>Unidad</th><th>Rol</th>
			</thead>
			<tbody>
				{foreach $persona->entidades as $usuario_entidad}
			    <tr><td><a href="index.php?page=entidad_datos&id_entidad={$usuario_entidad->id_entidad}">{$usuario_entidad->entidad->nombre}</a></td> <td>{$usuario_entidad->rol->nombre}</td></tr>
				{/foreach}
			</tbody>
		</table>
	</div>
</div>	