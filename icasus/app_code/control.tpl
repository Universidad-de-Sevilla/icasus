{if $modulo == 'inicio'}
<div style="opacity: 1;" class="box grid_16 no_titlebar">
	<div class="toggle_container">
		<div style="opacity: 1;" class="block">
			<form>
			  <fieldset class="label_side">
				<label>Fecha</label>
				<div>
					{html_select_date id="Year" prefix="" class="required" year_empty="Seleccinar un año ..."
					display_months=FALSE display_days=FALSE start_year=($smarty.now|date_format:"%Y")-10
					end_year=$smarty.now|date_format:"%Y"}
					<div class="required_tag"></div>
				</div>
			  </fieldset> 
			</form>
		</div>
	</div>
</div>
<div class="box grid_16 single_datatable">
	<div id="dt1" class="no_margin">
		<table class="display datatable"> 
			<thead>
				<tr><th>Unidad</th><th>Indicador</th><th>Fecha</th><th>Valor</th></tr>
			</thead>
			<tbody>
				{foreach from=$valores item=valor}
				<tr><td>{$valor.unidad}</td><td>{$valor.indicador}</td><td>{$valor.fecha}</td><td>{if $valor.valor == NULL}NULL{/if}</td></tr>
				{/foreach}
			</tbody>	
		</table>
	</div><!-- #dt1 .no_margin -->
</div><!-- .box grid16 single_datatable -->	
	{literal}
	<script>
		var id_entidad = {/literal}{$id_entidad}{literal};
		$('#Year').on('change',function(){
			var fecha = $('#Year').val();
			$.ajax({
				url: "index.php?page=control&ajax=true&modulo=filtrOnlyear&id_entidad="+id_entidad+"&fecha="+fecha,
        success: function(datos){$("#dt1").html(datos);}
      });
		});
	</script>
	{/literal}
{/if}

{if $modulo == 'filtrOnlyear'}
		<script src="theme/danpin/scripts/DataTables/jquery.dataTables.js" type="text/javascript"></script><script src="theme/danpin/scripts/adminica/adminica_datatables.js" type="text/javascript"></script>
		<table class="display datatable"> 
			<thead>
				<tr><th>Unidad</th><th>Indicador</th><th>Fecha</th><th>Valor</th></tr>
			</thead>
			<tbody>
				{foreach from=$valores item=valor}
				<tr><td>{$valor.unidad}</td><td>{$valor.indicador}</td><td>{$valor.fecha}</td><td>{if $valor.valor == NULL}NULL{/if}</td></tr>
				{/foreach}
			</tbody>	
		</table>
{/if}
