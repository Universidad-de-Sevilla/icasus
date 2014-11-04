<ul id="panel-tipo">
  <li><a href="#">{$smarty.const.TXT_LINEAS}</a></li>
  <li><a href="#">{$smarty.const.TXT_BARRAS}</a></li>
  <li><a href="#">{$smarty.const.TXT_TABLA}</a></li>
  <li><a href="#">{$smarty.const.TXT_METRICA}</a></li>
</ul>

<ul class="indicador" id="1">
{foreach $indicadores as $indicador}
  <li><a href="#" class="indicador" id_indicador="{$indicador->id}">{$indicador->nombre}</a></li>
{/foreach}
</ul>

<ul class="indicador" id="2">
{foreach $indicadores as $indicador}
  <li><a href="#" class="indicador" id_indicador="{$indicador->id}">{$indicador->nombre}</a></li>
{/foreach}
</ul>
