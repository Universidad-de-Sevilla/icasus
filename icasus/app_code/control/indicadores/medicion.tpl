<!-- Diálogo Valor fuera del intervalo -->
<div class="modal fade" id="dialogo_valor_intervalo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h3 class="modal-title" id="myModalLabel"><i class="fa fa-hourglass fa-fw"></i><sub
                            class="fa fa-pencil fa-fw"></sub> {$smarty.const.TXT_MED_VER}: {$medicion->etiqueta}</h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_MED_VAL_INTERVALO} <span id="intervalo"></span></p>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_BTN_ACEPTAR}" class="btn btn-primary"
                        data-dismiss="modal"><i class="fa fa-check fa-fw"></i> {$smarty.const.TXT_BTN_ACEPTAR}</button>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Valor fuera del intervalo -->

<!-- Diálogo Valor fuera de período -->
<div class="modal fade" id="dialogo_valor_periodo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h3 class="modal-title" id="myModalLabel"><i class="fa fa-hourglass fa-fw"></i><sub
                            class="fa fa-pencil fa-fw"></sub> {$smarty.const.TXT_MED_VER}: {$medicion->etiqueta}</h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_MED_VAL_NO_PERIODO} <span id="periodo"></span></p>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_BTN_ACEPTAR}" class="btn btn-primary"
                        data-dismiss="modal"><i class="fa fa-check fa-fw"></i> {$smarty.const.TXT_BTN_ACEPTAR}</button>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Valor fuera de período -->

<!-- Diálogo Validar Valores de Referencia -->
<div class="modal fade" id="dialogo_valor_referencia" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h3 class="modal-title" id="myModalLabel"><i class="fa fa-hourglass fa-fw"></i><sub
                            class="fa fa-pencil fa-fw"></sub> {$smarty.const.TXT_MED_VER}: {$medicion->etiqueta}</h3>
            </div>
            <div class="modal-body">
                <div class="alert alert-danger"><i
                            class="fa fa-exclamation-circle fa-fw"></i> {$smarty.const.MSG_VAL_REF_NO_VALIDO}
                    {if $indicador->inverso}
                    ({$smarty.const.TXT_DESCENDENTE})
                    {else}
                    ({$smarty.const.TXT_ASCENDENTE})
                    {/if}.
                </div>
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>{$smarty.const.FIELD_ESTIMACION}</th>
                            <th>{$smarty.const.FIELD_VAL_REF}</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr {if !$indicador->inverso}class="success"{/if}>
                            <td>{$smarty.const.TXT_ASCENDENTE}</td>
                            <td><span class="label label-danger">{$smarty.const.FIELD_LIMITE}</span><i
                                        class="fa fa-angle-left fa-fw"></i><span
                                        class="label label-success">{$smarty.const.FIELD_META}</span></td>
                        </tr>
                        <tr {if $indicador->inverso}class="success"{/if}>
                            <td>{$smarty.const.TXT_DESCENDENTE}</td>
                            <td><span class="label label-danger">{$smarty.const.FIELD_LIMITE}</span><i
                                        class="fa fa-angle-right fa-fw"></i><span
                                        class="label label-success">{$smarty.const.FIELD_META}</span></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_BTN_ACEPTAR}" class="btn btn-primary"
                        data-dismiss="modal"><i class="fa fa-check fa-fw"></i> {$smarty.const.TXT_BTN_ACEPTAR}</button>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Validar Valores de Referencia -->

<!-- Diálogo Valor no numérico -->
<div class="modal fade" id="dialogo_valor_num" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h3 class="modal-title" id="myModalLabel"><i class="fa fa-hourglass fa-fw"></i><sub
                            class="fa fa-pencil fa-fw"></sub> {$smarty.const.TXT_MED_VER}: {$medicion->etiqueta}</h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_MED_VAL_NOMUM}</p>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_BTN_ACEPTAR}" class="btn btn-primary"
                        data-dismiss="modal"><i class="fa fa-check fa-fw"></i> {$smarty.const.TXT_BTN_ACEPTAR}</button>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Valor no numérico -->

<!-- Diálogo Valor nulo -->
<div class="modal fade" id="dialogo_valor_nulo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h3 class="modal-title" id="myModalLabel"><i class="fa fa-hourglass fa-fw"></i><sub
                            class="fa fa-pencil fa-fw"></sub> {$smarty.const.TXT_MED_VER}: {$medicion->etiqueta}</h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_MED_VAL_NULO}</p>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_BTN_ACEPTAR}" class="btn btn-primary"
                        data-dismiss="modal"><i class="fa fa-check fa-fw"></i> {$smarty.const.TXT_BTN_ACEPTAR}</button>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Valor nulo -->

<!-- Diálogo Etiqueta nula -->
<div class="modal fade" id="dialogo_etiqueta_nula" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h3 class="modal-title" id="myModalLabel"><i class="fa fa-hourglass fa-fw"></i><sub
                            class="fa fa-pencil fa-fw"></sub> {$smarty.const.TXT_MED_VER}: {$medicion->etiqueta}</h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_MED_ETIQUETA_NULA}</p>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_BTN_ACEPTAR}" class="btn btn-primary"
                        data-dismiss="modal"><i class="fa fa-check fa-fw"></i> {$smarty.const.TXT_BTN_ACEPTAR}</button>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Etiqueta nula -->

