<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <h3 title="{$_nombre_pagina}" class="page-header">
            <i class="fa fa-bullseye fa-fw"></i><sub class="fa fa-plus fa-fw"></sub> {$_nombre_pagina}
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
            <li><a title="{$smarty.const.FIELD_PLANES}" href='index.php?page=plan_listar&id_entidad={$entidad->id}'>{$smarty.const.FIELD_PLANES}</a></li>
            <li><a title="{$smarty.const.FIELD_PLAN} {$plan->anyo_inicio} - {($plan->anyo_inicio + $plan->duracion-1)}" href='index.php?page=plan_mostrar&id_plan={$plan->id}&id_entidad={$entidad->id}'>{$smarty.const.FIELD_PLAN} {$plan->anyo_inicio} - {$plan->anyo_inicio + $plan->duracion-1}</a></li>
            <li><a title="{$smarty.const.FIELD_LINEAS}" href='index.php?page=plan_mostrar&id_plan={$plan->id}&id_entidad={$entidad->id}#plan_lineas'>{$smarty.const.FIELD_LINEAS}</a></li>
            <li><a title="{$smarty.const.FIELD_LINEA} {$linea->indice}. {$linea->nombre}" href='index.php?page=linea_mostrar&id_entidad={$entidad->id}&id_linea={$linea->id}'>{$smarty.const.FIELD_LINEA} {$linea->indice}. {$linea->nombre|truncate:30}</a></li>
            <li><a title="{$smarty.const.FIELD_OBJS_EST}" href='index.php?page=linea_mostrar&id_linea={$linea->id}&id_entidad={$entidad->id}#linea_objests'>{$smarty.const.FIELD_OBJS_EST}</a></li>
            <li><a title="{$smarty.const.FIELD_OBJ_EST} {$linea->indice}.{$objest->indice}. {$objest->nombre}" href='index.php?page=objest_mostrar&id_objest={$objest->id}&id_entidad={$entidad->id}'>{$smarty.const.FIELD_OBJ_EST} {$linea->indice}.{$objest->indice}. {$objest->nombre|truncate:30}</a></li>
            <li><a title="{$smarty.const.FIELD_OBJS_OP}" href='index.php?page=objest_mostrar&id_objest={$objest->id}&id_entidad={$entidad->id}#objest_objops'>{$smarty.const.FIELD_OBJS_OP}</a></li>
            <li title="{$_nombre_pagina}" class="active">{$_nombre_pagina}</li>
        </ol>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- /Breadcrumbs -->

