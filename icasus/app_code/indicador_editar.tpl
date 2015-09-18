<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <h2 title="{$_nombre_pagina}" class="page-header">
            <i class="fa fa-pencil fa-fw"></i> {$_nombre_pagina}
        </h2>
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
                <a class="btn btn-default btn-danger" href="index.php?page=indicador_listar&id_entidad={$entidad->id}" title="{$smarty.const.TXT_INDICS_VOLVER}">
                    <i class="fa fa-arrow-left fa-fw"></i> {$smarty.const.TXT_INDICS_VOLVER}</a>
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
                <span class="panel-title"><i class="fa fa-dashboard fa-fw"></i> {$smarty.const.TXT_INDIC_PARAM}</span>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <form method="post" action="index.php?page=indicador_grabar&id_indicador={$indicador->id}" id="indicador_editar"
                      data-toggle="validator" class="form-horizontal">
                    <input type="hidden" name="id_entidad" value="{$entidad->id}" /> 
                    <!-- Nav tabs -->
                    <ul class="nav nav-pills" role="tablist">
                        <li id="tab_indicador" role="presentation" class="active" ><a href="#indicador" aria-controls="{$smarty.const.FIELD_INDIC}" role="tab" data-toggle="tab">{$smarty.const.FIELD_INDIC}</a></li>
                        <li id="tab_otros" role="presentation" ><a href="#otros" aria-controls="{$smarty.const.TXT_OTRAS_PROP}" role="tab" data-toggle="tab">{$smarty.const.TXT_OTRAS_PROP}</a></li>
                        <li id="tab_subunidades" role="presentation" ><a href="#subunidades" aria-controls="{$smarty.const.FIELD_SUBUNID_AFECT}" role="tab" data-toggle="tab">{$smarty.const.FIELD_SUBUNID_AFECT}</a></li>
                    </ul>
                    <!-- /Nav tabs -->
                    <!-- Tab panes -->
                    <div class="tab-content">

                        <!-- Tab indicador -->
                        <div role="tabpanel" class="tab-pane active" id="indicador">
                            <br>
                            <div class="form-group has-feedback">
                                <label for="codigo" class="col-sm-2 control-label">{$smarty.const.FIELD_COD} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
                                <div class="col-sm-8">
                                    <input title="{$smarty.const.TXT_CODIGO}" type='text' name='codigo' id='codigo' 
                                           pattern="[A-Z]+[.]*[A-Z]*[0-9]*[.]*[0-9]*([-]*[A-Z]*[.]*[A-Z]*[0-9]*[.]*[0-9]*)*"
                                           class="form-control" placeholder="{$smarty.const.FIELD_COD}" required/>
                                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                            <div class="form-group has-feedback">
                                <label for="nombre" class="col-sm-2 control-label">{$smarty.const.FIELD_NOMBRE} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
                                <div class="col-sm-8">
                                    <input type='text' class="form-control" name='nombre' id='nombre' placeholder="{$smarty.const.FIELD_NOMBRE}" required/>
                                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="id_proceso" class="col-sm-2 control-label">{$smarty.const.FIELD_PROC}</label>
                                <div class="col-sm-8">
                                    <select class="form-control chosen-select" name="id_proceso" id="id_proceso">
                                        {foreach $procesos as $proceso}
                                            <option value="{$proceso->id}">{$proceso->nombre}</option>
                                        {/foreach}
                                    </select>
                                </div>
                            </div>
                            <div class="form-group has-feedback">
                                <label for="formulacion" class="col-sm-2 control-label">{$smarty.const.FIELD_FORM} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
                                <div class="col-sm-8">
                                    <textarea  class="form-control" id="formulacion" name="formulacion" placeholder="{$smarty.const.FIELD_FORM}" required></textarea>
                                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                            <div class="form-group has-feedback">
                                <label for="historicos" class="col-sm-2 control-label">{$smarty.const.FIELD_HISTORICO} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
                                <div class="col-sm-8">
                                    <input type="number" value="2008" id='historicos' name="historicos" class="form-control" placeholder="{$smarty.const.FIELD_HISTORICO}" min='2008' max="{$smarty.now|date_format:'%Y'}" required/>
                                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="periodicidad" class="col-sm-2 control-label">{$smarty.const.FIELD_PERIOD}</label>
                                <div class="col-sm-8">
                                    <select class="form-control chosen-select" name="periodicidad" id="periodicidad">
                                        <option value="Bienal">{$smarty.const.TXT_BIENAL}</option>
                                        <option value="Anual" selected>{$smarty.const.TXT_ANUAL}</option>
                                        <option value="Semestral">{$smarty.const.TXT_SEMESTRAL}</option>
                                        <option value="Cuatrimestral">{$smarty.const.TXT_CUATRIMESTRAL}</option>
                                        <option value="Trimestral">{$smarty.const.TXT_TRIMESTRAL}</option>
                                        <option value="Mensual">{$smarty.const.TXT_MENSUAL}</option>
                                    </select>
                                </div>
                            </div>
                            <div id="total_anual" title="{$smarty.const.TXT_CALCULO_TOTAL_ANUAL}" class="form-group hidden">
                                <label for="id_tipo_agregacion_temporal" class="col-sm-2 control-label">{$smarty.const.FIELD_CALC_TOTAL_ANUAL}</label>
                                <div class="col-sm-8">
                                    <select class="form-control chosen-select" name="id_tipo_agregacion_temporal" id="id_tipo_agregacion_temporal">
                                        {foreach $tipos_agregacion as $tipo_agregacion}
                                            {if $tipo_agregacion->id != 0}
                                                <option value="{$tipo_agregacion->id}" >{$tipo_agregacion->descripcion}</option>
                                            {/if}
                                        {/foreach}
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="id_responsable" class="col-sm-2 control-label">{$smarty.const.FIELD_RESP_SEG}</label>
                                <div class="col-sm-8">
                                    <select class="form-control chosen-select" name="id_responsable" id="id_responsable">
                                        {foreach $usuarios_entidad as $usuario_entidad}
                                            <option value="{$usuario_entidad->usuario->id}">{$usuario_entidad->usuario->apellidos}, {$usuario_entidad->usuario->nombre} {if $usuario_entidad->usuario->puesto} - {$usuario_entidad->usuario->puesto} {/if}</option>
                                        {/foreach} 
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="id_responsable_medicion" class="col-sm-2 control-label">{$smarty.const.FIELD_RESP_MED}</label>
                                <div class="col-sm-8">
                                    <select class="form-control chosen-select" name="id_responsable_medicion" id="id_responsable_medicion">
                                        {foreach $usuarios_entidad as $usuario_entidad}
                                            <option value="{$usuario_entidad->usuario->id}">{$usuario_entidad->usuario->apellidos}, {$usuario_entidad->usuario->nombre} {if $usuario_entidad->usuario->puesto} - {$usuario_entidad->usuario->puesto} {/if}</option>
                                        {/foreach} 
                                    </select>
                                </div>
                            </div>              
                            <div id="calculo_automatico">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">{$smarty.const.TXT_INDIC_DAT_CALCULADO}</label>
                                    <div class="col-sm-8">
                                        <div title="{$smarty.const.TXT_SOLO_INDIC_CALC}">
                                            <input type="checkbox" id="activar_calculo"  class="form-control" 
                                                   data-toggle="toggle" data-on="{$smarty.const.TXT_SI}"
                                                   data-onstyle="success" data-offstyle="danger"
                                                   data-off="{$smarty.const.TXT_NO}" data-size="small"/>  
                                        </div>
                                    </div>
                                </div>
                                <div id="formula_calculo" class="form-group has-feedback hidden">
                                    <label for="calculo" class="col-sm-2 control-label">{$smarty.const.FIELD_FORMULA} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
                                    <div class="col-sm-8">
                                        <textarea id="calculo" name="calculo" title="{$smarty.const.TXT_FORMULA}" class="form-control" rows="4" placeholder="{$smarty.const.TXT_FORMULA}" data-validar_formula="validar_formula" disabled="disabled" required></textarea>
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                            </div>
                            <div id="intervalo">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">{$smarty.const.FIELD_INTERVALO}</label>
                                    <div class="col-sm-8">
                                        <div title="{$smarty.const.TXT_INTERVALO}">
                                            <input type="checkbox" id="activar_intervalo"  class="form-control" 
                                                   data-toggle="toggle" data-on="{$smarty.const.TXT_SI}"
                                                   data-onstyle="success" data-offstyle="danger"
                                                   data-off="{$smarty.const.TXT_NO}" data-size="small"/>  
                                        </div>
                                    </div>
                                </div>
                                <div id="vmin" class="form-group has-feedback hidden">
                                    <label for="valor_min" class="col-sm-2 control-label">{$smarty.const.FIELD_VALOR_MIN} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
                                    <div class="col-sm-8">
                                        <input type="number" id='valor_min' name="valor_min" class="form-control" placeholder="{$smarty.const.FIELD_VALOR_MIN}" disabled="disabled" required/>
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div id="vmax" class="form-group has-feedback hidden">
                                    <label for="valor_max" class="col-sm-2 control-label">{$smarty.const.FIELD_VALOR_MAX} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
                                    <div class="col-sm-8">
                                        <input type="number" id='valor_max' name="valor_max" class="form-control" placeholder="{$smarty.const.FIELD_VALOR_MAX}" disabled="disabled" required/>
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-8">
                                    <button type="button" class="btn btn-default btn-danger" title="{$smarty.const.TXT_CANCEL}" onclick="location.href = 'index.php?page=indicador_listar&id_entidad={$entidad->id}';">
                                        <i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_CANCEL}
                                    </button>
                                    <div class="pull-right">
                                        <button type="reset" class="btn btn-default btn-warning" title="{$smarty.const.TXT_RESET}">
                                            <i class="fa fa-refresh fa-fw"></i> {$smarty.const.TXT_RESET}
                                        </button>
                                        <button title="{$smarty.const.TXT_GRABAR}" type="submit" class="btn btn-default btn-success">
                                            <i class="fa fa-download fa-fw"></i> {$smarty.const.TXT_GRABAR}
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /Tab indicador --> 

                        <!-- Tab otros -->
                        <div role="tabpanel" class="tab-pane" id="otros">
                            <br>
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
                            <div class="form-group">
                                <label for="fuente_informacion" class="col-sm-2 control-label">{$smarty.const.FIELD_FUENTE_INFO}</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="fuente_informacion" name="fuente_informacion" placeholder="{$smarty.const.FIELD_FUENTE_INFO}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="fuente_datos" class="col-sm-2 control-label">{$smarty.const.FIELD_FUENTE_DAT}</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="fuente_datos" name="fuente_datos" placeholder="{$smarty.const.TXT_FUENTE_DAT}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="evidencia" class="col-sm-2 control-label">{$smarty.const.FIELD_MET}</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="evidencia" name="evidencia" placeholder="{$smarty.const.FIELD_MET}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="interpretacion" class="col-sm-2 control-label">{$smarty.const.FIELD_INTERP}</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="interpretacion" name="interpretacion" placeholder="{$smarty.const.FIELD_INTERP}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="criterios_efqm" class="col-sm-2 control-label">{$smarty.const.FIELD_EFQM}</label>
                                <div class="col-sm-8">
                                    <select class="form-control chosen-select" name="criterios_efqm[]" id="criterios_efqm" multiple>
                                        {foreach $criterios_efqm as $criterio_efqm}
                                            <option value="{$criterio_efqm->id}">
                                                {$criterio_efqm->codigo} - {$criterio_efqm->nombre|htmlentities}
                                            </option>
                                        {/foreach}
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="id_visibilidad" class="col-sm-2 control-label">{$smarty.const.FIELD_VISIBILIDAD}</label>
                                <div class="col-sm-8">
                                    <select class="form-control chosen-select" name="id_visibilidad" id="id_visibilidad">
                                        {foreach $visibilidades as $visibilidad}
                                            <option value="{$visibilidad->id}">
                                                {$visibilidad->nombre}
                                            </option>
                                        {/foreach}
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="unidad_generadora" class="col-sm-2 control-label">{$smarty.const.FIELD_UNID_GEN}</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="unidad_generadora" name="unidad_generadora" placeholder="{$smarty.const.FIELD_UNID_GEN}">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-8">
                                    <button type="button" class="btn btn-default btn-danger" title="{$smarty.const.TXT_CANCEL}" onclick="location.href = 'index.php?page=indicador_listar&id_entidad={$entidad->id}';">
                                        <i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_CANCEL}
                                    </button>
                                    <div class="pull-right">
                                        <button type="reset" class="btn btn-default btn-warning" title="{$smarty.const.TXT_RESET}">
                                            <i class="fa fa-refresh fa-fw"></i> {$smarty.const.TXT_RESET}
                                        </button>
                                        <button title="{$smarty.const.TXT_GRABAR}" type="submit" class="btn btn-default btn-success">
                                            <i class="fa fa-download fa-fw"></i> {$smarty.const.TXT_GRABAR}
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /Tab otros -->

                        <!-- Tab subunidades -->
                        <div role="tabpanel" class="tab-pane" id="subunidades">
                            <br>
                            <div class="form-group">
                                <label for="tipo_seleccion_responsable" class="col-sm-2 control-label">{$smarty.const.FIELD_TIP_MED}</label>
                                <div class="col-sm-8">
                                    <div class="radio">
                                        <label >
                                            <input id="tipo_seleccion_responsable" type="radio" name="tipo_seleccion_responsable" value="0" class="medicion" checked>
                                            {$smarty.const.TXT_MED_UNICA}
                                        </label>
                                    </div>
                                    <div class="radio">
                                        <label >
                                            <input id="tipo_seleccion_responsable" type="radio" name="tipo_seleccion_responsable" value="1" class="medicion">
                                            {$smarty.const.TXT_MED_DES}
                                        </label>
                                    </div>
                                    <div class="radio">
                                        <label >
                                            <input id="tipo_seleccion_responsable" type="radio" name="tipo_seleccion_responsable" value="2" class="medicion">
                                            {$smarty.const.TXT_MED_DES_CEN}
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div id="total" title="{$smarty.const.TXT_CALCULO_TOTAL}" class="form-group hidden">
                                <label for="id_tipo_agregacion" class="col-sm-2 control-label">{$smarty.const.FIELD_CALC_TOTAL}</label>
                                <div class="col-sm-8">
                                    <select class="form-control chosen-select" name="id_tipo_agregacion" id="id_tipo_agregacion">
                                        {foreach $tipos_agregacion as $tipo_agregacion}
                                            {if $tipo_agregacion->id != 0 AND $tipo_agregacion->id != 5}
                                                <option value="{$tipo_agregacion->id}" >{$tipo_agregacion->descripcion}</option>
                                            {/if}
                                        {/foreach}
                                    </select>
                                </div>
                            </div>
                            <div id="div_unidad" class="form-group has-feedback">
                                <label for="lista_subunidades" class="col-sm-2 control-label">{$smarty.const.FIELD_SUBUNIDS} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
                                <div class="col-sm-8">
                                    <div class="checkbox">
                                        <label>
                                            <input id="lista_subunidades" type="checkbox" name="subunidades[]" value="{$entidad->id}" class="unidad" checked="checked" required>
                                            {$entidad->etiqueta}
                                        </label>
                                    </div>
                                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                            <div id="div_subunidades" class="form-group has-feedback hidden">
                                <label for="lista_subunidades" class="col-sm-2 control-label">{$smarty.const.FIELD_SUBUNIDS} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
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
                                                <input id="lista_subunidades" type="checkbox" name="subunidades[]" value="{$subunidad->id}" class="subunidad" data-validar_subunidades="validar_subunidades" >
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
                                    <button type="button" class="btn btn-default btn-danger" title="{$smarty.const.TXT_CANCEL}" onclick="location.href = 'index.php?page=indicador_listar&id_entidad={$entidad->id}';">
                                        <i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_CANCEL}
                                    </button>     
                                    <div class="pull-right">
                                        <button type="reset" class="btn btn-default btn-warning" title="{$smarty.const.TXT_RESET}">
                                            <i class="fa fa-refresh fa-fw"></i> {$smarty.const.TXT_RESET}
                                        </button>
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

