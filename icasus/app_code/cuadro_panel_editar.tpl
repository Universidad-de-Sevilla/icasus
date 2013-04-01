<ul id="panel-tipo">
  <li><a href="#">Líneas</a></li>
  <li><a href="#">Barras</a></li>
  <li><a href="#">Tabla</a></li>
  <li><a href="#">Métrica</a></li>
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
