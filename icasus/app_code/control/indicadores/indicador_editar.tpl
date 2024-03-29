<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <h3 title="{$_nombre_pagina}" class="page-header">
            <i class="fa fa-dashboard fa-fw"></i><sub class="fa fa-pencil fa-fw"></sub> {$_nombre_pagina}
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
            <li><a title="{$smarty.const.FIELD_UNIDS}" href='?page=entidad_listar'>{$smarty.const.FIELD_UNIDS}</a></li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" data-target="#" title="{$entidad->nombre}" href="?page=entidad_mostrar&id_entidad={$entidad->id}">
                    {$entidad->nombre|truncate:30} <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu">
                    <li>
                        <a title="{$smarty.const.FIELD_USER}: {$_usuario->login} - {$smarty.const.TXT_UNID}: {$entidad->nombre} - {$smarty.const.FIELD_ROL}: {$_rol}"
                           href="?page=entidad_mostrar&id_entidad={$entidad->id}">
                            <i class="fa fa-folder fa-fw"></i> {$entidad->nombre} / <i class="fa fa-user fa-fw"></i> {$_rol}
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a title="{$smarty.const.TXT_PLANES_DESCRIPCION}" href='?page=plan_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-book fa-fw"></i> {$smarty.const.FIELD_PLANES} <span title="{$smarty.const.FIELD_TOTAL}: {$num_planes} {$smarty.const.FIELD_PLANES}">({$num_planes})</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_CARTAS_DESCRIPCION}" href='?page=carta_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-map-o fa-fw"></i> {$smarty.const.FIELD_CARTAS} <span title="{$smarty.const.FIELD_TOTAL}: {$num_cartas} {$smarty.const.FIELD_CARTAS}">({$num_cartas})</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_PROCS_DESCRIPCION}" href='?page=proceso_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-gears fa-fw"></i> {$smarty.const.FIELD_PROCS} <span title="{$smarty.const.FIELD_TOTAL}: {$num_procesos} {$smarty.const.FIELD_PROCS}">({$num_procesos})</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_INDICS_DESCRIPCION}" href='?page=indicador_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-dashboard fa-fw"></i> {$smarty.const.FIELD_INDICS}/{$smarty.const.FIELD_DATOS} <span title="{$smarty.const.FIELD_TOTAL}: {$num_indicadores} {$smarty.const.FIELD_INDICS}/{$smarty.const.FIELD_DATOS}">({$num_indicadores})</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_CUADRO_MANDO_DESCRIPCION}" href='?page=cuadro_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-th fa-fw"></i> {$smarty.const.FIELD_CUADROS_MANDO} <span title="{$smarty.const.FIELD_TOTAL}: {$num_cuadros} {$smarty.const.FIELD_CUADROS_MANDO}">({$num_cuadros})</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_CONSULTA_DESCRIPCION}" href="?page=consulta_avanzada&id_entidad={$entidad->id}">
                            <i class="fa fa-commenting fa-fw"></i> {$smarty.const.TXT_CONSULT}
                        </a>
                    </li>   
                    <li>
                        <a title="{$smarty.const.TXT_CONTROL_DESCRIPCION}" href="?page=control&modulo=inicio&id_entidad={$entidad->id}">
                            <i class="fa fa-sliders fa-fw"></i> {$smarty.const.TXT_CONTROL}
                        </a>
                    </li>
                </ul>
                <!-- /.dropdown-menu -->
            </li>
            <!-- /.dropdown -->
            {if $indicador->id_proceso}
                <li>
                    <a title="{$smarty.const.FIELD_PROCS}" href='?page=proceso_listar&id_entidad={$entidad->id}'>{$smarty.const.FIELD_PROCS}</a>
                </li>
                <li>
                    <a title="{$proceso->nombre}" href='?page=proceso_mostrar&id_proceso={$proceso->id}&id_entidad={$entidad->id}'>{$proceso->nombre|truncate:30}</a>
                </li>
            {else}
                <li>
                    <a title="{$smarty.const.FIELD_INDICS}/{$smarty.const.FIELD_DATOS}" href='?page=indicador_listar&id_entidad={$entidad->id}'>{$smarty.const.FIELD_INDICS}/{$smarty.const.FIELD_DATOS}</a>
                </li>
            {/if}
            <li><a title="{$indicador->nombre}" href='?page=indicador_mostrar&id_indicador={$indicador->id}&id_entidad={$entidad->id}'>{$indicador->nombre|truncate:30}</a></li>
            <li title="{$_nombre_pagina}" class="active">{$_nombre_pagina}</li>
        </ol>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- /Breadcrumbs -->

