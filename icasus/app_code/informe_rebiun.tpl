<style>
    .box a.csv {
        background: url(../images/grabber.gif) no-repeat;
        background: url(../images/grabber-trans.png) no-repeat;
        display: block;
        height: 22px;
        width: 22px;
        position: absolute;
        right: 81px;
        top: 4px;
    }

</style>
<div class="box grid_16 single_datatable">
    <h2 class="box_head grad_grey_dark">{$smarty.const.TXT_DATOS_REBIUN_DET}</h2>
    <a class="csv" title={$smarty.const.TXT_DATOS_REBIUN_DET_EXPORT_CSV} href="index.php?page=datos_rebiun_csv&modulo=detalle"><img src="/icons/ff16/table_add.png" alt={$smarty.const.TXT_EXPORT_CSV}></a><a class="grabber" href="#"></a><a class="toggle" href="#"></a>
    <div id="dt1" class="no_margin">
        <table class="display datatable"> 
            <thead>
                <tr><th>{$smarty.const.FIELD_COD}</th><th>{$smarty.const.FIELD_INDIC}</th><th>{$smarty.const.FIELD_SUBUNID}</th><th>{$smarty.const.FIELD_MEDIDOR}</th><th>{$smarty.const.FIELD_VAL}</th></tr>
            </thead>
            <tbody>
                {foreach from=$informe item=detalle}
                    <tr>
                        <td>{$detalle.codigo}</td>
                        <td>{$detalle.indicador}</td>
                        <td>{$detalle.subunidad}</td>
                        <td>{$detalle.medidor}</td>
                        <td>{$detalle.valor}</td>
                    </tr>
                {/foreach}
            </tbody>	
        </table>
    </div><!-- #dt1 .no_margin -->
</div><!-- .box grid16 single_datatable -->

<div class="box grid_16 single_datatable">
    <h2 class="box_head grad_grey_dark">{$smarty.const.TXT_DATOS_REBIUN_SUMA}</h2>
    <a class="csv" title={$smarty.const.TXT_DATOS_REBIUN_SUMA_EXPORT_CSV} href="index.php?page=datos_rebiun_csv&modulo=suma"><img src="/icons/ff16/table_add.png" alt={$smarty.const.TXT_EXPORT_CSV}></a><a class="grabber" href="#"></a><a class="toggle" href="#"></a>

    <div id="dt1" class="no_margin">
        <table class="display datatable"> 
            <thead>
                <tr><th>{$smarty.const.FIELD_COD}</th><th>{$smarty.const.FIELD_INDIC}</th><th>{$smarty.const.FIELD_ETIQUETA}</th><th>{$smarty.const.FIELD_VAL}</th></tr>
            </thead>
            <tbody>
                {foreach from=$suma item=detalle}
                    <tr>
                        <td>{$detalle.codigo}</td>
                        <td>{$detalle.indicador}</td>
                        <td>{$detalle.etiqueta}</td>
                        <td>{$detalle.valor}</td>
                    </tr>
                {/foreach}
            </tbody>	
        </table>
    </div><!-- #dt1 .no_margin -->
</div><!-- .box grid16 single_datatable -->

<div class="box grid_16 single_datatable">
    <h2 class="box_head grad_grey_dark">{$smarty.const.TXT_DATOS_REBIUN_PROMEDIO}</h2>
    <a class="csv" title={$smarty.const.TXT_DATOS_REBIUN_PROMEDIO_EXPORT_CSV} href="index.php?page=datos_rebiun_csv&modulo=promedio"><img src="/icons/ff16/table_add.png" alt={$smarty.const.TXT_EXPORT_CSV}></a><a class="grabber" href="#"></a><a class="toggle" href="#"></a>

    <div id="dt1" class="no_margin">
        <table class="display datatable"> 
            <thead>
                <tr><th>{$smarty.const.FIELD_COD}</th><th>{$smarty.const.FIELD_INDIC}</th><th>{$smarty.const.FIELD_ETIQUETA}</th><th>{$smarty.const.FIELD_VAL}</th></tr>
            </thead>
            <tbody>
                {foreach from=$promedio item=detalle}
                    <tr>
                        <td>{$detalle.codigo}</td>
                        <td>{$detalle.indicador}</td>
                        <td>{$detalle.etiqueta}</td>
                        <td>{$detalle.valor}</td>
                    </tr>
                {/foreach}
            </tbody>	
        </table>
    </div><!-- #dt1 .no_margin -->
</div><!-- .box grid16 single_datatable -->	
