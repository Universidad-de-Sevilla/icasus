<div class="flat_area grid_16">
	<h2><img src='/icons/ff32/cog_edit.png' alt='icono engranaje'> Editando Proceso</h2>
</div>
<div class="box grid_16">
	<div class="toggle_container">
		<div class="block">
		
			<form method='post' action='index.php?page=proceso_editar' id='formproceso' class='datos'>
			  <input type='hidden' name='id_entidad' id='id_entidad' value='{$proceso->id_entidad}' />
			  <input type='hidden' name='id_proceso' id='id_proceso' value='{$proceso->id}' />
			          
			  <fieldset class="label_side">
				<label>Proceso madre</label>
				<div>
					<select name='madre' id='madre'>
					  <option value="0">Es un Proceso Madre</option>
					  {foreach from=$procesos_madre item=proceso_madre}
					    <option value="{$proceso_madre->id}" {if $proceso_madre->id == $proceso->id_madre} selected{/if}>
					    {$proceso_madre->codigo} - {$proceso_madre->nombre} 
					    </option>
					  {/foreach} 
					 </select>
					<div class="required_tag tooltip hover left" title="Campo requerido"></div>
				</div>
			  </fieldset>  
			  <fieldset class="label_side">
				<label>C&oacute;digo</label>
				<div>
					<input type='text' name='codigo' id='codigo' value='{$proceso->codigo}' />
					<div class="required_tag tooltip hover left" title="Campo requerido"></div>
				</div>
			  </fieldset> 
			  <fieldset class="label_side">
				<label>Revisi&oacute;n</label>
				<div>
					<input type='text' name='revision' id='revision' value='{$proceso->revision}' />					
					<div class="required_tag tooltip hover left" title="Campo requerido"></div>
				</div>
			  </fieldset>  
			  <fieldset class="label_side">
				<label>Fecha</label>
				<div>
					<input type='text' name='fecha_revision' id='fecha_revision' value="{$proceso->fecha_revision|date_format:"%d/%m/%Y"}" />
					<div class="required_tag tooltip hover left" title="Campo requerido"></div>
				</div>
			  </fieldset>  
			  <fieldset class="label_side">
				<label>Nombre proceso</label>
				<div>
					<input type='text' name='nombre' id='nombre' value='{$proceso->nombre}' />
					<div class="required_tag tooltip hover left" title="Campo requerido"></div>
				</div>
			  </fieldset> 
			  <fieldset class="label_side">
				<label>Propietario</label>
				<div>
					<select name="id_propietario" id="id_propietario">
			        {foreach from=$usuarios_entidad item=usuario_entidad}
			          <option value='{$usuario_entidad->usuario->id}' 
			          {if $proceso->id_propietario == $usuario_entidad->usuario->id}selected{/if}>{$usuario_entidad->usuario->nombre} {$usuario_entidad->usuario->apellidos} {if $usuario_entidad->usuario->puesto} - {$usuario_entidad->usuario->puesto} {/if}
			          </option>
			        {/foreach}              
			        </select>
				</div>
			  </fieldset> 
			  <fieldset class="label_side">
				<label>Misi&oacute;n</label>
				<div>
					<textarea rows="2" name='mision' id='mision'>{$proceso->mision}</textarea>
				</div>
			  </fieldset>   
			  <fieldset class="label_side">
				<label>Equipo de proceso</label>
				<div>
					<textarea name='equipo_de_proceso' id='equipo_de_proceso'>{$proceso->equipo_de_proceso}</textarea>
				</div>
			  </fieldset>      
			  <fieldset class="label_side">
				<label>Resultados clave</label>
				<div>
					<textarea name='resultados_clave' id='resultados_clave'>{$proceso->resultados_clave}</textarea>
				</div>
			  </fieldset>  
			  <fieldset class="label_side">
				<label>Entradas</label>
				<div>
					<textarea name='entradas' id='entradas'>{$proceso->entradas}</textarea>
				</div>
			  </fieldset>  
			  <fieldset class="label_side">
				<label>Proveedores</label>
				<div>
					<textarea name='proveedores' id='proveedores'>{$proceso->proveedores}</textarea>
				</div>
			  </fieldset>   
			  <fieldset class="label_side">
				<label>Salidas</label>
				<div>
					<textarea name='salidas' id='salidas'>{$proceso->salidas}</textarea>
				</div>
			  </fieldset>  
			  <fieldset class="label_side">
				<label>Clientes</label>
				<div>
					<textarea name='clientes' id='clientes'>{$proceso->clientes}</textarea>
				</div>
			  </fieldset>
			  <fieldset class="label_side">
				<label>Actividades</label>
				<div>
					<textarea name='actividades' id='actividades'>{$proceso->actividades}</textarea>
			    </div>
			  </fieldset> 
			  <fieldset class="label_side">
				<label>Documentaci&oacute;n</label>
				<div>
					<input type='text' name='documentacion' id='documentacion' value='{$proceso->documentacion}' />
			    </div>
			  </fieldset>
			  <fieldset class="label_side">
				<label>Mediciones</label>
				<div>
					<textarea name='mediciones' id='mediciones'>{$proceso->mediciones}</textarea>
			    </div>
			  </fieldset>   
			  <fieldset class="label_side">
				<label>Registros</label>
				<div>
					<textarea name='registros' id='registros'>{$proceso->registros}</textarea>
			    </div>
			  </fieldset>    
			  <fieldset class="label_side">
				<label>Tipo de proceso</label>
				<div>
					<select name="alcance" id="alcance">
					    <option value="Indefinido" {if $proceso->alcance == 'Indefinido'} selected {/if} >Indefinido ...</option>
					    <option value="Apoyo" {if $proceso->alcance == 'Apoyo'} selected {/if}>Apoyo</option>
					    <option value="Operativo" {if $proceso->alcance == 'Operativo'} selected {/if}>Operativo</option>
					    <option value="Directivo/Gestion" {if $proceso->alcance == 'Directivo/Gestion'} selected {/if}>Directivo/Gestión</option>
					</select> 	
				</div>
			  </fieldset> 
			  <fieldset class="label_side">
				<div>
					<input type='submit' class='btn' value='Grabar' name='proceso_submit' />
				</div>
			  </fieldset>      
			</form>
		</div>
	</div>
</div>