<!-- Diálogo Confirmar Borrado -->
<div class="modal fade" id="dialogo_confirmar_borrado" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h3 class="modal-title" id="myModalLabel"><i
                            class="fa fa-trash fa-fw"></i> {$smarty.const.TXT_MED_BORRAR}: {$medicion->etiqueta}</h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_MED_CONFIRM_BORRAR}</p>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_NO}" class="btn btn-danger" data-dismiss="modal"><i
                            class="fa fa-times fa-fw"></i> {$smarty.const.TXT_NO}</button>
                <a title="{$smarty.const.TXT_SI}" class="btn btn-success" name="borrar" id="borrar"
                   href='index.php?page=medicion_borrar&id_medicion={$medicion->id}&id_entidad={$indicador->id_entidad}'><i
                            class="fa fa-check fa-fw"></i> {$smarty.const.TXT_SI}</a>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Confirmar Borrado -->

<!-- Diálogo Confirmar Restaurar -->
<div class="modal fade" id="dialogo_confirmar_restaurar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h3 class="modal-title" id="myModalLabel"><i
                            class="fa fa-recycle fa-fw"></i> {$smarty.const.TXT_INDIC_RESTAURAR}: {$indicador->nombre}
                </h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_INDIC_CONFIRM_RESTAURAR}</p>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_NO}" class="btn btn-danger" data-dismiss="modal"><i
                            class="fa fa-times fa-fw"></i> {$smarty.const.TXT_NO}</button>
                <a title="{$smarty.const.TXT_SI}" class="btn btn-success" name="borrar" id="borrar"
                   href='index.php?page=indicador_archivar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}&modulo=restaurar'><i
                            class="fa fa-check fa-fw"></i> {$smarty.const.TXT_SI}</a>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Confirmar Restaurar -->

