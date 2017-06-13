<!-- Diálogo Carga de Paneles -->
<div class="modal fade" id="dialogo_cargando_paneles" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel"><i class="fa fa-map-o fa-fw"></i> {$_nombre_pagina}</h3>
            </div>
            <div class="modal-body">
                <h4 class="text-center"><i class='fa fa-spinner fa-pulse'></i> {$smarty.const.MSG_PANEL_CARGANDO}</h4>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Carga de Paneles -->

<!-- Diálogo Confirmar Borrado Carta -->
<div class="modal fade" id="dialogo_confirmar_borrado_carta" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel">
                    <i class="fa fa-trash fa-fw"></i> {$smarty.const.TXT_CARTA_BORRAR}: {$carta->fecha|date_format:'%d/%m/%Y'}</h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_CARTA_CONFIRM_BORRAR}</p>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_NO}" class="btn btn-danger" data-dismiss="modal"><i
                        class="fa fa-times fa-fw"></i> {$smarty.const.TXT_NO}</button>
                <a title="{$smarty.const.TXT_SI}" class="btn btn-success" name="borrar" id="borrar" href="index.php?page=carta_borrar&id_carta={$carta->id}&id_entidad={$carta->id_entidad}"><i
                        class="fa fa-check fa-fw"></i> {$smarty.const.TXT_SI}</a>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Confirmar Borrado Carta -->

<!-- Diálogo Crear Normativa -->
<div class="modal fade" id="crear_normativa" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form method="post" action="" id="formcrearnormativa" name="formcrearnormativa" data-toggle="validator" class="form-horizontal">
                <input type="hidden"  name="id_carta" value="{$carta->id}"/>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="{$smarty.const.TXT_CERRAR}"><span aria-hidden="true">&times;</span></button>
                    <h3 class="modal-title" id="myModalLabel"><i class="fa fa-hand-paper-o fa-fw"></i><sub class="fa fa-plus fa-fw"></sub> {$smarty.const.TXT_NORMATIVA_CREAR}</h3>
                </div>
                <div class="modal-body">
                    <div class="form-group has-feedback">
                        <label for="c-nombre-norm" class="col-sm-3 control-label"><i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i> {$smarty.const.FIELD_NOMBRE}</label>
                        <div class="col-sm-8">
                            <input type='text' class="form-control" name='c-nombre-norm' id='c-nombre-norm' placeholder="{$smarty.const.FIELD_NOMBRE}" required/>
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="c-url-norm" class="col-sm-3 control-label"><i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i> URL</label>
                        <div class="col-sm-8">
                            <input type='url' name='c-url-norm' id='c-url-norm' class="form-control" placeholder="URL" required/>
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" title="{$smarty.const.TXT_CANCEL}" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_CANCEL}</button>
                    <button type="reset" class="btn btn-warning" title="{$smarty.const.TXT_RESET}">
                        <i class="fa fa-refresh fa-fw"></i> {$smarty.const.TXT_RESET}
                    </button>
                    <button name="normativa_crear" id="normativa_crear" type="button" title="{$smarty.const.TXT_GRABAR}" class="btn btn-success"><i class="fa fa-download fa-fw"></i> {$smarty.const.TXT_GRABAR}</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- /Diálogo Crear Normativa -->

<!-- Diálogo Editar Normativa -->
<div class="modal fade" id="editar_normativa" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form method="post" action="" id="formeditarnormativa" name="formcrearnormativa" data-toggle="validator" class="form-horizontal">
                <input type="hidden" id="id_normativa" name="id_normativa"/>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="{$smarty.const.TXT_CERRAR}"><span aria-hidden="true">&times;</span></button>
                    <h3 class="modal-title" id="myModalLabel"><i class="fa fa-hand-paper-o fa-fw"></i><sub class="fa fa-pencil fa-fw"></sub> {$smarty.const.TXT_NORMATIVA_EDIT}</h3>
                </div>
                <div class="modal-body">
                    <div class="form-group has-feedback">
                        <label for="e-nombre-norm" class="col-sm-3 control-label"><i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i> {$smarty.const.FIELD_NOMBRE}</label>
                        <div class="col-sm-8">
                            <input type='text' class="form-control" name='e-nombre-norm' id='e-nombre-norm' placeholder="{$smarty.const.FIELD_NOMBRE}" required/>
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="e-url-norm" class="col-sm-3 control-label"><i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i> URL</label>
                        <div class="col-sm-8">
                            <input type='url' name='e-url-norm' id='e-url-norm' class="form-control" placeholder="URL" required/>
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" title="{$smarty.const.TXT_CANCEL}" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_CANCEL}</button>
                    <button type="reset" class="btn btn-warning" title="{$smarty.const.TXT_RESET}">
                        <i class="fa fa-refresh fa-fw"></i> {$smarty.const.TXT_RESET}
                    </button>
                    <button name="normativa_editar" id="normativa_editar" type="button" title="{$smarty.const.TXT_GRABAR}" class="btn btn-success"><i class="fa fa-download fa-fw"></i> {$smarty.const.TXT_GRABAR}</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- /Diálogo Editar Normativa -->

