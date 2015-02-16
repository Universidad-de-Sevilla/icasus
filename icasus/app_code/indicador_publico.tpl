<ul>
    {foreach from = $indicadores item =indicador}
        <li>{$indicador->entidad} - <a href="index.php?page=indicador_datos_publico&id_indicador={$indicador->id_indicador}">{$indicador->nombre}</a></li>
        {/foreach}
</ul>
