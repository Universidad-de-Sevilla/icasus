<!-- Diálogo Confirmar Borrado cuadro -->
<div class="modal fade" id="dialogo_confirmar_borrado" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h3 class="modal-title" id="myModalLabel">
                    <i class="fa fa-trash fa-fw"></i> {$smarty.const.TXT_CUADRO_BORRAR}: {$cuadro->nombre}
                </h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_CUADRO_MANDO_CONFIRM_BORRAR}</p>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_NO}" class="btn btn-default btn-danger" data-dismiss="modal">
                    <i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_NO}
                </button>
                <a title="{$smarty.const.TXT_SI}" class="btn btn-default btn-success"
                   href='?page=cuadro_borrar&id_cuadro={$cuadro->id}'>
                    <i class="fa fa-check fa-fw"></i> {$smarty.const.TXT_SI}
                </a>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Confirmar Borrado cuadro -->

<!-- Diálogo Crear panel -->
<div class="modal fade" id="dialogo_crear_panel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h3 class="modal-title" id="myModalLabel">
                    <i class="fa fa-columns fa-fw"></i>
                    <sub class="fa fa-plus fa-fw"></sub> {$smarty.const.TXT_PANEL_CREAR} : {$smarty.const.TXT_PANEL_TIPO}
                </h3>
            </div>
            <div class="modal-body">
                <div class="panel panel-resumen clickable"
                     title="{$smarty.const.TXT_LINEAS}: {$smarty.const.TXT_LINEAS_DESC}"
                     onclick="location.href = 'index.php?page=panel_linea&id_cuadro={$cuadro->id}&id_entidad={$entidad->id}';">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-1">
                                <i class="fa fa-line-chart fa-2x"></i>
                            </div>
                            <div class="col-xs-11">
                                <strong>{$smarty.const.TXT_LINEAS}:</strong> {$smarty.const.TXT_LINEAS_DESC}
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.panel -->
                <div class="panel panel-resumen clickable"
                     title="{$smarty.const.TXT_BARRAS}: {$smarty.const.TXT_BARRAS_DESC}"
                     onclick="location.href = 'index.php?page=panel_barra&id_cuadro={$cuadro->id}&id_entidad={$entidad->id}';">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-1">
                                <i class="fa fa-bar-chart fa-2x"></i>
                            </div>
                            <div class="col-xs-11">
                                <strong>{$smarty.const.TXT_BARRAS}:</strong> {$smarty.const.TXT_BARRAS_DESC}
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.panel -->
                <div class="panel panel-resumen clickable"
                     title="{$smarty.const.TXT_MIXTO}: {$smarty.const.TXT_MIXTO_DESC}"
                     onclick="location.href = 'index.php?page=panel_mixto&id_cuadro={$cuadro->id}&id_entidad={$entidad->id}';">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-1">
                                <span class="fa-stack fa-1x">
                                    <i class="fa fa-line-chart fa-stack-2x"></i>
                                    <i class="fa fa-bar-chart fa-stack-2x"></i>
                                </span>
                            </div>
                            <div class="col-xs-11">
                                <strong>{$smarty.const.TXT_MIXTO}:</strong> {$smarty.const.TXT_MIXTO_DESC}
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.panel -->
                <div class="panel panel-resumen clickable"
                     title="{$smarty.const.TXT_TARTA}: {$smarty.const.TXT_TARTA_DESC}"
                     onclick="location.href = 'index.php?page=panel_tarta&id_cuadro={$cuadro->id}&id_entidad={$entidad->id}';">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-1">
                                <i class="fa fa-pie-chart fa-2x"></i>
                            </div>
                            <div class="col-xs-11">
                                <strong>{$smarty.const.TXT_TARTA}:</strong> {$smarty.const.TXT_TARTA_DESC}
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.panel -->
                <div class="panel panel-resumen clickable"
                     title="{$smarty.const.TXT_TABLA}: {$smarty.const.TXT_TABLA_DESC}"
                     onclick="location.href = 'index.php?page=panel_tabla&id_cuadro={$cuadro->id}&id_entidad={$entidad->id}';">
                    <div class="panel-heading">
                        <div class="row">
                            <div class="col-xs-1">
                                <i class="fa fa-table fa-2x"></i>
                            </div>
                            <div class="col-xs-11">
                                <strong>{$smarty.const.TXT_TABLA}:</strong> {$smarty.const.TXT_TABLA_DESC}
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.panel -->
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_CANCEL}" class="btn btn-danger" data-dismiss="modal"><i
                            class="fa fa-times fa-fw"></i> {$smarty.const.TXT_CANCEL}</button>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Crear panel -->

