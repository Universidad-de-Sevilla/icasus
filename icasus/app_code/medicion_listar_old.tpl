<!-- Diálogo Confirmar Borrado -->
<div class="modal fade" id="dialogo_confirmar_borrado" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel"><i class="fa fa-trash fa-fw"></i> {$smarty.const.TXT_MED_BORRAR}: <span id="etiqueta_medicion"></span></h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_MED_CONFIRM_BORRAR}</p>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_NO}" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_NO}</button>
                <a title="{$smarty.const.TXT_SI}" class="btn btn-success" name="borrar" id="borrar"><i class="fa fa-check fa-fw"></i> {$smarty.const.TXT_SI}</a>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Confirmar Borrado -->

<!-- Diálogo Confirmar Borrado Mediciones-->
<div class="modal fade" id="dialogo_confirmar_borrado_mediciones" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel"><i class="fa fa-trash fa-fw"></i> {$smarty.const.TXT_MEDS_BORRAR}</h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_MEDS_CONFIRM_BORRAR}</p>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_NO}" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_NO}</button>
                <a title="{$smarty.const.TXT_SI}" class="btn btn-success" onClick="$('#form_mediciones').submit();"><i class="fa fa-check fa-fw"></i> {$smarty.const.TXT_SI}</a>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Confirmar Borrado Mediciones-->

<!-- Diálogo Confirmar Crear -->
<div class="modal fade" id="dialogo_confirmar_generar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel"><i class="fa fa-history fa-fw"></i><sub class="fa fa-plus fa-fw"></sub> {$smarty.const.TXT_MED_CREAR}: {$indicador->nombre}</h3>
            </div>
            <form class="form-horizontal" id="form_generar" name="form_generar" data-toggle="validator" method="post" action="index.php?page=medicion_generar">
                <input type="hidden" name="id_entidad" value="{$indicador->id_entidad}"/>
                <input type="hidden" name="id_indicador" value="{$indicador->id}"/>
                <input type="hidden" name="tipo" value="{$tipo}"/>
                <div class="modal-body">
                    <p>{$smarty.const.MSG_MED_CREAR}</p>
                    <div class="form-group has-feedback">
                        <label for="anyo" class="col-sm-2 control-label">{$smarty.const.FIELD_ANYO} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
                        <div class="col-sm-4">
                            <input type="number" value="{$smarty.now|date_format:'%Y'}" name="anyo" id='anyo' class="form-control" placeholder="{$smarty.const.FIELD_ANYO}" min='{$indicador->historicos}' max="{$smarty.now|date_format:'%Y'}" required/>
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" title="{$smarty.const.TXT_NO}" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_NO}</button>
                    <button id="btn_confirm_generar" type="submit" title="{$smarty.const.TXT_SI}" data-texto_generando="{$smarty.const.MSG_MED_GENERANDO}" class="btn btn-success"><i class="fa fa-check fa-fw"></i> {$smarty.const.TXT_SI}</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- /Diálogo Confirmar Crear -->

<!-- Diálogo Confirmar Cargar -->
<div class="modal fade" id="dialogo_confirmar_cargar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel"><i class="fa fa-history fa-fw"></i><sub class="fa fa-arrow-circle-up fa-fw"></sub> {$smarty.const.TXT_MED_CARGAR}: {$indicador->nombre}</h3>
            </div>
            <form class="form-horizontal" id="form_cargar" name="form_cargar" data-toggle="validator" method="post" action="index.php?page=medicion_listar&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}">
                <div class="modal-body">
                    <p>{$smarty.const.MSG_MED_CARGAR}</p>
                    <div class="form-group has-feedback">
                        <label for="registros" class="col-sm-3 control-label">{$smarty.const.FIELD_REGISTROS} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
                        <div class="col-sm-4">
                            <input type="number" value="{$total_registros}" name="registros" id='registros' class="form-control" placeholder="{$smarty.const.FIELD_REGISTROS}" min='1' max="{$total_registros}" required/>
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" title="{$smarty.const.TXT_NO}" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_NO}</button>
                    <button id="btn_confirm_cargar" type="submit" title="{$smarty.const.TXT_SI}" data-texto_cargando="{$smarty.const.MSG_MED_CARGANDO}" class="btn btn-success"><i class="fa fa-check fa-fw"></i> {$smarty.const.TXT_SI}</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- /Diálogo Confirmar Cargar -->