<!-- Diálogo Confirmar Borrado Normativa -->
<div class="modal fade" id="dialogo_confirmar_borrado_normativa" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel"><i
                        class="fa fa-trash fa-fw"></i> {$smarty.const.TXT_NORMATIVA_BORRAR}: <span id="nombre_normativa"></span></h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_NORMATIVA_CONFIRM_BORRAR}</p>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_NO}" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_NO}</button>
                <a title="{$smarty.const.TXT_SI}" class="btn btn-success" name="borrar" id="borrar"><i class="fa fa-check fa-fw"></i> {$smarty.const.TXT_SI}</a>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Confirmar Borrado Normativa -->

<!-- Diálogo Confirmar Borrado Servicio -->
<div class="modal fade" id="dialogo_confirmar_borrado_servicio" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel"><i
                        class="fa fa-trash fa-fw"></i> {$smarty.const.TXT_SERVICIO_BORRAR}: <span id="nombre_servicio"></span></h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_SERVICIO_CONFIRM_BORRAR}</p>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_NO}" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_NO}</button>
                <a title="{$smarty.const.TXT_SI}" class="btn btn-success" name="borrar" id="borrar"><i class="fa fa-check fa-fw"></i> {$smarty.const.TXT_SI}</a>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Confirmar Borrado Servicio -->

<!-- Diálogo Confirmar Borrado Compromiso -->
<div class="modal fade" id="dialogo_confirmar_borrado_compromiso" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel"><i
                        class="fa fa-trash fa-fw"></i> {$smarty.const.TXT_COMPROMISO_BORRAR}: <span id="nombre_compromiso"></span></h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_COMPROMISO_CONFIRM_BORRAR}</p>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_NO}" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_NO}</button>
                <a title="{$smarty.const.TXT_SI}" class="btn btn-success" name="borrar" id="borrar"><i class="fa fa-check fa-fw"></i> {$smarty.const.TXT_SI}</a>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Confirmar Borrado Compromiso -->

<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <h3 title="{$_nombre_pagina}" class="page-header">
            <div class="row">
                <div class="col-md-10">
                    <i class="fa fa-map-o fa-fw"></i> {$_nombre_pagina}
                </div>
                <!-- /.col-md-10 -->
                <!-- Navegación -->
                {if count($cartas)> 1}
                    <div class="col-md-2">
                        <div style="font-size:10px">{$indice+1} {$smarty.const.TXT_DE} {count($cartas)} {$smarty.const.FIELD_CARTAS}</div>
                        <div class="btn-toolbar" role="toolbar" aria-label="">
                            <div class="btn-group" role="group" aria-label="">
                                <a title="{$smarty.const.TXT_PRIMER} {$smarty.const.FIELD_CARTA}" class="btn btn-danger btn-xs {if $indice == 0}disabled{/if}" href='index.php?page=carta_mostrar&id_entidad={$entidad->id}&id_carta={$cartas[0]->id}'>
                                    <i class="fa fa-step-backward fa-fw"></i>
                                </a>
                                <a title="{$smarty.const.TXT_ANT} {$smarty.const.FIELD_CARTA}" class="btn btn-danger btn-xs {if $indice == 0}disabled{/if}" href='index.php?page=carta_mostrar&id_entidad={$entidad->id}&id_carta={$cartas[$indice-1]->id}'>
                                    <i class="fa fa-play fa-rotate-180 fa-fw"></i>
                                </a>
                                <a title="{$smarty.const.TXT_SIG} {$smarty.const.FIELD_CARTA}" class="btn btn-danger btn-xs {if $indice == (count($cartas)-1)}disabled{/if}" href='index.php?page=carta_mostrar&id_entidad={$entidad->id}&id_carta={$cartas[$indice+1]->id}'>
                                    <i class="fa fa-play fa-fw"></i>
                                </a>
                                <a title="{$smarty.const.TXT_ULTIMO} {$smarty.const.FIELD_CARTA}" class="btn btn-danger btn-xs {if $indice == (count($cartas)-1)}disabled{/if}" href='index.php?page=carta_mostrar&id_entidad={$entidad->id}&id_carta={$cartas[(count($cartas)-1)]->id}'>
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
            <li><a title="{$smarty.const.FIELD_CARTAS}" href='index.php?page=carta_listar&id_entidad={$entidad->id}'>{$smarty.const.FIELD_CARTAS}</a></li>
            <li title="{$_nombre_pagina}" class="active">{$_nombre_pagina}</li>
        </ol>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- /Breadcrumbs -->

