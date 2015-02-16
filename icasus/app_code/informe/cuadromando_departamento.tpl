{literal}
    <style>
        .scrollH	{
            width:589px;
            padding:3px;
            overflow:auto;
            margin-bottom:10px;}
        </style>
    {/literal}
    <h3>{$smarty.const.TXT_CUADRO_MANDO}</h3>
    <div class="scrollH">
    <table style="width:95%">
        <tr>  
            <th>{$smarty.const.FIELD_UNIDS}</th> 
                {foreach from=$codigos item=codigo}
                <th colspan="{$colspan}" style="text-align:center">{$codigo}</th>
                {/foreach}
        </tr>

        {foreach from=$entidades item=entidad}
            <tr>
                <td style="width:35%"><a href="index.php?page=indicador_listar&id_entidad={$entidad->id_entidad}">{$entidad->nombre}</a></td>
                    {foreach key=key from=$entidad->indicadores item=indicador}

                    {foreach key=key2 from=$indicador item=item}
                        <td style="color:#66CDAA">{if $item > 0}{if $tipo == 'valor'}{$item}{elseif $tipo == 'numero'}{$key2|substr:-2} {/if}{/if}</td> 
                        <!--	
                        <td style="color:#66CDAA">{if $item > 0}<a href="index.php?page=index.php?page=indicador_datos&id_indicador=871&id_entidad={$entidad->entidad_id}">{$key2|substr:-2}</a>{/if}</td> 
                        -->
                    {/foreach}
                {/foreach}
            </tr>
        {/foreach}
    </table>
</div>
<!--
<table>
<tr>
<th rowspan="2">Unidades</th>
{foreach from=$codigos item=codigo}
<th colspan="3">{$codigo}</th>
{/foreach}
</tr>
<tr>
{foreach from=$codigos item=codigo}
    {foreach from=$periodos item=periodo}
    <th>{$periodo|substr:-2}</th>
    {/foreach}
{/foreach}
</tr>
</table8B
-->