<!--
<form method="post" action="index.php?page=indicador_grabar&id_indicador={$indicador->id}" id="formindicador" name="formindicador">
    <input type="hidden" name="id_entidad" value="{$entidad->id}" />

    <div style="opacity: 1;" class="box tabs" id="tab_editar_indicador">
        <ul class="tab_header">
            <li ><a  href="#indicador" id="tab_indicador">{$smarty.const.FIELD_INDIC}</a></li>
            <li ><a  href="#otros" id="tab_otros">{$smarty.const.TXT_OTRAS_PROP}</a></li>
            <li ><a  href="#subunidades" id="tab_subunidades">{$smarty.const.FIELD_SUBUNID_AFECT}</a></li>
        </ul>

<!-- Tab Indicador
<div style="opacity: 1;" id="indicador" class="block ui-tabs-panel ui-widget-content ui-corner-bottom">
    <p>&nbsp;</p>
    <div class="columns clearfix">
        <div class="col_40">
            <fieldset class="label">
                <label>{$smarty.const.FIELD_COD}</label>
                <div><input  type="text" name="codigo" value="{$indicador->codigo}" /><div class="required_tag tooltip hover left" title="{$smarty.const.MSG_FIELD_REQ}"></div> </div>
            </fieldset>
        </div>
        <div class="col_60">
            <fieldset class="label">
                <label>{$smarty.const.FIELD_PROC}</label>
                <div>
                    <select name="id_proceso" id="id_proceso" class="required2 select_box">
                        <option value="">{$smarty.const.TXT_SEL_UNO}</option>
{foreach $procesos as $proceso}
    <option value="{$proceso->id}" {if $indicador->id_proceso == $proceso->id}selected{/if}> {$proceso->nombre} </option>
{/foreach}
</select>
<div class="required_tag tooltip hover left" title="{$smarty.const.MSG_FIELD_REQ}"></div>
</div>
</fieldset>
</div>
</div>
<fieldset class="label_side">
<label>{$smarty.const.FIELD_NOMBRE}</label>
<div><textarea name="nombre" />{$indicador->nombre}</textarea><div class="required_tag tooltip hover left" title="{$smarty.const.MSG_FIELD_REQ}"></div></div>
</fieldset>
<fieldset class="label_side">
<label>{$smarty.const.FIELD_FORM}</label>
<div><textarea   name="formulacion">{$indicador->formulacion}</textarea><div class="required_tag tooltip hover left" title="{$smarty.const.MSG_FIELD_REQ}"></div></div>
</fieldset>
<fieldset class="label_side">
<label>{$smarty.const.FIELD_HISTORICO}</label>
<div><input  type="number" name="historicos" value="{$indicador->historicos}" /><div class="required_tag tooltip hover left" title="{$smarty.const.MSG_FIELD_REQ}"></div></div>
</fieldset>
<fieldset class="label_side">
<label>{$smarty.const.FIELD_RESP_SEG}</label>
<div>
<select name="id_responsable" class="required2 select_box">
<option value="">{$smarty.const.TXT_SEL_UNO}</option>
{foreach $usuarios_entidades as $usuario_entidad}
    <option value="{$usuario_entidad->usuario->id}"{if $indicador->id_responsable == $usuario_entidad->usuario->id}selected{/if}>{$usuario_entidad->usuario->apellidos}, {$usuario_entidad->usuario->nombre} {if $usuario_entidad->usuario->puesto} - {$usuario_entidad->usuario->puesto} {/if}
    </option>
{/foreach}
</select><div class="required_tag tooltip hover left" title="{$smarty.const.MSG_FIELD_REQ}"></div>
</div>
</fieldset>
<fieldset class="label_side">
<label>{$smarty.const.FIELD_RESP_MED}</label>
<div>
<select name="id_responsable_medicion" class="select_box">
<option value="">{$smarty.const.TXT_SEL_UNO}</option>
{foreach $usuarios_entidades as $usuario_entidad}
    <option value="{$usuario_entidad->usuario->id}"{if $indicador->id_responsable_medicion == $usuario_entidad->usuario->id}selected{/if}>{$usuario_entidad->usuario->apellidos}, {$usuario_entidad->usuario->nombre} {if $usuario_entidad->usuario->puesto} - {$usuario_entidad->usuario->puesto} {/if}
    </option>
{/foreach}
</select><div class="required_tag tooltip hover left" title="{$smarty.const.MSG_FIELD_REQ}"></div>
</div>
</fieldset>

