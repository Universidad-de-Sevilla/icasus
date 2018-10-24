<!-- Diálogo Confirmar Borrado Normativa -->
<div class="modal fade" id="dialogo_confirmar_borrado_normativa" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel">
                    <i class="fa fa-trash fa-fw"></i> {$smarty.const.TXT_NORMATIVA_BORRAR}: {$normativa->nombre}</h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_NORMATIVA_CONFIRM_BORRAR}</p>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_NO}" class="btn btn-danger" data-dismiss="modal"><i
                            class="fa fa-times fa-fw"></i> {$smarty.const.TXT_NO}</button>
                <a title="{$smarty.const.TXT_SI}" class="btn btn-success" name="borrar" id="borrar"
                   href="index.php?page=normativa_borrar&id_normativa={$normativa->id}&id_entidad={$normativa->carta->id_entidad}"><i
                            class="fa fa-check fa-fw"></i> {$smarty.const.TXT_SI}</a>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Confirmar Borrado Normativa -->

<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">

            <div class="row">
                <div class="col-md-10">
                    <h3 title="{$_nombre_pagina}" class="page-header"><i class="fa fa-hand-paper-o fa-fw"></i> {$_nombre_pagina}</h3>
                </div>
                <!-- /.col-md-10 -->
                <!-- Navegación -->
                {if count($normativas)> 1}
                    <div class="col-md-2">
                        <div style="font-size:10px">{$indice+1} {$smarty.const.TXT_DE} {count($normativas)} {$smarty.const.FIELD_NORMATIVAS}</div>
                        <div class="btn-toolbar" role="toolbar" aria-label="">
                            <div class="btn-group" role="group" aria-label="">
                                <a title="{$smarty.const.TXT_PRIMER} {$smarty.const.FIELD_NORMATIVA}"
                                   class="btn btn-danger btn-xs {if $indice == 0}disabled{/if}"
                                   href='index.php?page=normativa_mostrar&id_entidad={$entidad->id}&id_normativa={$normativas[0]->id}'>
                                    <i class="fa fa-step-backward fa-fw"></i>
                                </a>
                                    <a title="{$smarty.const.TXT_ANT} {$smarty.const.FIELD_NORMATIVA}"
                                       class="btn btn-danger btn-xs {if $indice == 0}disabled" href="#"{else}"
                                       href='index.php?page=normativa_mostrar&id_entidad={$entidad->id}&id_normativa={$normativas[$indice-1]->id}'{/if}>
                                        <i class="fa fa-play fa-rotate-180 fa-fw"></i>
                                    </a>
                                    <a title="{$smarty.const.TXT_SIG} {$smarty.const.FIELD_NORMATIVA}"
                                       class="btn btn-danger btn-xs {if $indice == (count($normativas)-1)}disabled" href="#"{else}"
                                       href='index.php?page=normativa_mostrar&id_entidad={$entidad->id}&id_normativa={$normativas[$indice+1]->id}'{/if}>
                                        <i class="fa fa-play fa-fw"></i>
                                    </a>
                                <a title="{$smarty.const.TXT_ULTIMO} {$smarty.const.FIELD_NORMATIVA}"
                                   class="btn btn-danger btn-xs {if $indice == (count($normativas)-1)}disabled{/if}"
                                   href='index.php?page=normativa_mostrar&id_entidad={$entidad->id}&id_normativa={$normativas[(count($normativas)-1)]->id}'>
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
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- /Nombre página -->

<!-- Breadcrumbs -->
<div class="row">
    <div class="col-lg-12">
        <ol class="breadcrumb">
            <li><i title="{$smarty.const.TXT_ESTA}" class="fa fa-map-marker fa-fw"></i>
                <a title="{$smarty.const.FIELD_UNIDS}"
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
            <li><a title="{$smarty.const.FIELD_NORMATIVAS}"
                   href='index.php?page=carta_mostrar&id_carta={$carta->id}&id_entidad={$entidad->id}#carta_normativas'>{$smarty.const.FIELD_NORMATIVAS}</a>
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
        <table class="table table-striped table-hover ficha">
            <thead>
            <th></th>
            <th></th>
            </thead>
            <tbody>
            <tr>
                <th>{$smarty.const.FIELD_NOMBRE}</th>
                <td>{$normativa->nombre}</td>
            </tr>
            <tr>
                <th>{$smarty.const.FIELD_CARTA}</th>
                <td><a title="{$smarty.const.FIELD_CARTA}"
                       href='index.php?page=carta_mostrar&id_carta={$carta->id}&id_entidad={$carta->id_entidad}'>{$carta->fecha|date_format:'%d/%m/%Y'}</a>
                </td>
            </tr>
            <tr>
                <th>URL</th>
                <td>
                    <a title="{$normativa->nombre}" href="{$normativa->enlace}" target="_blank">{$normativa->enlace}</a>
                </td>
            </tr>
            </tbody>
        </table>
        {if $_control}
            <div id="botones_ficha" class="btn-toolbar hidden" role="toolbar" aria-label="">
                <a title="{$smarty.const.TXT_NORMATIVA_EDIT}" class="btn btn-default btn-danger"
                   href="index.php?page=normativa_editar&id_normativa={$normativa->id}&id_entidad={$normativa->carta->id_entidad}">
                    <i class="fa fa-hand-paper-o fa-fw"></i><sub class="fa fa-pencil fa-fw"></sub>
                </a>
                <a title="{$smarty.const.TXT_NORMATIVA_BORRAR}" class="btn btn-default btn-danger"
                   href='javascript:void(0)' data-toggle="modal" data-target="#dialogo_confirmar_borrado_normativa">
                    <i class="fa fa-trash fa-fw"></i>
                </a>
            </div>
        {/if}
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->