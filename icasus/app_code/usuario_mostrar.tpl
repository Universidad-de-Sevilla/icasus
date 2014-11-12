<div class="flat_area grid_16">
	<h2>{$smarty.const.TXT_USER_DAT}</h2>
</div>

<div class="box grid_16">
	<div class="toggle_container">
		<div class="block">
			<fieldset class="label_side">
				<label>{$smarty.const.FIELD_NAME}</label>
				<div class="clearfix">
						<span>{$persona->nombre}</span>
				</div>
			</fieldset>	
			<fieldset class="label_side">
				<label>{$smarty.const.FIELD_APEL}</label>
				<div class="clearfix">
						<span>{$persona->apellidos}</span>
				</div>
			</fieldset>	
			<fieldset class="label_side">
				<label>{$smarty.const.FIELD_LOGIN}</label>
				<div class="clearfix">
						<span>{$persona->login}</span>
				</div>
			</fieldset>	
			<fieldset class="label_side">
				<label>{$smarty.const.FIELD_CORREO}</label>
				<div class="clearfix">
						<span>{$persona->correo}</span>
				</div>
			</fieldset>	
			<fieldset class="label_side">
				<label>{$smarty.const.FIELD_TEL}</label>
				<div class="clearfix">
						<span>{$persona->telefono}</span>
				</div>
			</fieldset>	
			<fieldset class="label_side">
				<label>{$smarty.const.FIELD_UNID_DEST}</label>
				<div class="clearfix">
						<span>{$persona->unidad_hominis}</span>
				</div>
			</fieldset>	
			<fieldset class="label_side">
				<label>{$smarty.const.FIELD_PUESTO}</label>
				<div class="clearfix">
						<span>{$persona->puesto}</span>
				</div>
			</fieldset>	
		</div>
	</div>
</div>			

<div class="flat_area grid_16">
	<h2>{$smarty.const.TXT_USER_UNIDS}</h2>
</div>

<div class="box grid_16">
	<div class="block">	
    {if $persona->entidades}
      <table class="static"> 
        <thead>
          <th>{$smarty.const.TXT_UNID}</th><th>{$smarty.const.FIELD_ROL}</th>
        </thead>
        <tbody>
          {foreach $persona->entidades as $usuario_entidad}
            <tr><td><a href="index.php?page=entidad_datos&id_entidad={$usuario_entidad->id_entidad}">{$usuario_entidad->entidad->nombre}</a></td> <td>{$usuario_entidad->rol->nombre}</td></tr>
          {/foreach}
        </tbody>
      </table>
    {else}
      <div class="alert alert_blue">{$smarty.const.MSG_UNID_NO_ASIG}</div>
    {/if}
	</div>
</div>	
