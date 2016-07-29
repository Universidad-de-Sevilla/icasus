<!-- Diálogo Archivo Nuevo -->
<div class="modal fade" id="dialogo_crear" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <form action="index.php?page=archivo_gestionar_ajax&ajax=true&id_entidad={$entidad->id}&modulo=subir&tipo={$tipo}" name="subir" method="post" enctype="multipart/form-data" 
                  data-toggle="validator" class="form-horizontal">
                {if isset($plan)}
                    <input type="hidden" value="{$plan->id}" name="id_objeto">
                {else if isset($proceso)}
                    <input type="hidden" value="{$proceso->id}" name="id_objeto">
                {else}
                    <input type="hidden" value="{$entidad->id}" name="id_objeto">
                {/if}
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="{$smarty.const.TXT_CERRAR}"><span aria-hidden="true">&times;</span></button>
                    <h3 class="modal-title" id="myModalLabel"><i class="fa fa-upload fa-fw"></i> {$smarty.const.TXT_ARCHIVO_SUBIR}</h3>
                </div>
                <div class="modal-body">
                    <div class="form-group has-feedback">
                        <label for="stitulo" class="col-sm-2 control-label">{$smarty.const.FIELD_NOMBRE} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
                        <div class="col-sm-8">
                            <input type="text" name="stitulo" id="stitulo" class="form-control" placeholder="{$smarty.const.FIELD_NOMBRE}" required />                  
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <label for="sarchivo" class="col-sm-2 control-label">{$smarty.const.FIELD_ARCHIVO} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
                        <div class="col-sm-8">
                            <input class="filestyle" data-buttonBefore="true" 
                                   data-placeholder="{$smarty.const.TXT_NO_ARCHIVO_SEL}" 
                                   data-iconName="fa fa-folder-open fa-fw" 
                                   data-buttonName="btn-primary" 
                                   data-buttonText="{$smarty.const.TXT_EXAMINAR}" 
                                   type="file" name="sarchivo" id="sarchivo" required />
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sdescripcion" class="col-sm-2 control-label">{$smarty.const.FIELD_DESC}</label>
                        <div class="col-sm-8">
                            <textarea  name="sdescripcion" id="sdescripcion" class="form-control" placeholder="{$smarty.const.FIELD_DESC}"/></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="svisible" class="col-sm-2 control-label">{$smarty.const.FIELD_VISIB}</label>
                        <div class="col-sm-8">
                            <input  type="checkbox" id="svisible" name="svisible" class="form-control" 
                                    data-toggle="toggle" data-on="{$smarty.const.TXT_SI}"
                                    data-onstyle="success" data-offstyle="danger" data-size="small"
                                    data-off="{$smarty.const.TXT_NO}" value="1" checked />         
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" title="{$smarty.const.TXT_CANCEL}" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_CANCEL}</button>
                    <button type="reset" class="btn btn-warning" title="{$smarty.const.TXT_RESET}">
                        <i class="fa fa-refresh fa-fw"></i> {$smarty.const.TXT_RESET}
                    </button>
                    <button type="submit" title="{$smarty.const.TXT_ARCHIVO_SUBIR}" class="btn btn-success"><i class="fa fa-upload fa-fw"></i> {$smarty.const.TXT_ARCHIVO_SUBIR}</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- /Diálogo Archivo Nuevo -->

