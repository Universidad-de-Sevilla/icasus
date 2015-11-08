<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <h3 title="{$_nombre_pagina}" class="page-header">
            <i class="fa fa-plus-circle fa-fw"></i> {$_nombre_pagina}<span id="nombre_panel">: {$smarty.const.TXT_AYUDA}</span>
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
            <li><a title="{$cuadro->nombre}" href='index.php?page=cuadro_mostrar&id={$cuadro->id}'>{$cuadro->nombre}</a></li>
            <li title="{$_nombre_pagina}" class="active">{$_nombre_pagina}</li>
        </ol>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- /Breadcrumbs -->

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-red">
            <div class="panel-heading">
                <span class="panel-title"><i class="fa fa-th fa-fw"></i> {$smarty.const.TXT_PANEL_PARAM}</span>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs h4" role="tablist">
                    <li id="tab_metrica" role="presentation"><a title="{$smarty.const.TXT_METRICA}" aria-controls="{$smarty.const.TXT_METRICA}" role="tab" data-toggle="tab" class="tipo" data-tipo="panel_metrica" data-nombre_panel="{$smarty.const.TXT_METRICA}" href="#datos_panel"><i class="fa fa-calendar-check-o fa-fw"></i> {$smarty.const.TXT_METRICA}</a></li>
                    <li id="tab_lineas" role="presentation"><a title="{$smarty.const.TXT_LINEAS}" aria-controls="{$smarty.const.TXT_LINEAS}" role="tab" data-toggle="tab" class="tipo" data-tipo="panel_linea" data-nombre_panel="{$smarty.const.TXT_LINEAS}" href="#datos_panel"><i class="fa fa-line-chart fa-fw"></i> {$smarty.const.TXT_LINEAS}</a></li>
                    <li id="tab_tarta" role="presentation"><a title="{$smarty.const.TXT_TARTA}" aria-controls="{$smarty.const.TXT_TARTA}" role="tab" data-toggle="tab" class="tipo" data-tipo="panel_tarta" data-nombre_panel="{$smarty.const.TXT_TARTA}" href="#datos_panel"><i class="fa fa-pie-chart fa-fw"></i> {$smarty.const.TXT_TARTA}</a></li>
                    <li id="tab_barras" role="presentation"><a title="{$smarty.const.TXT_BARRAS}" aria-controls="{$smarty.const.TXT_BARRAS}" role="tab" data-toggle="tab" class="tipo" data-tipo="panel_barra" data-nombre_panel="{$smarty.const.TXT_BARRAS}" href="#datos_panel"><i class="fa fa-bar-chart fa-fw"></i> {$smarty.const.TXT_BARRAS}</a></li>
                    <li id="tab_tabla" role="presentation"><a title="{$smarty.const.TXT_TABLA}" aria-controls="{$smarty.const.TXT_TABLA}" role="tab" data-toggle="tab" class="tipo" data-tipo="panel_tabla" data-nombre_panel="{$smarty.const.TXT_TABLA}" href="#datos_panel"><i class="fa fa-table fa-fw"></i> {$smarty.const.TXT_TABLA}</a></li>
                    <li id="tab_tabla_multi" role="presentation"><a title="{$smarty.const.TXT_TABLA_MULTI}" aria-controls="{$smarty.const.TXT_TABLA_MULTI}" role="tab" data-toggle="tab" class="tipo" data-tipo="panel_tabla_multi" data-nombre_panel="{$smarty.const.TXT_TABLA_MULTI}" href="#datos_panel"><i class="fa fa-table fa-fw"></i> {$smarty.const.TXT_TABLA_MULTI}</a></li>
                    <li id="tab_info" role="presentation" class="active" ><a title="{$smarty.const.TXT_AYUDA}" aria-controls="{$smarty.const.TXT_AYUDA}" role="tab" data-toggle="tab" class="tipo" data-tipo="panel_informacion" data-nombre_panel="{$smarty.const.TXT_AYUDA}" href="#datos_panel"><i class="fa fa-question-circle fa-fw"></i> {$smarty.const.TXT_AYUDA}</a></li>
                </ul>
                <!-- /Nav tabs -->
                <form method="post" action="index.php?page=panel_grabar" id="panel_nuevo" name="panel_nuevo"
                      data-toggle="validator" class="form-horizontal">
                    <input type="hidden" name="id_entidad" value="{$id_entidad}" id="id_entidad">
                    <input type="hidden" name="id_cuadro" value="{$cuadro->id}" id="id_cuadro">

                    <!-- Tab panes -->
                    <div class="tab-content">
                        <!-- Tab -->
                        <div role="tabpanel" class="tab-pane active" id="datos_panel">
                            <br>
                            <div id="datos">
                                {include file="panel_informacion.tpl"}
                            </div>
                            <div id="footer_tabs" class="hidden" class="form-group">
                                <div class="col-sm-offset-2 col-sm-8">
                                    <a class="btn btn-danger" title="{$smarty.const.TXT_CANCEL}" href='index.php?page=cuadro_mostrar&id={$cuadro->id}'>
                                        <i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_CANCEL}
                                    </a>
                                    <div class="pull-right">
                                        <button type="reset" class="btn btn-warning" title="{$smarty.const.TXT_RESET}">
                                            <i class="fa fa-refresh fa-fw"></i> {$smarty.const.TXT_RESET}
                                        </button>
                                        <button title="{$smarty.const.TXT_GRABAR}" type="submit" class="btn btn-success">
                                            <i class="fa fa-download fa-fw"></i> {$smarty.const.TXT_GRABAR}
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /Tab -->
                    </div>
                    <!-- /Tab panes -->

                </form>
            </div>
            <!-- /.panel-body --> 
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->