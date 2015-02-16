<table class="datos">
    <thead>
        <tr><th>{$smarty.const.FIELD_FECHA_HORA}</th><th>{$smarty.const.FIELD_EVENTO}</th><th>{$smarty.const.FIELD_OBJETO}</th><th>{$smarty.const.FIELD_USER}</th></tr>
    </thead>
    <tbody>
        {foreach from=$logs item=log}
            <tr>
                <td nowrap>{$log->fecha|date_format:"%H:%M:%S %e/%m/%Y"}</td> 
                <td nowrap>{$log->page}</td> 
                <td nowrap>{$log->id_objeto}</td>
                <td nowrap>{$log->usuario->nombre} {$log->usuario->apellidos}</td>
            </tr>
        {/foreach}
    </tbody>	
</table>
