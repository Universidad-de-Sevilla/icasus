<div class="flat_area grid_16">
  <h2>Procesos de la unidad: {$entidad->nombre}</h2>
    {foreach $procesos_propios as $proceso}
        <h3>{$proceso->codigo} - {$proceso->nombre}</h3>
        <ul>
          {foreach $proceso->indicadores as $indicador}
            <li>{$indicador->nombre}</li>
          {/foreach}
        </ul>
    {/foreach}
  </ul>

  {if is_object($entidad->madre)}
    <h2>Procesos de la unidad: {$entidad->madre->nombre}</h2>
    {if is_object($procesos_madre)}
    <ul>
      {foreach $procesos_madre as $proceso}
          <h3>{$proceso->codigo} - {$proceso->nombre}</h3>
          <ul>
            {foreach $proceso->indicadores as $indicador}
              <li>{$indicador->nombre}</li>
            {/foreach}
          </ul>
      {/foreach}
    </ul>
    {else}
      <p>No se han definido procesos en esta unidad</p>
    {/if}
  {/if}
</div>
