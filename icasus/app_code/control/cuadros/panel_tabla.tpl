<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <h3 title="{$_nombre_pagina}" class="page-header">
            <div class="row">
                <div class="col-sm-11">
                    <i class="fa fa-table fa-fw"></i> {$_nombre_pagina}
                </div>
                <!-- /.col-sm-11 -->
                <!-- Tipos de panel -->                 
                <div class="col-sm-1">
                    <button type="button" title="{$smarty.const.TXT_PANEL_TIPO}" class="btn btn-danger btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fa fa-columns fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </button>
                    <ul id="paneles_tipos" class="dropdown-menu">
                        <li>
                            <a title="{$smarty.const.TXT_LINEAS}: {$smarty.const.TXT_LINEAS_DESC}" href='index.php?page=panel_linea&id_cuadro={$cuadro->id}&id_entidad={$entidad->id}'><i class="fa fa-line-chart fa-fw"></i> {$smarty.const.TXT_LINEAS}</a>
                        </li>
                        <li>
                            <a title="{$smarty.const.TXT_BARRAS}: {$smarty.const.TXT_BARRAS_DESC}" href='index.php?page=panel_barra&id_cuadro={$cuadro->id}&id_entidad={$entidad->id}'><i class="fa fa-bar-chart fa-fw"></i> {$smarty.const.TXT_BARRAS}</a>
                        </li>
                        <li>
                            <a title="{$smarty.const.TXT_MIXTO}: {$smarty.const.TXT_MIXTO_DESC}" href='index.php?page=panel_mixto&id_cuadro={$cuadro->id}&id_entidad={$entidad->id}'>
                                <span class="fa-stack fa-1x">
                                    <i class="fa fa-line-chart fa-stack-1x"></i>
                                    <i class="fa fa-bar-chart fa-stack-1x"></i>
                                </span> {$smarty.const.TXT_MIXTO}
                            </a>
                        </li>
                        <li>
                            <a title="{$smarty.const.TXT_TARTA}: {$smarty.const.TXT_TARTA_DESC}" href='index.php?page=panel_tarta&id_cuadro={$cuadro->id}&id_entidad={$entidad->id}'><i class="fa fa-pie-chart fa-fw"></i> {$smarty.const.TXT_TARTA}</a>
                        </li>
                        <li class="active">
                            <a title="{$smarty.const.TXT_TABLA}: {$smarty.const.TXT_TABLA_DESC}"><i class="fa fa-table fa-fw"></i> {$smarty.const.TXT_TABLA}</a>
                        </li>
                    </ul>
                </div>
                <!-- /.col-sm-1 -->                 
                <!-- /Tipos de panel -->
            </div>
            <!-- /.row -->
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
                        <a title="{$smarty.const.TXT_PLANES_DESCRIPCION}" href='index.php?page=plan_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-book fa-fw"></i> {$smarty.const.FIELD_PLANES} <span title="{$smarty.const.FIELD_TOTAL}: {$num_planes} {$smarty.const.FIELD_PLANES}">({$num_planes})</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_CARTAS_DESCRIPCION}" href='index.php?page=carta_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-map-o fa-fw"></i> {$smarty.const.FIELD_CARTAS} <span title="{$smarty.const.FIELD_TOTAL}: {$num_cartas} {$smarty.const.FIELD_CARTAS}">({$num_cartas})</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_PROCS_DESCRIPCION}" href='index.php?page=proceso_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-gears fa-fw"></i> {$smarty.const.FIELD_PROCS} <span title="{$smarty.const.FIELD_TOTAL}: {$num_procesos} {$smarty.const.FIELD_PROCS}">({$num_procesos})</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_INDICS_DESCRIPCION}" href='index.php?page=indicador_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-dashboard fa-fw"></i> {$smarty.const.FIELD_INDICS}/{$smarty.const.FIELD_DATOS} <span title="{$smarty.const.FIELD_TOTAL}: {$num_indicadores} {$smarty.const.FIELD_INDICS}/{$smarty.const.FIELD_DATOS}">({$num_indicadores})</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_CUADRO_MANDO_DESCRIPCION}" href='index.php?page=cuadro_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-th fa-fw"></i> {$smarty.const.FIELD_CUADROS_MANDO} <span title="{$smarty.const.FIELD_TOTAL}: {$num_cuadros} {$smarty.const.FIELD_CUADROS_MANDO}">({$num_cuadros})</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_CONSULTA_DESCRIPCION}" href="index.php?page=consulta_avanzada&id_entidad={$entidad->id}">
                            <i class="fa fa-commenting fa-fw"></i> {$smarty.const.TXT_CONSULT}
                        </a>
                    </li>   
                    <li>
                        <a title="{$smarty.const.TXT_CONTROL_DESCRIPCION}" href="index.php?page=control&modulo=inicio&id_entidad={$entidad->id}">
                            <i class="fa fa-sliders fa-fw"></i> {$smarty.const.TXT_CONTROL}
                        </a>
                    </li>
                </ul>
                <!-- /.dropdown-menu -->
            </li>
            <!-- /.dropdown -->
            <li><a title="{$smarty.const.FIELD_CUADROS_MANDO}" href='index.php?page=cuadro_listar&id_entidad={$entidad->id}'>{$smarty.const.FIELD_CUADROS_MANDO}</a></li>
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
        <div class="alert alert-info alert-dismissible">
            <i class="fa fa-info-circle fa-fw"></i> 
            {$smarty.const.TXT_TABLA_DESC}
        </div>
        <form method="post" action="index.php?page=panel_grabar" id="panel_nuevo" name="panel_nuevo"
              data-toggle="validator" class="form-horizontal">
            <input type="hidden" name="id_entidad" value="{$entidad->id}" id="id_entidad">
            <input type="hidden" name="id_cuadro" value="{$cuadro->id}" id="id_cuadro">
            <input type="hidden" name="tipo" value="{$panel_tipo->id}">
            <input type="hidden" name="id_medicion" value="0">

            <!-- Datos genéricos del panel -->
            <fieldset>
                <legend>{$smarty.const.TXT_PANEL_DATOS}</legend>
                <div class="form-group has-feedback">
                    <label for="nombre" class="col-sm-2 control-label"><i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i> {$smarty.const.FIELD_NOMBRE}</label>
                    <div class="col-sm-8">
                        <input type='text' class="form-control" name='nombre' id='nombre' placeholder="{$smarty.const.FIELD_NOMBRE}" required/>
                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                        <div class="help-block with-errors"></div>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="orden" class="col-sm-2 control-label"><i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i> {$smarty.const.FIELD_ORDEN} </label>
                    <div class="col-sm-8">
                        <input type="number" value="1" id='orden' name="orden" class="form-control" placeholder="{$smarty.const.FIELD_ORDEN}" min='1' data-elementos='{$elementos|@json_encode}' data-validar_igual="validar_igual" data-validar_igual-error="{$smarty.const.ERR_PANEL_VAL_ORDEN}" required/>
                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                        <div class="help-block with-errors"></div>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="ancho" class="col-sm-2 control-label">{$smarty.const.FIELD_ANCHO}</label>
                    <div class="col-sm-8">
                        <select class="form-control chosen-select" id='ancho' name="ancho">
                            <option value="6" {if $panel_tipo->ancho_pred == 6}selected{/if}>{$smarty.const.TXT_PANEL_NORMAL}</option>
                            <option value="12" {if $panel_tipo->ancho_pred == 12}selected{/if}>{$smarty.const.TXT_PANEL_GRANDE}</option> 
                        </select>
                    </div>
                </div>
            </fieldset>
            <!-- /Datos genéricos del panel -->

            <!-- Ventana temporal -->
            <fieldset>
                <legend>{$smarty.const.TXT_PANEL_VENTANA}</legend>
                <div class="form-group">
                    <div title="{$smarty.const.TXT_PANEL_VENTANA_DESC}" class="col-sm-offset-2 col-sm-2">
                        <input type="checkbox" id="ventana_tiempo"  class="form-control" 
                               data-toggle="toggle" data-on="{$smarty.const.TXT_PANEL_VENTANA_FIJA}"
                               data-onstyle="success" data-offstyle="danger" data-off="{$smarty.const.TXT_PANEL_VENTANA_VAR}" data-size="small"/>
                    </div>
                </div> 
                <div id="ventana_fija" class="hidden">
                    <div class="form-group has-feedback">
                        <label for="anyo_inicio" class="col-sm-2 control-label"><i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i> {$smarty.const.FIELD_ANYO_INICIO}</label>
                        <div class="col-sm-8">
                            <input type="number" value="{{$smarty.now|date_format:'%Y'}|intval-1}" name="anyo_inicio" id='anyo_inicio' class="form-control" placeholder="{$smarty.const.FIELD_ANYO_INICIO}" min="2000" max="{{$smarty.now|date_format:'%Y'}|intval-1}" disabled="disabled" required/>
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="anyo_fin" class="col-sm-2 control-label"><i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i> {$smarty.const.FIELD_ANYO_FIN}</label>
                        <div class="col-sm-8">
                            <input type="number" value="{{$smarty.now|date_format:'%Y'}|intval-1}" name="anyo_fin" id='anyo_fin' class="form-control" placeholder="{$smarty.const.FIELD_ANYO_FIN}" min="2000" max="{{$smarty.now|date_format:'%Y'}|intval-1}" disabled="disabled" required/>
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                </div>
                <div id="ventana_var">
                    <div class="form-group has-feedback">
                        <label for="anyos_atras" class="col-sm-2 control-label"><i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i> {$smarty.const.FIELD_ANYOS_ATRAS}</label>
                        <div class="col-sm-8">
                            <input type="number" value="5" name="anyos_atras" id='anyos_atras' class="form-control" placeholder="{$smarty.const.FIELD_ANYOS_ATRAS}" min='1' max="10" required/>
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                </div>
            </fieldset>
            <!-- /Ventana temporal -->

            <!-- Indicadores -->
            <fieldset>
                <legend>{$smarty.const.TXT_PANEL_INDICS}</legend>

                <!-- Unidad -->
                <div class="form-group">
                    <label for="id_subunidad" class="col-sm-2 control-label">{$smarty.const.FIELD_UNID}</label>
                    <div class="col-sm-8">
                        <select id="id_subunidad" name="id_subunidad" class="form-control chosen-select" required>
                            <option value="0">{$smarty.const.FIELD_TOTAL} - {$entidad->nombre}</option>
                            {foreach $subunidades as $subunidad}
                                <option value="{$subunidad->id}">{$subunidad->etiqueta}</option>
                            {/foreach}
                        </select>
                    </div>
                </div>
                <!-- /Unidad -->

                <!-- Indicadores (Proceso) -->
                <div class="form-group">
                    <label for="indicadores" class="col-sm-2 control-label">{$smarty.const.FIELD_INDICS} ({$smarty.const.FIELD_PROC})</label>
                    <div class="col-sm-8">
                        <select class="form-control chosen-select" name="id_indicadores[]" id="indicadores" multiple>
                            {foreach $indicadores as $indicador}
                                <option title="{$indicador->nombre}" value="{$indicador->id}">{$indicador->nombre}</option>
                            {/foreach}
                        </select>
                    </div>
                    <div class="col-sm-2">
                        <button id="sel_todos_indics" type="button" class="btn btn-default btn-primary btn-xs" title="{$smarty.const.TXT_SEL_TODOS}" >
                            <i class="fa fa-check-square-o fa-fw"></i>
                        </button>
                        <button id="desel_todos_indics" type="button" class="btn btn-default btn-primary btn-xs" title="{$smarty.const.TXT_DESEL_TODOS}" >
                            <i class="fa fa-square-o fa-fw"></i>
                        </button>
                    </div>
                </div>
                <!-- /Indicadores (Proceso) -->

                <!-- Indicadores (Control) -->
                <div class="form-group">
                    <label for="indicadores_ctl" class="col-sm-2 control-label">{$smarty.const.FIELD_INDICS} ({$smarty.const.TXT_CONTROL})</label>
                    <div class="col-sm-8">
                        <select class="form-control chosen-select" name="id_indicadores[]" id="indicadores_ctl" multiple>
                            {foreach $indicadores_ctl as $indicador}
                                <option title="{$indicador->nombre}" value="{$indicador->id}">{$indicador->nombre}</option>
                            {/foreach}
                        </select>
                    </div>
                    <div class="col-sm-2">
                        <button id="sel_todos_indics_ctl" type="button" class="btn btn-default btn-primary btn-xs" title="{$smarty.const.TXT_SEL_TODOS}" >
                            <i class="fa fa-check-square-o fa-fw"></i>
                        </button>
                        <button id="desel_todos_indics_ctl" type="button" class="btn btn-default btn-primary btn-xs" title="{$smarty.const.TXT_DESEL_TODOS}" >
                            <i class="fa fa-square-o fa-fw"></i>
                        </button>
                    </div>
                </div>
                <!-- /Indicadores (Control) -->

                <!-- Indicadores (Datos) -->
                <div class="form-group">
                    <label for="datos" class="col-sm-2 control-label">{$smarty.const.FIELD_INDICS} ({$smarty.const.FIELD_DATOS})</label>
                    <div class="col-sm-8">
                        <select class="form-control chosen-select" name="id_indicadores[]" id="datos" multiple>
                            {foreach $datos as $dato}
                                <option title="{$dato->nombre}" value="{$dato->id}">{$dato->nombre}</option>
                            {/foreach}
                        </select>
                    </div>
                    <div class="col-sm-2">
                        <button id="sel_todos_datos" type="button" class="btn btn-default btn-primary btn-xs" title="{$smarty.const.TXT_SEL_TODOS}" >
                            <i class="fa fa-check-square-o fa-fw"></i>
                        </button>
                        <button id="desel_todos_datos" type="button" class="btn btn-default btn-primary btn-xs" title="{$smarty.const.TXT_DESEL_TODOS}" >
                            <i class="fa fa-square-o fa-fw"></i>
                        </button>
                    </div>
                </div>
                <!-- /Indicadores (Datos) -->

                <div class="form-group has-feedback">
                    <div class="col-sm-offset-2 col-sm-8">
                        <input type="text" class="invisible" id="indicadores_datos" required>
                        <div class="help-block with-errors"></div>
                    </div>
                </div>

            </fieldset>
            <!-- /Indicadores -->

            <div class="form-group">
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
        </form>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->