<div class="columns clearfix">
<div class="col_50">
<fieldset class="label">
<label>{$smarty.const.FIELD_CALCULO}</label>
<div><textarea rows="6"  class="" name="calculo" placeholder="{$smarty.const.TXT_SOLO_INDIC_CALC}">{$indicador->calculo}</textarea></div>
</fieldset>
</div>
<div  class="col_50">
<fieldset title="{$smarty.const.TXT_INTERVALO}" class="label">
<label>{$smarty.const.FIELD_INTERVALO}</label>
<div class="col_50">
    <fieldset class="label_side">
        <label>{$smarty.const.FIELD_VALOR_MIN}</label>
        <div><input  type="number" value="{$indicador->valor_min}" name="valor_min"/></div>
    </fieldset>
</div>
<div class="col_50">
    <fieldset class="label_side">
        <label>{$smarty.const.FIELD_VALOR_MAX}</label>
        <div><input  type="number" value="{$indicador->valor_max}" name="valor_max"/></div>
    </fieldset>
</div>
</fieldset>
</div>
</div>

<div class="button_bar clearfix" id="footer_tabs">
<button class="dark send_left" type="reset" value="{$smarty.const.TXT_CANCEL}" name="proceso_cancel" onclick="history.back();"><span>{$smarty.const.TXT_CANCEL}</span></button>
<button class="green send_right img_icon has_text" type="submit"><span>{$smarty.const.TXT_GRABAR}</span></button>
</div>
</div>
<!-- //Tab Indicador 

