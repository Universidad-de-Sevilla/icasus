<div class="box grid_16">
	<div class="toggle_container">
		<div class="block">
			<h2>{$indicador->codigo} - {$indicador->nombre}</h2>
			<form name="medicion" id="medicion" action="index.php?page=medicion_grabar" method="post" class="validate_form">
				<input type="hidden" name="id_indicador" value="{$indicador->id}" />
				<input type="hidden" name="tipo" value="{$tipo}" />
				<fieldset>
					<label>Etiqueta</label>
					<div>
						<input type="input" name="etiqueta"class="text required" /></p>
						<div class="required_tag"></div>
					</div>
				</fieldset>
        
				<div class="columns clearfix">
					<div class="col_25">
							<fieldset >
								<label>Inicio del periodo</label>
								<div>
									{html_select_date field_order='DMY' start_year="-10"  end_year="+5" time=$smarty.now  prefix="pi" month_format='%m'}
								</div>
							</fieldset>
					</div>
					<div class="col_25">
							<fieldset >
								<label>Fin del periodo</label>
								<div>
									{html_select_date field_order='DMY' start_year="-10" end_year="+5" time=$smarty.now  prefix="pf" month_format='%m'}
								</div>
							</fieldset>
					</div>
					<div class="col_25">
						<fieldset >
							<label>Inicio de grabación</label>
							<div>
								{html_select_date field_order='DMY' start_year="-10"  end_year="+5" time=$smarty.now prefix="gi" month_format='%m'}
							</div>
						</fieldset>
					</div>
					<div class="col_25">
					<fieldset >
							<label>Fin de grabación</label>
							<div>
								{html_select_date field_order='DMY' start_year="-10" end_year="+5" time=$smarty.now prefix="gf" month_format='%m'}
							</div>
						</fieldset>
					</div>
				</div>
        {if $tipo == "indicador"}
				<fieldset >
					{if $valores_referencia}
            <label><h2>Valores de Referencia</h2></label>
              {foreach $valores_referencia as $valor_referencia}
                <label>{$valor_referencia->etiqueta}</label>
                <div>
                <input type="input" name="valor_referencia[{$valor_referencia->id}]" class="text required"/>
                </div>
              {/foreach}
            {else}
              <p>No se han definido valores de referencia para este indicador</p>
            {/if}
          </fieldset>
        {/if}
				<div class="button_bar clearfix">
				<button class="green" type="submit" value="Grabar" name="proceso_submit">
					<span>Grabar</span>
				</button>
				</div>
			</form>
    </div>
	</div>
</div>
