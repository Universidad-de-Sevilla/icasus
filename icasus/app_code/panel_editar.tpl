{if $panel->id_paneltipo == 2 || $panel->id_paneltipo == 7}
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
{/if}

<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <h3 title="{$_nombre_pagina}" class="page-header">
            <i class="fa fa-columns fa-fw"></i><sub class="fa fa-pencil fa-fw"></sub> {$_nombre_pagina}
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
        {if $panel->id_paneltipo == 2}
            <div class="alert alert-info alert-dismissible">
                <i class="fa fa-info-circle fa-fw"></i> 
                {$smarty.const.TXT_LINEAS_DESC}
            </div>
        {else if $panel->id_paneltipo == 3}
            <div class="alert alert-info alert-dismissible">
                <i class="fa fa-info-circle fa-fw"></i> 
                {$smarty.const.TXT_TARTA_DESC}
            </div>
        {else if $panel->id_paneltipo == 4}
            <div class="alert alert-info alert-dismissible">
                <i class="fa fa-info-circle fa-fw"></i> 
                {$smarty.const.TXT_MIXTO_DESC}
            </div>
        {else if $panel->id_paneltipo == 6}
            <div class="alert alert-info alert-dismissible">
                <i class="fa fa-info-circle fa-fw"></i> 
                {$smarty.const.TXT_TABLA_DESC}
            </div>
        {else if $panel->id_paneltipo == 7}
            <div class="alert alert-info alert-dismissible">
                <i class="fa fa-info-circle fa-fw"></i> 
                {$smarty.const.TXT_BARRAS_DESC}
            </div>
        {/if}
        <form action="index.php?page=panel_grabar" id="panel_nuevo" name="panel_nuevo" method='post' 
              data-toggle="validator" class="form-horizontal">
            <input type="hidden" name="id_entidad" value="{$entidad->id}" id="id_entidad">
            <input type="hidden" name="id_cuadro" value="{$cuadro->id}" id="id_cuadro">
            <input type="hidden" name="id_panel" value="{$panel->id}" id="id_panel">
            <input type="hidden" name="tipo" value="{$panel->id_paneltipo}">

            <!-- Datos genéricos del panel -->
            <fieldset>
                <legend>{$smarty.const.TXT_PANEL_DATOS}</legend>
                <div class="form-group has-feedback">
                    <label for="nombre" class="col-sm-2 control-label"><i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i> {$smarty.const.FIELD_NOMBRE}</label>
                    <div class="col-sm-8">
                        <input type='text' class="form-control" name='nombre' id='nombre' placeholder="{$smarty.const.FIELD_NOMBRE}" value="{$panel->nombre}" required/>
                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                        <div class="help-block with-errors"></div>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="orden" class="col-sm-2 control-label"><i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i> {$smarty.const.FIELD_ORDEN}</label>
                    <div class="col-sm-8">
                        <input type="number" id='orden' name="orden" class="form-control" placeholder="{$smarty.const.FIELD_ORDEN}" min='1' value="{$panel->orden}" data-elementos='{$elementos|@json_encode}' data-validar_igual="validar_igual" data-validar_igual-error="{$smarty.const.ERR_PANEL_VAL_ORDEN}" required/>
                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                        <div class="help-block with-errors"></div>
                    </div>
                </div>
                <div class="form-group has-feedback">
                    <label for="ancho" class="col-sm-2 control-label">{$smarty.const.FIELD_ANCHO}</label>
                    <div class="col-sm-8">
                        <select class="form-control chosen-select" id='ancho' name="ancho">
                            <option value="6" {if $panel->ancho == 6}selected{/if}>{$smarty.const.TXT_PANEL_NORMAL}</option>
                            <option value="12" {if $panel->ancho == 12}selected{/if}>{$smarty.const.TXT_PANEL_GRANDE}</option> 
                        </select>
                    </div>
                </div>
                {*Si es un panel de líneas, de barras o mixto*}
                {if $panel->id_paneltipo == 2 || $panel->id_paneltipo == 4 || $panel->id_paneltipo == 7}
                    <div class="form-group">
                        <label for="periodicidad" class="col-sm-2 control-label">{$smarty.const.FIELD_PERIOD}</label>
                        <div class="col-sm-8">
                            <select class="form-control chosen-select" name="periodicidad" id='periodicidad'>
                                <option value="anual" {if $panel->periodicidad=='anual'}selected{/if}>{$smarty.const.TXT_ANUAL}</option>
                                <option value="bienal" {if $panel->periodicidad=='bienal'}selected{/if}>{$smarty.const.TXT_BIENAL}</option>
                                <option value="mensual" {if $panel->periodicidad=='mensual'}selected{/if}>{$smarty.const.TXT_INTRANUAL}</option>     
                            </select>
                        </div>
                    </div>
                {/if}
            </fieldset>
            <!-- /Datos genéricos del panel -->

            {*Si es un panel de líneas, de barras o mixto*}
            {if $panel->id_paneltipo == 2 || $panel->id_paneltipo == 4 || $panel->id_paneltipo == 6 || $panel->id_paneltipo == 7}
                <!-- Ventana temporal -->
                <fieldset>
                    <legend>{$smarty.const.TXT_PANEL_VENTANA}</legend>
                    <div class="form-group">
                        <div title="{$smarty.const.TXT_PANEL_VENTANA_DESC}" class="col-sm-offset-2 col-sm-2">
                            <input type="checkbox" id="ventana_tiempo"  class="form-control" 
                                   data-toggle="toggle" data-on="{$smarty.const.TXT_PANEL_VENTANA_FIJA}"
                                   data-onstyle="success" data-offstyle="danger" data-off="{$smarty.const.TXT_PANEL_VENTANA_VAR}" data-size="small"
                                   {if !$panel->anyos_atras}checked{/if}/>
                        </div>
                    </div> 
                    <div id="ventana_fija" {if $panel->anyos_atras}class="hidden"{/if}>
                        <div class="form-group has-feedback">
                            <label for="anyo_inicio" class="col-sm-2 control-label"><i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i> {$smarty.const.FIELD_ANYO_INICIO}</label>
                            <div class="col-sm-8">
                                <input type="number" {if $panel->anyo_inicio}value="{$panel->anyo_inicio}"{else}value="{{$smarty.now|date_format:'%Y'}|intval-1}"{/if} name="anyo_inicio" id='anyo_inicio' class="form-control" placeholder="{$smarty.const.FIELD_ANYO_INICIO}" min="2000" max="{{$smarty.now|date_format:'%Y'}|intval-1}" {if $panel->anyos_atras}disabled="disabled"{/if} required/>
                                <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="form-group has-feedback">
                            <label for="anyo_fin" class="col-sm-2 control-label"><i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i> {$smarty.const.FIELD_ANYO_FIN}</label>
                            <div class="col-sm-8">
                                <input type="number" {if $panel->anyo_fin}value="{$panel->anyo_fin}"{else}value="{{$smarty.now|date_format:'%Y'}|intval-1}"{/if} name="anyo_fin" id='anyo_fin' class="form-control" placeholder="{$smarty.const.FIELD_ANYO_FIN}" min="2000" max="{{$smarty.now|date_format:'%Y'}|intval-1}" {if $panel->anyos_atras}disabled="disabled"{/if} required/>
                                <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                    </div>
                    <div id="ventana_var" {if !$panel->anyos_atras}class="hidden"{/if}>
                        <div class="form-group has-feedback">
                            <label for="anyos_atras" class="col-sm-2 control-label"><i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i> {$smarty.const.FIELD_ANYOS_ATRAS}</label>
                            <div class="col-sm-8">
                                <input type="number" {if $panel->anyos_atras}value="{$panel->anyos_atras}"{else}value="5"{/if} name="anyos_atras" id='anyos_atras' class="form-control" placeholder="{$smarty.const.FIELD_ANYOS_ATRAS}" min='1' max="10" {if !$panel->anyos_atras}disabled="disabled"{/if} required/>
                                <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                    </div>
                </fieldset>
                <!-- /Ventana temporal -->
            {/if}

            <!-- Indicadores -->
            <fieldset>
                <legend>{$smarty.const.TXT_PANEL_INDICS}</legend>

                {*Editando paneles de líneas o barras*}
                {if $panel->id_paneltipo == 2 || $panel->id_paneltipo == 7}

                    <!-- Indicadores añadidos al panel -->
                    <div id="indicadores_subunidades" class="form-group">       
                        <div class="col-sm-offset-2 col-sm-8">
                            <table class="table table-hover" id="indicadores_subunidades_seleccionados" data-texto_borrar="{$smarty.const.TXT_BORRAR}" style="background-color: white">
                                <thead>
                                <th>{$smarty.const.FIELD_INDICS}/{$smarty.const.FIELD_DATOS}</th>
                                <th colspan="2">{$smarty.const.FIELD_UNID}</th>
                                </thead>
                                {foreach $panel_indicadores as $pi}
                                    <tr class="fila_borrar">
                                        <td>
                                            <input type="hidden" name="id_indicadores[]" value="{$indicadores[$pi->id]->id}">
                                            {$indicadores[$pi->id]->nombre}
                                        </td> 
                                        <td>
                                            <input type="hidden" name="id_subunidades[]" value="{$unidades[$pi->id]->id}">
                                            {$unidades[$pi->id]->etiqueta}
                                        </td>
                                        <td class="text-center">
                                            <a class="remove_seleccion" title="{$smarty.const.TXT_BORRAR}" href="#">
                                                <i class="fa fa-times fa-fw"></i>
                                            </a>
                                        </td>
                                    </tr>
                                {/foreach}
                            </table>
                        </div>
                    </div>
                    <!-- /Indicadores añadidos al panel -->

                    <!-- Búsqueda de indicadores -->
                    <div class="form-group has-feedback">
                        <label class="col-sm-2 control-label"><i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
                        <div class="col-sm-8">
                            <input id="buscar_indicador" data-id_entidad="{$entidad->id}" class="form-control" placeholder="{$smarty.const.TXT_BUSCAR}" type="text">
                        </div> 
                    </div>
                    <div class="form-group hidden" id="listado_indicadores"></div>
                    <!-- Búsqueda de indicadores -->

                    <div class="form-group has-feedback">
                        <div class="col-sm-offset-2 col-sm-8">
                            <input type="text" class="invisible" id="indicadores">
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>

                    {*Editando paneles de tarta*}
                {else if $panel->id_paneltipo == 3}

                    <!-- Indicador -->
                    <div class="form-group">
                        <label for="indicador" class="col-sm-2 control-label">{$smarty.const.FIELD_INDIC}/{$smarty.const.FIELD_DATO}</label>
                        <div class="col-sm-8">
                            <select class="form-control chosen-select" name="id_indicador" id="indicador">
                                {foreach $indicadores_unidad as $indicador}
                                    <option title="{$indicador->nombre}" value="{$indicador->id}" {if $id_indicador==$indicador->id}selected{/if}>{$indicador->nombre}</option>
                                {/foreach}
                            </select>
                        </div>
                    </div>
                    <!-- /Indicador -->

                    <!-- Mediciones -->
                    <div class="form-group">
                        <label for="medicion" class="col-sm-2 control-label">{$smarty.const.FIELD_MED}</label>
                        <div id="mediciones_tarta" class="col-sm-8">
                            <select class="form-control chosen-select" name="id_medicion" id="medicion">
                                {foreach $mediciones as $medicion}
                                    <option title="{$medicion->etiqueta}" value="{$medicion->id}" {if $panel->id_medicion==$medicion->id}selected{/if}>{$medicion->etiqueta}</option>
                                {/foreach}
                            </select>
                        </div>
                    </div>
                    <!-- /Mediciones -->

                    {*Editando paneles mixtos*}
                {else if $panel->id_paneltipo == 4}

                    <!-- Indicador base -->
                    <div class="form-group">
                        <label for="indicador_base" class="col-sm-2 control-label">{$smarty.const.FIELD_INDIC_BASE}</label>
                        <div class="col-sm-8">
                            <select class="form-control chosen-select" name="id_indicadores[]" id="indicador_base">
                                {foreach $indicadores_unidad as $indicador}
                                    <option title="{$indicador->nombre}" value="{$indicador->id}" {if $id_indicador==$indicador->id}selected{/if}>{$indicador->nombre}</option>
                                {/foreach}
                            </select>
                        </div>
                    </div>
                    <!-- /Indicador base -->

                    <!-- Indicadores complementarios -->
                    <div class="form-group">
                        <label for="indicadores_complementarios" class="col-sm-2 control-label">{$smarty.const.FIELD_INDIC_COMPLEMENT}</label>
                        <div class="col-sm-8">
                            <select class="form-control chosen-select" name="id_indicadores[]" id="indicadores_complementarios" multiple>
                                {foreach $indicadores_unidad as $indicador}
                                    <option title="{$indicador->nombre}" value="{$indicador->id}"
                                            {foreach $indicadores as $ind}
                                                {if $ind->id==$indicador->id && !$ind@first}selected{/if}
                                            {/foreach}>
                                        {$indicador->nombre}
                                    </option>
                                {/foreach}
                            </select>
                        </div>
                    </div>
                    <!-- /Indicadores complementarios -->

                    {*Editando paneles de tabla*}
                {else if $panel->id_paneltipo == 6}

                    <!-- Unidad -->
                    <div class="form-group">
                        <label for="id_subunidad" class="col-sm-2 control-label">{$smarty.const.FIELD_UNID}</label>
                        <div class="col-sm-8">
                            <select id="id_subunidad" name="id_subunidad" class="form-control chosen-select" required>
                                <option value="0" {if $id_unidad==0}selected{/if}>{$smarty.const.FIELD_TOTAL} - {$entidad->nombre}</option>
                                {foreach $subunidades as $subunidad}
                                    <option value="{$subunidad->id}" {if $id_unidad==$subunidad->id}selected{/if}>{$subunidad->etiqueta}</option>
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
                                {foreach $indicadores_unidad_no_datos as $indicador}
                                    <option title="{$indicador->nombre}" value="{$indicador->id}"
                                            {foreach $indicadores as $ind}
                                                {if $ind->id==$indicador->id}selected{/if}
                                            {/foreach}>
                                        {$indicador->nombre}
                                    </option>
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
                                    <option title="{$indicador->nombre}" value="{$indicador->id}"
                                            {foreach $indicadores as $ind}
                                                {if $ind->id==$indicador->id}selected{/if}
                                            {/foreach}>
                                        {$indicador->nombre}
                                    </option>
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
                                {foreach $datos_unidad as $dato}
                                    <option title="{$dato->nombre}" value="{$dato->id}"
                                            {foreach $indicadores as $ind}
                                                {if $ind->id==$dato->id}selected{/if}
                                            {/foreach}>
                                        {$dato->nombre}
                                    </option>
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
                            <input type="text" class="invisible" id="indicadores_datos">
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>

                {/if}
            </fieldset>
            <!-- /Indicadores -->

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-8">
                    <a class="btn btn-danger" title="{$smarty.const.TXT_CANCEL}" href='index.php?page=cuadro_mostrar&id_cuadro={$cuadro->id}&id_entidad={$cuadro->id_entidad}'>
                        <i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_CANCEL}
                    </a>
                    <div class="pull-right">
                        <button type="reset" class="btn btn-warning" title="{$smarty.const.TXT_RESET}">
                            <i class="fa fa-refresh fa-fw"></i> {$smarty.const.TXT_RESET}
                        </button>
                        <button title="{$smarty.const.TXT_GRABAR}" type="button" class="btn btn-success" data-toggle="modal" data-target="#dialogo_confirmar_edicion">
                            <i class="fa fa-download fa-fw"></i> {$smarty.const.TXT_GRABAR}
                        </button>
                    </div>
                </div>
            </div>

            <!-- Diálogo Confirmar Edición -->
            <div class="modal fade" id="dialogo_confirmar_edicion" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h3 class="modal-title" id="myModalLabel"><i class="fa fa-columns fa-fw"></i><sub class="fa fa-pencil fa-fw"></sub> {$smarty.const.TXT_PANEL_EDITAR}: {$panel->nombre}</h3>
                        </div>
                        <div class="modal-body">
                            <p>{$smarty.const.MSG_PANEL_CONFIRM_EDITAR}</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" title="{$smarty.const.TXT_NO}" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_NO}</button>
                            <button type="submit" title="{$smarty.const.TXT_SI}" class="btn btn-success" name="editar" id="editar"><i class="fa fa-check fa-fw"></i> {$smarty.const.TXT_SI}</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Diálogo Confirmar Edición -->

        </form>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->