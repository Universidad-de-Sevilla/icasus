<!-- Diálogo Confirmar Borrado Servicio -->
<div class="modal fade" id="dialogo_confirmar_borrado_servicio" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel">
                    <i class="fa fa-trash fa-fw"></i> {$smarty.const.TXT_SERVICIO_BORRAR}: S.{$servicio->indice}
                    . {$servicio->nombre}</h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_SERVICIO_CONFIRM_BORRAR}</p>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_NO}" class="btn btn-danger" data-dismiss="modal"><i
                            class="fa fa-times fa-fw"></i> {$smarty.const.TXT_NO}</button>
                <a title="{$smarty.const.TXT_SI}" class="btn btn-success" name="borrar" id="borrar"
                   href="index.php?page=servicio_borrar&id_servicio={$servicio->id}&id_entidad={$servicio->carta->id_entidad}"><i
                            class="fa fa-check fa-fw"></i> {$smarty.const.TXT_SI}</a>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Confirmar Borrado Servicio -->

<!-- Diálogo Confirmar Borrado Compromiso -->
<div class="modal fade" id="dialogo_confirmar_borrado_compromiso" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel"><i
                            class="fa fa-trash fa-fw"></i> {$smarty.const.TXT_COMPROMISO_BORRAR}: <span
                            id="nombre_compromiso"></span></h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_COMPROMISO_CONFIRM_BORRAR}</p>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_NO}" class="btn btn-danger" data-dismiss="modal"><i
                            class="fa fa-times fa-fw"></i> {$smarty.const.TXT_NO}</button>
                <a title="{$smarty.const.TXT_SI}" class="btn btn-success" name="borrar" id="borrar"><i
                            class="fa fa-check fa-fw"></i> {$smarty.const.TXT_SI}</a>
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
                    <i class="fa fa-user-circle-o fa-fw"></i> {$_nombre_pagina}
                </div>
                <!-- /.col-md-10 -->
                <!-- Navegación -->
                {if count($servicios)> 1}
                    <div class="col-md-2">
                        <div style="font-size:10px">{$indice+1} {$smarty.const.TXT_DE} {count($servicios)} {$smarty.const.FIELD_SERVICIOS}</div>
                        <div class="btn-toolbar" role="toolbar" aria-label="">
                            <div class="btn-group" role="group" aria-label="">
                                <a title="{$smarty.const.TXT_PRIMER} {$smarty.const.FIELD_SERVICIO}"
                                   class="btn btn-danger btn-xs {if $indice == 0}disabled{/if}"
                                   href='index.php?page=servicio_mostrar&id_entidad={$entidad->id}&id_servicio={$servicios[0]->id}'>
                                    <i class="fa fa-step-backward fa-fw"></i>
                                </a>
                                {if count($servicios) > 2}
                                    <a title="{$smarty.const.TXT_ANT} {$smarty.const.FIELD_SERVICIO}"
                                       class="btn btn-danger btn-xs {if $indice == 0}disabled{/if}"
                                       href='index.php?page=servicio_mostrar&id_entidad={$entidad->id}&id_servicio={$servicios[$indice-1]->id}'>
                                        <i class="fa fa-play fa-rotate-180 fa-fw"></i>
                                    </a>
                                    <a title="{$smarty.const.TXT_SIG} {$smarty.const.FIELD_SERVICIO}"
                                       class="btn btn-danger btn-xs {if $indice == (count($servicios)-1)}disabled{/if}"
                                       href='index.php?page=servicio_mostrar&id_entidad={$entidad->id}&id_servicio={$servicios[$indice+1]->id}'>
                                        <i class="fa fa-play fa-fw"></i>
                                    </a>
                                {/if}
                                <a title="{$smarty.const.TXT_ULTIMO} {$smarty.const.FIELD_SERVICIO}"
                                   class="btn btn-danger btn-xs {if $indice == (count($servicios)-1)}disabled{/if}"
                                   href='index.php?page=servicio_mostrar&id_entidad={$entidad->id}&id_servicio={$servicios[(count($servicios)-1)]->id}'>
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
            <li><a title="{$smarty.const.FIELD_UNIDS}"
                   href='index.php?page=entidad_listar'>{$smarty.const.FIELD_UNIDS}</a></li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" data-target="#" title="{$entidad->nombre}"
                   href="index.php?page=entidad_mostrar&id_entidad={$entidad->id}">
                    {$entidad->nombre|truncate:30} <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu">
                    <li>
                        <a title="{$smarty.const.FIELD_USER}: {$_usuario->login} - {$smarty.const.TXT_UNID}: {$entidad->nombre} - {$smarty.const.FIELD_ROL}: {$_rol}"
                           href="index.php?page=entidad_mostrar&id_entidad={$entidad->id}"><i
                                    class="fa fa-folder fa-fw"></i> {$entidad->nombre} / <i
                                    class="fa fa-user fa-fw"></i> {$_rol}</a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a title="{$smarty.const.TXT_PLANES_DESCRIPCION}"
                           href='index.php?page=plan_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-book fa-fw"></i> {$smarty.const.FIELD_PLANES} <span
                                    title="{$smarty.const.FIELD_TOTAL}: {$num_planes} {$smarty.const.FIELD_PLANES}">({$num_planes}
                                )</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_CARTAS_DESCRIPCION}"
                           href='index.php?page=carta_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-map-o fa-fw"></i> {$smarty.const.FIELD_CARTAS} <span
                                    title="{$smarty.const.FIELD_TOTAL}: {$num_cartas} {$smarty.const.FIELD_CARTAS}">({$num_cartas}
                                )</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_PROCS_DESCRIPCION}"
                           href='index.php?page=proceso_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-gears fa-fw"></i> {$smarty.const.FIELD_PROCS} <span
                                    title="{$smarty.const.FIELD_TOTAL}: {$num_procesos} {$smarty.const.FIELD_PROCS}">({$num_procesos}
                                )</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_INDICS_DESCRIPCION}"
                           href='index.php?page=indicador_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-dashboard fa-fw"></i> {$smarty.const.FIELD_INDICS}
                            /{$smarty.const.FIELD_DATOS} <span
                                    title="{$smarty.const.FIELD_TOTAL}: {$num_indicadores} {$smarty.const.FIELD_INDICS}/{$smarty.const.FIELD_DATOS}">({$num_indicadores}
                                )</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_CUADRO_MANDO_DESCRIPCION}"
                           href='index.php?page=cuadro_listar&id_entidad={$entidad->id}'>
                            <i class="fa fa-th fa-fw"></i> {$smarty.const.FIELD_CUADROS_MANDO} <span
                                    title="{$smarty.const.FIELD_TOTAL}: {$num_cuadros} {$smarty.const.FIELD_CUADROS_MANDO}">({$num_cuadros}
                                )</span>
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_CONSULTA_DESCRIPCION}"
                           href="index.php?page=consulta_avanzada&id_entidad={$entidad->id}">
                            <i class="fa fa-commenting fa-fw"></i> {$smarty.const.TXT_CONSULT}
                        </a>
                    </li>
                    <li>
                        <a title="{$smarty.const.TXT_CONTROL_DESCRIPCION}"
                           href="index.php?page=control&modulo=inicio&id_entidad={$entidad->id}">
                            <i class="fa fa-sliders fa-fw"></i> {$smarty.const.TXT_CONTROL}
                        </a>
                    </li>
                </ul>
                <!-- /.dropdown-menu -->
            </li>
            <!-- /.dropdown -->
            <li><a title="{$smarty.const.FIELD_CARTAS}"
                   href='index.php?page=carta_listar&id_entidad={$entidad->id}'>{$smarty.const.FIELD_CARTAS}</a></li>
            <li><a title="{$smarty.const.FIELD_CARTA} {$carta->fecha|date_format:'%d/%m/%Y'}"
                   href='index.php?page=carta_mostrar&id_carta={$carta->id}&id_entidad={$entidad->id}'>{$smarty.const.FIELD_CARTA} {$carta->fecha|date_format:'%d/%m/%Y'}</a>
            </li>
            <li><a title="{$smarty.const.FIELD_SERVICIOS}"
                   href='index.php?page=carta_mostrar&id_carta={$carta->id}&id_entidad={$entidad->id}#carta_servicios'>{$smarty.const.FIELD_SERVICIOS}</a>
            </li>
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
                <a href="#servicio_ficha" title="{$smarty.const.TXT_FICHA}" aria-controls="{$smarty.const.TXT_FICHA}"
                   role="tab" data-toggle="tab"><i class="fa fa-folder fa-fw"></i> {$smarty.const.TXT_FICHA}</a>
            </li>
            <li role="presentation">
                <a href="#servicio_compromisos" title="{$smarty.const.FIELD_COMPROMISOS}"
                   aria-controls="{$smarty.const.FIELD_COMPROMISOS}" role="tab" data-toggle="tab"><i
                            class="fa fa-handshake-o fa-fw"></i> {$smarty.const.FIELD_COMPROMISOS}</a>
            </li>
            <li role="presentation">
                <a href="#servicio_indics" title="{$smarty.const.FIELD_INDICS}"
                   aria-controls="{$smarty.const.FIELD_INDICS}" role="tab" data-toggle="tab"><i
                            class="fa fa-dashboard fa-fw"></i> {$smarty.const.FIELD_INDICS}</a>
            </li>
        </ul>
        <!-- /Nav tabs -->
        <br>
        <!-- Tab panes -->
        <div class="tab-content">

            <!-- Ficha del Servicio -->
            <div role="tabpanel" class="tab-pane active" id="servicio_ficha">
                <div class="row">
                    <!-- Datos del Servicio -->
                    <div class="col-md-12">
                        <table class="table table-striped table-hover ficha">
                            <thead>
                            <th></th>
                            <th></th>
                            </thead>
                            <tbody>
                            <tr>
                                <th>{$smarty.const.FIELD_INDICE}</th>
                                <td><span class="label label-default">{$servicio->indice}</span></td>
                            </tr>
                            <tr>
                                <th>{$smarty.const.FIELD_NOMBRE}</th>
                                <td>{$servicio->nombre}</td>
                            </tr>
                            <tr>
                                <th>{$smarty.const.FIELD_CARTA}</th>
                                <td><a title="{$smarty.const.FIELD_CARTA}"
                                       href='index.php?page=carta_mostrar&id_carta={$carta->id}&id_entidad={$carta->id_entidad}'>{$carta->fecha|date_format:'%d/%m/%Y'}</a>
                                </td>
                            </tr>
                            <tr>
                                <th>{$smarty.const.FIELD_DESCRIPCION}</th>
                                <td>
                                    {if $servicio->descripcion}
                                        {$servicio->descripcion|nl2br}
                                    {else}
                                        ---
                                    {/if}
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        {if $_control}
                            <div id="botones_ficha" class="btn-toolbar hidden" role="toolbar" aria-label="">
                                <a title="{$smarty.const.TXT_SERVICIO_EDIT}" class="btn btn-default btn-danger"
                                   href="index.php?page=servicio_editar&id_servicio={$servicio->id}&id_entidad={$servicio->carta->id_entidad}">
                                    <i class="fa fa-user-circle-o fa-fw"></i><sub class="fa fa-pencil fa-fw"></sub>
                                </a>
                                <a title="{$smarty.const.TXT_SERVICIO_BORRAR}" class="btn btn-default btn-danger"
                                   href='javascript:void(0)' data-toggle="modal"
                                   data-target="#dialogo_confirmar_borrado_servicio">
                                    <i class="fa fa-trash fa-fw"></i>
                                </a>
                            </div>
                        {/if}
                    </div>
                    <!-- /.col-md-12 -->
                    <!-- /Datos del Servicio -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /Ficha del Servicio -->

            <!-- Compromisos del Servicio -->
            <div role="tabpanel" class="tab-pane" id="servicio_compromisos">
                <!-- Barra de botones -->
                {if $_control}
                    <div id="botones_compromiso" class="btn-toolbar hidden" role="toolbar" aria-label="">
                        <div class="btn-group" role="group" aria-label="">
                            <a class="btn btn-danger"
                               href='index.php?page=compromiso_crear&id_servicio={$servicio->id}&id_entidad={$carta->id_entidad}'
                               title="{$smarty.const.TXT_COMPROMISO_CREAR}">
                                <i class="fa fa-handshake-o fa-fw"></i><sub class="fa fa-plus fa-fw"></sub>
                            </a>
                        </div>
                    </div>
                {/if}
                <!-- /Barra de botones -->
                {if $compromisos}
                    <div class="table-responsive">
                        <table id="tabla_compromisos" class="table datatable table-striped table-hover">
                            <thead>
                            <tr>
                                <th>{$smarty.const.FIELD_INDICE}</th>
                                <th>{$smarty.const.FIELD_COMPROMISO}</th>
                                <th>{$smarty.const.FIELD_ACCIONES}</th>
                            </tr>
                            </thead>
                            <tbody>
                            {foreach from=$compromisos item=compromiso}
                                <tr>
                                    <td>
                                        <span class="label label-default">C.{$compromiso->indice}</span>
                                    </td>
                                    <td>
                                        <a title="{$compromiso->nombre}: {$compromiso->descripcion|replace:"\r\n":" "}"
                                           href="index.php?page=compromiso_mostrar&id_entidad={$carta->id_entidad}&id_compromiso={$compromiso->id}">{$compromiso->nombre}</a>
                                    </td>
                                    <td>
                                        <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_FICHA}"
                                           href="index.php?page=compromiso_mostrar&id_entidad={$carta->id_entidad}&id_compromiso={$compromiso->id}">
                                            <i class="fa fa-folder fa-fw"></i>
                                        </a>
                                        {if $_control}
                                            <a class="btn btn-default btn-circle btn-xs"
                                               title="{$smarty.const.TXT_EDIT}"
                                               href="index.php?page=compromiso_editar&id_entidad={$carta->id_entidad}&id_compromiso={$compromiso->id}">
                                                <i class="fa fa-pencil fa-fw"></i>
                                            </a>
                                            <a class="btn btn-default btn-circle btn-xs"
                                               title="{$smarty.const.TXT_COMPROMISO_BORRAR}" href='javascript:void(0)'
                                               data-toggle="modal" data-target="#dialogo_confirmar_borrado_compromiso"
                                               data-id_entidad="{$carta->id_entidad}"
                                               data-nombre="C.{$compromiso->indice}. {$compromiso->nombre}"
                                               data-id_compromiso="{$compromiso->id}">
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
                                {$smarty.const.MSG_SERVICIO_NO_COMPROMISOS}
                            </div>
                        </div>
                        <!-- /.col-sm-11 -->
                        <div class="col-sm-1">
                            {if $_control}
                                <div class="btn-toolbar" role="toolbar" aria-label="">
                                    <div class="btn-group" role="group" aria-label="">
                                        <a class="btn btn-danger"
                                           href='index.php?page=compromiso_crear&id_servicio={$servicio->id}&id_entidad={$carta->id_entidad}'
                                           title="{$smarty.const.TXT_COMPROMISO_CREAR}">
                                            <i class="fa fa-handshake-o fa-fw"></i><sub class="fa fa-plus fa-fw"></sub>
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
            <!-- /Compromisos del Servicio -->

            <!-- Indicadores del Servicio -->
            <div role="tabpanel" class="tab-pane" id="servicio_indics">
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
                                <th>{$smarty.const.FIELD_PERIOD}</th>
                                <th>{$smarty.const.FIELD_RESP}</th>
                                <th>{$smarty.const.FIELD_RESP_MED}</th>
                                <th>{$smarty.const.FIELD_ACCIONES}</th>
                            </tr>
                            </thead>
                            <tbody>
                            {foreach $compromisos as $comp}
                                {foreach from=$compromiso_indicadores[$comp->id] item=indicador}
                                    <tr>
                                        <td><span class="label label-primary">{$indicador->codigo}</span></td>
                                        <td>
                                            {if $indicador->calculo}
                                                <i class="fa fa-calculator fa-fw"
                                                   title="{$smarty.const.TXT_CALC_AUTO}: {$indicador->calculo}"></i>
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
                                            <a title="{$comp->nombre}: {$comp->descripcion|replace:"\r\n":" "}"
                                               href="index.php?page=compromiso_mostrar&id_compromiso={$comp->id}&id_entidad={$indicador->id_entidad}">C.{$comp->indice}
                                                . {$comp->nombre}</a>
                                        </td>
                                        <td>{$indicador->periodicidad}</td>
                                        <td style="font-size: 12px">
                                            <a title="{$smarty.const.TXT_USER_PERFIL}"
                                               href='index.php?page=usuario_mostrar&id_usuario={$indicador->id_responsable}'>
                                                {$indicador->responsable->nombre} {$indicador->responsable->apellidos}</a>
                                        </td>
                                        <td style="font-size: 12px">
                                            <a title="{$smarty.const.TXT_USER_PERFIL}"
                                               href='index.php?page=usuario_mostrar&id_usuario={$indicador->id_responsable_medicion}'>
                                                {$indicador->responsable_medicion->nombre} {$indicador->responsable_medicion->apellidos}</a>
                                        </td>
                                        <td>
                                            <a class="btn btn-default btn-circle btn-xs"
                                               title="{$smarty.const.TXT_FICHA}"
                                               href='index.php?page=indicador_mostrar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                                                <i class="fa fa-folder fa-fw"></i>
                                            </a>
                                            <a class="btn btn-default btn-circle btn-xs"
                                               title="{$smarty.const.TXT_REP_GRAFIC}"
                                               href='index.php?page=graficas_mostrar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                                                <i class="fa fa-area-chart fa-fw"></i>
                                            </a>
                                            <a class="btn btn-default btn-circle btn-xs"
                                               href='index.php?page=medicion_listar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'
                                               title="{$smarty.const.FIELD_MEDICIONES}">
                                                <i class="fa fa-hourglass fa-fw"></i>
                                            </a>
                                            <a class="btn btn-default btn-circle btn-xs"
                                               title="{$smarty.const.TXT_ANALISIS}"
                                               href='index.php?page=analisis&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                                                <i class="fa fa-connectdevelop fa-fw"></i>
                                            </a>
                                            <a class="btn btn-default btn-circle btn-xs"
                                               title="{$smarty.const.TXT_VAL_REF}"
                                               href='index.php?page=valor_referencia&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                                                <i class="fa fa-tags fa-fw"></i>
                                            </a>
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
                                {$smarty.const.MSG_SERVICIO_NO_INDICS}
                            </div>
                        </div>
                        <!-- /.col-sm-12 -->
                    </div>
                    <!-- /.row -->
                {/if}
            </div>
            <!-- /Indicadores del Servicio -->

        </div>
        <!-- /Tab panes -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->