<div class="row">
    <div class="col-lg-12">
        <form action='index.php?page=objop_grabar' method='post' id='formobjop' name='formobjop' 
              data-toggle="validator" class="form-horizontal">
            <!-- Nav tabs -->
            <ul class="nav nav-pills" role="tablist">
                <li id="tab_objop" role="presentation" class="active"><a title="{$smarty.const.FIELD_OBJ_OP}" aria-controls="{$smarty.const.FIELD_OBJ_OP}" role="tab" ><b>{$smarty.const.TXT_PASO} 1:</b> <span class="badge">{$smarty.const.FIELD_OBJ_OP}</span></a></li>
                <li class="disabled"><a><i class="fa fa-arrow-right fa-fw"></i></a></li>
                <li id="tab_indicadores" role="presentation" class="disabled"><a title="{$smarty.const.FIELD_INDICS}" aria-controls="{$smarty.const.FIELD_INDICS}" role="tab" ><b>{$smarty.const.TXT_PASO} 2:</b> <span class="badge">{$smarty.const.FIELD_INDICS}</span></a></li>
                <li class="disabled"><a><i class="fa fa-arrow-right fa-fw"></i></a></li>
                <li id="tab_subunidades" role="presentation" class="disabled"><a title="{$smarty.const.FIELD_UNID} / {$smarty.const.FIELD_SUBUNIDS}" aria-controls="{$smarty.const.FIELD_UNID} / {$smarty.const.FIELD_SUBUNIDS}" role="tab" ><b>{$smarty.const.TXT_PASO} 3:</b> <span class="badge">{$smarty.const.FIELD_UNID} / {$smarty.const.FIELD_SUBUNIDS}</span></a></li>
            </ul>
            <!-- /Nav tabs -->
            <!-- Tab panes -->
            <div class="tab-content">

                <!-- Tab objetivo operacional -->
                <div role="tabpanel" class="tab-pane active" id="objop">
                    <br>
                    <div class="form-group">
                        <label for="id_objest" class="col-sm-2 control-label">{$smarty.const.FIELD_OBJ_EST}</label>
                        <div class="col-sm-8">
                            <input type="hidden" name="id_objest" value="{$objest->id}">
                            <input type='text' class="form-control" id="id_objest" value="{$objest->linea->indice}.{$objest->indice}. {$objest->nombre}" readonly/>
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="indice" class="col-sm-2 control-label"><i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i> {$smarty.const.FIELD_INDICE}</label>
                        <div class="col-sm-8">
                            <div class="input-group">
                                <div class="input-group-addon">{$objest->linea->indice}.{$objest->indice}.</div>
                                <input type='number' class="form-control" name='indice' id='indice' value="1" min="1" placeholder="{$smarty.const.FIELD_INDICE}" data-elementos='{$elementos|@json_encode}' data-validar_igual="validar_igual" data-validar_igual-error="{$smarty.const.ERR_OBJOP_VAL_INDICE}" required/>
                            </div>
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="nombre" class="col-sm-2 control-label"><i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i> {$smarty.const.FIELD_NOMBRE}</label>
                        <div class="col-sm-8">
                            <input type='text' class="form-control" name='nombre' id='nombre' placeholder="{$smarty.const.FIELD_NOMBRE}" required/>
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="id_responsable" class="col-sm-2 control-label">{$smarty.const.FIELD_RESP}</label>
                        <div class="col-sm-8">
                            <select class="form-control chosen-select" name="id_responsable" id="id_responsable">
                                {foreach $usuarios_entidad as $usuario_entidad}
                                    <option value="{$usuario_entidad->usuario->id}">{$usuario_entidad->usuario->apellidos}, {$usuario_entidad->usuario->nombre} {if $usuario_entidad->usuario->puesto} - {$usuario_entidad->usuario->puesto} {/if}</option>
                                {/foreach} 
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="descripcion" class="col-sm-2 control-label">{$smarty.const.FIELD_DESC}</label>
                        <div class="col-sm-8">
                            <textarea  class="form-control" id="descripcion" name="descripcion" placeholder="{$smarty.const.FIELD_DESC}"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="observaciones" class="col-sm-2 control-label">{$smarty.const.FIELD_OBSERV}</label>
                        <div class="col-sm-8">
                            <textarea  class="form-control" id="observaciones" name="observaciones" placeholder="{$smarty.const.FIELD_OBSERV}"></textarea>
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="peso" class="col-sm-2 control-label"><i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i> {$smarty.const.FIELD_PESO}</label>
                        <div class="col-sm-8">
                            <input id="peso" type="number" value="1" step="0.01" min="0.01" max="1" name="peso" class="form-control" placeholder="{$smarty.const.FIELD_PESO}" title="{$smarty.const.TXT_PESO}" data-toggle="tooltip" data-placement="left" required/>
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-8">
                            <a class="btn btn-danger" title="{$smarty.const.TXT_CANCEL}" href ='index.php?page=objest_mostrar&id_objest={$objest->id}&id_entidad={$plan->id_entidad}'>
                                <i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_CANCEL}
                            </a>
                            <div class="pull-right">
                                <button type="reset" class="btn btn-warning" title="{$smarty.const.TXT_RESET}">
                                    <i class="fa fa-refresh fa-fw"></i> {$smarty.const.TXT_RESET}
                                </button>
                                <button id="btn_nxt_indicadores" title="{$smarty.const.TXT_SIG}" type="button" class="btn btn-primary">
                                    <i class="fa fa-arrow-right fa-fw"></i> {$smarty.const.TXT_SIG}
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Tab objetivo operacional --> 

                <!-- Tab indicadores -->
                <div role="tabpanel" class="tab-pane" id="indicadores">
                    <br>
                    <div id="div_indics_correlacion" class="form-group">
                        <label for="indicadores_correlacion" class="col-sm-2 control-label">{$smarty.const.FIELD_INDICS} ({$smarty.const.FIELD_PROC})</label>
                        <div class="col-sm-8">
                            <select class="form-control chosen-select" name="indicadores_correlacion[]" id="indicadores_correlacion" multiple>
                                {foreach $indicadores as $indicador}
                                    <option title="{$indicador->codigo} - {$indicador->nombre}" value="{$indicador->id}">{$indicador->codigo} - {$indicador->nombre}</option>
                                {/foreach}
                            </select>
                        </div>
                    </div>
                    <div id="div_indics_control" class="form-group">
                        <label for="indicadores_control" class="col-sm-2 control-label">{$smarty.const.FIELD_INDICS} ({$smarty.const.TXT_CONTROL})</label>
                        <div class="col-sm-8">
                            <select class="form-control chosen-select" name="indicadores_control[]" id="indicadores_control" multiple>
                                {foreach $indicadores_ctl as $indicador}
                                    <option title="{$indicador->codigo} - {$indicador->nombre}" value="{$indicador->id}">{$indicador->codigo} - {$indicador->nombre}</option>
                                {/foreach}
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-8">
                            <button id="btn_prev_objop" title="{$smarty.const.TXT_ANT}" type="button" class="btn btn-primary btnPrev">
                                <i class=" fa fa-arrow-left fa-fw"></i> {$smarty.const.TXT_ANT}
                            </button>
                            <a class="btn btn-danger" title="{$smarty.const.TXT_CANCEL}" href ='index.php?page=objest_mostrar&id_objest={$objest->id}&id_entidad={$plan->id_entidad}'>
                                <i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_CANCEL}
                            </a>
                            <div class="pull-right">
                                <button id="btn_nxt_subunidades" title="{$smarty.const.TXT_SIG}" type="button" class="btn btn-primary btnNext">
                                    <i class="fa fa-arrow-right fa-fw"></i> {$smarty.const.TXT_SIG}
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Tab indicadores -->

                <!-- Tab subunidades -->
                <div role="tabpanel" class="tab-pane" id="subunidades">
                    <br>
                    <div class="form-group">
                        <label for="tipo_objop" class="col-sm-2 control-label">{$smarty.const.TXT_OBJOP_TIPO}</label>
                        <div class="col-sm-8">
                            <div class="radio">
                                <label>
                                    <input id="tipo_objop" type="radio" value="0" name="tipo_objop" class="tipo_objop" checked>
                                    {$smarty.const.TXT_OBJOP_PROPIO}
                                </label>
                            </div>
                            <div class="radio">
                                <label>
                                    <input id="tipo_objop" type="radio" value="1" name="tipo_objop" class="tipo_objop">
                                    {$smarty.const.TXT_OBJOP_DESC}
                                </label>
                            </div>
                        </div>
                    </div>
                    <div id="div_unidad" class="form-group">
                        <label for="lista_unidades" class="col-sm-2 control-label">{$smarty.const.FIELD_UNID}</label>
                        <div class="col-sm-8">
                            <select id="lista_unidades" class="form-control chosen-select" name="subunidades[]">
                                <option value="{$entidad->id}">{$entidad->etiqueta}</option>
                                {foreach name="subunidad" from=$subunidades item="subunidad"}
                                    <option value="{$subunidad->id}">{$subunidad->etiqueta}</option> 
                                {/foreach}
                            </select>
                        </div>
                    </div>
                    <div id="div_subunidades" class="form-group has-feedback hidden">
                        <label for="lista_subunidades" class="col-sm-2 control-label"><i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i> {$smarty.const.FIELD_SUBUNIDS}</label>
                        <div class="col-sm-8">
                            <button id="marcar_todos" type="button" class="btn btn-default btn-circle btn-primary btn-xs" title="{$smarty.const.TXT_MARCAR}" >
                                <i class="fa fa-check-square-o fa-fw"></i>
                            </button>
                            <button id="desmarcar_todos" type="button" class="btn btn-default btn-circle btn-primary btn-xs" title="{$smarty.const.TXT_DESMARCAR}" >
                                <i class="fa fa-square-o fa-fw"></i>
                            </button>
                            {foreach name="subunidad" from=$subunidades item="subunidad"}
                                <div class="checkbox">
                                    <label>
                                        <input id="lista_subunidades" type="checkbox" name="subunidades[]" value="{$subunidad->id}" class="subunidad" data-validar_subunidades="validar_subunidades" checked>
                                        {$subunidad->etiqueta}
                                    </label>
                                </div>
                            {/foreach}
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-8">
                            <button id="btn_prev_indicadores" title="{$smarty.const.TXT_ANT}" type="button" class="btn btn-primary btnPrev">
                                <i class=" fa fa-arrow-left fa-fw"></i> {$smarty.const.TXT_ANT}
                            </button>
                            <a class="btn btn-danger" title="{$smarty.const.TXT_CANCEL}" href ='index.php?page=objest_mostrar&id_objest={$objest->id}&id_entidad={$plan->id_entidad}'>
                                <i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_CANCEL}
                            </a>   
                            <div class="pull-right">
                                <button title="{$smarty.const.TXT_GRABAR}" type="submit" class="btn btn-success">
                                    <i class="fa fa-download fa-fw"></i> {$smarty.const.TXT_GRABAR}
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Tab subunidades -->

            </div>
            <!-- /Tab panes -->

        </form>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
