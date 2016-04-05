<!-- Diálogo Crear valor de referencia -->
<div class="modal fade" id="crear_referencia" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <form method="post" action="" id="formcrearreferencia" name="formcrearreferencia" data-toggle="validator" class="form-horizontal">
                <input type="hidden"  name="c-id_indicador" value="{$indicador->id}"/>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="{$smarty.const.TXT_CERRAR}"><span aria-hidden="true">&times;</span></button>
                    <h3 class="modal-title" id="myModalLabel"><i class="fa fa-tag fa-fw"></i><sub class="fa fa-plus fa-fw"></sub> {$smarty.const.TXT_VAL_REF_CREAR}</h3>
                </div>
                <div class="modal-body">
                    <div class="form-group has-feedback">
                        <label for="c-etiqueta" class="col-sm-2 control-label">{$smarty.const.FIELD_ETIQUETA} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
                        <div class="col-sm-8">
                            <input type="text" name='c-etiqueta' id="c-etiqueta" value="" class="form-control" placeholder="{$smarty.const.FIELD_ETIQUETA}" required />                  
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="c-nombre" class="col-sm-2 control-label">{$smarty.const.FIELD_NOMBRE} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
                        <div class="col-sm-8">
                            <input type="text" name='c-nombre' id="c-nombre" value="" class="form-control" placeholder="{$smarty.const.FIELD_NOMBRE}" required />                  
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="c-grafica" class="col-sm-2 control-label">{$smarty.const.FIELD_VISIB_GRAFIC}</label>
                        <div class="col-sm-8">
                            <input type="checkbox" id="c-grafica" name='c-grafica' class="form-control" 
                                   data-toggle="toggle" data-on="{$smarty.const.TXT_SI}"
                                   data-onstyle="success" data-offstyle="danger" data-size="small"
                                   data-off="{$smarty.const.TXT_NO}" checked />         
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="c-activo" class="col-sm-2 control-label">{$smarty.const.FIELD_ACTIVO}</label>
                        <div class="col-sm-8">
                            <input type="checkbox" id="c-activo" name='c-activo' class="form-control" 
                                   data-toggle="toggle" data-on="{$smarty.const.TXT_SI}"
                                   data-onstyle="success" data-offstyle="danger" data-size="small"
                                   data-off="{$smarty.const.TXT_NO}" checked />         
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" title="{$smarty.const.TXT_CANCEL}" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_CANCEL}</button>
                    <button type="reset" class="btn btn-warning" title="{$smarty.const.TXT_RESET}">
                        <i class="fa fa-refresh fa-fw"></i> {$smarty.const.TXT_RESET}
                    </button>
                    <button name="valor_nuevo_crear" id="valor_nuevo_crear" type="submit" title="{$smarty.const.TXT_GRABAR}" class="btn btn-success"><i class="fa fa-download fa-fw"></i> {$smarty.const.TXT_GRABAR}</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- /Diálogo Crear valor de referencia -->

<!-- Diálogo Editar valor de referencia -->
<div class="modal fade" id="editar_referencia" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <form method="post" action="" id="formeditarreferencia" name="formeditarreferencia" data-toggle="validator" class="form-horizontal">
                <input type="hidden"  name="e-id_indicador" value="{$indicador->id}"/>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="{$smarty.const.TXT_CERRAR}"><span aria-hidden="true">&times;</span></button>
                    <h3 class="modal-title" id="myModalLabel"><i class="fa fa-tag fa-fw"></i><sub class="fa fa-pencil fa-fw"></sub> {$smarty.const.TXT_VAL_REF_EDIT}</h3>
                </div>
                <div class="modal-body">
                    <div class="form-group has-feedback">
                        <label for="e-etiqueta" class="col-sm-2 control-label">{$smarty.const.FIELD_ETIQUETA} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
                        <div class="col-sm-8">
                            <input type="text" name='e-etiqueta' id="e-etiqueta" value="" class="form-control" placeholder="{$smarty.const.FIELD_ETIQUETA}" required />                  
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="e-nombre" class="col-sm-2 control-label">{$smarty.const.FIELD_NOMBRE} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
                        <div class="col-sm-8">
                            <input type="text" name='e-nombre' id="e-nombre" value="" class="form-control" placeholder="{$smarty.const.FIELD_NOMBRE}" required />                  
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="e-grafica" class="col-sm-2 control-label">{$smarty.const.FIELD_VISIB_GRAFIC}</label>
                        <div class="col-sm-8">
                            <input type="checkbox" id="e-grafica" name='e-grafica' class="form-control" 
                                   data-toggle="toggle" data-on="{$smarty.const.TXT_SI}"
                                   data-onstyle="success" data-offstyle="danger" data-size="small"
                                   data-off="{$smarty.const.TXT_NO}"/>         
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="e-activo" class="col-sm-2 control-label">{$smarty.const.FIELD_ACTIVO}</label>
                        <div class="col-sm-8">
                            <input type="checkbox" id="e-activo" name='e-activo' class="form-control" 
                                   data-toggle="toggle" data-on="{$smarty.const.TXT_SI}"
                                   data-onstyle="success" data-offstyle="danger" data-size="small"
                                   data-off="{$smarty.const.TXT_NO}"/>         
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" title="{$smarty.const.TXT_CANCEL}" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_CANCEL}</button>
                    <button type="reset" class="btn btn-warning" title="{$smarty.const.TXT_RESET}">
                        <i class="fa fa-refresh fa-fw"></i> {$smarty.const.TXT_RESET}
                    </button>
                    <button name="valor_editar" id="valor_editar" type="submit" title="{$smarty.const.TXT_GRABAR}" class="btn btn-success"><i class="fa fa-download fa-fw"></i> {$smarty.const.TXT_GRABAR}</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- /Diálogo Editar valor de referencia -->

