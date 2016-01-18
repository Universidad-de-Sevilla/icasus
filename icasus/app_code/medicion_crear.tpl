<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <h3 title="{$_nombre_pagina}" class="page-header">
            <i class="fa fa-plus-circle fa-fw"></i> {$_nombre_pagina}
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
                        <a title="{$smarty.const.TXT_CONSULTA_DESCRIPCION}" href="index.php?page=consulta_avanzada&id_entidad={$entidad->id}">
                            <i class="fa fa-commenting fa-fw"></i> {$smarty.const.TXT_CONSULT}
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_CUADRO_MANDO_DESCRIPCION}" href='index.php?page=cuadro_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-th fa-fw"></i> {$smarty.const.TXT_CUADROS_MANDO}
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
            <li><a title="{if $tipo == 'indicador'}{$smarty.const.FIELD_INDICS}{else}{$smarty.const.FIELD_DATOS}{/if}" href='index.php?page={$tipo}_listar&id_entidad={$entidad->id}'>{if $tipo == 'indicador'}{$smarty.const.FIELD_INDICS}{else}{$smarty.const.FIELD_DATOS}{/if}</a></li>
            <li><a title="{$indicador->nombre}" href='index.php?page={$tipo}_mostrar&id_{$tipo}={$indicador->id}&id_entidad={$entidad->id}'>{$indicador->nombre|truncate:30}</a></li>
            <li><a title="{$smarty.const.FIELD_MEDICIONES}: {$indicador->nombre}" href='index.php?page=medicion_listar&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'>{$smarty.const.FIELD_MEDICIONES}: {$indicador->nombre|truncate:30}</a></li>
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
                <span class="panel-title"><i class="fa fa-clock-o fa-fw"></i> {$smarty.const.TXT_MED_DATOS}</span>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <form method="post" action="index.php?page=medicion_grabar" id="medicion_crear"
                      data-toggle="validator" class="form-horizontal">
                    <input type="hidden" name="id_indicador" value="{$indicador->id}" />
                    <input type="hidden" name="tipo" value="{$tipo}" /> 
                    <!-- Nav tabs -->
                    <ul class="nav nav-pills" role="tablist">
                        <li id="tab_medicion" role="presentation" class="active" ><a title="{$smarty.const.FIELD_MED}" aria-controls="{$smarty.const.FIELD_MED}" role="tab" ><span class="badge">1</span> {$smarty.const.FIELD_MED}</a></li>
                        <li id="tab_vref" role="presentation" class="disabled" ><a title="{$smarty.const.FIELD_VAL_REF}" aria-controls="{$smarty.const.FIELD_VAL_REF}" role="tab" ><span class="badge">2</span> {$smarty.const.FIELD_VAL_REF}</a></li>
                        <li id="tab_subunidades" role="presentation" class="disabled" ><a title="{$smarty.const.FIELD_SUBUNID_AFECT}" aria-controls="{$smarty.const.FIELD_SUBUNID_AFECT}" role="tab" ><span class="badge">3</span> {$smarty.const.FIELD_SUBUNID_AFECT}</a></li>
                    </ul>
                    <!-- /Nav tabs -->
                    <!-- Tab panes -->
                    <div class="tab-content">

                        <!-- Tab medicion -->
                        <div role="tabpanel" class="tab-pane active" id="medicion">
                            <br>
                            <div class="form-group has-feedback">
                                <label for="etiqueta" class="col-sm-2 control-label">{$smarty.const.FIELD_ETIQUETA} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
                                <div class="col-sm-8">
                                    <input type='text' class="form-control" name="etiqueta" id="etiqueta" placeholder="{$smarty.const.FIELD_ETIQUETA}" required/>
                                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="observaciones" class="col-sm-2 control-label">{$smarty.const.FIELD_OBSERV}</label>
                                <div class="col-sm-8">
                                    <textarea  class="form-control" id="observaciones" name="observaciones" placeholder="{$smarty.const.FIELD_OBSERV}"></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">{$smarty.const.FIELD_INICIO_PERIODO}</label>
                                <div class="col-sm-8">
                                    <div>
                                        {html_select_date field_order='DMY' start_year="-10"  end_year="+5" time=$smarty.now  prefix="pi" month_format='%m'}
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">{$smarty.const.FIELD_FIN_PERIODO}</label>
                                <div class="col-sm-8">
                                    <div>
                                        {html_select_date field_order='DMY' start_year="-10" end_year="+5" time=$smarty.now  prefix="pf" month_format='%m'}
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">{$smarty.const.FIELD_INICIO_GRABACION}</label>
                                <div class="col-sm-8">
                                    <div>
                                        {html_select_date field_order='DMY' start_year="-10"  end_year="+5" time=$smarty.now prefix="gi" month_format='%m'}
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">{$smarty.const.FIELD_FIN_GRABACION}</label>
                                <div class="col-sm-8">
                                    <div>
                                        {html_select_date field_order='DMY' start_year="-10" end_year="+5" time=$smarty.now  prefix="gf" month_format='%m'}
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-8">
                                    <a class="btn btn-danger" title="{$smarty.const.TXT_CANCEL}" href = 'index.php?page=medicion_listar&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                                        <i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_CANCEL}
                                    </a>
                                    <div class="pull-right">
                                        <button type="reset" class="btn btn-warning" title="{$smarty.const.TXT_RESET}">
                                            <i class="fa fa-refresh fa-fw"></i> {$smarty.const.TXT_RESET}
                                        </button>
                                        <button id="btn_nxt_vref" title="{$smarty.const.TXT_SIG}" type="button" class="btn btn-primary">
                                            <i class="fa fa-arrow-right fa-fw"></i> {$smarty.const.TXT_SIG}
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /Tab medicion --> 

                        <!-- Tab valores de referencia -->
                        <div role="tabpanel" class="tab-pane" id="vref">
                            <br>
                            {if $valores_referencia}
                                {foreach $valores_referencia as $valor_referencia}
                                    <div class="form-group">
                                        <label for="{$valor_referencia->etiqueta}" class="col-sm-2 control-label">{$valor_referencia->etiqueta}</label>
                                        <div class="col-sm-8">
                                            <input type='number' class="form-control" name="valor_referencia[{$valor_referencia->id}]" id="{$valor_referencia->etiqueta}" placeholder="{$valor_referencia->etiqueta}" />
                                        </div>
                                    </div>
                                {/foreach}
                            {else}
                                <div class="alert alert-info alert-dismissible">
                                    <i class="fa fa-info-circle fa-fw"></i> 
                                    {$smarty.const.MSG_INDIC_NO_VAL_REF}
                                </div> 
                            {/if}
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-8">
                                    <button id="btn_prev_medicion" title="{$smarty.const.TXT_ANT}" type="button" class="btn btn-primary btnPrev">
                                        <i class=" fa fa-arrow-left fa-fw"></i> {$smarty.const.TXT_ANT}
                                    </button>
                                    <a class="btn btn-danger" title="{$smarty.const.TXT_CANCEL}" href = 'index.php?page=medicion_listar&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'>
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
                        <!-- /Tab valores de referencia -->

                        <!-- Tab subunidades -->
                        <div role="tabpanel" class="tab-pane" id="subunidades">
                            <br>
                            <div id="div_subunidades" class="form-group has-feedback">
                                <label for="lista_subunidades" class="col-sm-2 control-label">{$smarty.const.FIELD_SUBUNIDS} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
                                <div class="col-sm-8">
                                    {foreach name="subunidad" from=$subunidades item=subunidad}
                                        <div class="checkbox">
                                            <label>
                                                <input id="lista_subunidades" type="checkbox" name="subunidades[]" data-indicador="{$indicador->id}" value="{$subunidad->id}" class="subunidad" data-validar_subunidades="validar_subunidades"
                                                       {foreach $indicador_subunidades as $indicador_subunidad}
                                                           {if $indicador_subunidad->id_entidad == $subunidad->id} checked{/if}
                                                       {/foreach}>
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
                                    <button id="btn_prev_vref" title="{$smarty.const.TXT_ANT}" type="button" class="btn btn-primary btnPrev">
                                        <i class=" fa fa-arrow-left fa-fw"></i> {$smarty.const.TXT_ANT}
                                    </button>
                                    <a type="button" class="btn btn-danger" title="{$smarty.const.TXT_CANCEL}" href = 'index.php?page=medicion_listar&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'>
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
            <!-- /.panel-body --> 
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->