<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <h3 title="{$_nombre_pagina}" class="page-header">
            <div class="row">
                <div class="col-md-10">
                    {if $tipo == 'indicador'}<i class="fa fa-dashboard fa-fw"></i>{else}<i class="fa fa-database fa-fw"></i>{/if} {$_nombre_pagina}
                </div>
                <!-- /.col-md-10 -->
                <!-- Navegación -->
                {if count($indicadores)> 1}
                    <div class="col-md-2">
                        <div style="font-size:10px">{$indice+1} {$smarty.const.TXT_DE} {count($indicadores)} {if $tipo == 'indicador'}{$smarty.const.FIELD_INDICS}{else}{$smarty.const.FIELD_DATOS}{/if}</div>
                        <div class="btn-toolbar" role="toolbar" aria-label="">
                            <div class="btn-group" role="group" aria-label="">
                                <a title="{$smarty.const.TXT_PRIMER} {if $tipo == 'indicador'}{$smarty.const.FIELD_INDIC}{else}{$smarty.const.FIELD_DATO}{/if}" class="btn btn-danger btn-xs {if $indice == 0}disabled{/if}" href='index.php?page=medicion_listar&id_entidad={$entidad->id}&id_{$tipo}={$indicadores[0]->id}'>
                                    <i class="fa fa-step-backward fa-fw"></i>
                                </a>
                                <a title="{$smarty.const.TXT_ANT} {if $tipo == 'indicador'}{$smarty.const.FIELD_INDIC}{else}{$smarty.const.FIELD_DATO}{/if}" class="btn btn-danger btn-xs {if $indice == 0}disabled{/if}" href='index.php?page=medicion_listar&id_entidad={$entidad->id}&id_{$tipo}={$indicadores[$indice-1]->id}'>
                                    <i class="fa fa-play fa-rotate-180 fa-fw"></i>
                                </a>
                                <a title="{$smarty.const.TXT_SIG} {if $tipo == 'indicador'}{$smarty.const.FIELD_INDIC}{else}{$smarty.const.FIELD_DATO}{/if}" class="btn btn-danger btn-xs {if $indice == (count($indicadores)-1)}disabled{/if}" href='index.php?page=medicion_listar&id_entidad={$entidad->id}&id_{$tipo}={$indicadores[$indice+1]->id}'>
                                    <i class="fa fa-play fa-fw"></i>
                                </a>
                                <a title="{$smarty.const.TXT_ULTIMO} {if $tipo == 'indicador'}{$smarty.const.FIELD_INDIC}{else}{$smarty.const.FIELD_DATO}{/if}" class="btn btn-danger btn-xs {if $indice == (count($indicadores)-1)}disabled{/if}" href='index.php?page=medicion_listar&id_entidad={$entidad->id}&id_{$tipo}={$indicadores[(count($indicadores)-1)]->id}'>
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
            {if $tipo == 'indicador'}
                <li>
                    <a title="{$smarty.const.TXT_PROCS}" href='index.php?page=proceso_listar&id_entidad={$entidad->id}'>{$smarty.const.TXT_PROCS}</a>
                </li>
                <li>
                    <a title="{$proceso->nombre}" href='index.php?page=proceso_mostrar&id_proceso={$proceso->id}&id_entidad={$entidad->id}'>{$proceso->nombre|truncate:30}</a>
                </li>
            {else}
                <li>
                    <a title="{$smarty.const.FIELD_DATOS}" href='index.php?page={$tipo}_listar&id_entidad={$entidad->id}'>{$smarty.const.FIELD_DATOS}</a>
                </li>
            {/if}
            <li title="{$_nombre_pagina}" class="active">{$_nombre_pagina}</li>
        </ol>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- /Breadcrumbs -->