<!-- Diálogo Confirmar Borrado -->
<div class="modal fade" id="dialogo_confirmar_borrado" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel"><i class="fa fa-trash fa-fw"></i> {$smarty.const.TXT_VAL_REF_BORRAR}</h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_VALS_REF_CONFIRM_BORRAR}</p>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_NO}" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_NO}</button>
                <a title="{$smarty.const.TXT_SI}" class="btn btn-success" name="borrar" id="borrar" onClick="$('#form_val_ref').submit();"><i class="fa fa-check fa-fw"></i> {$smarty.const.TXT_SI}</a>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Confirmar Borrado -->

<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <h3 title="{$_nombre_pagina}" class="page-header">
            <i class="fa fa-tags fa-fw"></i> {$_nombre_pagina}
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
                            <i class="fa fa-th fa-fw"></i> {$smarty.const.TXT_CUADROS_MANDO} <span title="{$smarty.const.FIELD_TOTAL}: {$num_cuadros} {$smarty.const.TXT_CUADROS_MANDO}">({$num_cuadros})</span>
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
            {if $tipo == 'indicador'}
                <li>
                    <a title="{$smarty.const.TXT_PROCS}" href='index.php?page=proceso_listar&id_entidad={$entidad->id}'>{$smarty.const.TXT_PROCS}</a>
                </li>
                <li>
                    <a title="{$proceso->nombre}" href='index.php?page=proceso_mostrar&id_proceso={$proceso->id}&id_entidad={$entidad->id}'>{$proceso->nombre|truncate:30}</a>
                </li>
            {else}
                <li>
                    <a title="{$smarty.const.FIELD_DATOS}" href='index.php?page={$tipo}_listar&id_entidad={$entidad->id}'>{$smarty.const.FIELD_DATOS}</a>
                </li>
            {/if}
            <li><a title="{$smarty.const.FIELD_MEDICIONES}: {$indicador->nombre}" href='index.php?page=medicion_listar&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'>{$smarty.const.FIELD_MEDICIONES}: {$indicador->nombre|truncate:30}</a></li>
            <li title="{$_nombre_pagina}" class="active">{$_nombre_pagina}</li>
        </ol>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- /Breadcrumbs -->