<div class="row">
    <div class="col-lg-12">
        <form method="post" action="?page=indicador_grabar&id_indicador={$indicador->id}" id="indicador_editar"
              data-toggle="validator" class="form-horizontal">
            <input type="hidden" name="id_entidad" value="{$entidad->id}" /> 
            <!-- Nav tabs -->
            <ul class="nav nav-tabs" role="tablist">
                <li id="tab_indicador" role="presentation" class="active" ><a href="#indicador" title="{$smarty.const.FIELD_INDIC}" aria-controls="{$smarty.const.FIELD_INDIC}" role="tab" data-toggle="tab">{$smarty.const.FIELD_INDIC}</a></li>
                <li id="tab_otros" role="presentation" ><a href="#otros" title="{$smarty.const.TXT_OTRAS_PROP}" aria-controls="{$smarty.const.TXT_OTRAS_PROP}" role="tab" data-toggle="tab">{$smarty.const.TXT_OTRAS_PROP}</a></li>
                <li id="tab_subunidades" role="presentation" ><a href="#subunidades" title="{$smarty.const.FIELD_UNID} / {$smarty.const.FIELD_SUBUNIDS}" aria-controls="{$smarty.const.FIELD_UNID} / {$smarty.const.FIELD_SUBUNIDS}" role="tab" data-toggle="tab">{$smarty.const.FIELD_UNID} / {$smarty.const.FIELD_SUBUNIDS}</a></li>
            </ul>
            <!-- /Nav tabs -->
            <!-- Tab panes -->
            <div class="tab-content">

                <!-- Tab indicador -->
                <div role="tabpanel" class="tab-pane active" id="indicador">
                    <br>

                    <fieldset>
                        <legend>{$smarty.const.TXT_DEFINICION}</legend>
                        <div class="form-group has-feedback">
                            <label for="codigo" class="col-sm-2 control-label"><i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i> {$smarty.const.FIELD_COD}</label>
                            <div class="col-sm-8">
                                <input title="{$smarty.const.TXT_CODIGO}" type='text' name='codigo' id='codigo' data-toggle="tooltip" data-placement="left" 
                                       pattern="[A-Z]+[.]*[A-Z]*[0-9]*[.]*[0-9]*([-]*[A-Z]*[.]*[A-Z]*[0-9]*[.]*[0-9]*)*"
                                       class="form-control" placeholder="{$smarty.const.FIELD_COD}" value="{$indicador->codigo}" required/>
                                <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="form-group has-feedback">
                            <label for="nombre" class="col-sm-2 control-label"><i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i> {$smarty.const.FIELD_NOMBRE}</label>
                            <div class="col-sm-8">
                                <input type='text' class="form-control" name='nombre' id='nombre' placeholder="{$smarty.const.FIELD_NOMBRE}" value="{$indicador->nombre}" required/>
                                <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="formulacion" class="col-sm-2 control-label">{$smarty.const.FIELD_FORM}</label>
                            <div class="col-sm-8">
                                <textarea  class="form-control" id="formulacion" name="formulacion" placeholder="{$smarty.const.FIELD_FORM}">{$indicador->formulacion}</textarea>
                            </div>
                        </div>
                    </fieldset>

                    <fieldset>
                        <legend>{$smarty.const.FIELD_INDIC_TIPO}</legend>
                        <div id="control" class="form-group">
                            <label for='activar_control' class="col-sm-2 control-label">{$smarty.const.TXT_CONTROL}</label>
                            <div class="col-sm-8">
                                <div title="{$smarty.const.TXT_CONTROL}">
                                    <input type="checkbox" name='control' id=activar_control class="form-control" 
                                           data-toggle="toggle" data-on="{$smarty.const.TXT_SI}"
                                           data-onstyle="success" data-offstyle="danger"
                                           data-off="{$smarty.const.TXT_NO}" value=1 data-size="small" 
                                           {if $indicador->control}checked{/if}/>  
                                </div>
                            </div>
                        </div>
                        <div id="proceso" class="form-group {if $indicador->control}hidden{/if}">
                            <label for="id_proceso" class="col-sm-2 control-label">{$smarty.const.FIELD_PROC}</label>
                            <div class="col-sm-8">
                                <select class="form-control chosen-select" name="id_proceso" id="id_proceso">
                                    <option value="0" {if !$indicador->id_proceso}selected{/if}>{$smarty.const.TXT_INDIC_NO_PROC} ({$smarty.const.FIELD_DATO})</option>
                                    {foreach $procesos as $proceso}
                                        <option value="{$proceso->id}" {if $indicador->id_proceso == $proceso->id}selected{/if}>{$proceso->nombre}</option>
                                    {/foreach}
                                </select>
                            </div>
                        </div>
                    </fieldset>

                    <fieldset>
                        <legend>{$smarty.const.FIELD_MED}</legend>
                        <div class="form-group has-feedback">
                            <label for="historicos" class="col-sm-2 control-label"><i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i> {$smarty.const.FIELD_HISTORICO}</label>
                            <div class="col-sm-8">
                                <input type="number" id='historicos' name="historicos" class="form-control"
                                       title="{$smarty.const.TXT_HISTORICO}" data-toggle="tooltip" data-placement="left"
                                       placeholder="{$smarty.const.FIELD_HISTORICO}" min='2000' max="{$smarty.now|date_format:'%Y'}"
                                       value="{$indicador->historicos}" required/>
                                <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="periodicidad" class="col-sm-2 control-label">{$smarty.const.FIELD_PERIOD}</label>
                            <div class="col-sm-8">
                                <select class="form-control chosen-select" name="periodicidad" id="periodicidad">
                                    <option value="Bienal" {if {$indicador->periodicidad} == Bienal}selected{/if}>{$smarty.const.TXT_BIENAL}</option>
                                    <option value="Anual" {if {$indicador->periodicidad} == Anual}selected{/if}>{$smarty.const.TXT_ANUAL}</option>
                                    <option value="Semestral" {if $indicador->periodicidad == Semestral}selected{/if}>{$smarty.const.TXT_SEMESTRAL}</option>
                                    <option value="Cuatrimestral" {if $indicador->periodicidad == Cuatrimestral}selected{/if}>{$smarty.const.TXT_CUATRIMESTRAL}</option>
                                    <option value="Trimestral" {if $indicador->periodicidad == Trimestral}selected{/if}>{$smarty.const.TXT_TRIMESTRAL}</option>
                                    <option value="Mensual" {if $indicador->periodicidad == Mensual}selected{/if}>{$smarty.const.TXT_MENSUAL}</option>
                                </select>
                            </div>
                        </div>
                        <div id="total_anual" class="form-group"
                             title="{if $indicador->periodicidad == Anual or $indicador->periodicidad == Bienal}{$smarty.const.TXT_CALCULO_TOTAL_ANUAL_HIST}{else}{$smarty.const.TXT_CALCULO_TOTAL_ANUAL}{/if}"
                             data-toggle="tooltip"  data-label="{$smarty.const.FIELD_CALC_TOTAL_ANUAL}"
                             data-label_hist="{$smarty.const.FIELD_CALC_TOTAL_ANUAL_HIST}"
                             data-title="{$smarty.const.TXT_CALCULO_TOTAL_ANUAL}"
                             data-title_hist="{$smarty.const.TXT_CALCULO_TOTAL_ANUAL_HIST}"
                             data-option0="{$tipos_agregacion[0]->descripcion}">
                            <label for="id_tipo_agregacion_temporal" id="agregacion_anual" class="col-sm-2 control-label">
                                {if $indicador->periodicidad == Anual or $indicador->periodicidad == Bienal}
                                    {$smarty.const.FIELD_CALC_TOTAL_ANUAL_HIST}
                                {else}
                                    {$smarty.const.FIELD_CALC_TOTAL_ANUAL}
                                {/if}
                            </label>
                            <div class="col-sm-8">
                                <select class="form-control chosen-select" name="id_tipo_agregacion_temporal" id="id_tipo_agregacion_temporal">
                                    {foreach $tipos_agregacion as $tipo_agregacion}
                                        {if $indicador->periodicidad == Anual or $indicador->periodicidad == Bienal}
                                            {if $tipo_agregacion->id != 4 && $tipo_agregacion->id != 6}
                                                <option title="{$tipo_agregacion->explicacion}" value="{$tipo_agregacion->id}" {if $indicador->id_tipo_agregacion_temporal == $tipo_agregacion->id}selected{/if}>{$tipo_agregacion->descripcion}</option>
                                            {/if}
                                        {else}
                                            {if $tipo_agregacion->id != 0 && $tipo_agregacion->id != 4 && $tipo_agregacion->id != 6}
                                                <option title="{$tipo_agregacion->explicacion}" value="{$tipo_agregacion->id}" {if $indicador->id_tipo_agregacion_temporal == $tipo_agregacion->id}selected{/if}>{$tipo_agregacion->descripcion}</option>
                                            {/if}
                                        {/if}
                                    {/foreach}
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for='inverso' class="col-sm-2 control-label">{$smarty.const.FIELD_ESTIMACION}</label>
                            <div class="col-sm-8">
                                <div title="{$smarty.const.TXT_ESTIMACION}" data-toggle="tooltip" data-placement="left">
                                    <input type="checkbox" name='inverso' id='inverso' class="form-control" 
                                           data-toggle="toggle" data-on="{$smarty.const.TXT_DESCENDENTE}"
                                           data-onstyle="danger" data-offstyle="success"
                                           data-off="{$smarty.const.TXT_ASCENDENTE}" value="1" data-size="small" {if $indicador->inverso}checked{/if}/>  
                                </div>
                            </div>
                        </div>
                        <div id="calculo_automatico">
                            <div class="form-group">
                                <label for="activar_calculo" class="col-sm-2 control-label">{$smarty.const.TXT_INDIC_DAT_CALCULADO}</label>
                                <div class="col-sm-8">
                                    <div title="{$smarty.const.TXT_SOLO_INDIC_CALC}" data-toggle="tooltip" data-placement="left">
                                        <input type="checkbox" id="activar_calculo"  class="form-control" 
                                               data-toggle="toggle" data-on="{$smarty.const.TXT_SI}"
                                               data-onstyle="success" data-offstyle="danger"
                                               data-off="{$smarty.const.TXT_NO}" data-size="small" {if $indicador->calculo}checked{/if}/>  
                                    </div>
                                </div>
                            </div>
                            <div id="formula_calculo" class="form-group has-feedback {if !$indicador->calculo}hidden{/if}">
                                <label for="calculo" class="col-sm-2 control-label"><i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i> {$smarty.const.FIELD_FORMULA}</label>
                                <div class="col-sm-8">
                                    <textarea id="calculo" name="calculo" title="{$smarty.const.TXT_FORMULA}" class="form-control" data-toggle="tooltip" data-placement="left" rows="5" placeholder="{$smarty.const.TXT_FORMULA}" data-validar_formula="validar_formula" required {if !$indicador->calculo}disabled{/if}>{$indicador->calculo}</textarea>
                                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                        </div>
                        <div id="intervalo">
                            <div class="form-group">
                                <label for="activar_intervalo" class="col-sm-2 control-label">{$smarty.const.FIELD_INTERVALO}</label>
                                <div class="col-sm-8">
                                    <div title="{$smarty.const.TXT_INTERVALO}" data-toggle="tooltip" data-placement="left">
                                        <input type="checkbox" id="activar_intervalo"  class="form-control" 
                                               data-toggle="toggle" data-on="{$smarty.const.TXT_SI}"
                                               data-onstyle="success" data-offstyle="danger"
                                               data-off="{$smarty.const.TXT_NO}" data-size="small" {if $indicador->valor_min}checked{/if}/>  
                                    </div>
                                </div>
                            </div>
                            <div id="vmin" class="form-group has-feedback {if !$indicador->valor_min}hidden{/if}">
                                <label for="valor_min" class="col-sm-2 control-label"><i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i> {$smarty.const.FIELD_VALOR_MIN}</label>
                                <div class="col-sm-8">
                                    <input type="number" step="0.01" id='valor_min' name="valor_min" class="form-control" placeholder="{$smarty.const.FIELD_VALOR_MIN}" value="{$indicador->valor_min}" required/>
                                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                            <div id="vmax" class="form-group has-feedback {if !$indicador->valor_max}hidden{/if}">
                                <label for="valor_max" class="col-sm-2 control-label"><i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i> {$smarty.const.FIELD_VALOR_MAX}</label>
                                <div class="col-sm-8">
                                    <input type="number" step="0.01" id='valor_max' name="valor_max" class="form-control" placeholder="{$smarty.const.FIELD_VALOR_MAX}" value="{$indicador->valor_max}" required/>
                                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                        </div>

                    </fieldset>

                    <fieldset>
                        <legend>{$smarty.const.TXT_USERS}</legend>
                        <div class="form-group">
                            <label for="id_responsable" class="col-sm-2 control-label">{$smarty.const.FIELD_RESP_SEG}</label>
                            <div class="col-sm-8">
                                <select class="form-control chosen-select" name="id_responsable" id="id_responsable">
                                    {foreach $usuarios_entidades as $usuario_entidad}
                                        <option value="{$usuario_entidad->usuario->id}" {if $indicador->id_responsable == $usuario_entidad->usuario->id}selected{/if}>{$usuario_entidad->usuario->apellidos}, {$usuario_entidad->usuario->nombre} {if $usuario_entidad->usuario->puesto} - {$usuario_entidad->usuario->puesto} {/if}</option>
                                    {/foreach} 
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="id_responsable_medicion" class="col-sm-2 control-label">{$smarty.const.FIELD_RESP_MED}</label>
                            <div class="col-sm-8">
                                <select class="form-control chosen-select" name="id_responsable_medicion" id="id_responsable_medicion">
                                    {foreach $usuarios_entidades as $usuario_entidad}
                                        <option value="{$usuario_entidad->usuario->id}" {if $indicador->id_responsable_medicion == $usuario_entidad->usuario->id}selected{/if}>{$usuario_entidad->usuario->apellidos}, {$usuario_entidad->usuario->nombre} {if $usuario_entidad->usuario->puesto} - {$usuario_entidad->usuario->puesto} {/if}</option>
                                    {/foreach} 
                                </select>
                            </div>
                        </div>
                    </fieldset>

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-8">
                            <a class="btn btn-danger" title="{$smarty.const.TXT_CANCEL}" href = '?page=indicador_mostrar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>
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
                </div>
                <!-- /Tab indicador --> 

                <!-- Tab otros -->
                <div role="tabpanel" class="tab-pane" id="otros">
                    <br>
                    <div class="form-group">
                        <label for="descripcion" class="col-sm-2 control-label">{$smarty.const.FIELD_DESC}</label>
                        <div class="col-sm-8">
                            <textarea  class="form-control" id="descripcion" name="descripcion" placeholder="{$smarty.const.FIELD_DESC}">{$indicador->descripcion}</textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="observaciones" class="col-sm-2 control-label">{$smarty.const.FIELD_OBSERV}</label>
                        <div class="col-sm-8">
                            <textarea  class="form-control" id="observaciones" name="observaciones" placeholder="{$smarty.const.FIELD_OBSERV}">{$indicador->observaciones}</textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="fuente_informacion" class="col-sm-2 control-label">{$smarty.const.FIELD_FUENTE_INFO}</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="fuente_informacion" name="fuente_informacion" placeholder="{$smarty.const.FIELD_FUENTE_INFO}" value="{$indicador->fuente_informacion}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="fuente_datos" class="col-sm-2 control-label">{$smarty.const.FIELD_FUENTE_DAT}</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="fuente_datos" name="fuente_datos" placeholder="{$smarty.const.TXT_FUENTE_DAT}" value="{$indicador->fuente_datos}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="evidencia" class="col-sm-2 control-label">{$smarty.const.FIELD_MET}</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="evidencia" name="evidencia" placeholder="{$smarty.const.FIELD_MET}" value="{$indicador->evidencia}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="interpretacion" class="col-sm-2 control-label">{$smarty.const.FIELD_INTERP}</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="interpretacion" name="interpretacion" placeholder="{$smarty.const.FIELD_INTERP}" value="{$indicador->interpretacion}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="unidad_generadora" class="col-sm-2 control-label">{$smarty.const.FIELD_UNID_GEN}</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="unidad_generadora" name="unidad_generadora" placeholder="{$smarty.const.FIELD_UNID_GEN}" value="{$indicador->unidad_generadora}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="criterios_efqm" class="col-sm-2 control-label">{$smarty.const.FIELD_EFQM}</label>
                        <div class="col-sm-8">
                            <select class="form-control chosen-select" name="criterios_efqm[]" id="criterios_efqm" multiple>
                                {foreach $criterios_efqm as $criterio_efqm}
                                    <option value="{$criterio_efqm->id}" 
                                            {foreach $indicador->criterios_efqm as $indi_efqm}
                                                {if $indi_efqm->id_criterio_efqm == $criterio_efqm->id}selected{/if}
                                            {/foreach}>
                                        {$criterio_efqm->codigo} - {$criterio_efqm->nombre}
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
                                    <option value="{$visibilidad->id}" {if $visibilidad->id == $indicador->visibilidad->id}selected{/if}>
                                        {$visibilidad->nombre}
                                    </option>
                                {/foreach}
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-8">
                            <a class="btn btn-danger" title="{$smarty.const.TXT_CANCEL}" href = '?page=indicador_mostrar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>
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
                                    <input id="tipo_seleccion_responsable" type="radio" name="tipo_seleccion_responsable" value="0" class="medicion" {if $indicador->desagregado == 0}checked{/if}>
                                    {$smarty.const.TXT_MED_UNICA}
                                </label>
                            </div>
                            {if $subunidades}
                                <div class="radio">
                                    <label >
                                        <input id="tipo_seleccion_responsable" type="radio" name="tipo_seleccion_responsable" value="1" class="medicion" {if $indicador->desagregado == 1}checked{/if}>
                                        {$smarty.const.TXT_MED_AGRED}
                                    </label>
                                </div>
                                <div class="radio">
                                    <label >
                                        <input id="tipo_seleccion_responsable" type="radio" name="tipo_seleccion_responsable" value="2" class="medicion" {if $indicador->desagregado == 2}checked{/if}>
                                        {$smarty.const.TXT_MED_AGRED_CEN}
                                    </label>
                                </div>
                            {/if}
                        </div>
                    </div>
                    <div id="total" title="{$smarty.const.TXT_CALCULO_TOTAL}" data-toggle="tooltip" class="form-group {if $indicador->desagregado == 0}hidden{/if}">
                        <label for="id_tipo_agregacion" class="col-sm-2 control-label">{$smarty.const.FIELD_CALC_TOTAL}</label>
                        <div class="col-sm-8">
                            <select class="form-control chosen-select" name="id_tipo_agregacion" id="id_tipo_agregacion">
                                {foreach $tipos_agregacion as $tipo_agregacion}
                                    {if $tipo_agregacion->id != 0 AND $tipo_agregacion->id != 5}
                                        <option {if $tipo_agregacion->id == 6 && !$indicador->calculo}class="hidden heredado" {elseif $tipo_agregacion->id == 6 && $indicador->calculo}class="heredado" {elseif $tipo_agregacion->id == 4}class="manual"{/if} title="{$tipo_agregacion->explicacion}" value="{$tipo_agregacion->id}" {if $indicador->id_tipo_agregacion == $tipo_agregacion->id}selected{/if}>{$tipo_agregacion->descripcion}</option>
                                    {/if}
                                {/foreach}
                            </select>
                        </div>
                    </div>
                    <div id="div_unidad" class="form-group has-feedback {if $indicador->desagregado != 0}hidden{/if}">
                        <label for="lista_subunidades" class="col-sm-2 control-label"><i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i> {$smarty.const.FIELD_UNID}</label>
                        <div class="col-sm-8">
                            <div class="checkbox">
                                <label>
                                    <input id="lista_subunidades" type="checkbox" name="subunidades[]" value="{$entidad->id}" class="unidad" {if $indicador->desagregado == 0}checked{/if} required>
                                    {$entidad->etiqueta}
                                </label>
                            </div>
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                    <div id="div_subunidades" class="form-group has-feedback {if $indicador->desagregado == 0}hidden{/if}">
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
                                        <input id="lista_subunidades" type="checkbox" name="subunidades[]" value="{$subunidad->id}" class="subunidad" data-validar_subunidades="validar_subunidades" 
                                               {foreach $indicador_subunidades as $indicador_subunidad}
                                                   {if $indicador_subunidad->id_entidad == $subunidad->id}checked{/if}
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
                            <a class="btn btn-danger" title="{$smarty.const.TXT_CANCEL}" href = '?page=indicador_mostrar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                                <i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_CANCEL}
                            </a>     
                            <div class="pull-right">
                                <button title="{$smarty.const.TXT_GRABAR}" type="button" class="btn btn-default btn-success" data-toggle="modal" data-target="#dialogo_confirmar_edicion">
                                    <i class="fa fa-download fa-fw"></i> {$smarty.const.TXT_GRABAR}
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Tab subunidades -->
            </div>
            <!-- /Tab panes -->

            <!-- Diálogo Confirmar Edición -->
            <div class="modal fade" id="dialogo_confirmar_edicion" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h3 class="modal-title" id="myModalLabel"><i class="fa fa-dashboard fa-fw"></i><sub class="fa fa-pencil fa-fw"></sub> {$smarty.const.TXT_INDIC_EDIT}: {$indicador->nombre}</h3>
                        </div>
                        <div class="modal-body">
                            <p>{$smarty.const.MSG_INDIC_CONFIRM_EDITAR}</p>
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