<!-- Diálogo Confirmar Borrado panel -->
<div class="modal fade" id="dialogo_borrado_panel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h3 class="modal-title" id="myModalLabel">
                    <i class="fa fa-trash fa-fw"></i> {$smarty.const.TXT_PANEL_BORRAR}: <span id="nombre_panel"></span>
                </h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_PANEL_BORRAR}</p>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_NO}" class="btn btn-default btn-danger" data-dismiss="modal">
                    <i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_NO}
                </button>
                <a title="{$smarty.const.TXT_SI}" class="btn btn-default btn-success" id="borrar">
                    <i class="fa fa-check fa-fw"></i> {$smarty.const.TXT_SI}
                </a>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Confirmar Borrado panel -->

<!-- Diálogo Notificar Borrado panel -->
<div class="modal fade" id="dialogo_notificar_borrado_panel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h3 class="modal-title" id="myModalLabel">
                    <i class="fa fa-trash fa-fw"></i> {$smarty.const.TXT_PANEL_BORRAR}: <span id="nombre_panel_borrado"></span>
                </h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_PANEL_BORRADO}</p>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_BTN_ACEPTAR}" class="btn btn-primary" data-dismiss="modal">
                    <i class="fa fa-check fa-fw"></i> {$smarty.const.TXT_BTN_ACEPTAR}
                </button>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Notificar Borrado panel -->

<!-- Diálogo Carga de Paneles -->
<div class="modal fade" id="dialogo_cargando_paneles" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h3 class="modal-title" id="myModalLabel"><i class="fa fa-th fa-fw"></i> {$_nombre_pagina}</h3>
            </div>
            <div class="modal-body">
                <h4 class="text-center"><i class='fa fa-spinner fa-pulse'></i> {$smarty.const.MSG_PANEL_CARGANDO}</h4>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Carga de Paneles -->

<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <div id="nombre_cuadro" title="{$_nombre_pagina}" class="page-header" data-id_unidad="{$entidad->id}"
            data-nombre_unidad="{$entidad->etiqueta}" data-panel_vacio="{$smarty.const.MSG_PANEL_NO_VAL}">
            <div class="row">
                <div class="col-md-10">
                    <i class="fa fa-th fa-fw"></i> {$_nombre_pagina}
                </div>
                <!-- /.col-md-10 -->
                <!-- Navegación -->
                {if count($cuadros)> 1 && !$cuadro->privado}
                    <div class="col-md-2">
                        <div style="font-size:10px">{$indice+1} {$smarty.const.TXT_DE} {count($cuadros)} {$smarty.const.FIELD_CUADROS_MANDO}</div>
                        <div class="btn-toolbar" role="toolbar" aria-label="">
                            <div class="btn-group" role="group" aria-label="">
                                <a title="{$smarty.const.TXT_PRIMER} {$smarty.const.FIELD_CUADRO_MANDO}"
                                   class="btn btn-danger btn-xs {if $indice == 0}disabled{/if}"
                                   href='?page=cuadro_mostrar&id_entidad={$entidad->id}&id_cuadro={$cuadros[0]->id}'>
                                    <i class="fa fa-step-backward fa-fw"></i>
                                </a>
                                <a title="{$smarty.const.TXT_ANT} {$smarty.const.FIELD_CUADRO_MANDO}"
                                   class="btn btn-danger btn-xs {if $indice == 0}disabled{/if}"
                                   href='{if $indice > 0}index.php?page=cuadro_mostrar&id_entidad={$entidad->id}&id_cuadro={$cuadros[$indice-1]->id}{/if}'>
                                    <i class="fa fa-play fa-rotate-180 fa-fw"></i>
                                </a>
                                <a title="{$smarty.const.TXT_SIG} {$smarty.const.FIELD_CUADRO_MANDO}"
                                   class="btn btn-danger btn-xs {if $indice == (count($cuadros)-1)}disabled{/if}"
                                   href='{if $indice < (count($cuadros)-1)}index.php?page=cuadro_mostrar&id_entidad={$entidad->id}&id_cuadro={$cuadros[$indice+1]->id}{/if}'>
                                    <i class="fa fa-play fa-fw"></i>
                                </a>
                                <a title="{$smarty.const.TXT_ULTIMO} {$smarty.const.FIELD_CUADRO_MANDO}"
                                   class="btn btn-danger btn-xs {if $indice == (count($cuadros)-1)}disabled{/if}"
                                   href='?page=cuadro_mostrar&id_entidad={$entidad->id}&id_cuadro={$cuadros[(count($cuadros)-1)]->id}'>
                                    <i class="fa fa-step-forward fa-fw"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                    <!-- /.col-md-2 -->
                {/if}
                <!-- /Navegación -->
            </div>
            <!-- /.row -->
        </div>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- /Nombre página -->

