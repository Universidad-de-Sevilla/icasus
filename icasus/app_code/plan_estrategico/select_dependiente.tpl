<select name="objetivo" id="objetivo" >
        <option value="0">Seleccionar un Objetivo de esta L&Iacute;nea</option>
{foreach from=$objetivo item=lista}';
echo '<option value="{$lista.id}">{$lista.idorden} :: {$lista.titulo|htmlentities|truncate:65:"...":true}</option>
{/foreach}
</select>