<!-- Tab Otras Propiedades 
<div style="opacity: 1;" id="otros" class="block ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide">
    <p>&nbsp;</p>
    <fieldset class="label_side">
        <label>{$smarty.const.FIELD_DESC}</label>
        <div><textarea  class="inp" name="descripcion">{$indicador->descripcion}</textarea></div>
    </fieldset>
    <fieldset class="label_side">
        <label>{$smarty.const.FIELD_OBSERV}</label>
        <div><textarea  class="inp" name="observaciones">{$indicador->observaciones}</textarea></div>
    </fieldset> 
    <fieldset class="label_side">
        <label>{$smarty.const.FIELD_FUENTE_INFO}</label>
        <div><input  type="text" placeholder="{$smarty.const.TXT_FUENTE_INFO}" name="fuente_informacion" value="{$indicador->fuente_informacion}"/></div>
    </fieldset>
    <fieldset class="label_side">
        <label>{$smarty.const.FIELD_FUENTE_DAT}</label>
        <div><input  type="text" placeholder="{$smarty.const.TXT_FUENTE_DAT}" name="fuente_datos" value="{$indicador->fuente_datos}"/></div>
    </fieldset>
    <fieldset class="label_side">
        <label>{$smarty.const.FIELD_MET}</label>
        <div><input  type="text" name="evidencia" value="{$indicador->evidencia}" /></div>
    </fieldset>
    <fieldset class="label_side">
        <label>{$smarty.const.FIELD_INTERP}</label>
        <div><input  type="text" name="interpretacion" value="{$indicador->interpretacion}" /></div>
    </fieldset>
    <fieldset class="label_side">
        <label>{$smarty.const.FIELD_EFQM}</label>
        <div class="columns clearfix">
            <div class="col_50">
                <select name="criterios_efqm[]" id="criterios_efqm" class="select_box" >
                    <option value="">{$smarty.const.TXT_ELEG_UNO}</option>
{foreach $criterios_efqm as $criterio_efqm}
    <option value="{$criterio_efqm->id}"
    {if $indicador->criterios_efqm}
        {if $indicador->criterios_efqm[0]->criterio_efqm->id == $criterio_efqm->id}selected{/if}
    {/if}
    >{$criterio_efqm->codigo} - {$criterio_efqm->nombre|htmlentities}