<!-- Breadcrumbs -->
<div class="row">
    <div class="col-lg-12">
        <ol class="breadcrumb">
            <li><i title="{$smarty.const.TXT_ESTA}" class="fa fa-map-marker fa-fw"></i></li>
            <li><a title="{$smarty.const.FIELD_UNIDS}"
                   href='?page=entidad_listar'>{$smarty.const.FIELD_UNIDS}</a></li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" data-target="#" title="{$entidad->nombre}"
                   href="?page=entidad_mostrar&id_entidad={$entidad->id}">
                    {$entidad->nombre|truncate:30} <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu">
                    <li>
                        <a title="{$smarty.const.FIELD_USER}: {$_usuario->login} - {$smarty.const.TXT_UNID}: {$entidad->nombre} - {$smarty.const.FIELD_ROL}: {$_rol}"
                           href="?page=entidad_mostrar&id_entidad={$entidad->id}"><i
                                    class="fa fa-folder fa-fw"></i> {$entidad->nombre} / <i
                                    class="fa fa-user fa-fw"></i> {$_rol}</a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a title="{$smarty.const.TXT_PLANES_DESCRIPCION}"
                           href='?page=plan_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-book fa-fw"></i> {$smarty.const.FIELD_PLANES} <span
                                    title="{$smarty.const.FIELD_TOTAL}: {$num_planes} {$smarty.const.FIELD_PLANES}">({$num_planes}
                                )</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_CARTAS_DESCRIPCION}"
                           href='?page=carta_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-map-o fa-fw"></i> {$smarty.const.FIELD_CARTAS} <span
                                    title="{$smarty.const.FIELD_TOTAL}: {$num_cartas} {$smarty.const.FIELD_CARTAS}">({$num_cartas}
                                )</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_PROCS_DESCRIPCION}"
                           href='?page=proceso_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-gears fa-fw"></i> {$smarty.const.FIELD_PROCS} <span
                                    title="{$smarty.const.FIELD_TOTAL}: {$num_procesos} {$smarty.const.FIELD_PROCS}">({$num_procesos}
                                )</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_INDICS_DESCRIPCION}"
                           href='?page=indicador_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-dashboard fa-fw"></i> {$smarty.const.FIELD_INDICS}
                            /{$smarty.const.FIELD_DATOS} <span
                                    title="{$smarty.const.FIELD_TOTAL}: {$num_indicadores} {$smarty.const.FIELD_INDICS}/{$smarty.const.FIELD_DATOS}">({$num_indicadores}
                                )</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_CUADRO_MANDO_DESCRIPCION}"
                           href='?page=cuadro_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-th fa-fw"></i> {$smarty.const.FIELD_CUADROS_MANDO} <span
                                    title="{$smarty.const.FIELD_TOTAL}: {$num_cuadros} {$smarty.const.FIELD_CUADROS_MANDO}">({$num_cuadros}
                                )</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_CONSULTA_DESCRIPCION}"
                           href="?page=consulta_avanzada&id_entidad={$entidad->id}">
                            <i class="fa fa-commenting fa-fw"></i> {$smarty.const.TXT_CONSULT}
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_CONTROL_DESCRIPCION}"
                           href="?page=control&modulo=inicio&id_entidad={$entidad->id}">
                            <i class="fa fa-sliders fa-fw"></i> {$smarty.const.TXT_CONTROL}
                        </a>
                    </li>
                </ul>
                <!-- /.dropdown-menu -->
            </li>
            <!-- /.dropdown -->
            <li><a title="{$smarty.const.FIELD_CUADROS_MANDO}"
                   href='?page=cuadro_listar&id_entidad={$entidad->id}'>{$smarty.const.FIELD_CUADROS_MANDO}</a>
            </li>
            <li title="{$_nombre_pagina}" class="active">{$_nombre_pagina}</li>
        </ol>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- /Breadcrumbs -->

