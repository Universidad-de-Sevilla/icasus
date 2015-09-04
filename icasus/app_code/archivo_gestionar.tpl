<!-- Diálogo Archivo Nuevo -->
<div class="modal fade" id="dialogo_crear" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <form action="index.php?page=archivo_gestionar_ajax&ajax=true&modulo=subir" name="subir" method="post" enctype="multipart/form-data" 
                  data-toggle="validator" class="form-horizontal">
                <input type="hidden" value="{$proceso->id}" name="id_objeto" >
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="{$smarty.const.TXT_CERRAR}"><span aria-hidden="true">&times;</span></button>
                    <h3 class="modal-title" id="myModalLabel"><i class="fa fa-plus-circle fa-fw"></i> {$smarty.const.TXT_ARCHIVO_NUEVO}</h3>
                </div>
                <div class="modal-body">
                    <div class="form-group has-feedback">
                        <label for="stitulo" class="col-sm-2 control-label">{$smarty.const.FIELD_TITULO} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
                        <div class="col-sm-8">
                            <input type="text" name="stitulo" id="stitulo" class="form-control" placeholder="{$smarty.const.FIELD_TITULO}" required />                  
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
                    <button type="button" title="{$smarty.const.TXT_CANCEL}" class="btn btn-default btn-danger" data-dismiss="modal"><i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_CANCEL}</button>
                    <button type="reset" class="btn btn-default btn-warning" title="{$smarty.const.TXT_RESET}">
                        <i class="fa fa-refresh fa-fw"></i> {$smarty.const.TXT_RESET}
                    </button>
                    <button type="submit" title="{$smarty.const.TXT_ARCHIVO_SUBIR}" class="btn btn-default btn-success"><i class="fa fa-upload fa-fw"></i> {$smarty.const.TXT_ARCHIVO_SUBIR}</button>
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
                        <label for="etitulo" class="col-sm-2 control-label">{$smarty.const.FIELD_TITULO} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
                        <div class="col-sm-8">
                            <input type="text" id="etitulo" name='etitulo' class="form-control" placeholder="{$smarty.const.FIELD_TITULO}" required />                  
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
                    <button type="button" title="{$smarty.const.TXT_CANCEL}" class="btn btn-default btn-danger" data-dismiss="modal"><i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_CANCEL}</button>
                    <button type="reset" class="btn btn-default btn-warning" title="{$smarty.const.TXT_RESET}">
                        <i class="fa fa-refresh fa-fw"></i> {$smarty.const.TXT_RESET}
                    </button>
                    <button type="submit" name="egrabar" id="egrabar" title="{$smarty.const.TXT_ARCHIVO_ACTUALIZAR_DATOS}" class="btn btn-default btn-success"><i class="fa fa-pencil fa-fw"></i> {$smarty.const.TXT_ARCHIVO_ACTUALIZAR_DATOS}</button>
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
                <button type="button" title="{$smarty.const.TXT_CANCEL}" class="btn btn-default btn-danger" data-dismiss="modal"><i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_CANCEL}</button>
                <button type="button" title="{$smarty.const.TXT_BORRAR}" class="btn btn-default btn-success" name="borrar" id="borrar"><i class="fa fa-trash fa-fw"></i> {$smarty.const.TXT_BORRAR}</button>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Archivo Borrar -->