</option>
{/foreach}
</select>
</div>
<div class="col_50">
<select name="criterios_efqm[]" id="criterios_efqm" class="select_box">
<option value="">{$smarty.const.TXT_ELEG_UNO}</option>
{foreach $criterios_efqm as $criterio_efqm}
    <option value="{$criterio_efqm->id}"
    {if $indicador->criterios_efqm|@count gt 1}
        {if $indicador->criterios_efqm[1]->criterio_efqm->id == $criterio_efqm->id}selected{/if}
    {/if}
    >
    {$criterio_efqm->codigo} - {$criterio_efqm->nombre|htmlentities}
</option>
{/foreach}
</select>
</div>
</div>
</fieldset>
<div class="columns clearfix">     
<div class="col_50">
<fieldset class="label">
<label>{$smarty.const.FIELD_VISIBILIDAD}</label>
<div>
<select name="id_visibilidad" id="id_visibilidad" class="required select_box">
{foreach $visibilidades as $visibilidad}
    <option value="{$visibilidad->id}" {if $visibilidad->id == $indicador->visibilidad->id}selected{/if} >
    {$visibilidad->nombre}
</option>
{/foreach}
</select>
</div>
</fieldset>
</div>
<div class="col_50">
<fieldset class="label">
<label>{$smarty.const.FIELD_UNID_GEN}</label>
<div><input  type="text" name="unidad_generadora" value="{$indicador->unidad_generadora}" /></div>
</fieldset>
</div>
</div>
<div class="columns clearfix">
<div class="col_50">
<fieldset class="label">
<label>{$smarty.const.FIELD_PERIOD}</label>
<div>
<select name="periodicidad" id="periodicidad" class="select_box">
<option value="Bienal"{if {$indicador->periodicidad} == Bienal}selected{/if} >{$smarty.const.TXT_BIENAL}</option>
<option value="Anual"{if {$indicador->periodicidad} == Anual}selected{/if} >{$smarty.const.TXT_ANUAL}</option>
<option value="Semestral"{if $indicador->periodicidad == Semestral}selected{/if} >{$smarty.const.TXT_SEMESTRAL}</option>
<option value="Cuatrimestral" {if $indicador->periodicidad == Cuatrimestral}selected{/if} >{$smarty.const.TXT_CUATRIMESTRAL}</option>
<option value="Trimestral" {if $indicador->periodicidad == Trimestral}selected{/if} >{$smarty.const.TXT_TRIMESTRAL}</option> 
<option value="Mensual" {if $indicador->periodicidad == Mensual}selected{/if} >{$smarty.const.TXT_MENSUAL}</option>     
</select>
</div>
</fieldset>
</div>
<div class="col_50">
<fieldset title="{$smarty.const.TXT_CALCULO_TOTAL_ANUAL}" class="label" id="total_anual" style="display:{if $indicador->periodicidad == Anual OR $indicador->periodicidad == Bienal}none{else}block{/if}">
<label>{$smarty.const.FIELD_CALC_TOTAL_ANUAL}</label>
<div>
<select name="id_tipo_agregacion_temporal" id="id_tipo_agregacion_temporal">
{foreach $tipos_agregacion as $tipo_agregacion}
    {if $tipo_agregacion->id != 0}
        <option value="{$tipo_agregacion->id}" {if $indicador->id_tipo_agregacion_temporal == $tipo_agregacion->id}selected{/if}>{$tipo_agregacion->descripcion}</option>
    {/if}
{/foreach}
</select>
</div>
</fieldset>
</div>
</div> 
<div class="button_bar clearfix" id="footer_tabs">
<button class="dark send_left" type="reset" value="{$smarty.const.TXT_CANCEL}" name="proceso_cancel" onclick="history.back();"><span>{$smarty.const.TXT_CANCEL}</span></button>
<button class="green send_right img_icon has_text" type="submit"><span>{$smarty.const.TXT_GRABAR}</span></button>
</div>
</div>
<!-- //Tab Otras Propiedades 

