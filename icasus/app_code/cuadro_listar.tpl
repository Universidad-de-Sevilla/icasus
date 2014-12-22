<p><a href="index.php?page=cuadro_crear" title="{$smarty.const.TXT_CUADRO_NUEVO}">
        <img	src="/icons/ff16/table_add.png" alt="{$smarty.const.TXT_ICON}" /> {$smarty.const.TXT_CUADRO_NUEVO}</a>
</p>

{if $cuadros_propios|count > 0}

    <div class="box grid_16 single_datatable">
        <h2 class="box_head grad_grey_dark">{$smarty.const.TXT_CUADRO_MANDO_PROPIOS}</h2>
        <div id="dt1" class="no_margin">
            <table class="display datatable"> 
                <thead>
                    <tr><th>{$smarty.const.FIELD_NOMBRE}</th><th>{$smarty.const.FIELD_VISIBILIDAD}</th><th>{$smarty.const.FIELD_COMENTARIOS}</th><!--<th>Acciones</th>--></tr>
                </thead>
                <tbody>
                    {foreach from=$cuadros_propios item=cuadro}
                        <tr>
                            <td><a href="index.php?page=cuadro_mostrar&id={$cuadro->id}">{$cuadro->nombre}</a></td> 
                            <td>{if $cuadro->privado == 0}{$smarty.const.TXT_PUBLICO}{else}{$smarty.const.TXT_PRIVADO}{/if}</td>
                            <td width="70%">{$cuadro->comentarios}</td>
                        </tr>
                    {/foreach}
                </tbody>	
            </table>
        </div><!-- #dt1 .no_margin -->
    </div><!-- .box grid16 single_datatable -->

{else}
    <h3>{$smarty.const.MSG_CUADRO_MANDO_NO_DEF}<a href="index.php?page=cuadro_crear" title="{$smarty.const.TXT_CUADRO_NUEVO}">{$smarty.const.TXT_A_Q_ESPERAS}</a></h3>
    {/if}

{if $cuadros_publicos|count > 0}

    <div class="box grid_16 single_datatable">
        <h2 class="box_head grad_grey_dark">{$smarty.const.TXT_CUADROS_MANDO_PUBLIC}</h2>
        <div id="dt1" class="no_margin">
            <table class="display datatable"> 
                <thead>
                    <tr><th>{$smarty.const.FIELD_NOMBRE}</th><th>{$smarty.const.FIELD_VISIBILIDAD}</th><th>{$smarty.const.FIELD_COMENTARIOS}</th><!--<th>Acciones</th>--></tr>
                </thead>
                <tbody>
                    {foreach from=$cuadros_publicos item=cuadro}
                        <tr>
                            <td><a href="index.php?page=cuadro_mostrar&id={$cuadro->id}">{$cuadro->nombre}</a></td> 
                            <td>{if $cuadro->privado == 0}{$smarty.const.TXT_PUBLICO}{else}{$smarty.const.TXT_PRIVADO}{/if}</td>
                            <td width="70%">{$cuadro->comentarios}</td>
                        </tr>
                    {/foreach}
                </tbody>	
            </table>
        </div><!-- #dt1 .no_margin -->
    </div><!-- .box grid16 single_datatable -->

{else}
    <h3>{$smarty.const.MSG_CUADRO_MANDO_NO_PUBLIC}<a href="index.php?page=cuadro_crear" title="{$smarty.const.TXT_CUADRO_NUEVO}">{$smarty.const.TXT_A_Q_ESPERAS}</a></h3>
    {/if}