<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <div class="page-header">
            <div class="row">
                <div class="col-md-10">
                    <i class="fa fa-hourglass fa-fw"></i> {$_nombre_pagina}
                </div>
                <!-- /.col-md-10 -->
                <!-- Navegación -->
                {if count($mediciones)> 1}
                    <div class="col-md-2">
                        <div style="font-size:10px">{$indice+1} {$smarty.const.TXT_DE} {count($mediciones)} {$smarty.const.FIELD_MEDICIONES}</div>
                        <div class="btn-toolbar" role="toolbar" aria-label="">
                            <div class="btn-group" role="group" aria-label="">
                                <a title="{$smarty.const.TXT_PRIMER} {$smarty.const.FIELD_MED}"
                                   class="btn btn-danger btn-xs {if $indice == 0}disabled{/if}"
                                   href='index.php?page=medicion&id_entidad={$entidad->id}&id_medicion={$mediciones[0]->id}'>
                                    <i class="fa fa-step-backward fa-fw"></i>
                                </a>
                                {if count($mediciones) > 2}
                                    <a title="{$smarty.const.TXT_ANT} {$smarty.const.FIELD_MED}"
                                       class="btn btn-danger btn-xs {if $indice == 0}disabled{/if}"
                                       href='index.php?page=medicion&id_entidad={$entidad->id}&id_medicion={$mediciones[$indice-1]->id}'>
                                        <i class="fa fa-play fa-rotate-180 fa-fw"></i>
                                    </a>
                                    <a title="{$smarty.const.TXT_SIG} {$smarty.const.FIELD_MED}"
                                       class="btn btn-danger btn-xs {if $indice == (count($mediciones)-1)}disabled{/if}"
                                       href='index.php?page=medicion&id_entidad={$entidad->id}&id_medicion={$mediciones[$indice+1]->id}'>
                                        <i class="fa fa-play fa-fw"></i>
                                    </a>
                                {/if}
                                <a title="{$smarty.const.TXT_ULTIMO} {$smarty.const.FIELD_MED}"
                                   class="btn btn-danger btn-xs {if $indice == (count($mediciones)-1)}disabled{/if}"
                                   href='index.php?page=medicion&id_entidad={$entidad->id}&id_medicion={$mediciones[(count($mediciones)-1)]->id}'>
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
            <i title="{$smarty.const.TXT_ESTA}" class="fa fa-map-marker fa-fw"></i>
            <li><a title="{$smarty.const.FIELD_UNIDS}"
                   href='index.php?page=entidad_listar'>{$smarty.const.FIELD_UNIDS}</a></li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" data-target="#" title="{$entidad->nombre}"
                   href="index.php?page=entidad_mostrar&id_entidad={$entidad->id}">
                    {$entidad->nombre|truncate:30} <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu">
                    <li>
                        <a title="{$smarty.const.FIELD_USER}: {$_usuario->login} - {$smarty.const.TXT_UNID}: {$entidad->nombre} - {$smarty.const.FIELD_ROL}: {$_rol}"
                           href="index.php?page=entidad_mostrar&id_entidad={$entidad->id}"><i
                                    class="fa fa-folder fa-fw"></i> {$entidad->nombre} / <i
                                    class="fa fa-user fa-fw"></i> {$_rol}</a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a title="{$smarty.const.TXT_PLANES_DESCRIPCION}"
                           href='index.php?page=plan_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-book fa-fw"></i> {$smarty.const.FIELD_PLANES} <span
                                    title="{$smarty.const.FIELD_TOTAL}: {$num_planes} {$smarty.const.FIELD_PLANES}">({$num_planes}
                                )</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_CARTAS_DESCRIPCION}"
                           href='index.php?page=carta_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-map-o fa-fw"></i> {$smarty.const.FIELD_CARTAS} <span
                                    title="{$smarty.const.FIELD_TOTAL}: {$num_cartas} {$smarty.const.FIELD_CARTAS}">({$num_cartas}
                                )</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_PROCS_DESCRIPCION}"
                           href='index.php?page=proceso_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-gears fa-fw"></i> {$smarty.const.FIELD_PROCS} <span
                                    title="{$smarty.const.FIELD_TOTAL}: {$num_procesos} {$smarty.const.FIELD_PROCS}">({$num_procesos}
                                )</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_INDICS_DESCRIPCION}"
                           href='index.php?page=indicador_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-dashboard fa-fw"></i> {$smarty.const.FIELD_INDICS}
                            /{$smarty.const.FIELD_DATOS} <span
                                    title="{$smarty.const.FIELD_TOTAL}: {$num_indicadores} {$smarty.const.FIELD_INDICS}/{$smarty.const.FIELD_DATOS}">({$num_indicadores}
                                )</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_CUADRO_MANDO_DESCRIPCION}"
                           href='index.php?page=cuadro_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-th fa-fw"></i> {$smarty.const.FIELD_CUADROS_MANDO} <span
                                    title="{$smarty.const.FIELD_TOTAL}: {$num_cuadros} {$smarty.const.FIELD_CUADROS_MANDO}">({$num_cuadros}
                                )</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_CONSULTA_DESCRIPCION}"
                           href="index.php?page=consulta_avanzada&id_entidad={$entidad->id}">
                            <i class="fa fa-commenting fa-fw"></i> {$smarty.const.TXT_CONSULT}
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_CONTROL_DESCRIPCION}"
                           href="index.php?page=control&modulo=inicio&id_entidad={$entidad->id}">
                            <i class="fa fa-sliders fa-fw"></i> {$smarty.const.TXT_CONTROL}
                        </a>
                    </li>
                </ul>
                <!-- /.dropdown-menu -->
            </li>
            <!-- /.dropdown -->
            {if $indicador->id_proceso}
                <li>
                    <a title="{$smarty.const.FIELD_PROCS}"
                       href='index.php?page=proceso_listar&id_entidad={$entidad->id}'>{$smarty.const.FIELD_PROCS}</a>
                </li>
                <li>
                    <a title="{$proceso->nombre}"
                       href='index.php?page=proceso_mostrar&id_proceso={$proceso->id}&id_entidad={$entidad->id}'>{$proceso->nombre|truncate:30}</a>
                </li>
            {else}
                <li>
                    <a title="{$smarty.const.FIELD_INDICS}/{$smarty.const.FIELD_DATOS}"
                       href='index.php?page=indicador_listar&id_entidad={$entidad->id}'>{$smarty.const.FIELD_INDICS}
                        /{$smarty.const.FIELD_DATOS}</a>
                </li>
            {/if}
            <li><a title="{$smarty.const.FIELD_MEDICIONES}: {$indicador->nombre}"
                   href='index.php?page=medicion_listar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>{$smarty.const.FIELD_MEDICIONES}
                    : {$indicador->nombre|truncate:30}</a></li>
            <li title="{$_nombre_pagina}" class="active">{$_nombre_pagina}</li>
        </ol>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- /Breadcrumbs -->