<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <h2 title="{$_nombre_pagina}" class="page-header">
            <i class="fa fa-file fa-fw"></i> {$_nombre_pagina}
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
            {if $_control}
                <div class="btn-group" role="group" aria-label="">
                    <a class="btn btn-default btn-danger" href="javascript:void(0)" title="{$smarty.const.TXT_ARCHIVO_SUBIR_NUEVO}" data-toggle="modal" data-target="#dialogo_crear">
                        <i class="fa fa-upload fa-fw"></i> {$smarty.const.TXT_ARCHIVO_SUBIR_NUEVO}
                    </a>
                </div>
            {/if}
            <div class="btn-group" role="group" aria-label="">
                <a class="btn btn-default btn-danger" href="index.php?page=proceso_mostrar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}" title="{$smarty.const.TXT_PROC_VOLVER}">
                    <i class="fa fa-arrow-left fa-fw"></i> {$smarty.const.TXT_PROC_VOLVER}</a>
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
                <span class="panel-title"><i class="fa fa-file fa-fw"></i> {$smarty.const.TXT_PROC_ARCHIVOS}</span>
                <i class="fa fa-chevron-up pull-right clickable"></i>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                {if isset($archivos)}
                    <div class="table-responsive">
                        <table class="table datatable table-striped table-hover">
                            <thead>
                                <tr>                     
                                    <th>{$smarty.const.FIELD_TITULO}</th>
                                    <th>{$smarty.const.FIELD_VISIB}</th>
                                    <th>{$smarty.const.FIELD_USER}</th>
                                    {if $_control}<th>{$smarty.const.FIELD_ACCIONES}</th>{/if}
                                </tr>
                            </thead>
                            <tbody>
                                {foreach from=$archivos item=archivo}
                                    <tr>
                                        <td>
                                            {if $_control}
                                                <a class="editar_archivo" title="{$archivo->titulo|htmlentities}: {$archivo->descripcion|htmlentities}" href="javascript:void(0)" id="l-titulo-{$archivo->id}" value="{$archivo->titulo|htmlentities}" data-toggle="modal" data-target="#dialogo_editar" >
                                                    {$archivo->titulo|htmlentities}
                                                </a>
                                                <span id="l-descripcion-{$archivo->id}" data-descripcion="{$archivo->descripcion|htmlentities}"></span>
                                            {else}
                                                <span title="{$archivo->titulo|htmlentities}: {$archivo->descripcion|htmlentities}">{$archivo->titulo|htmlentities}</span>
                                            {/if}
                                        </td>
                                        <td>
                                            {if $_control}  
                                                <input type="checkbox" class="form-control visibilidad" data-id="{$archivo->id}"
                                                       data-toggle="toggle" data-on="{$smarty.const.TXT_SI}"
                                                       data-onstyle="success" data-offstyle="danger" data-size="mini"
                                                       data-off="{$smarty.const.TXT_NO}" {if $archivo->visible}checked{/if} />
                                                <span id="l-visible-{$archivo->id}" data-visibilidad="{$archivo->visible}"></span>
                                            {else}
                                                <input type="checkbox" class="form-control" 
                                                       data-toggle="toggle" data-on="{$smarty.const.TXT_SI}"
                                                       data-onstyle="success" data-offstyle="danger" data-size="mini"
                                                       data-off="{$smarty.const.TXT_NO}" {if $archivo->visible}checked{/if} disabled/>
                                            {/if}
                                        </td>
                                        <td>
                                            <a title="{$smarty.const.TXT_USER_PERFIL}" href="index.php?page=usuario_mostrar&id_usuario={$archivo->usuario->id}">
                                                {$archivo->usuario->nombre} {$archivo->usuario->apellidos}</a>
                                        </td>
                                        {if $_control}
                                            <td>
                                                <a class="btn btn-default btn-circle btn-xs editar_archivo" title="{$smarty.const.TXT_ARCHIVO_ACTUALIZAR_DATOS}" href="javascript:void(0)" id="l-titulo-{$archivo->id}" data-toggle="modal" data-target="#dialogo_editar" >
                                                    <i class="fa fa-pencil fa-fw"></i>
                                                </a>
                                                <a class="btn btn-default btn-circle btn-xs borrar_archivo" title="{$smarty.const.TXT_ARCHIVO_BORRAR}" href="javascript:void(0)" id="l-borrar-{$archivo->id}" data-toggle="modal" data-target="#dialogo_borrar">
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
                    <div class="alert alert-info alert-dismissible">
                        <i class="fa fa-info-circle fa-fw"></i> 
                        {$smarty.const.MSG_PROC_ARCHIVO_NO}
                    </div> 
                {/if}
            </div>
            <!-- /.panel-body -->        
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->