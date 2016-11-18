<!-- Diálogo Subunidades -->
<div class="modal fade" id="dialogo_subunidades" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel"><i class="fa fa-sitemap fa-fw"></i> {$smarty.const.TXT_SEL} {$smarty.const.FIELD_UNID} - <span></span></h3>
            </div>
            <div class="modal-body">
                <b>{$smarty.const.MSG_PANEL_INDIC_UNID}</b>
                <div class="row" id="lista_subunidades"></div>
            </div>
            <div class="modal-footer">
                <button form="form_unidades" type="submit" title="{$smarty.const.TXT_BTN_ACEPTAR}" class="btn btn-primary subunidad_seleccionar"><i class="fa fa-check fa-fw"></i> {$smarty.const.TXT_BTN_ACEPTAR}</button>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Subunidades -->

{*Ajax*}
{if isset($modulo)}

    {*Búsqueda de indicadores/datos*}
    {if $modulo == 'buscar'}
        <div class="col-sm-8 col-sm-offset-2 " style="overflow-y: auto;height: 30vh;">
            <b>{$smarty.const.TXT_BUSCAR_RESUL}</b>
            {if $indicadores}
                <ul class="list-unstyled">
                    {foreach from=$indicadores item=item}
                        <li style="margin: 1px">
                            <button title="{$smarty.const.TXT_PANEL_INCLUIR}" data-id_indicador="{$item->id}" data-nombre_indicador="{$item->nombre}" class="btn btn-primary btn-sm indicador_seleccionado" type="button">
                                <i class="fa fa-plus"></i>
                            </button> 
                            <span title="{$item->nombre}">{$item->nombre|truncate:90}</span>
                        </li>
                    {/foreach}
                </ul>
            {else}
                <div class="alert alert-info alert-dismissible">
                    <i class="fa fa-info-circle fa-fw"></i> 
                    {$smarty.const.MSG_INDIC_NO_ENC}
                </div>
            {/if}
        </div>
    {/if}

    {*Cálculo de subunidades del indicador/dato*}
    {if $modulo == 'subunidades'}
        <form id="form_unidades">
            <div class="col-sm-6">
                <div class="radio">
                    <label>
                        <input id="subunidad_seleccionada" data-id_indicador="{$id_indicador}" class="subunidad_seleccionada"
                               name="id_subunidad" type="radio" value="0" data-nombre_indicador="{$nombre_indicador}" data-nombre_subunidad="{$smarty.const.FIELD_TOTAL}" required> {$smarty.const.FIELD_TOTAL}
                    </label>
                </div> 
                {if $indicador_subunidades|@count > 1}
                    {foreach name=subunidades from=$indicador_subunidades item=item}
                        {if $smarty.foreach.subunidades.iteration == floor($indicador_subunidades|@count/2)+1}
                        </div><div class="col-sm-6">
                        {/if}
                        <div class="radio">
                            <label>
                                <input id="subunidad_seleccionada" data-id_indicador="{$id_indicador}" class="subunidad_seleccionada"
                                       name="id_subunidad"
                                       type="radio" value="{$item->id_entidad}" 
                                       data-nombre_indicador="{$nombre_indicador}"
                                       data-nombre_subunidad="{$item->entidad->etiqueta}" required> 
                                {$item->entidad->etiqueta}
                            </label>
                        </div>
                    {/foreach}
                {/if}
            </div>
        </form>
    {/if}

{else}
    <!-- Nombre página -->
    <div class="row">
        <div class="col-lg-12">
            <h3 title="{$_nombre_pagina}" class="page-header">
                <div class="row">
                    <div class="col-sm-11">
                        <i class="fa fa-line-chart fa-fw"></i> {$_nombre_pagina}
                    </div>
                    <!-- /.col-sm-11 -->
                    <!-- Tipos de panel -->                 
                    <div class="col-sm-1">
                        <button type="button" title="{$smarty.const.TXT_PANEL_TIPO}" class="btn btn-danger btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-columns fa-fw"></i> <i class="fa fa-caret-down"></i>
                        </button>
                        <ul id="paneles_tipos" class="dropdown-menu">
                            <li class="active">
                                <a title="{$smarty.const.TXT_LINEAS}: {$smarty.const.TXT_LINEAS_DESC}"><i class="fa fa-line-chart fa-fw"></i> {$smarty.const.TXT_LINEAS}</a>
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
                            <li>
                                <a title="{$smarty.const.TXT_TABLA}: {$smarty.const.TXT_TABLA_DESC}" href='index.php?page=panel_tabla&id_cuadro={$cuadro->id}&id_entidad={$entidad->id}'><i class="fa fa-table fa-fw"></i> {$smarty.const.TXT_TABLA}</a>
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
                            <a title="{$smarty.const.TXT_PROCS_DESCRIPCION}" href='index.php?page=proceso_listar&id_entidad={$entidad->id}'>
                                <i class="fa fa-gears fa-fw"></i> {$smarty.const.FIELD_PROCS} <span title="{$smarty.const.FIELD_TOTAL}: {$num_procesos} {$smarty.const.FIELD_PROCS}">({$num_procesos})</span>
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
                {$smarty.const.TXT_LINEAS_DESC}
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
                    <div class="form-group">
                        <label for="periodicidad" class="col-sm-2 control-label">{$smarty.const.FIELD_PERIOD}</label>
                        <div class="col-sm-8">
                            <select class="form-control chosen-select" name="periodicidad" id='periodicidad'>
                                <option value="anual">{$smarty.const.TXT_ANUAL}</option>
                                <option value="bienal">{$smarty.const.TXT_BIENAL}</option>
                                <option value="mensual">{$smarty.const.TXT_INTRANUAL}</option>     
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

                <!-- Indicadores/datos -->
                <fieldset>
                    <legend>{$smarty.const.TXT_PANEL_INDICS}</legend>

                    <!-- Indicadores y datos añadidos al panel -->
                    <div id="indicadores_subunidades" class="form-group hidden">       
                        <div class="col-sm-offset-2 col-sm-8">
                            <table class="table table-hover" id="indicadores_subunidades_seleccionados" data-texto_borrar="{$smarty.const.TXT_BORRAR}" style="background-color: white">
                                <thead>
                                <th>{$smarty.const.FIELD_INDICS}/{$smarty.const.FIELD_DATOS}</th>
                                <th colspan="2">{$smarty.const.FIELD_UNID}</th>
                                </thead>
                            </table>
                        </div>
                    </div>
                    <!-- /Indicadores y datos añadidos al panel -->

                    <!-- Búsqueda de indicadores/datos -->
                    <div class="form-group has-feedback">
                        <label class="col-sm-2 control-label"><i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
                        <div class="col-sm-8">
                            <input id="buscar_indicador" data-id_entidad="{$entidad->id}" class="form-control" placeholder="{$smarty.const.TXT_BUSCAR}" type="text">
                        </div> 
                    </div>
                    <div class="form-group hidden" id="listado_indicadores"></div>
                    <!-- Búsqueda de indicadores/datos -->

                    <div class="form-group has-feedback">
                        <div class="col-sm-offset-2 col-sm-8">
                            <input type="text" class="invisible" id="indicadores" required>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>

                </fieldset>
                <!-- /Indicadores/datos -->

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
{/if}