<div class="row">
    <div class="col-lg-12">
        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active">
                <a id="tab_med_datos" href="#med_datos" title="{$smarty.const.TXT_FICHA}"
                   aria-controls="{$smarty.const.TXT_FICHA}" role="tab" data-toggle="tab"><i
                            class="fa fa-folder fa-fw"></i> {$smarty.const.TXT_FICHA}</a>
            </li>
            <li role="presentation">
                <a href="#med_valores" title="{$smarty.const.TXT_VALS}" aria-controls="{$smarty.const.TXT_VALS}"
                   role="tab" data-toggle="tab"><i class="fa fa-tags fa-fw"></i> {$smarty.const.TXT_VALS}</a>
            </li>
            <li class="pull-right">
                <div class="btn-toolbar" role="toolbar" aria-label="">
                    <div class="btn-group" role="group" aria-label="">
                        <a title="{$smarty.const.FIELD_MEDICIONES}" class="btn btn-default"
                           href='index.php?page=medicion_listar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                            <i class="fa fa-hourglass fa-fw"></i>
                        </a>
                        {if $permiso_editar}
                            <a title="{$smarty.const.TXT_VAL_EDIT}" class="btn btn-default"
                               href='index.php?page=valores&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                                <i class="fa fa-pencil-square-o fa-fw"></i>
                            </a>
                        {/if}
                    </div>
                    <div class="btn-group" role="group" aria-label="">
                        {if $permiso_editar}
                            <a class="btn btn-default {if $indicador->archivado}disabled{/if}"
                               title="{$smarty.const.TXT_MED_BORRAR}" href='javascript:void(0)' data-toggle="modal"
                               data-target="#dialogo_confirmar_borrado">
                                <i class="fa fa-trash fa-fw"></i>
                            </a>
                        {/if}
                    </div>
                </div>
            </li>
        </ul>
        <!-- /Nav tabs -->
        <br>
        <!-- Tab panes -->
        <div class="tab-content">

            <!-- Indicadores archivados -->
            {if $indicador->archivado}
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-danger">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-sm-10">
                                        <span class="panel-title">
                                            <i class="fa fa-archive fa-fw"></i> {$smarty.const.TXT_INDIC_ARCHIVADO}
                                        </span>
                                    </div>
                                    <!-- /.col-sm-10 -->
                                    <div class="col-sm-2">
                                        {if $permiso_editar}
                                            <a title="{$smarty.const.TXT_INDIC_RESTAURAR}"
                                               class="btn btn-danger pull-right" href='javascript:void(0)'
                                               data-toggle="modal" data-target="#dialogo_confirmar_restaurar">
                                                <i class="fa fa-recycle fa-fw"></i>
                                            </a>
                                        {/if}
                                    </div>
                                    <!-- /.col-sm-2 -->
                                </div>
                                <!-- /.row -->
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-hover">
                                        <tbody>
                                        <tr>
                                            <th>{$smarty.const.FIELD_CREAC}</th>
                                            <td>{$indicador->fecha_creacion|date_format:"%d-%m-%Y"}</td>
                                        </tr>
                                        <tr>
                                            <th>{$smarty.const.FIELD_ARCHIVADO}</th>
                                            <td>{$indicador->archivado|date_format:"%d-%m-%Y"}</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!-- /.panel-body -->
                        </div>
                        <!-- /.panel -->
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
            {/if}
            <!-- /Indicadores archivados -->

            <!-- Indicadores calculados -->
            {if $indicador->calculo}
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <span class="panel-title"><i
                                            class="fa fa-info-circle fa-fw"></i> {$smarty.const.TXT_CALC_AUTO}</span>
                                <i class="fa fa-chevron-down pull-right clickable panel-collapsed"></i>
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body" style="display: none">
                                {$smarty.const.TXT_DEPENDE}
                                <div class="table-responsive">
                                    <table class="table table-striped table-hover">
                                        <tr>
                                            <th>{$smarty.const.FIELD_ID}</th>
                                            <th>{$smarty.const.FIELD_NOMBRE}</th>
                                        </tr>
                                        {foreach $indicadores_influyentes as $indicador_influyente}
                                            <tr>
                                                <td><span class="badge">{$indicador_influyente->id}</span></td>
                                                <td>
                                                    <a class="btn btn-info"
                                                       href='index.php?page=indicador_mostrar&id_indicador={$indicador_influyente->id}&id_entidad={$indicador_influyente->id_entidad}'
                                                       title="{$smarty.const.TXT_FICHA}: {$indicador_influyente->nombre}">
                                                        <i class="fa fa-dashboard fa-fw"></i>{if $indicador_influyente->id_proceso}
                                                        <sub class="fa fa-gear fa-fw"></sub>{elseif $indicador_influyente->control}
                                                        <sub class="fa fa-sliders fa-fw"></sub>{else}<sub
                                                            class="fa fa-database fa-fw"></sub>{/if} {$indicador_influyente->nombre}
                                                    </a>
                                                </td>
                                            </tr>
                                        {/foreach}
                                        <tr class="info">
                                            <th><i class="fa fa-calculator fa-fw"></i> {$smarty.const.FIELD_FORMULA}
                                            </th>
                                            <td>{$indicador->calculo}</td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <!-- /.panel-body -->
                        </div>
                        <!-- /.panel -->
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
            {/if}
            <!-- /Indicadores calculados -->

            <!-- Indicadores dependientes -->
            {if $indicadores_dependientes}
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-warning">
                            <div class="panel-heading">
                                <span class="panel-title"><i
                                            class="fa fa-exclamation-triangle fa-fw"></i> {$smarty.const.TXT_INDIC_DAT_DEPENDIENTES}</span>
                                <i class="fa fa-chevron-down pull-right clickable panel-collapsed"></i>
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body" style="display: none">
                                {$smarty.const.TXT_INFLUYE}
                                <div class="table-responsive">
                                    <table class="table table-striped table-hover">
                                        <tr>
                                            <th>{$smarty.const.FIELD_ID}</th>
                                            <th>{$smarty.const.FIELD_NOMBRE}</th>
                                        </tr>
                                        {foreach $indicadores_dependientes as $indicador_dependiente}
                                            <tr>
                                                <td><span class="badge">{$indicador_dependiente->id}</span></td>
                                                <td>
                                                    <a class="btn btn-warning"
                                                       href='index.php?page=indicador_mostrar&id_indicador={$indicador_dependiente->id}&id_entidad={$indicador_dependiente->id_entidad}'
                                                       title="{$smarty.const.TXT_FICHA}: {$indicador_dependiente->nombre}">
                                                        <i class="fa fa-dashboard fa-fw"></i>{if $indicador_dependiente->id_proceso}
                                                        <sub class="fa fa-gear fa-fw"></sub>{elseif $indicador_dependiente->control}
                                                        <sub class="fa fa-sliders fa-fw"></sub>{else}<sub
                                                            class="fa fa-database fa-fw"></sub>{/if} {$indicador_dependiente->nombre}
                                                    </a>
                                                </td>
                                            </tr>
                                        {/foreach}
                                    </table>
                                </div>
                            </div>
                            <!-- /.panel-body -->
                        </div>
                        <!-- /.panel -->
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
            {/if}
            <!-- /Indicadores dependientes -->

            <!-- Datos de la medición -->
            <div role="tabpanel" class="tab-pane active" id="med_datos" data-inverso="{$indicador->inverso}">
                <!-- Parámetros de la medición -->
                <div class="col-md-6">
                    <div class="table-responsive">
                        <table class="table table-striped table-hover ficha">
                            <thead>
                            <tr>
                                <th></th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th><i title="{$smarty.const.MSG_CAMPO_REQ}"
                                       class="fa fa-asterisk fa-fw"></i> {$smarty.const.FIELD_ETIQUETA}</th>
                                <td style="white-space:nowrap">
                                    {if $permiso_editar == true && !$indicador->calculo && !$indicador->archivado}
                                        <div>
                                                <span id="et">
                                                    <a href="javascript:void(0)" title="{$smarty.const.TXT_EDIT}"
                                                       onclick="etiqueta_editar('{$medicion->id}', 'et', 'etiqueta');">{if $medicion->etiqueta != NULL}{$medicion->etiqueta}{else}---{/if}</a>
                                                </span>
                                        </div>
                                    {else}
                                        <div>{$medicion->etiqueta}</div>
                                    {/if}
                                </td>
                            </tr>
                            <tr>
                                <th>{$smarty.const.FIELD_OBSERV}</th>
                                <td style="white-space:nowrap">
                                    {if $permiso_editar == true && !$indicador->archivado}
                                        <div>
                                                <span id="ob">
                                                    <a href="javascript:void(0)" title="{$smarty.const.TXT_EDIT}"
                                                       onclick="observaciones_editar('{$medicion->id}', 'ob', 'observaciones');">{if $medicion->observaciones != ''}{$medicion->observaciones}{else}---{/if}</a>
                                                </span>
                                        </div>
                                    {else}
                                        <div>{if $medicion->observaciones != ''}{$medicion->observaciones}{else}---{/if}</div>
                                    {/if}
                                </td>
                            </tr>
                            <tr>
                                <th>{$smarty.const.FIELD_INICIO_PERIODO}</th>
                                <td style="white-space:nowrap">
                                    {if $permiso_editar == true && !$indicador->calculo && !$indicador->archivado}
                                        <div>
                                                <span id="pi">
                                                    <a href="javascript:void(0)" title="{$smarty.const.TXT_EDIT}"
                                                       onclick="fecha_editar('{$medicion->id}', 'pi');">
                                                        {if $medicion->periodo_inicio}
                                                            {$medicion->periodo_inicio|date_format:"%d-%m-%Y"}
                                                        {else}
                                                            ---
                                                        {/if}
                                                    </a>
                                                </span>
                                        </div>
                                    {else}
                                        <div>{$medicion->periodo_inicio|date_format:"%d-%m-%Y"}</div>
                                    {/if}
                                </td>
                            </tr>
                            <tr>
                                <th>{$smarty.const.FIELD_FIN_PERIODO}</th>
                                <td style="white-space:nowrap">
                                    {if $permiso_editar == true && !$indicador->calculo && !$indicador->archivado}
                                        <div>
                                                <span id="pf">
                                                    <a href="javascript:void(0)" title="{$smarty.const.TXT_EDIT}"
                                                       onclick="fecha_editar('{$medicion->id}', 'pf');">
                                                        {if $medicion->periodo_fin}
                                                            {$medicion->periodo_fin|date_format:"%d-%m-%Y"}
                                                        {else}
                                                            ---
                                                        {/if}
                                                    </a>
                                                </span>
                                        </div>
                                    {else}
                                        <div>{$medicion->periodo_fin|date_format:"%d-%m-%Y"}</div>
                                    {/if}
                                </td>
                            </tr>
                            <tr>
                                <th>{$smarty.const.FIELD_INICIO_GRABACION}</th>
                                <td style="white-space:nowrap">
                                        <span id="gi" data-grabacion_inicio="{$medicion->grabacion_inicio}">
                                            {if ($permiso_unidad || $permiso_proceso || $indicador->id_responsable == $_usuario->id) && !$indicador->calculo && !$indicador->archivado}
                                                <div>
                                                    <a href="javascript:void(0)" title="{$smarty.const.TXT_EDIT}"
                                                       onclick="fecha_editar('{$medicion->id}', 'gi');">
                                                        {if $medicion->grabacion_inicio}
                                                            {$medicion->grabacion_inicio|date_format:"%d-%m-%Y"}
                                                        {else}
                                                            ---
                                                        {/if}
                                                    </a>
                                                </div>