<!-- Tab Subunidades afectadas 
<div style="opacity: 1;" id="subunidades" class="block ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide">
    <p>&nbsp;</p>
    <fieldset class="label_side">
        <label>{$smarty.const.FIELD_TIP_MED}</label>
        <div>
            <p><input type="radio" name="tipo_seleccion_responsable" value="0" class="medicion"{if $indicador->desagregado == 0}checked="checked"{/if}> {$smarty.const.TXT_MED_UNICA}</p>
            <p><input type="radio" name="tipo_seleccion_responsable" value="1" class="medicion"{if $indicador->desagregado == 1}checked="checked"{/if}> {$smarty.const.TXT_MED_DES}</p>
            <p><input type="radio" name="tipo_seleccion_responsable" value="2" class="medicion"{if $indicador->desagregado == 2}checked="checked"{/if}> {$smarty.const.TXT_MED_DES_CEN}</p>
        </div>
    </fieldset>

    <fieldset title="{$smarty.const.TXT_CALCULO_TOTAL}" class="label_side" id="total" style="display:{if $indicador->desagregado == 0}none{else}block{/if}">
        <label>{$smarty.const.FIELD_CALC_TOTAL}</label>
        <div>
            <select name="id_tipo_agregacion" id="id_tipo_agregacion">
{foreach $tipos_agregacion as $tipo_agregacion}
    {if $tipo_agregacion->id != 0 AND $tipo_agregacion->id != 5}
        <option value="{$tipo_agregacion->id}" {if $indicador->id_tipo_agregacion == $tipo_agregacion->id}selected{/if}>{$tipo_agregacion->descripcion}</option>
    {/if}
{/foreach}
</select>
</div>
</fieldset>

