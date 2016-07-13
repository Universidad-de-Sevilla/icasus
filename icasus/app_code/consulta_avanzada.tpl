<!-- Diálogo sin valores para la medición -->
<div class="modal fade" id="dialogo_sin_val" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel"><i class="fa fa-info-circle fa-fw"></i> {$smarty.const.FIELD_MED} <span id="med_actual"></span></h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_VAL_NO_ASIG}</p>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_BTN_ACEPTAR}" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-check fa-fw"></i> {$smarty.const.TXT_BTN_ACEPTAR}</button>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo sin valores para la medición -->

<!-- Diálogo no se puede calcular -->
<div class="modal fade" id="dialogo_no_cal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel"><i class="fa fa-info-circle fa-fw"></i> {$smarty.const.TXT_CONSULT}</h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_NO_CAL}</p>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_BTN_ACEPTAR}" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-check fa-fw"></i> {$smarty.const.TXT_BTN_ACEPTAR}</button>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo no se puede calcular -->

<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <h3 title="{$_nombre_pagina}" class="page-header">
            <i class="fa fa-commenting fa-fw"></i> {$_nombre_pagina}
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
                            <i class="fa fa-th fa-fw"></i> {$smarty.const.FIELD_CUADROS_MANDO} <span title="{$smarty.const.FIELD_TOTAL}: {$num_cuadros} {$smarty.const.FIELD_CUADROS_MANDO}">({$num_cuadros})</span>
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
            {$smarty.const.TXT_CONSULT_INFO}
        </div> 
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
    <!-- Parámetros de la consulta -->
    <div class="col-lg-4">
        <div class="panel panel-red">
            <div class="panel-heading">
                <span class="panel-title"><i class="fa fa-commenting fa-fw"></i> {$smarty.const.TXT_CONSULT_PARAM}</span>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <!-- Listado de indicadores/datos de la unidad -->
                <div class="row">
                    <div class="col-lg-12">
                        {if $indicadores}
                            <form>
                                <div class="form-group">
                                    <label class="control-label" for="indicadores">{$smarty.const.TXT_CONSULT_BUSCAR}</label>
                                    <select class="form-control chosen-select" id='indicadores'>
                                        {foreach $indicadores as $indicador}
                                            <option title="{$indicador->nombre}" value="{$indicador->id}">{$indicador->nombre}</option>
                                        {/foreach} 
                                    </select>
                                </div>
                            </form>
                            <button id="btn_incluir" type="button" title="{$smarty.const.TXT_CONSULT_INCLUIR}" class="btn btn-primary"><i class="fa fa-plus-circle fa-fw"></i></button>
                            <button id="btn_quitar" type="button" title="{$smarty.const.TXT_CONSULT_QUITAR}" class="btn btn-danger hidden"><i class="fa fa-minus-circle fa-fw"></i></button>
                            {else}
                            <div class="alert alert-info alert-dismissible">
                                <i class="fa fa-info-circle fa-fw"></i> 
                                {$smarty.const.MSG_UNID_NO_IND_NO_DAT}
                            </div> 
                        {/if}
                    </div>
                    <!-- /.col-lg-12 -->  
                </div>
                <!-- /.row -->
                <!-- /Listado de indicadores/datos de la unidad -->
                <!-- Indicadores/datos agregados a la consulta -->
                <div class="row">
                    <div class="col-lg-12">
                        <hr>
                        <label class="label_receptor op0 hidden">{$smarty.const.TXT_CONSULT_OPERAND} 1</label>
                        <div class="well receptor op0 hidden" data-serie="0"></div>
                        <div class="form-group op0 hidden">
                            <select title="{$smarty.const.TXT_CONSULT_OPER}" class="operador form-control chosen-select" data-serie="0">
                                {foreach $operaciones as $operacion}
                                    <option title="{$operacion.1}" value="{$operacion.0}">{$operacion.1}</option>
                                {/foreach}
                            </select>
                        </div>
                        <label class="label_receptor op1 hidden">{$smarty.const.TXT_CONSULT_OPERAND} 2</label>
                        <div class="well receptor op1 hidden" data-serie="1"></div>
                        <div class="form-group op1 hidden">
                            <select title="{$smarty.const.TXT_CONSULT_OPER}" class="operador form-control chosen-select" data-serie="1">
                                {foreach $operaciones as $operacion}
                                    <option title="{$operacion.1}" value="{$operacion.0}">{$operacion.1}</option>
                                {/foreach}
                            </select>
                        </div>
                        <label class="label_receptor op2 hidden">{$smarty.const.TXT_CONSULT_OPERAND} 3</label>
                        <div class="well receptor op2 hidden" data-serie="2"></div>
                        <div class="form-group op2 hidden">
                            <select title="{$smarty.const.TXT_CONSULT_OPER}" class="operador form-control chosen-select" data-serie="2">
                                {foreach $operaciones as $operacion}
                                    <option title="{$operacion.1}" value="{$operacion.0}">{$operacion.1}</option>
                                {/foreach}
                            </select>
                        </div>
                        <label class="label_receptor op3 hidden">{$smarty.const.TXT_CONSULT_OPERAND} 4</label>
                        <div class="well receptor op3 hidden" data-serie="3"> </div>
                        <div class="form-group op3 hidden">
                            <select title="{$smarty.const.TXT_CONSULT_OPER}" class="operador form-control chosen-select" data-serie="3">
                                {foreach $operaciones as $operacion}
                                    <option title="{$operacion.1}" value="{$operacion.0}">{$operacion.1}</option>
                                {/foreach}
                            </select>
                        </div>
                        <label class="label_receptor op4 hidden">{$smarty.const.TXT_CONSULT_OPERAND} 5</label>
                        <div class="well receptor op4 hidden" data-serie="4"></div>
                        <button id="btn_mostrar_resultado1" title="{$smarty.const.TXT_MOSTRAR_RESUL}" class="btn btn-success pull-right hidden"><i class="fa fa-search fa-fw"></i> {$smarty.const.TXT_MOSTRAR_RESUL}</button>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /Indicadores/datos agregados a la consulta -->
            </div>
            <!-- /.panel-body -->        
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-4 -->
    <!-- /Parámetros de la consulta -->

    <!-- Resultados de la consulta -->
    <div class="col-lg-8">
        <div class="panel panel-red">
            <div class="panel-heading">
                <span class="panel-title"><i class="fa fa-area-chart fa-fw"></i> {$smarty.const.TXT_CONSULT_RESUL}</span>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <!-- Gráfica con los resultados obtenidos -->
                <div class="col-lg-12">
                    <div id="sin_resultados" class="alert alert-info alert-dismissible">
                        <i class="fa fa-info-circle fa-fw"></i> 
                        {$smarty.const.MSG_NO_OPERANDOS}
                    </div>
                    <div id="resultados" class="hidden">
                        <div class="btn-toolbar mediciones">
                            <button title="{$smarty.const.TXT_TODOS}" class="btn btn-default medicion actual">{$smarty.const.TXT_TODOS}</button>
                            {$anyo_actual = $smarty.now|date_format:'%Y'}
                            {for $anyo = $anyo_actual - 5 to $anyo_actual}
                                <button title="{$anyo}" class="btn btn-default medicion">{$anyo}</button>
                            {/for}
                            <button id="btn_mostrar_resultado2" title="{$smarty.const.TXT_RESUL}" class="btn btn-success">{$smarty.const.TXT_RESUL}</button>
                        </div>
                        <div id="grafica"></div>
                    </div>
                </div>
                <!-- /.col-lg-12 -->
                <!-- /Gráfica con los resultados obtenidos -->
            </div>
            <!-- /.panel-body -->        
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-8 -->
    <!-- /Resultados de la consulta -->
</div>
<!-- /.row -->