<div class="row">
    <div class="col-lg-12">
        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active">
                <a href="#carta_ficha" title="{$smarty.const.TXT_FICHA}" aria-controls="{$smarty.const.TXT_FICHA}" role="tab" data-toggle="tab"><i class="fa fa-folder fa-fw"></i> {$smarty.const.TXT_FICHA}</a>
            </li>
            <li role="presentation">
                <a href="#carta_normativas" title="{$smarty.const.FIELD_NORMATIVAS}" aria-controls="{$smarty.const.FIELD_NORMATIVAS}" role="tab" data-toggle="tab"><i class="fa fa-hand-paper-o fa-fw"></i> {$smarty.const.FIELD_NORMATIVAS}</a>
            </li>
            <li role="presentation">
                <a href="#carta_servicios" title="{$smarty.const.FIELD_SERVICIOS}" aria-controls="{$smarty.const.FIELD_SERVICIOS}" role="tab" data-toggle="tab"><i class="fa fa-user-circle-o fa-fw"></i> {$smarty.const.FIELD_SERVICIOS}</a>
            </li>
            <li role="presentation">
                <a href="#carta_compromisos" title="{$smarty.const.FIELD_COMPROMISOS}" aria-controls="{$smarty.const.FIELD_COMPROMISOS}" role="tab" data-toggle="tab"><i class="fa fa-handshake-o fa-fw"></i> {$smarty.const.FIELD_COMPROMISOS}</a>
            </li>
            <li role="presentation">
                <a href="#carta_indics" title="{$smarty.const.FIELD_INDICS}" aria-controls="{$smarty.const.FIELD_INDICS}" role="tab" data-toggle="tab"><i class="fa fa-dashboard fa-fw"></i> {$smarty.const.FIELD_INDICS}</a>
            </li>
            <li role="presentation">
                <a href="#carta_archivos" title="{$smarty.const.TXT_ARCHIVOS}" aria-controls="{$smarty.const.TXT_ARCHIVOS}" role="tab" data-toggle="tab"><i class="fa fa-archive fa-fw"></i> {$smarty.const.TXT_ARCHIVOS}</a>
            </li>
            <li role="presentation">
                <a href="#carta_res" title="{$smarty.const.TXT_SEGUIMIENTO} ({$smarty.const.FIELD_SERVICIOS}, {$smarty.const.FIELD_COMPROMISOS}, {$smarty.const.FIELD_INDICS})" aria-controls="{$smarty.const.TXT_SEGUIMIENTO} ({$smarty.const.FIELD_SERVICIOS}, {$smarty.const.FIELD_COMPROMISOS}, {$smarty.const.FIELD_INDICS})" role="tab" data-toggle="tab"><i class="fa fa-tasks fa-fw"></i> {$smarty.const.TXT_SEGUIMIENTO}</a>
            </li>
        </ul>
        <!-- /Nav tabs -->
        <br>
        <!-- Tab panes -->
        <div class="tab-content">

            <!-- Ficha de la Carta de Servicios -->
            <div role="tabpanel" class="tab-pane active" id="carta_ficha">
                <div class="row">
                    <!-- Datos de la Carta de Servicios -->
                    <div class="col-md-12">
                        <table class="table table-striped table-hover ficha">
                            <thead><th></th><th></th></thead>
                            <tbody>
                                <tr>
                                    <th>{$smarty.const.FIELD_CARTA}</th>
                                    <td><span class="label label-default">{$carta->fecha|date_format:'%d/%m/%Y'}</span></td>
                                </tr>
                                <tr>
                                    <th>{$smarty.const.FIELD_CUADRO_MANDO}</th>
                                    <td>
                                        {if $carta->id_cuadro}              
                                            <a title="{$carta->cuadro->nombre}" 
                                               href="index.php?page=cuadro_mostrar&id_cuadro={$carta->id_cuadro}&id_entidad={$carta->id_entidad}">
                                                {$carta->cuadro->nombre}
                                            </a>
                                        {else}
                                            ---
                                        {/if}
                                    </td>
                                </tr>
                                <tr>
                                    <th>{$smarty.const.FIELD_MISION}</th>
                                    <td>
                                        {if $carta->mision}
                                            {$carta->mision|nl2br}
                                        {else}
                                            ---
                                        {/if}
                                    </td>
                                </tr>
                                <tr>
                                    <th>{$smarty.const.FIELD_VISION}</th>
                                    <td>
                                        {if $carta->vision}
                                            {$carta->vision|nl2br}
                                        {else}
                                            ---
                                        {/if}
                                    </td>
                                </tr>
                                <tr>
                                    <th>{$smarty.const.FIELD_VALORES}</th>
                                    <td>
                                        {if $carta->valores}
                                            {$carta->valores|nl2br}
                                        {else}
                                            ---
                                        {/if}
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        {if $_control}
                            <div id="botones_ficha" class="btn-toolbar hidden" role="toolbar" aria-label="">
                                <a title="{$smarty.const.TXT_CARTA_EDIT}" class="btn btn-default btn-danger" href="index.php?page=carta_editar&id_carta={$carta->id}&id_entidad={$carta->id_entidad}">
                                    <i class="fa fa-map-o fa-fw"></i><sub class="fa fa-pencil fa-fw"></sub>
                                </a>
                                <a title="{$smarty.const.TXT_CARTA_BORRAR}" class="btn btn-default btn-danger" href='javascript:void(0)' data-toggle="modal" data-target="#dialogo_confirmar_borrado_carta">
                                    <i class="fa fa-trash fa-fw"></i>
                                </a>
                            </div>
                        {/if}
                    </div>
                    <!-- /.col-md-12 -->
                    <!-- /Datos de la Carta de Servicios -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /Ficha de la Carta de Servicios -->

            <!-- Normativas de la Carta -->
            <div role="tabpanel" class="tab-pane" id="carta_normativas">
                <!-- Barra de botones -->
                {if $_control}
                    <div id="botones_normativas" class="btn-toolbar hidden" role="toolbar" aria-label="">
                        <div class="btn-group" role="group" aria-label="">
                            <a class="btn btn-danger" href='javascript:void(0)' 
                               data-toggle="modal" data-target="#crear_normativa" title="{$smarty.const.TXT_NORMATIVA_CREAR}">
                                <i class="fa fa-hand-paper-o fa-fw"></i><sub class="fa fa-plus fa-fw"></sub>
                            </a>
                        </div>
                    </div>
                {/if}
                <!-- /Barra de botones -->
                <div id="normativas">
                    {if $normativas}
                        <div class="table-responsive">
                            <table id="tabla_normativas" class="table datatable table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>{$smarty.const.FIELD_NOMBRE}</th>
                                        <th>URL</th>
                                        {if $_control}<th>{$smarty.const.FIELD_ACCIONES}</th>{/if}
                                    </tr>
                                </thead>
                                <tbody>
                                    {foreach from=$normativas item=normativa} 
                                        <tr>
                                            <td id="norm_nombre_{$normativa->id}">{$normativa->nombre}</td>
                                            <td>
                                                <a id="norm_url_{$normativa->id}" title="{$normativa->nombre}" href="{$normativa->enlace}" target="_blank">{$normativa->enlace}</a>
                                            </td>
                                            {if $_control}
                                                <td>
                                                    <a class="editar_normativa btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_EDIT}" href='javascript:void(0)' 
                                                       data-toggle="modal" data-target="#editar_normativa" data-id_normativa="{$normativa->id}">
                                                        <i class="fa fa-pencil fa-fw"></i>
                                                    </a>
                                                    <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_NORMATIVA_BORRAR}" href='javascript:void(0)' data-toggle="modal" data-target="#dialogo_confirmar_borrado_normativa"
                                                       data-id_entidad="{$carta->id_entidad}" data-nombre="{$normativa->nombre}" data-id_normativa="{$normativa->id}">
                                                        <i class="fa fa-trash fa-fw"></i>
                                                    </a>
                                                </td>
                                            {/if}
                                        </tr>     
                                    {/foreach}
                                </tbody>
                            </table>
                        </div>
                    {else}
                        <div class="row">
                            <div class="col-sm-11">
                                <div class="alert alert-info alert-dismissible">
                                    <i class="fa fa-info-circle fa-fw"></i> 
                                    {$smarty.const.MSG_CARTA_NO_NORMATIVAS}
                                </div>
                            </div>
                            <!-- /.col-sm-11 -->
                            <div class="col-sm-1">
                                {if $_control}
                                    <div class="btn-toolbar" role="toolbar" aria-label="">
                                        <div class="btn-group" role="group" aria-label="">
                                            <a class="btn btn-danger" href='javascript:void(0)' 
                                               data-toggle="modal" data-target="#crear_normativa" title="{$smarty.const.TXT_NORMATIVA_CREAR}">
                                                <i class="fa fa-hand-paper-o fa-fw"></i><sub class="fa fa-plus fa-fw"></sub>
                                            </a>
                                        </div>
                                    </div>
                                {/if}
                            </div>
                            <!-- /.col-sm-1 -->
                        </div>
                        <!-- /.row -->
                    {/if}
                </div>
            </div>
            <!-- /Normativas de la Carta -->

            <!-- Servicios de la Carta -->
            <div role="tabpanel" class="tab-pane" id="carta_servicios">
                <!-- Barra de botones -->
                {if $_control}
                    <div id="botones_servicio" class="btn-toolbar hidden" role="toolbar" aria-label="">
                        <div class="btn-group" role="group" aria-label="">
                            <a class="btn btn-danger" href='index.php?page=servicio_crear&id_carta={$carta->id}&id_entidad={$carta->id_entidad}' 
                               title="{$smarty.const.TXT_SERVICIO_CREAR}">
                                <i class="fa fa-user-circle-o fa-fw"></i><sub class="fa fa-plus fa-fw"></sub>
                            </a>
                        </div>
                    </div>
                {/if}
                <!-- /Barra de botones -->
                {if $servicios}
                    <div class="table-responsive">
                        <table id="tabla_servicios" class="table datatable table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>{$smarty.const.FIELD_INDICE}</th>
                                    <th>{$smarty.const.FIELD_SERVICIO}</th>
                                    <th>{$smarty.const.FIELD_ACCIONES}</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach from=$servicios item=servicio} 
                                    <tr>  
                                        <td>
                                            <span class="label label-default">S.{$servicio->indice}</span>
                                        </td>
                                        <td>
                                            <a title="{$servicio->nombre}: {$servicio->descripcion|replace:"\r\n":" "}" href="index.php?page=servicio_mostrar&id_entidad={$carta->id_entidad}&id_servicio={$servicio->id}">{$servicio->nombre}</a>
                                        </td>
                                        <td>
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_FICHA}" href="index.php?page=servicio_mostrar&id_entidad={$carta->id_entidad}&id_servicio={$servicio->id}">
                                                <i class="fa fa-folder fa-fw"></i>
                                            </a>
                                            {if $_control}
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_COMPROMISO_CREAR}" href="index.php?page=compromiso_crear&id_servicio={$servicio->id}&id_entidad={$carta->id_entidad}">
                                                    <i class="fa fa-handshake-o fa-fw"></i>
                                                </a>
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_EDIT}" href="index.php?page=servicio_editar&id_entidad={$carta->id_entidad}&id_servicio={$servicio->id}">
                                                    <i class="fa fa-pencil fa-fw"></i>
                                                </a>
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_SERVICIO_BORRAR}" href='javascript:void(0)' data-toggle="modal" data-target="#dialogo_confirmar_borrado_servicio"
                                                   data-id_entidad="{$carta->id_entidad}" data-nombre="S.{$servicio->indice}. {$servicio->nombre}" data-id_servicio="{$servicio->id}">
                                                    <i class="fa fa-trash fa-fw"></i>
                                                </a>
                                            {/if}
                                        </td>
                                    </tr>     
                                {/foreach}
                            </tbody>
                        </table>
                    </div>
                {else}
                    <div class="row">
                        <div class="col-sm-11">
                            <div class="alert alert-info alert-dismissible">
                                <i class="fa fa-info-circle fa-fw"></i> 
                                {$smarty.const.MSG_CARTA_NO_SERVICIOS}
                            </div>
                        </div>
                        <!-- /.col-sm-11 -->
                        <div class="col-sm-1">
                            {if $_control}
                                <div class="btn-toolbar" role="toolbar" aria-label="">
                                    <div class="btn-group" role="group" aria-label="">
                                        <a class="btn btn-danger" href='index.php?page=servicio_crear&id_carta={$carta->id}&id_entidad={$carta->id_entidad}' 
                                           title="{$smarty.const.TXT_SERVICIO_CREAR}">
                                            <i class="fa fa-user-circle-o fa-fw"></i><sub class="fa fa-plus fa-fw"></sub>
                                        </a>
                                    </div>
                                </div>
                            {/if}
                        </div>
                        <!-- /.col-sm-1 -->
                    </div>
                    <!-- /.row -->
                {/if}
            </div>
            <!-- /Servicios de la Carta -->

            <!-- Compromisos de la Carta -->
            <div role="tabpanel" class="tab-pane" id="carta_compromisos">
                {if $compromisos}
                    <div class="table-responsive">
                        <table id="tabla_objest" class="table datatable table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>{$smarty.const.FIELD_INDICE}</th>
                                    <th>{$smarty.const.FIELD_COMPROMISO}</th>
                                    <th>{$smarty.const.FIELD_SERVICIO}</th>
                                    <th>{$smarty.const.FIELD_ACCIONES}</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach $servicios as $serv}
                                    {foreach from=$compromisos_servicios[$serv->id] item=compromiso} 
                                        <tr>  
                                            <td>
                                                <span class="label label-default">S.{$serv->indice}.C.{$compromiso->indice}</span>
                                            </td>
                                            <td>
                                                <a title="{$compromiso->nombre}: {$compromiso->descripcion|replace:"\r\n":" "}" href="index.php?page=compromiso_mostrar&id_entidad={$carta->id_entidad}&id_compromiso={$compromiso->id}">C.{$compromiso->indice}. {$compromiso->nombre}</a>
                                            </td>
                                            <td>
                                                <a title="{$serv->nombre}: {$serv->descripcion|replace:"\r\n":" "}" href="index.php?page=servicio_mostrar&id_entidad={$carta->id_entidad}&id_servicio={$serv->id}">S.{$serv->indice}. {$serv->nombre}</a>
                                            </td>
                                            <td>
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_FICHA}" href="index.php?page=compromiso_mostrar&id_entidad={$carta->id_entidad}&id_compromiso={$compromiso->id}">
                                                    <i class="fa fa-folder fa-fw"></i>
                                                </a>
                                                {if $_control}
                                                    <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_EDIT}" href="index.php?page=compromiso_editar&id_entidad={$carta->id_entidad}&id_compromiso={$compromiso->id}">
                                                        <i class="fa fa-pencil fa-fw"></i>
                                                    </a>
                                                    <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_COMPROMISO_BORRAR}" href='javascript:void(0)' data-toggle="modal" data-target="#dialogo_confirmar_borrado_compromiso"
                                                       data-id_entidad="{$carta->id_entidad}" data-nombre="C.{$compromiso->indice}. {$compromiso->nombre}" data-id_compromiso="{$compromiso->id}">
                                                        <i class="fa fa-trash fa-fw"></i>
                                                    </a>
                                                {/if}
                                            </td>
                                        </tr>    
                                    {/foreach}
                                {/foreach}
                            </tbody>
                        </table>
                    </div>
                {else}
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="alert alert-info alert-dismissible">
                                <i class="fa fa-info-circle fa-fw"></i> 
                                {$smarty.const.MSG_CARTA_NO_COMPROMISOS}
                            </div>
                        </div>
                        <!-- /.col-sm-12 -->
                    </div>
                    <!-- /.row -->
                {/if}
            </div>
            <!-- /Compromisos de la Carta -->

            <!-- Indicadores de la Carta -->
            <div role="tabpanel" class="tab-pane" id="carta_indics">
                {if $indicadores}
                    <div class="table-responsive">
                        <table id="tabla_indics" class="table datatable table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>{$smarty.const.FIELD_COD}</th>
                                    <th></th>
                                    <th></th>
                                    <th>{$smarty.const.FIELD_INDIC}</th>
                                    <th>{$smarty.const.FIELD_COMPROMISO}</th>
                                    <th>{$smarty.const.FIELD_SERVICIO}</th>
                                    <th>{$smarty.const.FIELD_PERIOD}</th>
                                    <th>{$smarty.const.FIELD_RESP}</th>
                                    <th>{$smarty.const.FIELD_RESP_MED}</th>
                                    <th>{$smarty.const.FIELD_ACCIONES}</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach $servicios as $serv}
                                    {foreach $compromisos_servicios[$serv->id] as $comp}
                                        {if isset($compromiso_indicadores[$comp->id])}
                                            {foreach from=$compromiso_indicadores[$comp->id] item=indicador}
                                                <tr>
                                                    <td><span class="label label-primary">{$indicador->codigo}</span></td>
                                                    <td>
                                                        {if $indicador->calculo}
                                                            <i class="fa fa-calculator fa-fw" title="{$smarty.const.TXT_CALC_AUTO}: {$indicador->calculo}"></i>
                                                        {/if}
                                                    </td>
                                                    <td>
                                                        {if $indicador->id_tipo_agregacion!= 0}
                                                            <i class="fa fa-sitemap fa-fw" title="{$smarty.const.FIELD_AGREG}"></i>
                                                        {/if}
                                                    </td>
                                                    <td>
                                                        <a href='index.php?page=indicador_mostrar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}' 
                                                           title="{$indicador->nombre}: {$indicador->descripcion|replace:"\r\n":" "}">
                                                            {$indicador->nombre}</a>
                                                    </td>
                                                    <td>
                                                        <a title="{$comp->nombre}: {$comp->descripcion|replace:"\r\n":" "}" href="index.php?page=compromiso_mostrar&id_compromiso={$comp->id}&id_entidad={$indicador->id_entidad}">C.{$comp->indice}. {$comp->nombre}</a>
                                                    </td>
                                                    <td>
                                                        <a title="{$serv->nombre}: {$serv->descripcion|replace:"\r\n":" "}" href="index.php?page=servicio_mostrar&id_entidad={$carta->id_entidad}&id_servicio={$serv->id}">S.{$serv->indice}. {$serv->nombre}</a>
                                                    </td>
                                                    <td>{$indicador->periodicidad}</td>
                                                    <td style="font-size: 12px">
                                                        <a title="{$smarty.const.TXT_USER_PERFIL}" href='index.php?page=usuario_mostrar&id_usuario={$indicador->id_responsable}'>
                                                            {$indicador->responsable->nombre} {$indicador->responsable->apellidos}</a>
                                                    </td>
                                                    <td style="font-size: 12px">
                                                        <a title="{$smarty.const.TXT_USER_PERFIL}" href='index.php?page=usuario_mostrar&id_usuario={$indicador->id_responsable_medicion}'>
                                                            {$indicador->responsable_medicion->nombre} {$indicador->responsable_medicion->apellidos}</a>
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_FICHA}" href='index.php?page=indicador_mostrar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                                                            <i class="fa fa-folder fa-fw"></i>
                                                        </a>
                                                        <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_REP_GRAFIC}" href='index.php?page=graficas_mostrar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                                                            <i class="fa fa-area-chart fa-fw"></i>
                                                        </a>
                                                        <a class="btn btn-default btn-circle btn-xs" href='index.php?page=medicion_listar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}' 
                                                           title="{$smarty.const.FIELD_MEDICIONES}">
                                                            <i class="fa fa-hourglass fa-fw"></i>
                                                        </a>
                                                        <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_ANALISIS}" href='index.php?page=analisis&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                                                            <i class="fa fa-connectdevelop fa-fw"></i>
                                                        </a>
                                                        <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_VAL_REF}" href='index.php?page=valor_referencia&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                                                            <i class="fa fa-tags fa-fw"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                            {/foreach}
                                        {/if}
                                    {/foreach}
                                {/foreach}
                            </tbody>
                        </table>
                    </div>
                {else}
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="alert alert-info alert-dismissible">
                                <i class="fa fa-info-circle fa-fw"></i> 
                                {$smarty.const.MSG_CARTA_NO_INDICS}
                            </div>
                        </div>
                        <!-- /.col-sm-12 -->
                    </div>
                    <!-- /.row -->
                {/if}
            </div>
            <!-- /Indicadores de la Carta -->

            <!-- Archivos la Carta de Servicios -->
            <div role="tabpanel" class="tab-pane" id="carta_archivos">
                <!-- Barra de botones -->
                {if $_control}
                    <div id="botones_archivo" class="btn-toolbar hidden" role="toolbar" aria-label="">
                        <div class="btn-group" role="group" aria-label="">
                            <a class="btn btn-danger" href='index.php?page=archivo_gestionar&id_carta={$carta->id}&id_entidad={$entidad->id}' 
                               title="{$smarty.const.TXT_ARCHIVOS_GESTION}">
                                <i class="fa fa-archive fa-fw"></i>
                            </a>
                        </div>
                    </div>
                {/if}
                <!-- /Barra de botones -->
                {if $archivos}
                    <div class="table-responsive">
                        <table id="tabla_archivos" class="table datatable table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>{$smarty.const.FIELD_ARCHIVO}</th>
                                    <th>{$smarty.const.FIELD_USER}</th>
                                    <th>{$smarty.const.FIELD_ACCIONES}</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach from=$archivos item=archivo} 
                                    {if $archivo->visible}
                                        <tr>  
                                            <td>
                                                <a title='{$archivo->titulo}: {$archivo->descripcion|replace:"\r\n":" "}' href="index.php?page=archivo_descargar&id={$archivo->id}">{$archivo->titulo}</a>
                                            </td>
                                            <td style="font-size: 12px">
                                                <a title="{$smarty.const.TXT_USER_PERFIL}" href='index.php?page=usuario_mostrar&id_usuario={$archivo->usuario->id}'>{$archivo->usuario->nombre} {$archivo->usuario->apellidos}</a>
                                            </td>
                                            <td style="white-space:nowrap">
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_ARCHIVO_DESCARGA}" href="index.php?page=archivo_descargar&id={$archivo->id}"><i class="fa fa-download fa-fw"></i></a>                 
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_USER_PERFIL}" href='index.php?page=usuario_mostrar&id_usuario={$archivo->usuario->id}'><i class="fa fa-user fa-fw"></i></a>
                                            </td>
                                        </tr>
                                    {/if}
                                {/foreach}
                            </tbody>
                        </table>
                    </div>
                {else}
                    <div class="row">
                        <div class="col-sm-11">
                            <div class="alert alert-info alert-dismissible">
                                <i class="fa fa-info-circle fa-fw"></i> 
                                {$smarty.const.MSG_CARTA_NO_ARCHIVOS}
                            </div>
                        </div>
                        <!-- /.col-sm-11 -->
                        <div class="col-sm-1">
                            {if $_control}
                                <div class="btn-toolbar" role="toolbar" aria-label="">
                                    <div class="btn-group" role="group" aria-label="">
                                        <a class="btn btn-danger" href='index.php?page=archivo_gestionar&id_carta={$carta->id}&id_entidad={$entidad->id}' 
                                           title="{$smarty.const.TXT_ARCHIVOS_GESTION}">
                                            <i class="fa fa-archive fa-fw"></i>
                                        </a>
                                    </div>
                                </div>
                            {/if}
                        </div>
                        <!-- /.col-sm-1 -->
                    </div>
                    <!-- /.row -->
                {/if}
            </div>
            <!-- /Archivos de la Carta de Servicios -->

            <!-- Seguimiento de la Carta de Servicios -->
            <div role="tabpanel" class="tab-pane" id="carta_res">
                {if $servicios}
                    <div class="panel-group" id="accordion_servicios" role="tablist" aria-multiselectable="true" style="margin-bottom: 0;">
                        {foreach from=$servicios item=servicio}
                            <div class="panel panel-danger" style="margin-top: 0;">
                                <div class="panel-heading" role="tab">
                                    <h4 class="panel-title">
                                        <a title="{$smarty.const.FIELD_SERVICIO}: S.{$servicio->indice}. {$servicio->nombre}" role="button" data-toggle="collapse" data-parent="#accordion_servicios" href="#{$servicio->id}" aria-expanded="false" aria-controls="">
                                            <i class="fa fa-user-circle-o fa-fw"></i> S.{$servicio->indice}. {$servicio->nombre}
                                        </a>
                                        <a class="panel-title pull-right" title="{$smarty.const.TXT_FICHA}" href="index.php?page=servicio_mostrar&id_servicio={$servicio->id}&id_entidad={$carta->id_entidad}">
                                            <i class="fa fa-folder fa-fw"></i>
                                        </a> 
                                    </h4>
                                </div>
                                <!-- /.panel-heading -->
                                <div id="{$servicio->id}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="">
                                    <div class="panel-group" id="accordion_compromisos" role="tablist" aria-multiselectable="true" style="margin-bottom: 0;">
                                        {if $compromisos_servicios[$servicio->id]}
                                            {foreach from=$compromisos_servicios[$servicio->id] item=compromiso}
                                                <div class="panel panel-warning" style="margin-top: 0;">
                                                    <div class="panel-heading" role="tab">
                                                        <h4 class="panel-title">
                                                            <a title="{$smarty.const.FIELD_COMPROMISO}: C.{$compromiso->indice}. {$compromiso->nombre}" role="button" data-toggle="collapse" data-parent="#accordion_compromisos" href="#{$servicio->id}{$compromiso->id}" aria-expanded="false" aria-controls="">
                                                                <i class="fa fa-handshake-o fa-fw"></i> C.{$compromiso->indice}. {$compromiso->nombre}
                                                            </a>
                                                            <a class="panel-title pull-right" title="{$smarty.const.TXT_FICHA}" href="index.php?page=compromiso_mostrar&id_compromiso={$compromiso->id}&id_entidad={$carta->id_entidad}">
                                                                <i class="fa fa-folder fa-fw"></i>
                                                            </a> 
                                                        </h4>
                                                    </div>
                                                </div>
                                                <!-- /.panel-heading -->
                                                <div id="{$servicio->id}{$compromiso->id}" class="panel-collapse collapse compromiso" role="tabpanel" aria-labelledby="" {if isset($compromiso_indicadores[$compromiso->id])}data-num_indic="{$compromiso_indicadores[$compromiso->id]|@count}{/if}">
                                                    {if isset($compromiso_indicadores[$compromiso->id])}
                                                        <div class="panel-body">
                                                            <div id="carousel-indics-{$compromiso->id}" class="carousel slide" data-ride="carousel" data-interval="15000">
                                                                <!-- Wrapper for slides -->
                                                                <div class="carousel-inner" role="listbox">
                                                                    {foreach $compromiso_indicadores[$compromiso->id] as $ind}
                                                                        <div class="item {if $ind@first}active{/if}">
                                                                            <div class="{$servicio->id}{$compromiso->id} highchart" 
                                                                                 id="panel_{$compromiso->id}_{$ind->id}" 
                                                                                 data-id_indicador="{$ind->id}" 
                                                                                 data-nombre_indicador="{$ind->nombre}"
                                                                                 data-valor_min="{$ind->valor_min}" 
                                                                                 data-valor_max="{$ind->valor_max}" 
                                                                                 data-fecha_inicio="{$anio_inicio}-01-01" 
                                                                                 data-fecha_fin="{$anio_fin}-12-31"
                                                                                 {if $ind->periodicidad=='Bienal'}
                                                                                     data-periodicidad= "bienal" 
                                                                                 {else}
                                                                                     data-periodicidad= "anual"
                                                                                 {/if}>
                                                                            </div>
                                                                            <div class="carousel-caption">
                                                                                <h3>
                                                                                    <a href='index.php?page=indicador_mostrar&id_indicador={$ind->id}&id_entidad={$ind->id_entidad}' 
                                                                                       title="{$ind->nombre}: {$ind->descripcion|replace:"\r\n":" "}"><i class="fa fa-dashboard fa-fw"></i></a>
                                                                                </h3>
                                                                                <p style="color: #337AB7;">{$smarty.const.TXT_GRAFICO_AUMENTAR}</p>
                                                                            </div>
                                                                        </div>
                                                                    {/foreach}
                                                                </div>
                                                                <!-- Controls -->
                                                                <a class="left carousel-control" title="{$smarty.const.TXT_ANT}" href="#carousel-correl-{$objop->id}" role="button" data-slide="prev">
                                                                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true" style="color: #337AB7;"></span>
                                                                    <span class="sr-only">{$smarty.const.TXT_ANT}</span>
                                                                </a>
                                                                <a class="right carousel-control" title="{$smarty.const.TXT_SIG}" href="#carousel-correl-{$objop->id}" role="button" data-slide="next">
                                                                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true" style="color: #337AB7;"></span>
                                                                    <span class="sr-only">{$smarty.const.TXT_SIG}</span>
                                                                </a>
                                                            </div>
                                                            <!-- /.carousel -->
                                                        </div>
                                                    {else}
                                                        <div class="alert alert-info alert-dismissible" style="margin: 0;">
                                                            <i class="fa fa-info-circle fa-fw"></i> 
                                                            {$smarty.const.MSG_COMPROMISO_NO_INDICS}
                                                        </div> 
                                                    {/if}
                                                </div>
                                                <!-- /.panel-collapse -->
                                            {/foreach}
                                        {else}
                                            <div class="alert alert-info alert-dismissible" style="margin: 0;">
                                                <i class="fa fa-info-circle fa-fw"></i> 
                                                {$smarty.const.MSG_SERVICIO_NO_COMPROMISOS}
                                            </div> 
                                        {/if}
                                    </div>
                                </div>
                                <!-- /.panel-collapse -->
                            </div>
                            <!-- /.panel -->
                        {/foreach}
                    </div>
                {else}
                    <div class="alert alert-info alert-dismissible" style="margin: 0;">
                        <i class="fa fa-info-circle fa-fw"></i> 
                        {$smarty.const.MSG_CARTA_NO_SERVICIOS}
                    </div> 
                {/if}
            </div>
            <!-- /Seguimiento de la Carta de Servicios -->

        </div>
        <!-- /Tab panes -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->