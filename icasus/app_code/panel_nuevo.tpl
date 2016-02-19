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
            <li><a title="{$smarty.const.FIELD_UNIDS}" href='index.php?page=entidad_listar'>{$smarty.const.FIELD_UNIDS}</a></li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" data-target="#" title="{$entidad->nombre}" href="index.php?page=entidad_mostrar&id_entidad={$entidad->id}">
                    {$entidad->nombre|truncate:30} <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu">
                    <li>
                        <a title="{$smarty.const.FIELD_USER}: {$_usuario->login} - {$smarty.const.TXT_UNID}: {$entidad->nombre} - {$smarty.const.FIELD_ROL}: {$_rol}" href="index.php?page=entidad_mostrar&id_entidad={$entidad->id}"><i class="fa fa-folder fa-fw"></i> {$entidad->nombre} / <i class="fa fa-user fa-fw"></i> {$_rol}</a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a title="{$smarty.const.TXT_PROCS_DESCRIPCION}" href='index.php?page=proceso_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-gears fa-fw"></i> {$smarty.const.TXT_PROCS} <span title="{$smarty.const.FIELD_TOTAL}: {$num_procesos} {$smarty.const.TXT_PROCS}">({$num_procesos})</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_INDICS_DESCRIPCION}" href='index.php?page=indicador_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-dashboard fa-fw"></i> {$smarty.const.FIELD_INDICS} <span title="{$smarty.const.FIELD_TOTAL}: {$num_indicadores} {$smarty.const.FIELD_INDICS}">({$num_indicadores})</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_DATOS_DESCRIPCION}" href='index.php?page=dato_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-database fa-fw"></i> {$smarty.const.FIELD_DATOS} <span title="{$smarty.const.FIELD_TOTAL}: {$num_datos} {$smarty.const.FIELD_DATOS}">({$num_datos})</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_CUADRO_MANDO_DESCRIPCION}" href='index.php?page=cuadro_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-th fa-fw"></i> {$smarty.const.TXT_CUADROS_MANDO} <span title="{$smarty.const.FIELD_TOTAL}: {$num_cuadros} {$smarty.const.TXT_CUADROS_MANDO}">({$num_cuadros})</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_CONSULTA_DESCRIPCION}" href="index.php?page=consulta_avanzada&id_entidad={$entidad->id}">
                            <i class="fa fa-commenting fa-fw"></i> {$smarty.const.TXT_CONSULT}
                        </a>
                    </li>   
                    {if $_control}
                        <li class="divider"></li>
                        <li>
                            <a title="{$smarty.const.TXT_CONTROL_DESCRIPCION}" href="index.php?page=control&modulo=inicio&id_entidad={$entidad->id}">
                                <i class="fa fa-sliders fa-fw"></i> {$smarty.const.TXT_CONTROL}
                            </a>
                        </li>
                    {/if}
                </ul>
                <!-- /.dropdown-menu -->
            </li>
            <!-- /.dropdown -->
            <li><a title="{$smarty.const.TXT_CUADROS_MANDO}" href='index.php?page=cuadro_listar&id_entidad={$entidad->id}'>{$smarty.const.TXT_CUADROS_MANDO}</a></li>
            <li><a title="{$cuadro->nombre}" href='index.php?page=cuadro_mostrar&id_cuadro={$cuadro->id}&id_entidad={$entidad->id}'>{$cuadro->nombre}</a></li>
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
                <span class="panel-title"><i class="fa fa-columns fa-fw"></i> {$smarty.const.TXT_PANEL_PARAM}</span>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs h4" role="tablist">
                    <li id="tab_lineas" role="presentation"><a title="{$smarty.const.TXT_LINEAS}: {$smarty.const.TXT_LINEAS_DESC}" aria-controls="{$smarty.const.TXT_LINEAS}: {$smarty.const.TXT_LINEAS_DESC}" role="tab" data-toggle="tab" class="tipo" data-tipo="panel_linea" data-nombre_panel="{$smarty.const.TXT_LINEAS}" href="#datos_panel"><i class="fa fa-line-chart fa-fw"></i> {$smarty.const.TXT_LINEAS}</a></li>
                    <li id="tab_barras" role="presentation"><a title="{$smarty.const.TXT_BARRAS}: {$smarty.const.TXT_BARRAS_DESC}" aria-controls="{$smarty.const.TXT_BARRAS}: {$smarty.const.TXT_BARRAS_DESC}" role="tab" data-toggle="tab" class="tipo" data-tipo="panel_barra" data-nombre_panel="{$smarty.const.TXT_BARRAS}" href="#datos_panel"><i class="fa fa-bar-chart fa-fw"></i> {$smarty.const.TXT_BARRAS}</a></li>
                    <li id="tab_metrica" role="presentation"><a title="{$smarty.const.TXT_METRICA}: {$smarty.const.TXT_METRICA_DESC}" aria-controls="{$smarty.const.TXT_METRICA}: {$smarty.const.TXT_METRICA_DESC}" role="tab" data-toggle="tab" class="tipo" data-tipo="panel_metrica" data-nombre_panel="{$smarty.const.TXT_METRICA}" href="#datos_panel"><i class="fa fa-calendar-check-o fa-fw"></i> {$smarty.const.TXT_METRICA}</a></li>
                    <li id="tab_tarta" role="presentation"><a title="{$smarty.const.TXT_TARTA}: {$smarty.const.TXT_TARTA_DESC}" aria-controls="{$smarty.const.TXT_TARTA}: {$smarty.const.TXT_TARTA_DESC}" role="tab" data-toggle="tab" class="tipo" data-tipo="panel_tarta" data-nombre_panel="{$smarty.const.TXT_TARTA}" href="#datos_panel"><i class="fa fa-pie-chart fa-fw"></i> {$smarty.const.TXT_TARTA}</a></li>
                    <li id="tab_tabla" role="presentation"><a title="{$smarty.const.TXT_TABLA}: {$smarty.const.TXT_TABLA_DESC}" aria-controls="{$smarty.const.TXT_TABLA}: {$smarty.const.TXT_TABLA_DESC}" role="tab" data-toggle="tab" class="tipo" data-tipo="panel_tabla" data-nombre_panel="{$smarty.const.TXT_TABLA}" href="#datos_panel"><i class="fa fa-table fa-fw"></i> {$smarty.const.TXT_TABLA}</a></li>
                    <li id="tab_tabla_multi" role="presentation"><a title="{$smarty.const.TXT_TABLA_MULTI}: {$smarty.const.TXT_TABLA_MULTI_DESC}" aria-controls="{$smarty.const.TXT_TABLA_MULTI}: {$smarty.const.TXT_TABLA_MULTI_DESC}" role="tab" data-toggle="tab" class="tipo" data-tipo="panel_tabla_multi" data-nombre_panel="{$smarty.const.TXT_TABLA_MULTI}" href="#datos_panel"><i class="fa fa-table fa-fw"></i> {$smarty.const.TXT_TABLA_MULTI}</a></li>
                    <li id="tab_info" role="presentation" class="active" ><a title="{$smarty.const.TXT_AYUDA}" aria-controls="{$smarty.const.TXT_AYUDA}" role="tab" data-toggle="tab" class="tipo" data-tipo="panel_informacion" data-nombre_panel="{$smarty.const.TXT_AYUDA}" href="#datos_panel"><i class="fa fa-question-circle fa-fw"></i> {$smarty.const.TXT_AYUDA}</a></li>
                </ul>
                <!-- /Nav tabs -->
                <form method="post" action="index.php?page=panel_grabar" id="panel_nuevo" name="panel_nuevo"
                      data-toggle="validator" class="form-horizontal">
                    <input type="hidden" name="id_entidad" value="{$entidad->id}" id="id_entidad">
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
                                    <a class="btn btn-danger" title="{$smarty.const.TXT_CANCEL}" href='index.php?page=cuadro_mostrar&id_cuadro={$cuadro->id}&id_entidad={$entidad->id}'>
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