<div class="flat_area grid_16">
	<h2>Datos del indicador: {$indicador->nombre}</h2>
</div>

<div class="box grid_16">
	<div class="toggle_container">
		<div class="block">
			<h2 class="section">
				<a href='index.php?page=medicion_listar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><img 
					src='/icons/ff16/chart_curve.png' /> Mostrar mediciones</a> &nbsp;
				<a href='index.php?page=indicador_listar&id_entidad={$indicador->id_entidad}'><img 
					src='/icons/ff16/chart_curve.png' /> Listar todos</a> &nbsp;
				<a href='index.php?page=indicador_editar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><img 
					src='/icons/ff16/chart_curve_edit.png'  /> Editar</a> &nbsp; 
				<a href='index.php?page=indicador_crear&id_entidad={$indicador->id_entidad}'><img 
					src='/icons/ff16/chart_curve_add.png'  /> Crear</a> &nbsp; 
				<a
				href='index.php?page=indicador_borrar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}' onClick='return confirmar();'><img 
					src='/icons/ff16/chart_curve_delete.png'  /> Borrar</a> &nbsp; 
				<a href='index.php?page=indicador_datos_rtf&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}' title='Generar un informe en word de este indicador'>
				<img src='/icons/ff16/page_word.png'  /> Rtf</a> &nbsp;
				<a href='index.php?page=indicador_datos_excel&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}' title='Exportar los datos del indicador a Excel'>
				<img src='/icons/ff16/page_excel.png'  /> Excel</a>
								
			</h2>
		</div>
	</div>	
</div>	

<div class="box grid_16">
	<div class="toggle_container">
		<div class="block">
			<fieldset class="label_side">
				<label>C&oacute;digo proceso</label>
				<div class="clearfix">
					<span>Proceso</span>
				</div>
			</fieldset>
			<fieldset class="label_side">
				<label><a href='index.php?page=proceso_mostrar&codigo={$indicador->proceso->codigo}' title='Mostrar 
				proceso'>{$indicador->proceso->codigo}</a></label>
				<div class="clearfix">
					<span>{$indicador->proceso->nombre}</span>
				</div>
			</fieldset>	
			<fieldset class="label_side">
				<label>Código indicador</label>
				<div class="clearfix">
					<span>Nombre</span>
				</div>
			</fieldset>
			<fieldset class="label_side">
				<label>{$indicador->codigo}</label>
				<div class="clearfix">
					<span>{$indicador->nombre}</span>
				</div>
			</fieldset>
			<fieldset class="label_side">
				<label>Descripci&oacute;n</label>
				<div class="clearfix">
					<span>{$indicador->descripcion}</span>
				</div>
			</fieldset>
			<fieldset class="label_side">
				<label>Formulaci&oacute;n</label>
				<div class="clearfix">
					<span>{$indicador->formulacion}</span>
				</div>
			</fieldset>
			<fieldset class="label_side">
				<label>Objetivo</label>
				<div class="clearfix">
					<span>Objetivo pactado</span>
				</div>
			</fieldset>
			<fieldset class="label_side">
				<label>Objetivo carta</label>
				<div class="clearfix">
					<span>Estándar actual</span>
				</div>
			</fieldset>
			<fieldset class="label_side">
				<label>Objetivo carta</label>
				<div class="clearfix">
					<span>Estándar actual</span>
				</div>
			</fieldset>
			<!-- 
			<tr>
				<td>{$indicador->objetivo}</td>
				<td colspan='2'>{$indicador->objetivo_estrategico}</td>
				<td>{$indicador->objetivo_carta}</td>
				<td colspan='2'>{*$indicador->estandar*}</td>
			</tr>
			
			<tr>
				<th colspan='3'>Fuente de obtenci&oacute;n</th>
				<th>Periodicidad</th>
				<th colspan='2'>Visibilidad</th>
			</tr>
			<tr>
				<td colspan='3'>{$indicador->fuente}</td>	
				<td>{$indicador->periodicidad}</td>	
				<td colspan='2'>{$indicador->visibilidad->nombre|htmlentities}</td>
			</tr>	
			<tr><th colspan='6'>Responsable</tr>
			<tr><td colspan='6'><a href='index.php?page=usuario_datos&id_usuario={$indicador->responsable->id}'>{$indicador->responsable->nombre}
			{$indicador->responsable->apellidos}</a></td></tr>
		</table>
		 -->
		</div>
	</div>
</div>
<div class="flat_area grid_16">
	<h2>Mediciones</h2>
</div>
<div class="box grid_16">
	<div class="toggle_container">
		<div class="block">
			<h2 class="section">
				<a href='index.php?page=medicion_listar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><img 
			    src='/icons/ff16/time.png' /> Mostrar Mediciones</a>						
			</h2>
		</div>
	</div>	
</div>	
    
	
  <p><img src="index.php?page=grafica_indicador_agregado&id_indicador={$indicador->id}" alt="gráfica completa con los valores medios del indicador" />
