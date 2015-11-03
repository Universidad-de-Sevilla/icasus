<!-- Diálogo Confirmar Borrado -->
<div class="modal fade" id="dialogo_confirmar_borrado" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel"><i class="fa fa-trash fa-fw"></i> {$smarty.const.TXT_CUADRO_BORRAR}: <span id="nombre_cuadro"></span></h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_CUADRO_MANDO_CONFIRM_BORRAR}</p>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_NO}" class="btn btn-default btn-danger" data-dismiss="modal"><i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_NO}</button>
                <a title="{$smarty.const.TXT_SI}" class="btn btn-default btn-success" name="borrar" id="borrar" href='index.php?page=cuadro_borrar&id_cuadro={$cuadro->id}&id_entidad=14'><i class="fa fa-check fa-fw"></i> {$smarty.const.TXT_SI}</a>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Confirmar Borrado -->

<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <h3 title="{$_nombre_pagina}" class="page-header">
            <i class="fa fa-th fa-fw"></i> {$_nombre_pagina}
        </h3>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- /Nombre página -->

<!-- Breadcrumbs -->
<div class="row">
    <div class="col-lg-12">
        <ol class="breadcrumb">
            <i title="{$smarty.const.TXT_ESTA}" class="fa fa-map-marker fa-fw"></i>
            <li><a title="{$smarty.const.TXT_CUADROS_MANDO}" href='index.php?page=cuadro_listar'>{$smarty.const.TXT_CUADROS_MANDO}</a></li>
            <li title="{$_nombre_pagina}" class="active">{$_nombre_pagina}</li>
        </ol>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- /Breadcrumbs -->

<!-- Barra de botones -->
{if $cuadro->id_usuario == $_usuario->id}
    <div class="row">
        <div class="col-lg-12">
            <div class="btn-toolbar" role="toolbar" aria-label="">
                <div class="btn-group" role="group" aria-label="">
                    <a class="btn btn-default btn-danger" title="{$smarty.const.TXT_PANEL_AGREGAR}" href='index.php?page=panel_nuevo&id_cuadro={$cuadro->id}&id_entidad=14'>
                        <i class="fa fa-plus-circle fa-fw"></i> {$smarty.const.TXT_PANEL_AGREGAR}</a>
                    <a class="btn btn-default btn-danger" title="{$smarty.const.TXT_EDIT_PROP}" href='index.php?page=cuadro_editar&id_cuadro={$cuadro->id}&id_entidad=14'>
                        <i class="fa fa-pencil fa-fw"></i> {$smarty.const.TXT_EDIT_PROP}</a>
                </div> 
                <div class="btn-group" role="group" aria-label="">
                    <a class="btn btn-default btn-danger" title="{$smarty.const.TXT_BORRAR}" href='javascript:void(0)' data-toggle="modal" data-target="#dialogo_confirmar_borrado">
                        <i class="fa fa-trash fa-fw"></i> {$smarty.const.{$smarty.const.TXT_BORRAR}}</a>
                </div>
            </div>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <br>
{/if}
<!-- /Barra de botones -->

<!-- Comentarios del cuadro -->
{if $cuadro->comentarios}  
    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-info alert-dismissible">
                <i class="fa fa-info-circle fa-fw"></i> 
                {$cuadro->comentarios}
            </div> 
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
{/if}
<!-- /Comentarios del cuadro -->

<!-- Paneles -->
<div class ="row">
    {if $paneles}
        {foreach $paneles as $panel}
            <div class="col-lg-{$panel->ancho}" >
                <div class="panel panel-red">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-9">
                                <span title="{$smarty.const.FIELD_ORDEN}" class="badge">{$panel->orden}</span>
                                <strong><i class="fa fa-line-chart fa-fw"></i> {$panel->nombre}</strong>     
                            </div>
                            <!-- /.col-xs-9 -->
                            <div class="col-xs-3">
                                {*if $_usuario->id eq $cuadro->id_usuario*}
                                <div class="btn-toolbar pull-right" role="group" aria-label="">
                                    <a class="btn btn-default btn-xs" 
                                       title="{$smarty.const.TXT_EDIT}"
                                       href="index.php?page=panel_editar&id_panel={$panel->id}&id_cuadro={$id_cuadro}">
                                        <i class="fa fa-pencil fa-fw"></i> 
                                    </a>
                                    <a class="btn btn-default btn-xs" 
                                       title="{$smarty.const.TXT_BORRAR}" 
                                       class="borrar"
                                       data-id_panel="{$panel->id}" 
                                       data-nombre_panel="{$panel->nombre}" 
                                       href="javascript:void(0)">
                                        <i class="fa fa-times fa-fw"></i>
                                    </a>
                                </div>
                                {*/if*}
                            </div>
                            <!-- /.col-xs-3 -->
                        </div>
                        <!-- /.row --> 
                        <div class="row">
                            <div class="col-xs-12">
                                <span title="{$smarty.const.FIELD_ANCHO}: {$panel->ancho}" class="label label-primary">{$smarty.const.FIELD_ANCHO}: {$panel->ancho}</span>
                                {if $panel->tipo->id == 2 || $panel->tipo->id == 3 || $panel->tipo->id == 4}
                                    {$smarty.const.TXT_GRAFICO_AUMENTAR} 
                                {/if}
                            </div>
                            <!-- /.col-xs-12 -->
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">  
                        <div class="panel {$panel->tipo->clase_css}" 
                             id="panel_{$panel->id}" 
                             data-id_panel="{$panel->id}"
                             data-titulo_panel ="{$panel->nombre}"
                             data-id_medicion="{$panel->id_medicion}" 
                             data-fecha_inicio="{$panel->fecha_inicio}" 
                             data-fecha_fin="{$panel->fecha_fin}" 
                             data-periodicidad="{$panel->periodicidad}">
                        </div>
                    </div>
                    <!-- /.panel-body -->
                    <div class="panel-footer"></div>
                    <!-- /.panel-footer -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-{$panel->ancho} -->
        {/foreach} 
    {/if}
</div>
<!-- /.row -->
<!-- /Paneles -->








<!-- Dialogo para borrar paneles 
<div id="dialogo_borrar_panel" class="dialog_content narrow ui-dialog-content ui-widget-content">
    <div class="block" style="opacity: 1;" >
        <div class="section" style="padding:20px">
            <p>{$smarty.const.MSG_PANEL_BORRAR} "<b><span id="nombre_panel"></span></b>" </p>
        </div>
    </div>
</div>
<!-- //Dialogo para borrar paneles 

<!-- Paneles 
{if $paneles}
    {foreach $paneles as $panel}
        <div class="box grid_{$panel->ancho}" >   
            <div class="block alturo">
                <div class="titulo-panel">
                    <strong>{$panel->nombre}</strong>
        {if $panel->tipo->id != 1 && $panel->tipo->id != 5 && $panel->tipo->id != 6 && $panel->tipo->id != 7}
            {$smarty.const.TXT_GRAFICO_AUMENTAR} 
        {/if}
        {if $_usuario->id eq $cuadro->id_usuario}
            <br>
            <span style="font-size:10px;">{$smarty.const.FIELD_ORDEN}: {$panel->orden}</span>
            <span style="font-size:10px;">{$smarty.const.FIELD_ANCHO}: {$panel->ancho}</span>
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
             data-periodicidad="{$panel->periodicidad}">
        </div>
        <div class="leyenda"></div>
    </div>
</div>
</div>
    {/foreach}
{/if}
<!-- //Paneles -->