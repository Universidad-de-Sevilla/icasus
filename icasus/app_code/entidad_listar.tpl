
	{if is_array($grupos_usuario)}
		<div class="flat_area grid_16">
			<h2>Equipos de Trabajo del usuario</h2>
		</div>
		<div class="box grid_16">
			<div class="block">	
				  <table class="static">
				      <thead><tr><th>C&oacute;digo</th><th>Equipo</th><th colspan="4">Acciones</th></tr></thead>
				      <tbody>
						  {foreach from=$grupos_usuario item=grupo}
						     <tr>
						      <td>{$grupo.codigo}</td>
						      <td>{$grupo.nombre}</td>
						      <td>  
						        {if $grupo.rol =='secretario'}
						          <a href='index.php?page=grupo/grupo_datos&id_entidad={$grupo.id}' title="Ver y editar detalles del equipo">Editar</a> 
						        {else}
						          <a href='index.php?page=grupo/grupo_ver&id_entidad={$grupo.id}' title="Ver equipo">Ver</a>
						        {/if}
						     </td>		
						     <td><a href='index.php?page=indicador_listar&id_entidad={$grupo.id}'>Indicadores</a> </td>
						     <td><a href="index.php?page=plan_estrategico/plan_listar&id_entidad={$grupo.id}&entidad={$grupo.nombre|htmlentities}">Planificaci&oacute;n</a></td> 
						     <td><a href='index.php?page=grupo/acta_listar&id_entidad={$grupo.id}' title="Ver las actas de este equipo">Actas</a></td>
						     </tr>
						  {/foreach}
					  </tbody>
				  </table>
			</div>
		</div>		
	{/if}


	{if $entidades_usuario }
		<div class="flat_area grid_16">
			<h2>Unidades del usuario</h2>
		</div>
		<div class="box grid_16">
			<div class="block">	
			  <table class="static">
			      <thead><tr><th>C&oacute;digo</th><th>Unidad</th><th>Acciones</th></tr></thead>
			      <tbody>
			      {foreach from=$entidades_usuario item=entidad}
			         <tr>
			          <td>{$entidad->entidad->codigo}</td>
			          <td>{$entidad->entidad->nombre}</td>
			          <td>
			          <a href='index.php?page=entidad_datos&id_entidad={$entidad->entidad->id}'>Ver</a> - 
			          <a href='index.php?page=indicador_listar&id_entidad={$entidad->entidad->id}'>Indicadores</a> - 
			          <a href='index.php?page=proceso_listar&id_entidad={$entidad->entidad->id}'> Procesos</a> 
			          <!--
			          <a href="index.php?page=plan_estrategico/plan_listar&id_entidad={$entidad->entidad->id}&entidad={$entidad->entidad->nombre|htmlentities}">Planificaci&oacute;n</a> -
			          <a href='index.php?page=grupo/acta_listar&id_entidad={$entidad->entidad->id}' title="Ver las actas de este equipo">Actas</a> 
			          -->
			        </td>
			        </tr>
			      {/foreach}
			  </tbody></table>
		  </div>
		</div>
	{else}
		  <p class='aviso'>No tiene asignada ninguna unidad</p>
	{/if}
	
	<div class="flat_area grid_16">
		<h2>Buscar unidades</h2>
	</div>
	<div class="box grid_16">
		<div class="block">	
			<form action='index.php?page=entidad_listar' method="post" class="mini" name="formlogin">
			<input name='id_entidad' type='hidden' value='{$entidad->id}'/>
			<label for='criterio'>B&uacute;squeda:</label> 
			<input name='criterio' type='text' class='inp' value='{if isset($criterio)}{$criterio}{/if}'/>
			</form>
		</div>
	</div>		
	{if isset($entidades)}
		<div class="box grid_16">
			<div class="block">	
				  <table class="static">
				    <thead><tr><th>C&oacute;digo</th><th>Entidad</th><th colspan='2'>Acciones</th></tr></thead>
				    <tbody>
				    {foreach from=$entidades item=entidad}
				       <tr class="gradeX">
				        <td>{$entidad->codigo}</td>
				        <td>{$entidad->nombre}</td>
				        <td>
				        <a href='index.php?page=entidad_datos&id_entidad={$entidad->id}'>Ver</a> - <a href='index.php?page=indicador_listar&id_entidad={$entidad->id}'>Indicadores</a></td>
				       </tr>
				    {/foreach}
				    </tbody>
				  </table>
			</div>
		</div>		  
	{/if}