<!-- panel_nuevo.tpl -->
<div>
    <form method="post" action="index.php?page=panel_grabar" id="panel_nuevo" name="panel_nuevo">
        <input type="hidden" name="id_entidad" value="{$id_entidad}" id="id_entidad">
        <input type="hidden" name="id_cuadro" value="{$id_cuadro}" id="id_cuadro">
        <div style="opacity: 1;" class="box tabs" id="tab_crear_panel">
            <ul class="tab_header">
                <li>
                    <a class="tipo" data-tipo="panel_metrica"href="#datos_panel"><img src="/icons/ff32/date.png"style="padding-top:5px"><br /> {$smarty.const.TXT_METRICA}</a>
                </li>
                <li>
                    <a class="tipo" data-tipo="panel_linea"href="#datos_panel"><img src="/icons/ff32/chart_curve.png"style="padding-top:5px"><br /> {$smarty.const.TXT_LINEAS}</a>
                </li>
                <li>
                    <a  class="tipo" data-tipo="panel_tarta"href="#datos_panel"><img src="/icons/ff32/chart_pie.png"style="padding-top:5px"><br /> {$smarty.const.TXT_TARTA}</a>
                </li>
                <li>
                    <a class="tipo" data-tipo="panel_barra"href="#datos_panel"><img src="/icons/ff32/chart_bar.png"style="padding-top:5px"><br /> {$smarty.const.TXT_BARRAS}</a>
                </li>
                <li>
                    <a class="tipo" data-tipo="panel_tabla" href="#datos_panel"><img src="/icons/ff32/table.png" style="padding-top:5px"><br /> {$smarty.const.TXT_TABLA}</a>
                </li>
                <li>
                    <a class="tipo" data-tipo="panel_informacion" href="#datos_panel"><img src="/icons/ff32/information.png"style="padding-top:5px" ><br /> {$smarty.const.TXT_AYUDA}</a>
                </li>
            </ul>
            <div style="opacity: 1;" id="datos_panel" class="block ui-tabs-panel ui-widget-content ui-corner-bottom">
                <div id="datos" class="columns clearfix">
                    {include file="panel_informacion.tpl"}
                </div>
                <div class="button_bar clearfix" id="footer_tabs" style="display:none">
                    <button class="green send_right img_icon has_text" type="submit">
                        <span>{$smarty.const.TXT_GRABAR}</span>
                    </button>
                    <button class="btnPrev red send_left img_icon has_text" onclick="history.back();" type="button">
                        <span>{$smarty.const.TXT_CANCEL}</span>
                    </button>
                </div>
            </div><!-- fin tab 1 --> 
        </div><!-- id tab_crear_panel -->
    </form>
</div>

<div>
    <button class="light send_left" type="reset" value="{$smarty.const.TXT_VOLVER_CUADRO}" name="proceso_cancel" 
            onclick="history.back();">
        <img src='/icons/ff16/arrow_undo.png' style="margin:5px" />&nbsp;&nbsp;
        {$smarty.const.TXT_VOLVER_CUADRO}
    </button>
</div>

<script src="js/panel_nuevo.js" type="text/javascript"></script>