<!-- Menú del indicador -->
<div class="row">
    <div class="col-lg-12">
        <ul class="nav nav-tabs">
            <li role="presentation">
                <a title="{$smarty.const.TXT_FICHA}" href='index.php?page={$tipo}_mostrar&id_{$tipo}={$indicador->id}&id_entidad={$entidad->id}'><i class="fa fa-folder fa-fw"></i> {$smarty.const.TXT_FICHA}</a>
            </li>
            <li role="presentation" >
                <a title="{$smarty.const.TXT_REP_GRAFIC}" href='index.php?page=graficas_mostrar&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'><i class="fa fa-area-chart fa-fw"></i> {$smarty.const.TXT_REP_GRAFIC}</a>
            </li>
            <li role="presentation" class="active">
                <a title="{$smarty.const.FIELD_MEDICIONES}" href="#"><i class="fa fa-history fa-fw"></i> {$smarty.const.FIELD_MEDICIONES}</a>
            </li>
            {if (($_control || $indicador->id_responsable == $_usuario->id) && !$indicador->calculo)}
                <li role="presentation">
                    <a title="{$smarty.const.TXT_VAL_EDIT}" href='index.php?page=valores&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'><i class="fa fa-pencil-square-o fa-fw"></i> {$smarty.const.TXT_VAL_EDIT}</a>
                </li>
            {/if}
            {if $_control || $_usuario->id==$indicador->id_responsable}
                <li role="presentation">
                    <a title="{$smarty.const.FIELD_RESP_MED}" href='index.php?page=medicion_responsable&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'><i class="fa fa-user fa-fw"></i> {$smarty.const.FIELD_RESP_MED}</a>
                </li>
            {/if}
            <li role="presentation">
                <a title="{$smarty.const.TXT_VAL_REF}" href='index.php?page=valor_referencia&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'><i class="fa fa-tags fa-fw"></i> {$smarty.const.TXT_VAL_REF}</a>
            </li>
            {if $tipo == 'indicador'}
                <li role="presentation">
                    <a title="{$smarty.const.TXT_ANALISIS}" href='index.php?page=analisis&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><i class="fa fa-connectdevelop fa-fw"></i> {$smarty.const.TXT_ANALISIS}</a>
                </li>
            {/if}
        </ul>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<br>
<!-- /Menú del indicador -->

<!-- Barra de botones -->
<div class="row">
    {if $_control || $responsable}
    <div class="col-lg-6">
        <a title="{$smarty.const.TXT_MED_CREAR}" class="btn btn-danger btn-block" href='javascript:void(0)' 
            data-toggle="modal" data-target="#dialogo_confirmar_generar">
                <i class="fa fa-history fa-fw"></i><sub class="fa fa-plus fa-fw"></sub> {$smarty.const.TXT_MED_CREAR}
        </a>
    </div>
    <!-- /.col-lg-6 -->
    <div class="col-lg-6">
        {if $mediciones}
            <a title="{$smarty.const.TXT_MED_CARGAR}" class="btn btn-danger btn-block" href='javascript:void(0)' 
               accesskey=""data-toggle="modal" data-target="#dialogo_confirmar_cargar">
                <i class="fa fa-history fa-fw"></i><sub class="fa fa-arrow-circle-up fa-fw"></sub> {$smarty.const.TXT_MED_CARGAR}
            </a>
        {/if}
    </div>
    <!-- /.col-lg-6 -->
    {else}
        <div class="col-lg-12">
            {if $mediciones}
                <a title="{$smarty.const.TXT_MED_CARGAR}" class="btn btn-danger btn-block" href='javascript:void(0)' 
                   accesskey=""data-toggle="modal" data-target="#dialogo_confirmar_cargar">
                    <i class="fa fa-history fa-fw"></i><sub class="fa fa-arrow-circle-up fa-fw"></sub> {$smarty.const.TXT_MED_CARGAR}
                </a>
            {/if}
        </div>
        <!-- /.col-lg-12 -->
    {/if}
</div>
<!-- /.row -->
<br>
<!-- /Barra de botones -->
                
<!-- Indicadores/datos calculados -->
{if $indicador->calculo}
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <span class="panel-title"><i class="fa fa-info-circle fa-fw"></i> {$smarty.const.TXT_CALC_AUTO}</span>
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
                                {if $indicador_influyente->id_proceso}
                                    <tr>
                                        <td><span class="badge">{$indicador_influyente->id}</span></td>
                                        <td>
                                            <a class="btn btn-info" href='index.php?page=indicador_mostrar&id_indicador={$indicador_influyente->id}&id_entidad={$indicador_influyente->id_entidad}' 
                                               title="{$smarty.const.TXT_FICHA}: {$indicador_influyente->nombre}">
                                                <i class="fa fa-dashboard fa-fw"></i> {$indicador_influyente->nombre}
                                            </a>
                                        </td>
                                    </tr>
                                {else}
                                    <tr>
                                        <td><span class="badge">{$indicador_influyente->id}</span></td>
                                        <td> 
                                            <a class="btn btn-info" href='index.php?page=dato_mostrar&id_dato={$indicador_influyente->id}&id_entidad={$indicador_influyente->id_entidad}' 
                                               title="{$smarty.const.TXT_FICHA}: {$indicador_influyente->nombre}">
                                                <i class="fa fa-database fa-fw"></i> {$indicador_influyente->nombre}
                                            </a>
                                        </td>
                                    </tr>
                                {/if}   
                            {/foreach}
                            <tr class="info">
                                <th><i class="fa fa-calculator fa-fw"></i> {$smarty.const.FIELD_FORMULA}</th>
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
<!-- /Indicadores/datos calculados -->