<!-- Diálogo Archivo Actualizar -->
<div class="modal fade" id="dialogo_editar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <form name="editar" method="post" data-toggle="validator" class="form-horizontal" >
                <input type="hidden" value="" name="id_fichero" id="id_fichero" >
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="{$smarty.const.TXT_CERRAR}"><span aria-hidden="true">&times;</span></button>
                    <h3 class="modal-title" id="myModalLabel"><i class="fa fa-pencil fa-fw"></i> {$smarty.const.TXT_ARCHIVO_ACTUALIZAR_DATOS}</h3>
                </div>
                <div class="modal-body">
                    <div class="form-group has-feedback">
                        <label for="etitulo" class="col-sm-2 control-label">{$smarty.const.FIELD_NOMBRE} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
                        <div class="col-sm-8">
                            <input type="text" id="etitulo" name='etitulo' class="form-control" placeholder="{$smarty.const.FIELD_NOMBRE}" required />                  
                            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
                            <div class="help-block with-errors"></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edescripcion" class="col-sm-2 control-label">{$smarty.const.FIELD_DESC}</label>
                        <div class="col-sm-8">
                            <textarea  id="edescripcion" name='edescripcion' class="form-control" placeholder="{$smarty.const.FIELD_DESC}"/></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="evisible" class="col-sm-2 control-label">{$smarty.const.FIELD_VISIB}</label>
                        <div class="col-sm-8">
                            <input type="checkbox" id="evisible" class="form-control" name="evisible"
                                   data-toggle="toggle" data-on="{$smarty.const.TXT_SI}"
                                   data-onstyle="success" data-offstyle="danger"
                                   data-off="{$smarty.const.TXT_NO}" data-size="small" />
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" title="{$smarty.const.TXT_CANCEL}" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_CANCEL}</button>
                    <button type="reset" class="btn btn-warning" title="{$smarty.const.TXT_RESET}">
                        <i class="fa fa-refresh fa-fw"></i> {$smarty.const.TXT_RESET}
                    </button>
                    <button type="submit" name="egrabar" id="egrabar" title="{$smarty.const.TXT_ARCHIVO_ACTUALIZAR_DATOS}" class="btn btn-success"><i class="fa fa-pencil fa-fw"></i> {$smarty.const.TXT_ARCHIVO_ACTUALIZAR_DATOS}</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- /Diálogo Archivo Actualizar -->

<!-- Diálogo Archivo Borrar -->
<div class="modal fade" id="dialogo_borrar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel"><i class="fa fa-trash fa-fw"></i> {$smarty.const.TXT_ARCHIVO_BORRAR}</h3>
            </div>
            <div class="modal-body">
                <input type="hidden" value="" name="id_borrar" id="id_borrar">
                <p>{$smarty.const.MSG_ARCHIVO_BORRAR_CONFIRM} <b><span id="titulo_borrar"></span></b>.</p>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_CANCEL}" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_CANCEL}</button>
                <button type="button" title="{$smarty.const.TXT_BORRAR}" class="btn btn-success" name="borrar" id="borrar"><i class="fa fa-trash fa-fw"></i> {$smarty.const.TXT_BORRAR}</button>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Archivo Borrar -->

<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <h3 title="{$_nombre_pagina}" class="page-header">
            <i class="fa fa-archive fa-fw"></i> {$_nombre_pagina}
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
                            <i class="fa fa-gears fa-fw"></i> {$smarty.const.FIELD_PROCS} <span title="{$smarty.const.FIELD_TOTAL}: {$num_procesos} {$smarty.const.FIELD_PROCS}">({$num_procesos})</span>
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
            {if isset($plan)}
                <li>
                    <a title="{$smarty.const.FIELD_PLAN} {$plan->anyo_inicio} - {($plan->anyo_inicio + $plan->duracion-1)}" href='index.php?page=plan_mostrar&id_plan={$plan->id}&id_entidad={$entidad->id}'>{$smarty.const.FIELD_PLAN} {$plan->anyo_inicio} - {$plan->anyo_inicio + $plan->duracion-1}</a>
                </li>
            {/if}
            {if isset($proceso)}
                <li>
                    <a title="{$smarty.const.FIELD_PROCS}" href='index.php?page=proceso_listar&id_entidad={$entidad->id}'>{$smarty.const.FIELD_PROCS}</a>
                </li>
                {if $proceso->madre}
                    <li>
                        <a title="{$proceso->madre->nombre}" href='index.php?page=proceso_mostrar&id_proceso={$proceso->madre->id}&id_entidad={$entidad->id}'>{$proceso->madre->nombre|truncate:30}</a>
                    </li>
                {/if}
                <li>
                    <a title="{$proceso->nombre}" href='index.php?page=proceso_mostrar&id_proceso={$proceso->id}&id_entidad={$entidad->id}'>{$proceso->nombre|truncate:30}</a>
                </li>
            {/if}
            <li title="{$_nombre_pagina}" class="active">{$_nombre_pagina}</li>
        </ol>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- /Breadcrumbs -->

