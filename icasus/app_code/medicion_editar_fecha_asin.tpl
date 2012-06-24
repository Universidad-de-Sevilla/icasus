{if $contenedor == 'pi'}
	{html_select_date field_order='DMY' prefix="pi" month_format='%m' start_year="-10" end_year="+2" time=$medicion->periodo_inicio}
	<a href="javascript:void(0)" onclick="javascript:fecha_grabar('{$medicion->id}','pi')"><img title='Grabar' src='https://r2h2.us.es/comun/icons/ff16/disk.png'align="absmiddle"></a>
  <a href="javascript:void(0)" onclick="javascript:fecha_cancelar('pi','{$medicion->id}')"><img title='Cancelar' src='https://r2h2.us.es/comun/icons/ff16/cross.png'align="absmiddle"></a>
{/if}
{if $contenedor == 'pf'}
	{html_select_date field_order='DMY' prefix="pf" month_format='%m' start_year="-10" end_year="+2" time=$medicion->periodo_fin}
	<a href="javascript:void(0)" onclick="javascript:fecha_grabar('{$medicion->id}','pf')"><img title='Grabar' src='https://r2h2.us.es/comun/icons/ff16/disk.png'align="absmiddle"></a>
  <a href="javascript:void(0)" onclick="javascript:fecha_cancelar('pf','{$medicion->id}')"><img title='Cancelar' src='https://r2h2.us.es/comun/icons/ff16/cross.png'align="absmiddle"></a>
{/if}
{if $contenedor == 'gi'}
	{html_select_date field_order='DMY' prefix="gi" month_format='%m' start_year="-10" end_year="+2" time=$medicion->grabacion_inicio}
	<a href="javascript:void(0)" onclick="javascript:fecha_grabar('{$medicion->id}','gi')"><img title='Grabar' src='https://r2h2.us.es/comun/icons/ff16/disk.png'align="absmiddle"></a>
  <a href="javascript:void(0)" onclick="javascript:fecha_cancelar('gi','{$medicion->id}')"><img title='Cancelar' src='https://r2h2.us.es/comun/icons/ff16/cross.png'align="absmiddle"></a>
{/if}
{if $contenedor == 'gf'}
	{html_select_date field_order='DMY' prefix="gf" month_format='%m' start_year="-10" end_year="+2" time=$medicion->grabacion_fin}
	<a href="javascript:void(0)" onclick="javascript:fecha_grabar('{$medicion->id}','gf')"><img title='Grabar' src='https://r2h2.us.es/comun/icons/ff16/disk.png'align="absmiddle"></a>
  <a href="javascript:void(0)" onclick="javascript:fecha_cancelar('gf','{$medicion->id}')"><img title='Cancelar' src='https://r2h2.us.es/comun/icons/ff16/cross.png'align="absmiddle"></a>
{/if}
