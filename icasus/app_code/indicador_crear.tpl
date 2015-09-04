<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <h2 title="{$_nombre_pagina}" class="page-header">
            <i class="fa fa-plus-circle fa-fw"></i> {$_nombre_pagina}
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
                <form method="post" action="index.php?page=indicador_grabar" id="indicador_crear"
                      data-toggle="validator" class="form-horizontal">
                    <input type="hidden" name="id_entidad" value="{$entidad->id}" /> 
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active"><a href="#indicador" aria-controls="{$smarty.const.FIELD_INDIC}" role="tab" data-toggle="tab">{$smarty.const.FIELD_INDIC}</a></li>
                        <li role="presentation"><a href="#otros" aria-controls="{$smarty.const.TXT_OTRAS_PROP}" role="tab" data-toggle="tab">{$smarty.const.TXT_OTRAS_PROP}</a></li>
                        <li role="presentation"><a href="#subunidades" aria-controls="{$smarty.const.FIELD_SUBUNID_AFECT}" role="tab" data-toggle="tab">{$smarty.const.FIELD_SUBUNID_AFECT}</a></li>
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
                                        <textarea title="{$smarty.const.TXT_FORMULA}" class="form-control" rows="4" id="calculo" name="calculo" placeholder="{$smarty.const.TXT_FORMULA}" data-validar_formula="validar_formula" required></textarea>
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
                                        <input type="number" id='valor_min' name="valor_min" class="form-control" placeholder="{$smarty.const.FIELD_VALOR_MIN}" required/>
                                        <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div id="vmax" class="form-group has-feedback hidden">
                                    <label for="valor_max" class="col-sm-2 control-label">{$smarty.const.FIELD_VALOR_MAX} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
                                    <div class="col-sm-8">
                                        <input type="number" id='valor_max' name="valor_max" class="form-control" placeholder="{$smarty.const.FIELD_VALOR_MAX}" required/>
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
                                        <button title="{$smarty.const.TXT_SIG}" type="button" class="btn btn-default btn-primary btnNext">
                                            <i class="fa fa-arrow-right fa-fw"></i> {$smarty.const.TXT_SIG}
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
                                <div class="col-sm-offset-2 col-sm-8">
                                    <button type="button" class="btn btn-default btn-danger" title="{$smarty.const.TXT_CANCEL}" onclick="location.href = 'index.php?page=indicador_listar&id_entidad={$entidad->id}';">
                                        <i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_CANCEL}
                                    </button>
                                    <div class="pull-right">
                                        <button type="reset" class="btn btn-default btn-warning" title="{$smarty.const.TXT_RESET}">
                                            <i class="fa fa-refresh fa-fw"></i> {$smarty.const.TXT_RESET}
                                        </button>
                                        <button title="{$smarty.const.TXT_ANT}" type="button" class="btn btn-default btn-primary btnPrev">
                                            <i class=" fa fa-arrow-left fa-fw"></i> {$smarty.const.TXT_ANT}
                                        </button>
                                        <button title="{$smarty.const.TXT_SIG}" type="button" class="btn btn-default btn-primary btnNext">
                                            <i class="fa fa-arrow-right fa-fw"></i> {$smarty.const.TXT_SIG}
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /Tab otros -->
                        <!-- Tab subunidades -->
                        <div role="tabpanel" class="tab-pane" id="subunidades">...</div>
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

