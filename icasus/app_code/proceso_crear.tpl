<div class="box grid_16">
	<div class="toggle_container">
		<div class="block">
		
			<form method="post" action="index.php?page=proceso_grabar" id="formproceso" class="validate_form">
			  <input type="hidden" name="id_entidad" id="id_entidad" value="{$entidad->id}" />
			
			  <fieldset class="label_side">
				<label>Proceso madre</label>
				<div>
					<select name="madre" class="required select_box" style="witdh:400px;" >
					  <option value="0">Es un Proceso Madre</option>
					  {foreach from=$procesos_madre item=proceso_madre}
					    <option value="{$proceso_madre->id}">
					    {$proceso_madre->codigo} - {$proceso_madre->nombre}</option>
					  {/foreach} 
					  </select>
					<div class="required_tag"></div>
				</div>
			  </fieldset> 
        <div class="columns clearfix">
          <div class="col_33">
            <fieldset>
              <label>C&oacute;digo</label>
              <div>
                <input type="text" name="codigo" placeholder="Indique un código estándar y único" class="required" />
                <div class="required_tag"></div>
              </div>
            </fieldset> 
          </div>
          <div class="col_33">
            <fieldset>
            <label>Revisi&oacute;n</label>
            <div>
              <input type="text" name="revision" placeholder="Versión actual del proceso"  class="required" />
              <div class="required_tag"></div>
            </div>
            </fieldset>  
          </div>
          <div class="col_33">
            <fieldset>
            <label>Fecha</label>
            <div>
              <input type="text" name="fecha_revision" placeholder="Fecha de la revisión actual" class="required" />
              <div class="required_tag"></div>
            </div>
            </fieldset>  
          </div>
        </div>
			  <fieldset class="label_side">
				<label>Nombre proceso</label>
				<div>
					<input style="width:100%" type="text" name="nombre" id="nombre" class="required" />
					<div class="required_tag"></div>
				</div>
			  </fieldset> 
			  <fieldset class="label_side">
				<label>Propietario</label>
				<div>
					<select name="id_propietario" class="select_box">
			        {foreach from=$usuarios_entidad item=usuario_entidad}
			          <option value="{$usuario_entidad->usuario->id}">{$usuario_entidad->usuario->nombre} {$usuario_entidad->usuario->apellidos} {if $usuario_entidad->usuario->puesto} - {$usuario_entidad->usuario->puesto} {/if}
			          </option>
			        {/foreach}              
			        </select>
				</div>
			  </fieldset> 
			  <fieldset class="label_side">
				<label>Misi&oacute;n</label>
				<div>
					<textarea rows="2" class="required autogrow" name="mision" id="mision"></textarea>
				</div>
			  </fieldset>   
			  <fieldset class="label_side">
				<label>Equipo de proceso</label>
				<div>
					<textarea rows="3" class="inp" name="equipo_de_proceso" id="equipo_de_proceso"></textarea>
				</div>
			  </fieldset>      
			  <fieldset class="label_side">
				<label>Resultados clave</label>
				<div>
					<textarea rows="3" class="inp" name="resultados_clave" id="resultados_clave"></textarea>
				</div>
			  </fieldset>
			  
			  <fieldset class="label_side">
				<label>Entradas</label>
				<div>
					<textarea rows="5" style="width:100%" name="entradas" id="entradas"></textarea>
				</div>
			  </fieldset>  
			  <fieldset class="label_side">
				<label>Proveedores</label>
				<div>
					<textarea name="proveedores" id="proveedores"></textarea>
				</div>
			  </fieldset>   
			  <fieldset class="label_side">
				<label>Salidas</label>
				<div>
					<textarea name="salidas"></textarea>
				</div>
			  </fieldset>  
			  <fieldset class="label_side">
				<label>Clientes</label>
				<div>
					<textarea name="clientes"></textarea>
				</div>
			  </fieldset>
			  <fieldset class="label_side">
				<label>Actividades</label>
				<div>
					<textarea rows="5" class="autogrow" name="actividades" id="actividades"></textarea>
			    </div>
			  </fieldset> 
			  <fieldset class="label_side">
				<label>Documentaci&oacute;n</label>
				<div>
					<input type="text" name="documentacion" id="documentacion"  />
			    </div>
			  </fieldset>
			  <fieldset class="label_side">
				<label>Mediciones</label>
				<div>
					<textarea rows="3" class="autogrow" name="mediciones" id="mediciones"></textarea>
			    </div>
			  </fieldset>   
			  <fieldset class="label_side">
				<label>Registros</label>
				<div>
					<textarea rows="3" class="autogrow" name="registros" id="registros"></textarea>
			    </div>
			  </fieldset>    
			  <fieldset class="label_side">
				<label>Tipo de proceso</label>
				<div>
					<select name="alcance" id="alcance" class="select_box">
					    <option value="Indefinido">Indefinido ...</option>
					    <option value="Apoyo">Apoyo</option>
					    <option value="Operativo">Operativo</option>
					    <option value="Directivo/Gestion">Directivo/Gestión</option>
					  </select>   
				</div>
			  </fieldset> 
			   
			  <div class="button_bar clearfix">
					<button class="green" type="submit" value="Grabar" name="proceso_submit">
						<span>Grabar</span>
					</button>
				</div>    
			</form>
		</div>
	</div>
</div>
