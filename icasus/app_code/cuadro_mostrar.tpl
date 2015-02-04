<div class="button_bar clearfix">
    {if $cuadro->id_usuario == $_usuario->id}
        <a title="{$smarty.const.TXT_PANEL_AGREGAR}" href='index.php?page=panel_nuevo&id_cuadro={$cuadro->id}&id_entidad=14'><img 
                src='/icons/ff16/application_add.png' /> {$smarty.const.TXT_PANEL_AGREGAR}</a>&nbsp;&nbsp;
        <a title="{$smarty.const.TXT_EDIT_PROP}" href='index.php?page=cuadro_editar&id_cuadro={$cuadro->id}&id_entidad=14'><img 
                src='/icons/ff16/table_edit.png' /> {$smarty.const.TXT_EDIT_PROP}</a>&nbsp;&nbsp;
        <a onclick="return confirm('{$smarty.const.MSG_CUADRO_MANDO_CONFIRM_BORRAR}');" 
           title="{$smarty.const.TXT_BORRAR}" 
           href='index.php?page=cuadro_borrar&id_cuadro={$cuadro->id}&id_entidad=14'>
            <img src='/icons/ff16/table_delete.png' /> {$smarty.const.TXT_BORRAR}</a>&nbsp;&nbsp;
        {/if}
    <a title="{$smarty.const.TXT_VOLVER_LIST}" href='index.php?page=cuadro_listar&id_entidad=14'>
        <img src='/icons/ff16/arrow_undo.png' /> {$smarty.const.TXT_VOLVER_LIST}</a> 
</div>

{if $cuadro->comentarios}
    <div class="alert alert_blue">
        <img height="24" width="24" src="theme/danpin/images/icons/small/white/info_about.png">
        {$cuadro->comentarios}
    </div>
{/if}

<!-- Dialogo para borrar paneles -->
<div id="dialogo_borrar_panel" class="dialog_content narrow ui-dialog-content ui-widget-content">
    <div class="block" style="opacity: 1;" >
        <div class="section" style="padding:20px">
            <p>{$smarty.const.MSG_PANEL_BORRAR} "<b><span id="nombre_panel"></span></b>" </p>
        </div>
    </div>
</div>
<!-- //Dialogo para borrar paneles -->

<!-- Paneles -->
{if $paneles}
    {foreach $paneles as $panel}
        <div class="box grid_{$panel->ancho}" >   
            <div class="block alturo">
                <div class="titulo-panel">
                    <strong>{$panel->nombre}</strong>
                    <br>
                    <span>{$smarty.const.FIELD_ORDEN}: {$panel->orden}</span>
                    <span>{$smarty.const.FIELD_ANCHO}: {$panel->ancho}</span>
                    {if $_usuario->id eq $cuadro->id_usuario}
                        <a title="{$smarty.const.TXT_EDIT}" 
                           class="editar" 
                           style="z-index:2;position:absolute;right: 20px;top:5px;" 
                           href="index.php?page=panel_editar&id_panel={$panel->id}&id_cuadro={$id_cuadro}">
                            <img src="/icons/ff16/application_edit.png" />&nbsp;&nbsp;
                        </a>   
                        <a title="{$smarty.const.TXT_BORRAR}" 
                           class="borrar" 
                           style="z-index:2;position:absolute;right: 5px;top:5px;" 
                           data-id_panel="{$panel->id}" 
                           data-nombre_panel="{$panel->nombre}" 
                           href="javascript:void(0)">
                            <img src="/icons/ff16/cancel.png" />
                        </a>
                    {/if}
                </div>
                <div class="section">
                    <div class="panel {$panel->tipo->clase_css}" 
                         id="panel_{$panel->id}" 
                         data-id_panel="{$panel->id}"
                         data-titulo_panel ="{$panel->nombre}"
                         data-id_medicion="{$panel->id_medicion}" 
                         data-fecha_inicio="{$panel->fecha_inicio}" 
                         data-fecha_fin="{$panel->fecha_fin}" 
                         data-ancho="{$panel->ancho}"
                         data-periodicidad="{$panel->periodicidad}">
                    </div>
                    <div class="leyenda"></div>
                </div>
            </div>
        </div>
    {/foreach}
{/if}
<!-- //Paneles -->		

<script src="js/highcharts.js" type="text/javascript"></script>
<script src="js/exporting.js" type="text/javascript"></script>
<script src="js/Conjunto.js" type="text/javascript"></script>
<script src="js/HighchartSerie.js" type="text/javascript"></script>
<script src="js/cuadro_mostrar.js" type="text/javascript"></script>
