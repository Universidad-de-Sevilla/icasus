{literal}
    <script>
        //mostrar y esconder bloques html
        function open_close(id)
        {
            if (document.getElementById(id).style.display === 'none')
            {
                document.getElementById(id).style.display = '';
            }
            else
            {
                document.getElementById(id).style.display = 'none';
            }
        }
    </script>
{/literal}
{foreach from = $entidades item = entidad}
    <p onclick="open_close('{$entidad->id_entidad}');"><b>{$entidad->nombre}</b></p>
    <ul id="{$entidad->id_entidad}" style="display:none">
        {foreach from = $entidad->indicadores item = indicadores}
            <li>{$indicadores->nombre}
                <table>
                    <tr><th>{$smarty.const.FIELD_VAL}</th><th>{$smarty.const.FIELD_FECHA}</th></tr>
                            {foreach from = $indicadores->valores item = valor}
                        <tr><td>{$valor->valor}</td><td>{$valor->fecha_recogida|date_format:"%d/%m/%Y"}</td></td>
                        {/foreach}
                </table>
            </li>
        {/foreach}
    </ul>
{/foreach}