<div class="row">
    <div class="col-lg-12">
        <!-- Barra de botones -->
        <div id='botones_archivo' class="btn-toolbar hidden" role="toolbar" aria-label="">
            <div class="btn-group" role="group" aria-label="">
                <a class="btn btn-danger" href="javascript:void(0)" title="{$smarty.const.TXT_ARCHIVO_SUBIR}" data-toggle="modal" data-target="#dialogo_crear">
                    <i class="fa fa-upload fa-fw"></i>
                </a>
            </div>
        </div>
        <!-- /Barra de botones -->
        {if $archivos}
            <div class="table-responsive">
                <table id='tabla_archivos' class="table datatable table-striped table-hover">
                    <thead>
                        <tr>                     
                            <th>{$smarty.const.FIELD_ARCHIVO}</th>
                            <th>{$smarty.const.FIELD_VISIB}</th>
                            <th>{$smarty.const.FIELD_USER}</th>
                            <th>{$smarty.const.FIELD_ACCIONES}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach from=$archivos item=archivo}
                            <tr>
                                <td>
                                    <a class="editar_archivo" title="{$archivo->titulo}: {$archivo->descripcion}" href="javascript:void(0)" id="l-titulo-{$archivo->id}" value="{$archivo->titulo}" data-toggle="modal" data-target="#dialogo_editar" >
                                        {$archivo->titulo}
                                    </a>
                                    <span id="l-descripcion-{$archivo->id}" data-descripcion="{$archivo->descripcion}"></span>
                                </td>
                                <td>
                                    <input id="l-visible-{$archivo->id}" type="checkbox" class="form-control visibilidad"
                                           data-toggle="toggle" data-on="{$smarty.const.TXT_SI}"
                                           data-onstyle="success" data-offstyle="danger" data-size="mini"
                                           data-off="{$smarty.const.TXT_NO}" {if $archivo->visible}checked{/if} />
                                </td>
                                <td style="font-size: 12px">
                                    <a title="{$smarty.const.TXT_USER_PERFIL}" href="index.php?page=usuario_mostrar&id_usuario={$archivo->usuario->id}">
                                        {$archivo->usuario->nombre} {$archivo->usuario->apellidos}</a>
                                </td> 
                                <td>
                                    <a class="btn btn-default btn-circle btn-xs editar_archivo" title="{$smarty.const.TXT_ARCHIVO_ACTUALIZAR_DATOS}" href="javascript:void(0)" id="l-titulo-{$archivo->id}" data-toggle="modal" data-target="#dialogo_editar" >
                                        <i class="fa fa-pencil fa-fw"></i>
                                    </a>
                                    <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_ARCHIVO_DESCARGA}" href="index.php?page=archivo_descargar&id={$archivo->id}"><i class="fa fa-download fa-fw"></i></a> 
                                    <a class="btn btn-default btn-circle btn-xs borrar_archivo" data-texto_borrar="{$smarty.const.MSG_ARCHIVO_BORRADO}" title="{$smarty.const.TXT_ARCHIVO_BORRAR}" href="javascript:void(0)" id="l-borrar-{$archivo->id}" data-toggle="modal" data-target="#dialogo_borrar">
                                        <i class="fa fa-trash fa-fw"></i>
                                    </a>
                                </td>           
                            </tr>
                        {/foreach}
                    </tbody>
                </table>
            </div>
        {else}
            <div class="row">
                <div class="col-sm-11">
                    {if isset($plan)}
                        <div class="alert alert-info alert-dismissible">
                            <i class="fa fa-info-circle fa-fw"></i> 
                            {$smarty.const.MSG_PLAN_NO_ARCHIVOS}
                        </div> 
                    {else if isset($proceso)}
                        <div class="alert alert-info alert-dismissible">
                            <i class="fa fa-info-circle fa-fw"></i> 
                            {$smarty.const.MSG_PROC_NO_ARCHIVOS}
                        </div> 
                    {else}
                        <div class="alert alert-info alert-dismissible">
                            <i class="fa fa-info-circle fa-fw"></i> 
                            {$smarty.const.MSG_UNID_NO_ARCHIVOS}
                        </div>
                    {/if}
                </div>
                <!-- /.col-sm-11 -->
                <div class="col-sm-1">
                    <div class="btn-toolbar" role="toolbar" aria-label="">
                        <div class="btn-group" role="group" aria-label="">
                            <a class="btn btn-danger" href="javascript:void(0)" title="{$smarty.const.TXT_ARCHIVO_SUBIR}" data-toggle="modal" data-target="#dialogo_crear">
                                <i class="fa fa-upload fa-fw"></i>
                            </a>
                        </div>
                    </div>
                </div>
                <!-- /.col-sm-1 -->
            </div>
            <!-- /.row -->
        {/if}
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->