<form method="post" action="index.php?page=indicador_grabar" id="formindicador" name="formindicador">
    <input type="hidden" name="id_entidad" value="{$entidad->id}" />

    <div style="opacity: 1;" class="box tabs" id="tab_crear_indicador">
        <ul class="tab_header">

            <li><a  href="#otros" >{$smarty.const.TXT_OTRAS_PROP}</a></li>
            <li><a  href="#subunidades" >{$smarty.const.FIELD_SUBUNID_AFECT}</a></li>
        </ul>



        <!-- Tab Otras Propiedades -->
        <div style="opacity: 1;" id="otros" class="block ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide">
            <p>&nbsp;</p>


       
            <div class="columns clearfix">
                <div class="col_50">
                    <fieldset class="label">
                        <label>{$smarty.const.FIELD_VISIBILIDAD}</label>	
                        <div>
                            <select name="id_visibilidad" id="id_visibilidad" class="required select_box">
                                {foreach $visibilidades as $visibilidad}
                                    <option value="{$visibilidad->id}">
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
                        <div><input  type="text" name="unidad_generadora" /></div>
                    </fieldset>
                </div>
            </div>
            <div class="columns clearfix">
                <div class="col_50">
                    <fieldset class="label">
                        <label>{$smarty.const.FIELD_PERIOD}</label>
                        <div>
                            <select name="periodicidad" id="periodicidad" class="select_box">
                                <option value="Bienal">{$smarty.const.TXT_BIENAL}</option>
                                <option value="Anual" selected>{$smarty.const.TXT_ANUAL}</option>
                                <option value="Semestral">{$smarty.const.TXT_SEMESTRAL}</option>
                                <option value="Cuatrimestral">{$smarty.const.TXT_CUATRIMESTRAL}</option>
                                <option value="Trimestral">{$smarty.const.TXT_TRIMESTRAL}</option>
                                <option value="Mensual">{$smarty.const.TXT_MENSUAL}</option>
                            </select>
                        </div>
                    </fieldset>
                </div>
                <div class="col_50">
                    <fieldset title="{$smarty.const.TXT_CALCULO_TOTAL_ANUAL}" class="label" id="total_anual" style="display:none">
                        <label>{$smarty.const.FIELD_CALC_TOTAL_ANUAL}</label>
                        <div>
                            <select name="id_tipo_agregacion_temporal" id="id_tipo_agregacion_temporal">
                                {foreach $tipos_agregacion as $tipo_agregacion}
                                    {if $tipo_agregacion->id != 0}
                                        <option value="{$tipo_agregacion->id}" >{$tipo_agregacion->descripcion}</option>
                                    {/if}
                                {/foreach}
                            </select>
                        </div>
                    </fieldset>
                </div>
            </div>
            <div class="button_bar clearfix" id="footer_tabs">
                <button class="dark send_left" type="reset" value="{$smarty.const.TXT_CANCEL}" name="proceso_cancel" onclick="history.back();"><span>{$smarty.const.TXT_CANCEL}</span></button>
                <button class="btnNext dark send_right img_icon has_text" type="button"><span>{$smarty.const.TXT_SIG}</span></button>
                <button class="btnPrev dark send_right img_icon has_text" type="button"><span>{$smarty.const.TXT_ANT}</span></button>
            </div>
        </div>
        <!-- //Tab Otras Propiedades -->




        <!-- Tab Subunidades afectadas -->
        <div style="opacity: 1;" id="subunidades" class="block ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide">
            <p>&nbsp;</p>
            <fieldset class="label_side required">
                <label>{$smarty.const.FIELD_TIP_MED}</label>
                <div>
                    <p><input type="radio" name="tipo_seleccion_responsable" value="0" class="medicion" >{$smarty.const.TXT_MED_UNICA}</p>
                    <p><input type="radio" name="tipo_seleccion_responsable" value="1" class="medicion"> {$smarty.const.TXT_MED_DES}</p>
                    <p><input type="radio" name="tipo_seleccion_responsable" value="2" class="medicion">{$smarty.const.TXT_MED_DES_CEN}</p>
                </div>
            </fieldset>

            <fieldset title="{$smarty.const.TXT_CALCULO_TOTAL}" class="label_side" id="total" style="display:none">
                <label>{$smarty.const.FIELD_CALC_TOTAL}</label>
                <div>
                    <select name="id_tipo_agregacion" id="id_tipo_agregacion">
                        {foreach $tipos_agregacion as $tipo_agregacion}
                            {if $tipo_agregacion->id != 0 AND $tipo_agregacion->id != 5}
                                <option value="{$tipo_agregacion->id}" >{$tipo_agregacion->descripcion}</option>
                            {/if}
                        {/foreach}
                    </select>
                </div>
            </fieldset>

            <fieldset class="label_side">
                <div>
                    <div id="div_unidad" style="display:none">
                        <input type="checkbox" name="subunidades[]" value="{$entidad->id}" class="unidad" /> {$entidad->etiqueta}
                        <hr/>
                    </div>
                    <div id="div_subunidades" class="column clearfix" style="display:none">
                        <div class="col_50">
                            {foreach name="subunidad" from=$subunidades item="subunidad"}
                                {if $smarty.foreach.subunidad.iteration == $subunidades|@count/2+1}</div><div class="col_50">{/if}
                                <input type="checkbox" name="subunidades[]" value="{$subunidad->id}" class="subunidad"/> {$subunidad->etiqueta}<br/>
                            {/foreach}
                        </div>
                    </div>
                </div>
            </fieldset>
            <div class="button_bar clearfix" id="footer_tabs">
                <button class="dark send_left" type="reset" value="{$smarty.const.TXT_CANCEL}" name="proceso_cancel" onclick="history.back();"><span>{$smarty.const.TXT_CANCEL}</span></button>
                <button class="dark send_right img_icon has_text" type="submit"><span>{$smarty.const.TXT_GRABAR}</span></button>
                <button class="btnPrev dark send_right img_icon has_text" type="button"><span>{$smarty.const.TXT_ANT}</span></button>
            </div>
        </div>
        <!-- //Tab Subunidades afectadas --> 
    </div>
</form>

<script src="js/indicador_crear.js" type="text/javascript"></script>