<!-- Indicadores/datos dependientes -->
{if $indicadores_dependientes}
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-warning">
                <div class="panel-heading">
                    <span class="panel-title"><i class="fa fa-exclamation-triangle fa-fw"></i> {$smarty.const.TXT_INDIC_DAT_DEPENDIENTES}</span>
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
                                {if $indicador_dependiente->id_proceso}
                                    <tr>
                                        <td><span class="badge">{$indicador_dependiente->id}</span></td>
                                        <td>
                                            <a class="btn btn-warning" href='index.php?page=indicador_mostrar&id_indicador={$indicador_dependiente->id}&id_entidad={$indicador_dependiente->id_entidad}' 
                                               title="{$smarty.const.TXT_FICHA}: {$indicador_dependiente->nombre}">
                                                <i class="fa fa-dashboard fa-fw"></i> {$indicador_dependiente->nombre}
                                            </a>
                                        </td>
                                    </tr>
                                {else}
                                    <tr>
                                        <td><span class="badge">{$indicador_dependiente->id}</span></td>
                                        <td> 
                                            <a class="btn btn-warning" href='index.php?page=dato_mostrar&id_dato={$indicador_dependiente->id}&id_entidad={$indicador_dependiente->id_entidad}' 
                                               title="{$smarty.const.TXT_FICHA}: {$indicador_dependiente->nombre}">
                                                <i class="fa fa-database fa-fw"></i> {$indicador_dependiente->nombre}
                                            </a>
                                        </td>
                                    </tr>
                                {/if}   
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
<!-- /Indicadores/datos dependientes -->