<fieldset class="label_side">
<div>
<div id="div_unidad" style="display:{if $indicador->desagregado != 0}none{else}block{/if}">
<input type="checkbox" name="subunidades[]" value="{$entidad->id}" class="unidad"
{foreach $indicador_subunidades as $indicador_subunidad}
    {if $indicador_subunidad->id_entidad == $entidad->id} checked{/if}
{/foreach}/> {$entidad->etiqueta}
<hr/>
</div>
<div id="div_subunidades" class="column clearfix" style="display:{if $indicador->desagregado == 0}none{else}block{/if}">
<div class="col_50">
{foreach name="subunidad" from=$subunidades item="subunidad"}
    {if $smarty.foreach.subunidad.iteration == $subunidades|@count/2+1}</div><div class="col_50">{/if}
    <input type="checkbox" name="subunidades[]" value="{$subunidad->id}" class="subunidad"
    {foreach $indicador_subunidades as $indicador_subunidad}
        {if $indicador_subunidad->id_entidad == $subunidad->id} checked{/if}
    {/foreach}/> {$subunidad->etiqueta}<br/>
{/foreach}
</div>
</div>
</div>
</fieldset>
<div class="button_bar clearfix" id="footer_tabs">
<button class="dark send_left" type="reset" value="{$smarty.const.TXT_CANCEL}" name="proceso_cancel" onclick="history.back();"><span>{$smarty.const.TXT_CANCEL}</span></button>
<button class="green send_right img_icon has_text" type="submit"><span>{$smarty.const.TXT_GRABAR}</span></button>
</div>
</div>
<!-- //Tab Subunidades afectadas 
</div>
</form>
-->