<!-- Barra de botones -->
<div class="row">
    <div class="col-lg-12">
        <div class="btn-toolbar" role="toolbar" aria-label="">
            <div class="btn-group" role="group" aria-label="">
                <a title="{$smarty.const.FIELD_MEDICIONES}" class="btn btn-danger" href='index.php?page=medicion_listar&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                    <i class="fa fa-history fa-fw"></i>
                </a>
                {if !$indicador->calculo && $permiso}
                    <a title="{$smarty.const.TXT_VAL_EDIT}" class="btn btn-danger" href='index.php?page=indicador_subunidad_valor&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                        <i class="fa fa-pencil-square-o fa-fw"></i>
                    </a>
                {/if}
                {if $permiso}
                    <a title="{$smarty.const.FIELD_RESP_MED}" class="btn btn-danger" href='index.php?page=medicion_responsable&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                        <i class="fa fa-user fa-fw"></i>
                    </a>
                {/if}
            </div>
            {if $permiso}
                <div class="btn-group pull-right" role="group" aria-label="">
                    <a href='javascript:void(0)' title="{$smarty.const.TXT_VAL_REF_CREAR}" class="btn btn-danger" data-toggle="modal" data-target="#crear_referencia">
                        <i class="fa fa-tag fa-fw"></i><sub class="fa fa-plus fa-fw"></sub>
                    </a>
                    {if $indicador->valores_referencia}
                        <a href="javascript:void(0)" title="{$smarty.const.TXT_VAL_REF_BORRAR}" class="btn btn-danger" data-toggle="modal" data-target="#dialogo_confirmar_borrado">
                            <i class="fa fa-trash fa-fw"></i>
                        </a>
                    {/if}
                </div>
            {/if}
        </div>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<br>
<!-- /Barra de botones -->

<div class="row">
    <div class="col-lg-12">
        {if $indicador->valores_referencia}
            <form id="form_val_ref" action='index.php?page=valor_referencia_crear&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}&borrar' method='post'>
                <div class="table-responsive">
                    <table class="table datatable table-striped table-hover">
                        <thead>
                            <tr>   
                                {if $permiso}
                                    <th>
                                        {$smarty.const.TXT_BORRAR}
                                    </th>
                                {/if}
                                <th>{$smarty.const.FIELD_ETIQUETA}</th>
                                <th>{$smarty.const.FIELD_VAL_REF}</th>
                                <th>{$smarty.const.FIELD_VISIB_GRAFIC}</th>
                                <th>{$smarty.const.FIELD_ACTIVO}</th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach from=$indicador->valores_referencia item=item}
                                <tr>
                                    {if $permiso}
                                        <td>
                                            <input type="checkbox" name='id_val_ref[]' value="{$item->id}"/>
                                        </td>
                                        <td><a href="javascript:void(0)" class="dialog_button" data-toggle="modal" data-target="#editar_referencia" title="{$smarty.const.TXT_VAL_REF_EDIT}" id="l-etiqueta-{$item->id}" value="{$item->etiqueta}">{$item->etiqueta}</a></td>
                                        <td><a href="javascript:void(0)" class="dialog_button" data-toggle="modal" data-target="#editar_referencia" title="{$smarty.const.TXT_VAL_REF_EDIT}" id="l-nombre-{$item->id}" value="{$item->nombre}">{$item->nombre}</a></td>
                                        <td>
                                            <input type="checkbox" class="grafica" data-toggle="toggle" data-on="{$smarty.const.TXT_SI}"
                                                   data-onstyle="success" data-offstyle="danger" data-size="mini"
                                                   data-off="{$smarty.const.TXT_NO}" {if $item->grafica}checked{/if}
                                                   id="l-grafica-{$item->id}">
                                        </td>
                                        <td>
                                            <input type="checkbox" class="activo" data-toggle="toggle" data-on="{$smarty.const.TXT_SI}"
                                                   data-onstyle="success" data-offstyle="danger" data-size="mini"
                                                   data-off="{$smarty.const.TXT_NO}" {if $item->activo}checked{/if} 
                                                   id="l-activo-{$item->id}">
                                        </td>
                                    {else}
                                        <td>{$item->etiqueta}</td>
                                        <td>{$item->nombre}</td>
                                        <td>
                                            <input type="checkbox" data-toggle="toggle" data-on="{$smarty.const.TXT_SI}"
                                                   data-onstyle="success" data-offstyle="danger" data-size="mini"
                                                   data-off="{$smarty.const.TXT_NO}" {if $item->grafica}checked{/if} 
                                                   disabled>
                                        </td>
                                        <td>
                                            <input type="checkbox" data-toggle="toggle" data-on="{$smarty.const.TXT_SI}"
                                                   data-onstyle="success" data-offstyle="danger" data-size="mini"
                                                   data-off="{$smarty.const.TXT_NO}" {if $item->activo}checked{/if} 
                                                   disabled>
                                        </td>
                                    {/if}
                                </tr>
                            {/foreach}
                        </tbody>
                    </table>
                </div>
            </form>
        {else}
            <div class="alert alert-info alert-dismissible">
                <i class="fa fa-info-circle fa-fw"></i> 
                {$smarty.const.MSG_INDIC_NO_VAL_REF}
            </div> 
        {/if}
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->