<!-- Tabla de mediciones -->
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-red">
            <div class="panel-heading">
                <span class="panel-title"><i class="fa fa-history fa-fw"></i> {$smarty.const.TXT_MED_TABLA} {if $mediciones}({$smarty.const.TXT_MOSTRANDO}: {if $limite==$total_registros}{$smarty.const.TXT_REGS_TODOS}{else}{$limite} {$smarty.const.TXT_DE} {$total_registros} {$smarty.const.FIELD_REGISTROS}{/if}){/if}</span>
                <i class="fa fa-chevron-up pull-right clickable"></i>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                
                <!-- Barra de botones -->
                {if $mediciones && ($_control || $responsable)}
                    <div id="botones" class="btn-toolbar hidden" role="toolbar" aria-label="">
                        <div class="btn-group" role="group" aria-label="">
                            <a title="{$smarty.const.TXT_MEDS_BORRAR}" class="btn btn-default btn-danger" href='javascript:void(0)' data-toggle="modal" data-target="#dialogo_confirmar_borrado_mediciones">
                                <i class="fa fa-trash fa-fw"></i>
                            </a>
                        </div>
                    </div>
                {/if}
                <!-- /Barra de botones -->
                
                {if $mediciones}
                    <form id="form_mediciones" action='index.php?page=medicion_borrar&id_entidad={$entidad->id}&tipo={$tipo}' method='post'>
                        <input type="hidden" name="id_indicador" value="{$indicador->id}"/>
                        <div class="table-responsive">
                            <table id="tabla_mediciones" class="table datatable table-striped table-hover">
                                <thead>
                                    <tr>
                                        {if $_control || $responsable}
                                            <th>
                                                {$smarty.const.TXT_BORRAR}
                                            </th>
                                        {/if}
                                        <th>{$smarty.const.FIELD_ETIQUETA}</th>
                                        <th>{$smarty.const.FIELD_INICIO_PERIODO}</th>
                                        <th>{$smarty.const.FIELD_FIN_PERIODO}</th>
                                        <th>{$smarty.const.FIELD_VAL}</th>
                                        <th>{$smarty.const.FIELD_STATUS}</th>
                                        <th>{$smarty.const.FIELD_OBSERV}</th>
                                        <th>{$smarty.const.FIELD_ACCIONES}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {foreach $mediciones as $medicion}
                                        <tr {if isset($status[$medicion->id])}
                                                {if  $status[$medicion->id] == 'red'}
                                                    class="danger"
                                                {else if $status[$medicion->id] == 'green'}
                                                    class="success"
                                                {else}
                                                    class="warning"
                                                {/if}
                                            {/if}>
                                                {if $_control || $responsable}
                                                    <td>
                                                        <input type="checkbox" name='id_mediciones[]' value="{$medicion->id}"/>
                                                    </td>
                                                {/if}
                                                <td>
                                                    <a title="{$smarty.const.TXT_MED_VER}" href="index.php?page=medicion&id_entidad={$entidad->id}&id_medicion={$medicion->id}&tipo={$tipo}">{$medicion->etiqueta}</a>
                                                </td>
                                                <td>{$medicion->periodo_inicio|date_format:"%d-%m-%Y"}</td>
                                                <td>{$medicion->periodo_fin|date_format:"%d-%m-%Y"}</td>
                                                <td>{if $totales[$medicion->id] !== NULL}<span class="badge">{$totales[$medicion->id]|round:"2"}</span>{else}---{/if}</td>
                                                <td>
                                                    {if isset($status[$medicion->id])}
                                                        {if  $status[$medicion->id] == 'red'}
                                                            <i title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_MEJORABLE} ({$smarty.const.FIELD_LIMITE}: {$medicion_lim[$medicion->id]}, {$smarty.const.FIELD_META}: {$medicion_obj[$medicion->id]})" class="fa fa-circle fa-fw" style="color:{$status[$medicion->id]}"></i>
                                                        {else if $status[$medicion->id] == 'green'}
                                                            <i title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_LOGRADO} ({$smarty.const.FIELD_LIMITE}: {$medicion_lim[$medicion->id]}, {$smarty.const.FIELD_META}: {$medicion_obj[$medicion->id]})" class="fa fa-circle fa-fw" style="color:{$status[$medicion->id]}"></i>
                                                        {else}
                                                            <i title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_ACEPTABLE} ({$smarty.const.FIELD_LIMITE}: {$medicion_lim[$medicion->id]}, {$smarty.const.FIELD_META}: {$medicion_obj[$medicion->id]})" class="fa fa-circle fa-fw" style="color:{$status[$medicion->id]}"></i>
                                                        {/if}
                                                    {else}
                                                        ---
                                                    {/if}
                                                </td>
                                                <td>
                                                    {if $medicion->observaciones != ''}
                                                        {$medicion->observaciones|truncate:60}
                                                    {else}
                                                        ---
                                                    {/if}
                                                </td>
                                                <td>
                                                    <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_MED_VER}" href="index.php?page=medicion&id_entidad={$entidad->id}&id_medicion={$medicion->id}&tipo={$tipo}"><i class="fa fa-pencil fa-fw"></i></a>
                                                        {if $_control || $responsable}
                                                        <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_MED_BORRAR}" href='javascript:void(0)' data-toggle="modal" data-target="#dialogo_confirmar_borrado"
                                                           data-etiqueta_medicion="{$medicion->etiqueta}" data-id_medicion="{$medicion->id}" data-tipo="{$tipo}" data-id_entidad="{$entidad->id}">
                                                            <i class="fa fa-trash fa-fw"></i>
                                                        </a>
                                                    {/if}
                                                </td>
                                            </tr>
                                            {/foreach}
                                            </tbody>
                                        </table>
                                    </div>
                                </form>
                {else}
                    <div class="alert alert-info alert-dismissible">
                        <i class="fa fa-info-circle fa-fw"></i> 
                        {$smarty.const.MSG_MED_NO_TIPO} {$tipo}
                    </div>
                {/if}
            </div>
            <!-- /.panel-body -->        
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- /Tabla de mediciones -->

