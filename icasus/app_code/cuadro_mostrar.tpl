<div class="button_bar clearfix">
    {if $cuadro->id_usuario == $_usuario->id}
        <a href='index.php?page=panel_nuevo&id_cuadro={$cuadro->id}&id_entidad=14'><img 
                src='/icons/ff16/application_add.png' /> {$smarty.const.TXT_PANEL_AGREGAR}</a>&nbsp;&nbsp;
        <a href='index.php?page=cuadro_editar&id_cuadro={$cuadro->id}&id_entidad=14'><img 
                src='/icons/ff16/table_edit.png' /> {$smarty.const.TXT_EDIT_PROP}</a>&nbsp;&nbsp;
        {/if}
    <a href='index.php?page=cuadro_listar&id_entidad=14'><img 
            src='/icons/ff16/arrow_undo.png' /> {$smarty.const.TXT_VOLVER_LIST}</a> 
</div>

<div class="alert alert_blue">
    <img height="24" width="24" src="theme/danpin/images/icons/small/white/info_about.png">
    {$cuadro->comentarios}
</div>

<!-- Dialogo para borrar paneles -->
<div id="dialogo_borrar_panel" class="dialog_content narrow ui-dialog-content ui-widget-content">
    <div class="block" style="opacity: 1;" >
        <div class="section" style="padding:20px">
            <p>{$smarty.const.MSG_PANEL_BORRAR} "<b><span id="nombre_panel"></span></b>" </p>
        </div>
    </div>
</div>
<!-- //Dialogo para borrar paneles -->

{if $paneles}
    {foreach $paneles as $panel}
        <div class="box grid_{$panel->ancho}" style="float:left;">
            <div class="block alturo" style="height:320px">
                <div class="titulo-panel">
                    <strong>{$panel->nombre}</strong> 
                    <a class="borrar pull-right ihidden" data-nombre_panel="{$panel->nombre}" href="#"><img src="/icons/ff16/cancel.png" /></a>
                    &nbsp; 
                    <a class="editar pull-right hidden" data-nombre_panel="{$panel->nombre}" href="#"><img src="/icons/ff16/application_add.png" /></a>
                </div>
                <div class="section">
                    <div class="panel {$panel->tipo->clase_css}" id="panel_{$panel->id}" data-idpanel="{$panel->id}" 
                         data-id_medicion="{$panel->id_medicion}" data-fecha_inicio="{$panel->fecha_inicio}" 
                         data-fecha_fin="{$panel->fecha_fin}" data-ancho="{$panel->ancho}"
                         data-periodicidad="{$panel->periodicidad}"></div>
                    <div class="leyenda"></div>
                </div>
            </div>
        </div>
    {/foreach}
{/if}

<script src="theme/danpin/scripts/flot/jquery.flot.min.js" type="text/javascript"></script>		
<script src="theme/danpin/scripts/flot/jquery.flot.time.js" type="text/javascript"></script>
<script src="theme/danpin/scripts/flot/jquery.flot.pie.min.js" type="text/javascript"></script>		
<script src="theme/danpin/scripts/flot/jquery.flot.orderBars.js" type="text/javascript"></script>		

<script src="js/highcharts.js" type="text/javascript"></script>
<script src="js/exporting.js" type="text/javascript"></script>
<script src="js/highchartStruct.js" type="text/javascript"></script>
<script src="js/cuadro_mostrar.js" type="text/javascript"></script>
