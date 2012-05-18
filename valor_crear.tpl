{if $aviso}<p class='aviso'>{$aviso}</p>{/if}
{if $error}<p class='error'>{$error}</p>{/if}
<h3>Indicador: {$indicador->nombre}</h3>
<p><a
href='index.php?page=indicador_datos&id_indicador={$indicador->id_indicador}&id_entidad={$indicador->id_entidad}'><img 
	src='iconos/16x16/chart_curve.png' /> Volver al indicador</a></p> 
<h3><img src='iconos/32x32/tag_blue_add.png' />Agregar valor</h3>
<form method='post' action='index.php?page=valor_grabar' id='formvalor' name='formvalor' class='datos'>
	<input type='hidden' name='id_indicador' id='id_indicador' value='{$indicador->id_indicador}' /> 
	<input type='hidden' name='id_entidad' id='id_entidad' value='{$indicador->id_entidad}' /> 

	<p><label for='calculo'>Cálculo </label><br />
	<span class='grey'>{$indicador->formulacion}</span><br />
	<input type='text' name='calculo' id='calculo' class='inp' 
	value='{$valor->calculo}' onchange='calcular()' /></p>

	<p><label for='dato_valor'>Valor </label> &nbsp; <span class='grey'>(requerido)</span></p>
	<p><input type='text' name='dato_valor' id='dato_valor' class='inp' value='' /></p>

	<p><label for='periodo'>Periodo</label> &nbsp;<span class='grey'></span></p>
	<p>{html_select_date field_order='MY' month_format='%m' start_year='-9'}</p>

	<p><label for='objetivo'>Objetivo </label> &nbsp; <span class='grey'>(requerido)</span></p>
	<p><input type='text' name='objetivo' id='objetivo' class='inp' value='{$indicador->objetivo}' /></p>
	
	<p><label for='objetivo'>Objetivo Pactado</label></p>
	<p><input type='text' name='objetivo_estrategico' id='objetivo_estrategico' class='inp' 
	value='{$indicador->objetivo_estrategico}' /></p>
	
	<p><label for='objetivo_carta'>Objetivo Carta de Servicio</label></p>
	<p><input type='text' name='objetivo_carta' id='objetivo_carta' class='inp' 
	value='{$indicador->objetivo_carta}' /></p>
	
	<p><label for='observaciones'>Observaciones</label></p>
	<p><textarea name='observaciones' id='observaciones' class='inp'></textarea></p>
	
	<p><input type='button' class='submit-btn' value='Enviar' name='indicador_submit'
		onclick='javascript:valor_validar();' /></p>
</form>