<!-- Valores unidad/año -->
{if $indicador->id_tipo_agregacion_temporal != 0}
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-red">
                <div class="panel-heading">
                    <span class="panel-title"><i class="fa fa-tags fa-fw"></i> {$smarty.const.TXT_VAL_TABLA} ({$smarty.const.TXT_ANUAL}: {$smarty.const.TXT_DESDE} {$anyo_inicio})</span>
                    <i class="fa fa-chevron-up pull-right clickable"></i>
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    {if $mediciones}
                        <table class="table table-striped table-hover tabla_valores">
                            <thead>
                                <tr>
                                    <th>{$smarty.const.FIELD_UNID}</th>
                                        {for $i=($smarty.now|date_format:"%Y") to $anyo_inicio step=-1}
                                        <th>{$i}</th>
                                        {/for}
                                </tr>
                            </thead>
                            {if $indicador->id_tipo_agregacion!=0} 
                                <tbody>
                                    {foreach from=$subunidades_mediciones item=subunidades}
                                        {if $subunidades->id != $entidad->id}
                                            <tr>
                                                <td><span class="label label-primary">{$subunidades->etiqueta}</span></td>
                                                {for $i=($smarty.now|date_format:"%Y") to $anyo_inicio step=-1}
                                                    <td>
                                                        {if $totales_anuales[$subunidades->id][$i]=== NULL}
                                                            ---
                                                        {else}
                                                            {$totales_anuales[$subunidades->id][$i]|round:"2"}
                                                        {/if}
                                                    </td>
                                                {/for}
                                            </tr>
                                        {/if}
                                    {/foreach}
                                </tbody>
                                <tfoot>
                                    {*Totales*}
                                    {foreach from=$subunidades_mediciones item=subunidades}
                                        {if $subunidades->id == $entidad->id}
                                            <tr>
                                                <td><b>{$smarty.const.FIELD_TOTAL}: {$subunidades->etiqueta} ({$agregacion_temporal})</b></td>
                                                {for $i=($smarty.now|date_format:"%Y") to $anyo_inicio step=-1}
                                                    <td 
                                                        {if isset($status_anuales[$subunidades->id][$i])}
                                                            {if $status_anuales[$subunidades->id][$i] == 'red'}
                                                                class="danger"
                                                            {else if $status_anuales[$subunidades->id][$i] == 'green'}
                                                                class="success"
                                                            {else}
                                                                class="warning"
                                                            {/if}
                                                        {/if}>
                                                        {if $totales_anuales[$subunidades->id][$i]=== NULL} 
                                                            --- 
                                                        {else}
                                                            <span class="badge">{$totales_anuales[$subunidades->id][$i]|round:"2"}</span>
                                                            {if isset($status_anuales[$subunidades->id][$i])}
                                                                {if $status_anuales[$subunidades->id][$i] == 'red'}
                                                                    <i title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_MEJORABLE} ({$smarty.const.FIELD_LIMITE}: {$ref_anuales_lim[$i]}, {$smarty.const.FIELD_META}: {$ref_anuales_obj[$i]})" class="fa fa-circle fa-fw" style="color:{$status_anuales[$subunidades->id][$i]}"></i>
                                                                {else if $status_anuales[$subunidades->id][$i] == 'green'}
                                                                    <i title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_LOGRADO} ({$smarty.const.FIELD_LIMITE}: {$ref_anuales_lim[$i]}, {$smarty.const.FIELD_META}: {$ref_anuales_obj[$i]})" class="fa fa-circle fa-fw" style="color:{$status_anuales[$subunidades->id][$i]}"></i>
                                                                {else}
                                                                    <i title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_ACEPTABLE} ({$smarty.const.FIELD_LIMITE}: {$ref_anuales_lim[$i]}, {$smarty.const.FIELD_META}: {$ref_anuales_obj[$i]})" class="fa fa-circle fa-fw" style="color:{$status_anuales[$subunidades->id][$i]}"></i>
                                                                {/if}
                                                            {else}
                                                                ---
                                                            {/if}
                                                        {/if}
                                                    </td>
                                                {/for}
                                            </tr>
                                        {/if}
                                    {/foreach}
                                </tfoot>
                            {else}
                                <tbody>
                                {*Totales*}
                                    {foreach from=$subunidades_mediciones item=subunidades}
                                        {if $subunidades->id == $entidad->id}
                                            <tr>
                                                <td><b>{$smarty.const.FIELD_TOTAL}: {$subunidades->etiqueta} ({$agregacion_temporal})</b></td>
                                                {for $i=($smarty.now|date_format:"%Y") to $anyo_inicio step=-1}
                                                    <td 
                                                        {if isset($status_anuales[$subunidades->id][$i])}
                                                            {if $status_anuales[$subunidades->id][$i] == 'red'}
                                                                class="danger"
                                                            {else if $status_anuales[$subunidades->id][$i] == 'green'}
                                                                class="success"
                                                            {else}
                                                                class="warning"
                                                            {/if}
                                                        {/if}>
                                                        {if $totales_anuales[$subunidades->id][$i]=== NULL} 
                                                            --- 
                                                        {else}
                                                            <span class="badge">{$totales_anuales[$subunidades->id][$i]|round:"2"}</span>
                                                            {if isset($status_anuales[$subunidades->id][$i])}
                                                                {if $status_anuales[$subunidades->id][$i] == 'red'}
                                                                    <i title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_MEJORABLE} ({$smarty.const.FIELD_LIMITE}: {$ref_anuales_lim[$i]}, {$smarty.const.FIELD_META}: {$ref_anuales_obj[$i]})" class="fa fa-circle fa-fw" style="color:{$status_anuales[$subunidades->id][$i]}"></i>
                                                                {else if $status_anuales[$subunidades->id][$i] == 'green'}
                                                                    <i title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_LOGRADO} ({$smarty.const.FIELD_LIMITE}: {$ref_anuales_lim[$i]}, {$smarty.const.FIELD_META}: {$ref_anuales_obj[$i]})" class="fa fa-circle fa-fw" style="color:{$status_anuales[$subunidades->id][$i]}"></i>
                                                                {else}
                                                                    <i title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_ACEPTABLE} ({$smarty.const.FIELD_LIMITE}: {$ref_anuales_lim[$i]}, {$smarty.const.FIELD_META}: {$ref_anuales_obj[$i]})" class="fa fa-circle fa-fw" style="color:{$status_anuales[$subunidades->id][$i]}"></i>
                                                                {/if}
                                                            {else}
                                                                ---
                                                            {/if}
                                                        {/if}
                                                    </td>
                                                {/for}
                                            </tr>
                                        {/if}
                                    {/foreach}
                                </tbody>
                            {/if}
                        </table>
                    {else}
                        <div class="alert alert-info alert-dismissible">
                            <i class="fa fa-info-circle fa-fw"></i> 
                            {$smarty.const.MSG_INDIC_NO_VAL}
                        </div>
                    {/if}
                </div>
                <!-- /.panel-body -->        
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
{/if}
<!-- /Valores unidad/año -->

