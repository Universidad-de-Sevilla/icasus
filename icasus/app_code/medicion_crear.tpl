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

<!-- Barra de botones -->
<div class="row">
    <div class="col-lg-12">
        <div class="btn-toolbar" role="toolbar" aria-label="">
            <div class="btn-group" role="group" aria-label="">
                <a class="btn btn-default btn-danger" href='index.php?page=medicion_listar&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}' title="{$smarty.const.TXT_MED_VOLVER}">
                    <i class="fa fa-arrow-left fa-fw"></i> {$smarty.const.TXT_MED_VOLVER}</a>
            </div>
        </div>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<br>
<!-- /Barra de botones -->

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
                                    <button type="button" class="btn btn-default btn-danger" title="{$smarty.const.TXT_CANCEL}" onclick="location.href = 'index.php?page=medicion_listar&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}';">
                                        <i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_CANCEL}
                                    </button>
                                    <div class="pull-right">
                                        <button type="reset" class="btn btn-default btn-warning" title="{$smarty.const.TXT_RESET}">
                                            <i class="fa fa-refresh fa-fw"></i> {$smarty.const.TXT_RESET}
                                        </button>
                                        <button id="btn_nxt_vref" title="{$smarty.const.TXT_SIG}" type="button" class="btn btn-default btn-primary">
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
                                    <button id="btn_prev_medicion" title="{$smarty.const.TXT_ANT}" type="button" class="btn btn-default btn-primary btnPrev">
                                        <i class=" fa fa-arrow-left fa-fw"></i> {$smarty.const.TXT_ANT}
                                    </button>
                                    <button type="button" class="btn btn-default btn-danger" title="{$smarty.const.TXT_CANCEL}" onclick="location.href = 'index.php?page=medicion_listar&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}';">
                                        <i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_CANCEL}
                                    </button>
                                    <div class="pull-right">
                                        <button id="btn_nxt_subunidades" title="{$smarty.const.TXT_SIG}" type="button" class="btn btn-default btn-primary btnNext">
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
                                    <button id="btn_prev_vref" title="{$smarty.const.TXT_ANT}" type="button" class="btn btn-default btn-primary btnPrev">
                                        <i class=" fa fa-arrow-left fa-fw"></i> {$smarty.const.TXT_ANT}
                                    </button>
                                    <button type="button" class="btn btn-default btn-danger" title="{$smarty.const.TXT_CANCEL}" onclick="location.href = 'index.php?page=medicion_listar&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}';">
                                        <i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_CANCEL}
                                    </button>     
                                    <div class="pull-right">
                                        <button title="{$smarty.const.TXT_GRABAR}" type="submit" class="btn btn-default btn-success">
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