<!-- Barra de botones -->
{if $cuadro->id_usuario == $_usuario->id || $_control}
    <div class="row">
        <div class="col-lg-12">
            <div class="btn-toolbar" role="toolbar" aria-label="">
                <div class="btn-group" role="group" aria-label="">
                    <a class="btn btn-default btn-danger" title="{$smarty.const.TXT_PANEL_CREAR}"
                       href='javascript:void(0)' data-toggle="modal" data-target="#dialogo_crear_panel">
                        <i class="fa fa-columns fa-fw"></i><sub class="fa fa-plus fa-fw"></sub> {$smarty.const.TXT_PANEL_CREAR}</a>
                </div>
                <div class="btn-group pull-right" role="group" aria-label="">
                    <a class="btn btn-default btn-danger" title="{$smarty.const.TXT_CUADRO_EDIT}"
                       href='?page=cuadro_editar&id_cuadro={$cuadro->id}&id_entidad={$entidad->id}'>
                        <i class="fa fa-th fa-fw"></i><sub class="fa fa-pencil fa-fw"></sub></a>
                    <a class="btn btn-default btn-danger" title="{$smarty.const.TXT_CUADRO_BORRAR}"
                       href='javascript:void(0)' data-toggle="modal" data-target="#dialogo_confirmar_borrado">
                        <i class="fa fa-trash fa-fw"></i></a>
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
<div id="paneles" data-num_paneles="{$paneles|@count}">
    {if $paneles}
    {$cuenta=0}
    {foreach $paneles as $panel}
    {*Si la cuenta es impar y el panel es ancho*}
    {if ($cuenta +1)%2==0 && $panel->ancho>6}
    {$cuenta=$cuenta+1}
</div>
    {/if}
    {*Creamos una fila al empezar, cada dos paneles normales o si es grande*}
    {if $cuenta%2==0}
    <div class="row">
    {/if}
    <div class="col-lg-{$panel->ancho}">
        <div class="panel panel-red">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-xs-8">
                        <span title="{$smarty.const.FIELD_ORDEN}" class="badge">{$panel->orden}</span>
                        <strong>
                            {if $panel->id_paneltipo == 2}
                                <i class="fa fa-line-chart fa-fw"></i>
                            {elseif $panel->id_paneltipo == 3}
                                <i class="fa fa-pie-chart fa-fw"></i>
                            {elseif $panel->id_paneltipo == 4}
                                <span class="fa-stack fa-1x">
                                            <i class="fa fa-line-chart fa-stack-1x"></i>
                                            <i class="fa fa-bar-chart fa-stack-1x"></i>
                                        </span>
                            {elseif $panel->id_paneltipo == 6}
                                <i class="fa fa-table fa-fw"></i>
                            {elseif $panel->id_paneltipo == 7}
                                <i class="fa fa-bar-chart fa-fw"></i>
                            {/if} {$panel->nombre}
                        </strong>
                    </div>
                    <!-- /.col-xs-8 -->
                    <div class="col-xs-4">
                        <div class="btn-toolbar pull-right" role="group" aria-label="">
                            {* Sólo paneles que no sean de tipo tabla*}
                            {if $panel->id_paneltipo != 6}
                                <button type="button" title="{$smarty.const.TXT_PANEL_INDICS}"
                                        class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown"
                                        aria-haspopup="true" aria-expanded="false">
                                    <i class="fa fa-dashboard fa-fw"></i> <i class="fa fa-caret-down"></i>
                                </button>
                                <ul id="panel_indics_{$panel->id}" class="dropdown-menu"></ul>
                            {/if}
                            {if $_usuario->id eq $cuadro->id_usuario || $_control}
                                <a class="btn btn-default btn-xs"
                                   title="{$smarty.const.TXT_EDIT}"
                                   href="?page=panel_editar&id_panel={$panel->id}&id_entidad={$entidad->id}">
                                    <i class="fa fa-pencil fa-fw"></i>
                                </a>
                                <a class="btn btn-default btn-xs"
                                   title="{$smarty.const.TXT_BORRAR}"
                                   data-id_panel="{$panel->id}"
                                   data-nombre_panel="{$panel->nombre}"
                                   href='javascript:void(0)'
                                   data-toggle="modal"
                                   data-target="#dialogo_borrado_panel">
                                    <i class="fa fa-trash fa-fw"></i>
                                </a>
                        {/if}
                    </div>
                </div>
                <!-- /.col-xs-4 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-xs-12">
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
                 data-titulo_panel="{$panel->nombre}"
                 data-id_medicion="{$panel->id_medicion}"
                 data-anyos_atras="{$panel->anyos_atras}"
                 data-anyo_inicio="{$panel->anyo_inicio}"
                 data-anyo_fin="{$panel->anyo_fin}"
                 data-periodicidad="{$panel->periodicidad}">
            </div>
        </div>
        <!-- /.panel-body -->
    </div>
    <!-- /.panel -->
</div>
<!-- /.col-lg-{$panel->ancho} -->
{*Cerramos la fila cada dos paneles normales si el panel
es grande y al terminar*}
    {if ($cuenta +1)%2==0 || $panel@last || $panel->ancho>6}
        </div>
    {/if}
    {*Incrementamos la cuenta en función del ancho del panel*}
    {if $panel->ancho>6}
        {$cuenta = $cuenta+2}
    {else}
        {$cuenta = $cuenta+1}
    {/if}
    {/foreach}
{/if}
<!-- /Paneles -->