<!-- Valores unidad/medición -->
{if $indicador->id_tipo_agregacion!=0}
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-red">
                <div class="panel-heading">
                    <span class="panel-title"><i class="fa fa-tags fa-fw"></i> {$smarty.const.TXT_VAL_TABLA} {if $mediciones}({$smarty.const.TXT_MOSTRANDO}: {if $limite==$total_registros}{$smarty.const.TXT_REGS_TODOS}{else}{$limite} {$smarty.const.TXT_DE} {$total_registros} {$smarty.const.FIELD_REGISTROS}{/if}){/if}</span>
                    <i class="fa fa-chevron-up pull-right clickable"></i>
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    {if $mediciones}
                            <table class="table table-striped table-hover tabla_valores">
                                <thead>
                                    <tr>
                                        <th>{$smarty.const.FIELD_UNID}</th>
                                            {foreach from=$mediciones item=medicion}
                                            <th>{$medicion->etiqueta}</th>
                                            {/foreach}
                                    </tr>
                                </thead>
                                <tbody>
                                    {foreach from=$subunidades_mediciones item=subunidades}
                                        {if $subunidades->id != $entidad->id}
                                            <tr>
                                                <td><span class="label label-primary">{$subunidades->etiqueta}</span></td>
                                                {foreach from=$subunidades->mediciones item=medicion}
                                                    <td>
                                                        {if $medicion->medicion_valor->valor == NULL} 
                                                            --- 
                                                        {else}
                                                            {$medicion->medicion_valor->valor|round:"2"}
                                                        {/if}
                                                    </td>
                                                {/foreach}
                                            </tr>
                                        {/if}
                                    {/foreach}
                                </tbody>
                                <tfoot>
                                    {*Total en indicadores centralizados o agregados de tipo manual*}
                                    {foreach from=$subunidades_mediciones item=subunidades}
                                        {if $subunidades->id == $entidad->id && ($indicador->id_tipo_agregacion == 0 || $indicador->id_tipo_agregacion == 4)}
                                            <tr>
                                                <td><b>{$smarty.const.FIELD_TOTAL}: {$subunidades->etiqueta} ({$agregacion})</b></td>
                                                {foreach from=$subunidades->mediciones item=medicion}
                                                    <td
                                                        {if isset($status[$medicion->id])}
                                                            {if  $status[$medicion->id] == 'red'}
                                                                class="danger"
                                                            {else if $status[$medicion->id] == 'green'}
                                                                class="success"
                                                            {else}
                                                                class="warning"
                                                            {/if}
                                                        {/if}>
                                                        {if $medicion->medicion_valor->valor == NULL} 
                                                            --- 
                                                        {else}
                                                            <span class="badge">{$medicion->medicion_valor->valor|round:"2"}</span>
                                                            {if isset($status[$medicion->id])}
                                                                {if  $status[$medicion->id] == 'red'}
                                                                    <i title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_MEJORABLE} ({$smarty.const.FIELD_LIMITE}: {$medicion_lim[$medicion->id]}, {$smarty.const.FIELD_META}: {$medicion_obj[$medicion->id]})" class="fa fa-circle fa-fw" style="color:{$status[$medicion->id]}"></i>
                                                                {else if $status[$medicion->id] == 'green'}
                                                                    <i title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_LOGRADO} ({$smarty.const.FIELD_LIMITE}: {$medicion_lim[$medicion->id]}, {$smarty.const.FIELD_META}: {$medicion_obj[$medicion->id]})" class="fa fa-circle fa-fw" style="color:{$status[$medicion->id]}"></i>
                                                                {else}
                                                                    <i title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_ACEPTABLE} ({$smarty.const.FIELD_LIMITE}: {$medicion_lim[$medicion->id]}, {$smarty.const.FIELD_META}: {$medicion_obj[$medicion->id]})" class="fa fa-circle fa-fw" style="color:{$status[$medicion->id]}"></i>
                                                                {/if}
                                                            {else}
                                                                ---
                                                            {/if}
                                                        {/if}
                                                    </td>
                                                {/foreach}
                                            </tr>
                                        {/if}
                                    {/foreach}
                                    {*Total en indicadores agregados de tipo no manual*}
                                    {foreach from=$subunidades_mediciones item=subunidades}
                                        {if $subunidades->id == $entidad->id && $indicador->id_tipo_agregacion != 0 && $indicador->id_tipo_agregacion != 4}
                                            <tr>
                                                <td><b>{$smarty.const.FIELD_TOTAL}: {$subunidades->etiqueta} ({$agregacion})</b></td>
                                                {foreach from=$subunidades->mediciones item=medicion}
                                                    <td 
                                                        {if isset($status[$medicion->id])}
                                                            {if $status[$medicion->id] == 'red'}
                                                                class="danger"
                                                            {else if $status[$medicion->id] == 'green'}
                                                                class="success"
                                                            {else}
                                                                class="warning"
                                                            {/if}
                                                        {/if}>
                                                        {if $totales[$medicion->id] === NULL} 
                                                            --- 
                                                        {else}
                                                            <span class="badge">{$totales[$medicion->id]|round:"2"}</span>
                                                            {if isset($status[$medicion->id])}
                                                                {if  $status[$medicion->id] == 'red'}
                                                                    <i title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_MEJORABLE} ({$smarty.const.FIELD_LIMITE}: {$medicion_lim[$medicion->id]}, {$smarty.const.FIELD_META}: {$medicion_obj[$medicion->id]})" class="fa fa-circle fa-fw" style="color:{$status[$medicion->id]}"></i>
                                                                {else if $status[$medicion->id] == 'green'}
                                                                    <i title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_LOGRADO} ({$smarty.const.FIELD_LIMITE}: {$medicion_lim[$medicion->id]}, {$smarty.const.FIELD_META}: {$medicion_obj[$medicion->id]})" class="fa fa-circle fa-fw" style="color:{$status[$medicion->id]}"></i>
                                                                {else}
                                                                    <i title="{if $indicador->inverso}{$smarty.const.TXT_DESCENDENTE}{else}{$smarty.const.TXT_ASCENDENTE}{/if}: {$smarty.const.TXT_VAL_ACEPTABLE} ({$smarty.const.FIELD_LIMITE}: {$medicion_lim[$medicion->id]}, {$smarty.const.FIELD_META}: {$medicion_obj[$medicion->id]})" class="fa fa-circle fa-fw" style="color:{$status[$medicion->id]}"></i>
                                                                {/if}
                                                            {else}
                                                                ---
                                                            {/if}
                                                        {/if}
                                                    </td>
                                                {/foreach}
                                            </tr>
                                        {/if}
                                    {/foreach}
                                </tfoot>
                            </table>
                    {else}
                        <div class="alert alert-info alert-dismissible">
                            <i class="fa fa-info-circle fa-fw"></i> 
                            {$smarty.const.MSG_INDIC_NO_VAL}
                        </div>
                    {/if}
                </div>
                <!-- /.panel-body -->        
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
{/if}
<!-- /Valores unidad/medición -->