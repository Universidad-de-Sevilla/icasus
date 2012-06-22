{if $contenedor == 'et'}
<a href="javascript:void(0)" onclick="javascript:etiqueta_editar('{$medicion->id}','et','etiqueta')">{if $medicion->etiqueta != NULL}{$medicion->etiqueta}{else}----{/if}</a>
{/if}
{if $contenedor == 'pi'}
<a href="javascript:void(0)" onclick="fecha_editar('{$medicion->id}','pi')">{if $medicion->periodo_inicio != NULL}{$medicion->periodo_inicio|date_format:"%d-%m-%Y"}{else}----{/if}</a>
{/if}
{if $contenedor == 'pf'}
<a href="javascript:void(0)" onclick="fecha_editar('{$medicion->id}','pf')">{if $medicion->periodo_fin != NULL}{$medicion->periodo_fin|date_format:"%d-%m-%Y"}{else}----{/if}</a>
{/if}
{if $contenedor == 'gi'}
<a href="javascript:void(0)" onclick="fecha_editar('{$medicion->id}','gi')">{if $medicion->grabacion_inicio != NULL}{$medicion->grabacion_inicio|date_format:"%d-%m-%Y"}{else}----{/if}</a>
{/if}
{if $contenedor == 'gf'}
<a href="javascript:void(0)" onclick="fecha_editar('{$medicion->id}','gf')">{if $medicion->grabacion_fin != NULL}{$medicion->grabacion_fin|date_format:"%d-%m-%Y"}{else}----{/if}</a>
{/if}