{else}

                                                <div>{$medicion->grabacion_inicio|date_format:"%d-%m-%Y"}</div>
                                            {/if}
                                        </span>
                                </td>
                            </tr>
                            <tr>
                                <th>{$smarty.const.FIELD_FIN_GRABACION}</th>
                                <td style="white-space:nowrap">
                                        <span id="gf" data-grabacion_fin="{$medicion->grabacion_fin}">
                                            {if ($permiso_unidad || $permiso_proceso || $indicador->id_responsable == $_usuario->id) && !$indicador->calculo && !$indicador->archivado}
                                                <div>
                                                    <a href="javascript:void(0)" title="{$smarty.const.TXT_EDIT}"
                                                       onclick="fecha_editar('{$medicion->id}', 'gf');">
                                                        {if $medicion->grabacion_fin}
                                                            {$medicion->grabacion_fin|date_format:"%d-%m-%Y"}
                                                        {else}
                                                            ---
                                                        {/if}
                                                    </a>
                                                </div>

{else}

                                                <div>{$medicion->grabacion_fin|date_format:"%d-%m-%Y"}</div>
                                            {/if}
                                        </span>
                                </td>
                            </tr>
                            <tr>
                                <th><span class="label label-primary">{$smarty.const.TXT_VAL_REF}</span></th>
                                <td>
                                    <a title="{$smarty.const.TXT_VAL_REF}" class="btn btn-default btn-xs"
                                       href='index.php?page=valor_referencia&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                                        <i class="fa fa-tags fa-fw"></i>
                                    </a>
                                </td>
                            </tr>
                            {if isset($valores_referencia_medicion)}
                                {foreach $valores_referencia_medicion as $valor_referencia_medicion}
                                    {if $valor_referencia_medicion->valor_referencia->activo}
                                        <tr {if strpos($valor_referencia_medicion->valor_referencia->nombre,'mite')}id='limite'
                                            data-limite="{$valor_referencia_medicion->valor|round:"2"}"
                                            {elseif strpos($valor_referencia_medicion->valor_referencia->nombre,'eta')}id='meta'
                                            data-meta="{$valor_referencia_medicion->valor|round:"2"}"{/if} >
                                            <th>
                                                <span class="label {if strpos($valor_referencia_medicion->valor_referencia->nombre,'mite')}label-danger{elseif strpos($valor_referencia_medicion->valor_referencia->nombre,'eta')}label-success{else}label-default{/if}">{$valor_referencia_medicion->valor_referencia->etiqueta}</span>
                                            </th>
                                            <td style="white-space:nowrap">
                                                {if $permiso_unidad && !$indicador->archivado}
                                                    <div>
                                                            <span id="referencia_{$valor_referencia_medicion->id}">
                                                                <a href="javascript:void(0)"
                                                                   title="{$smarty.const.TXT_EDIT}"
                                                                   onclick="referencia_editar('{$valor_referencia_medicion->id}', '{$medicion->id}');">
                                                                    {if $valor_referencia_medicion->valor == NULL}
                                                                        ---
                                                                    {else}
                                                                        {$valor_referencia_medicion->valor|round:"2"}
                                                                    {/if}
                                                                </a>
                                                            </span>
                                                    </div>
                                                {else}
                                                    <div>
                                                        {if $valor_referencia_medicion->valor == NULL}
                                                            ---
                                                        {else}
                                                            {$valor_referencia_medicion->valor|round:"2"}
                                                        {/if}
                                                    </div>
                                                {/if}
                                            </td>
                                        </tr>
                                    {/if}
                                {/foreach}
                            {/if}
                            </tbody>
                        </table>
                        {if !isset($valores_referencia_medicion)}
                            <div class="alert alert-info alert-dismissible">
                                <i class="fa fa-info-circle fa-fw"></i>
                                {$smarty.const.MSG_INDIC_NO_VAL_REF}
                            </div>
                        {/if}
                    </div>
                </div>
                <!-- /.col-md-6 -->
                <!-- /Parámetros de la medición -->
                <!-- Gráfica de tarta -->
                <div class="col-md-6">
                    <div id="grafica">
                        {if $pinta_grafico}
                            <strong class="panel-title"><i class="fa fa-pie-chart fa-fw"></i> {$panel->nombre}</strong>
                            {$smarty.const.TXT_GRAFICO_AUMENTAR}
                            <div id="container"
                                 data-id_indicador="{$indicador->id}"
                                 data-nombre_indicador="{$indicador->nombre}"
                                 data-id_medicion="{$medicion->id}">
                            </div>
                        {else}
                            <div class="alert alert-info alert-dismissible">
                                <i class="fa fa-info-circle fa-fw"></i>
                                {$smarty.const.MSG_VAL_NO_ASIG}
                            </div>
                        {/if}
                    </div>
                </div>
                <!-- /.col-md-6 -->
                <!-- /Gráfica de tarta -->
            </div>
            <!-- /Datos de la medición -->

            <!-- Valores de la medición -->
            <div role="tabpanel" class="tab-pane" id="med_valores">
                {if $valores}
                    <div id="valors" data-valor_min="{$indicador->valor_min}" data-valor_max="{$indicador->valor_max}"
                         class="table-responsive">
                        <table class="table table-striped table-hover" id="tabla_valores">
                            <thead>
                            <tr>
                                <th>{$smarty.const.FIELD_UNID}</th>
                                <th>{$smarty.const.FIELD_VAL}</th>
                                <th>{$smarty.const.FIELD_FECHA_RECOGIDA}</th>
                                <th>{$smarty.const.FIELD_USER_GRABA}</th>
                            </tr>
                            </thead>
                            <tbody>
                            {foreach $valores as $valor}
                                {*El indicador/dato es agregado pero por si el total se introduce manualmente nos cercioramos de no
                                listar la Unidad madre en orden, la pondremos al final*}
                                {if $valor->id_entidad!=$entidad->id && $indicador->id_tipo_agregacion!= 0}
                                    <tr>
                                        <td><span class="label label-primary">{$valor->entidad->etiqueta}</span></td>
                                        <td>
                                            {if $permiso_editar && !$indicador->calculo && $valor->activo && !$indicador->archivado}
                                                <a href="javascript:void(0)" title="{$smarty.const.TXT_EDIT}"
                                                   onclick="fila_editar('{$medicion->id}', '{$valor->id}');">
                                                    {if $valor->valor == NULL}
                                                        ---
                                                    {else}
                                                        {$valor->valor|round:"2"}
                                                    {/if}
                                                </a>
                                            {else}
                                                {if $valor->valor == NULL}
                                                    ---
                                                {else}
                                                    {$valor->valor|round:"2"}
                                                {/if}
                                            {/if}
                                        </td>
                                        <td>{$valor->fecha_recogida|date_format:"%d-%m-%Y"}</td>
                                        <td style="font-size: 12px">{$valor->usuario->nombre} {$valor->usuario->apellidos}</td>
                                    </tr>
                                {/if}
                                {*El indicador/dato es centralizado*}
                                {if $indicador->id_tipo_agregacion== 0}
                                    <tr {if isset($status)}class="{$status}"{/if}>
                                        <th>{$smarty.const.FIELD_TOTAL}: {$valor->entidad->etiqueta}</th>
                                        <td>
                                            {if $permiso_editar && !$indicador->calculo && !$indicador->archivado}
                                                <a href="javascript:void(0)" title="{$smarty.const.TXT_EDIT}"
                                                   onclick="fila_editar('{$medicion->id}', '{$valor->id}');">
                                                    {if $valor->valor!== NULL}
                                                        {if isset($status)}
                                                            {if $status == 'danger'}
                                                                <span title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_MEJORABLE} ({$smarty.const.FIELD_LIMITE}: {$medicion_lim}, {$smarty.const.FIELD_META}: {$medicion_obj})"
                                                                      class="label label-{$status}">{$valor->valor|round:"2"}</span>
                                                            {elseif $status == 'success'}
                                                                <span title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_LOGRADO} ({$smarty.const.FIELD_LIMITE}: {$medicion_lim}, {$smarty.const.FIELD_META}: {$medicion_obj})"
                                                                      class="label label-{$status}">{$valor->valor|round:"2"}</span>
                                                            {else}
                                                                <span title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_ACEPTABLE} ({$smarty.const.FIELD_LIMITE}: {$medicion_lim}, {$smarty.const.FIELD_META}: {$medicion_obj})"
                                                                      class="label label-{$status}">{$valor->valor|round:"2"}</span>
                                                            {/if}
                                                        {else}
                                                            <span class="label label-default">{$total|round:"2"}</span>
                                                        {/if}
                                                    {else}
                                                        ---
                                                    {/if}
                                                </a>
                                            {else}
                                                {if $valor->valor!== NULL}
                                                    {if isset($status)}
                                                        {if $status == 'danger'}
                                                            <span title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_MEJORABLE} ({$smarty.const.FIELD_LIMITE}: {$medicion_lim}, {$smarty.const.FIELD_META}: {$medicion_obj})"
                                                                  class="label label-{$status}">{$valor->valor|round:"2"}</span>
                                                        {elseif $status == 'success'}
                                                            <span title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_LOGRADO} ({$smarty.const.FIELD_LIMITE}: {$medicion_lim}, {$smarty.const.FIELD_META}: {$medicion_obj})"
                                                                  class="label label-{$status}">{$valor->valor|round:"2"}</span>
                                                        {else}
                                                            <span title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_ACEPTABLE} ({$smarty.const.FIELD_LIMITE}: {$medicion_lim}, {$smarty.const.FIELD_META}: {$medicion_obj})"
                                                                  class="label label-{$status}">{$valor->valor|round:"2"}</span>
                                                        {/if}
                                                    {else}
                                                        <span class="label label-default">{$total|round:"2"}</span>
                                                    {/if}
                                                {else}
                                                    ---
                                                {/if}
                                            {/if}
                                        </td>
                                        <td>{$valor->fecha_recogida|date_format:"%d-%m-%Y"}</td>
                                        <td style="font-size: 12px">{$valor->usuario->nombre} {$valor->usuario->apellidos}</td>
                                    </tr>
                                {/if}
                            {/foreach}
                            </tbody>
                            <tfoot>
                            <!-- TOTALES -->
                            {*El indicador/dato es agregado y su total no se introduce manualmente*}
                            {if $indicador->id_tipo_agregacion!= 0 && $indicador->id_tipo_agregacion!= 4}
                                <tr {if isset($status)}class="{$status}"{/if}>
                                    <th>{$smarty.const.FIELD_TOTAL}: {$entidad->etiqueta} ({$agregacion})</th>
                                    <td>
                                        {if $total!== NULL}
                                            {if isset($status)}
                                                {if $status == 'danger'}
                                                    <span title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_MEJORABLE} ({$smarty.const.FIELD_LIMITE}: {$medicion_lim}, {$smarty.const.FIELD_META}: {$medicion_obj})"
                                                          class="label label-{$status}">{$total|round:"2"}</span>
                                                {elseif $status == 'success'}
                                                    <span title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_LOGRADO} ({$smarty.const.FIELD_LIMITE}: {$medicion_lim}, {$smarty.const.FIELD_META}: {$medicion_obj})"
                                                          class="label label-{$status}">{$total|round:"2"}</span>
                                                {else}
                                                    <span title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_ACEPTABLE} ({$smarty.const.FIELD_LIMITE}: {$medicion_lim}, {$smarty.const.FIELD_META}: {$medicion_obj})"
                                                          class="label label-{$status}">{$total|round:"2"}</span>
                                                {/if}
                                            {else}
                                                <span class="label label-default">{$total|round:"2"}</span>
                                            {/if}
                                        {else}
                                            ---
                                        {/if}
                                    </td>
                                    <td>---</td>
                                    <td>---</td>
                                </tr>
                            {/if}
                            {*El indicador/dato es agregado y su total se introduce manualmente*}
                            {if $indicador->id_tipo_agregacion!= 0 && $indicador->id_tipo_agregacion== 4}
                                {foreach $valores as $valor}
                                    {if $valor->id_entidad==$entidad->id}
                                        <tr {if isset($status)}class="{$status}"{/if}>
                                            <th>{$smarty.const.FIELD_TOTAL}: {$entidad->etiqueta} ({$agregacion})</th>
                                            <td>
                                                {if $permiso_editar && !$indicador->calculo && !$indicador->archivado}
                                                    <a href="javascript:void(0)" title="{$smarty.const.TXT_EDIT}"
                                                       onclick="fila_editar('{$medicion->id}', '{$valor->id}');">
                                                        {if $valor->valor!== NULL}
                                                            {if isset($status)}
                                                                {if $status == 'danger'}
                                                                    <span title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_MEJORABLE} ({$smarty.const.FIELD_LIMITE}: {$medicion_lim}, {$smarty.const.FIELD_META}: {$medicion_obj})"
                                                                          class="label label-{$status}">{$valor->valor|round:"2"}</span>
                                                                {elseif $status == 'success'}
                                                                    <span title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_LOGRADO} ({$smarty.const.FIELD_LIMITE}: {$medicion_lim}, {$smarty.const.FIELD_META}: {$medicion_obj})"
                                                                          class="label label-{$status}">{$valor->valor|round:"2"}</span>
                                                                {else}
                                                                    <span title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_ACEPTABLE} ({$smarty.const.FIELD_LIMITE}: {$medicion_lim}, {$smarty.const.FIELD_META}: {$medicion_obj})"
                                                                          class="label label-{$status}">{$valor->valor|round:"2"}</span>
                                                                {/if}
                                                            {else}
                                                                <span class="label label-default">{$total|round:"2"}</span>
                                                            {/if}
                                                        {else}
                                                            ---
                                                        {/if}
                                                    </a>
                                                {else}
                                                    {if $valor->valor!== NULL}
                                                        {if isset($status)}
                                                            {if $status == 'danger'}
                                                                <span title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_MEJORABLE} ({$smarty.const.FIELD_LIMITE}: {$medicion_lim}, {$smarty.const.FIELD_META}: {$medicion_obj})"
                                                                      class="label label-{$status}">{$valor->valor|round:"2"}</span>
                                                            {elseif $status == 'success'}
                                                                <span title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_LOGRADO} ({$smarty.const.FIELD_LIMITE}: {$medicion_lim}, {$smarty.const.FIELD_META}: {$medicion_obj})"
                                                                      class="label label-{$status}">{$valor->valor|round:"2"}</span>
                                                            {else}
                                                                <span title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_ACEPTABLE} ({$smarty.const.FIELD_LIMITE}: {$medicion_lim}, {$smarty.const.FIELD_META}: {$medicion_obj})"
                                                                      class="label label-{$status}">{$valor->valor|round:"2"}</span>
                                                            {/if}
                                                        {else}
                                                            <span class="label label-default">{$total|round:"2"}</span>
                                                        {/if}
                                                    {else}
                                                        ---
                                                    {/if}
                                                {/if}
                                            </td>
                                            <td>
                                                {$valor->fecha_recogida|date_format:"%d-%m-%Y"}
                                            </td>
                                            <td style="font-size: 12px">
                                                {$valor->usuario->nombre} {$valor->usuario->apellidos}
                                            </td>
                                        </tr>
                                    {/if}
                                {/foreach}
                            {/if}
                            <!-- //TOTALES -->
                            </tfoot>
                        </table>
                    </div>
                {else}
                    <div class="alert alert-info alert-dismissible">
                        <i class="fa fa-info-circle fa-fw"></i>
                        {$smarty.const.ERR_MED_NO_VAL}
                    </div>
                {/if}
            </div>
            <!-- /Valores de la medición -->

        </div>
        <!-- /Tab panes -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->