<!-- Diálogo Confirmar Borrado -->
<div class="modal fade" id="dialogo_confirmar_borrado" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel"><i class="fa fa-trash fa-fw"></i> {$smarty.const.TXT_PROC_BORRAR}: {$proceso->nombre}</h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_PROC_CONFIRM_BORRAR}</p>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_NO}" class="btn btn-default btn-danger" data-dismiss="modal"><i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_NO}</button>
                <a title="{$smarty.const.TXT_SI}" class="btn btn-default btn-success" name="borrar" id="borrar" href='index.php?page=proceso_borrar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}'><i class="fa fa-check fa-fw"></i> {$smarty.const.TXT_SI}</a>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Confirmar Borrado -->

<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <h2 title="{$_nombre_pagina}" class="page-header">
            <i class="fa fa-folder fa-fw"></i> {$_nombre_pagina}
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
                    <a title="{$smarty.const.TXT_PROC_EDIT}" class="btn btn-default btn-danger" href='index.php?page=proceso_editar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}'>
                        <i class="fa fa-pencil fa-fw"></i> {$smarty.const.TXT_PROC_EDIT}
                    </a>
                    <a title="{$smarty.const.TXT_PROC_BORRAR}" class="btn btn-default btn-danger" href='javascript:void(0)' 
                       data-toggle="modal" data-target="#dialogo_confirmar_borrado">
                        <i class="fa fa-trash fa-fw"></i> {$smarty.const.TXT_PROC_BORRAR}
                    </a>
                </div>
            {/if}
            <div class="btn-group" role="group" aria-label="">
                <a class="btn btn-default btn-danger" href='index.php?page=archivo_gestionar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}' 
                   title="{$smarty.const.TXT_ARCHIVOS}">
                    <i class="fa fa-file fa-fw"></i> {$smarty.const.TXT_ARCHIVOS}</a>
            </div>
            <div class="btn-group" role="group" aria-label="">
                <a class="btn btn-default btn-danger" href="index.php?page=proceso_listar&id_entidad={$proceso->id_entidad}" title="{$smarty.const.TXT_PROCS_VOLVER}">
                    <i class="fa fa-arrow-left fa-fw"></i> {$smarty.const.TXT_PROCS_VOLVER}</a>
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
                <span class="panel-title"><i class="fa fa-gear fa-fw"></i> {$smarty.const.TXT_PROC_PARAM}</span>
                <i class="fa fa-chevron-up pull-right clickable"></i>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <table class="table table-striped table-hover">
                    <tbody>
                        <tr>
                            <th>{$smarty.const.FIELD_COD}</th>
                            <td>{$proceso->codigo}</td>
                        </tr>
                        <tr>
                            <th>{$smarty.const.FIELD_NOMBRE}</th>
                            <td>{$proceso->nombre}</td>
                        </tr>
                        <tr>
                            <th>{$smarty.const.FIELD_VERSION}</th>
                            <td>{$proceso->revision}</td>
                        </tr>
                        <tr>
                            <th>{$smarty.const.FIELD_FECHA}</th>
                            <td>{$proceso->fecha_revision|date_format:'%d/%m/%Y'}</td>
                        </tr>
                        <tr>
                            <th>{$smarty.const.FIELD_TIPO_PROC}</th>
                            <td>{$proceso->alcance}</td>
                        </tr>
                        <tr>
                            <th>{$smarty.const.FIELD_PROC_MADRE}</th>
                            <td>
                                {if $proceso_madre->id > 0}              
                                    <a title="{$proceso_madre->nombre}" 
                                       href="index.php?page=proceso_mostrar&id_proceso={$proceso_madre->id}&id_entidad={$proceso->id_entidad}">
                                        {$proceso_madre->codigo} - {$proceso_madre->nombre}
                                    </a>
                                {else}
                                    {$smarty.const.TXT_PROC_ES_MADRE}
                                {/if}
                            </td>
                        </tr>
                        <tr>
                            <th>{$smarty.const.FIELD_PROPIETARIO}</th>
                            <td>
                                {$propietario->nombre} {$propietario->apellidos} 
                                {if $propietario->puesto} - {$propietario->puesto} {/if}
                            </td>
                        </tr>
                        <tr>
                            <th>{$smarty.const.FIELD_MISION}</th>
                            <td> 
                                {if $proceso->mision}
                                    {$proceso->mision}
                                {else}
                                    ---
                                {/if}
                            </td>
                        </tr>
                        <tr>
                            <th>{$smarty.const.FIELD_EQUIP_PROC}</th>
                            <td> 
                                {if $proceso->equipo_de_proceso}
                                    {$proceso->equipo_de_proceso}
                                {else}
                                    ---
                                {/if}
                            </td>
                        </tr>
                        <tr>
                            <th>{$smarty.const.FIELD_RESULTS_CLAVE}</th>
                            <td> 
                                {if $proceso->resultados_clave}
                                    {$proceso->resultados_clave}
                                {else}
                                    ---
                                {/if}
                            </td>
                        </tr>
                        <tr>
                            <th>{$smarty.const.FIELD_ENTRADAS_PROV}</th>
                            <td> 
                                {if $proceso->entradas}
                                    {$proceso->entradas}
                                {else}
                                    ---
                                {/if}
                            </td>
                        </tr>
                        <tr>
                            <th>{$smarty.const.FIELD_SALIDAS_CLIENTS}</th>
                            <td> 
                                {if $proceso->entradas or $proceso->salidas}
                                    {$proceso->salidas}
                                {else}
                                    ---
                                {/if}
                            </td>
                        </tr>
                        <tr>
                            <th>{$smarty.const.FIELD_ACTIVIDADES}</th>
                            <td> 
                                {if $proceso->actividades}
                                    {$proceso->actividades}
                                {else}
                                    ---
                                {/if}
                            </td>
                        </tr>
                        <tr>
                            <th>{$smarty.const.FIELD_VARS_CONTROL}</th>
                            <td> 
                                {if $proceso->variables_control}
                                    {$proceso->variables_control}
                                {else}
                                    ---
                                {/if}
                            </td>
                        </tr>
                        <tr>
                            <th>{$smarty.const.FIELD_DOCUMENTACION}</th>
                            <td> 
                                {if $proceso->documentacion}
                                    {$proceso->documentacion}
                                {else}
                                    ---
                                {/if}
                            </td>
                        </tr>       
                        <tr>
                            <th>{$smarty.const.FIELD_MEDICIONES}</th>
                            <td> 
                                {if $proceso->mediciones}
                                    {$proceso->mediciones}
                                {else}
                                    ---
                                {/if}
                            </td>
                        </tr>      
                        <tr>
                            <th>{$smarty.const.FIELD_REGISTROS}</th>
                            <td> 
                                {if $proceso->registros}
                                    {$proceso->registros}
                                {else}
                                    ---
                                {/if}
                            </td>
                        </tr>
                        <tr>
                            <th>{$smarty.const.FIELD_OBSERV}</th>
                            <td> 
                                {if $proceso->observaciones}
                                    {$proceso->observaciones}
                                {else}
                                    ---
                                {/if}
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- /.panel-body -->        
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-red">
            <div class="panel-heading">
                <span class="panel-title"><i class="fa fa-dashboard fa-fw"></i> {$smarty.const.TXT_PROC_INDICS}</span>
                <i class="fa fa-chevron-up pull-right clickable"></i>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                {if $indicadores}
                    <div class="table-responsive">
                        <table class="table datatable table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>{$smarty.const.FIELD_COD}</th>
                                    <th>{$smarty.const.FIELD_INDIC}</th>
                                    <th>{$smarty.const.FIELD_RESP}</th>
                                    <th>{$smarty.const.FIELD_ACCIONES}</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach from=$indicadores item=indicador}
                                    <tr>  
                                        <td style="white-space:nowrap">{$indicador->codigo}</td>
                                        <td>
                                            <a title='{$indicador->nombre}: {$indicador->descripcion}' href='index.php?page=indicador_mostrar&id_indicador={$indicador->id}&id_entidad={$proceso->id_entidad}'>{$indicador->nombre}</a>
                                        </td>
                                        <td>
                                            <a title="{$smarty.const.TXT_USER_PERFIL}" href='index.php?page=usuario_mostrar&id_usuario={$indicador->id_responsable}'>{$indicador->responsable->nombre} {$indicador->responsable->apellidos}</a>
                                        </td>
                                        <td style="white-space:nowrap">
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_INDIC_MOSTRAR}: {$indicador->nombre}" href='index.php?page=indicador_mostrar&id_indicador={$indicador->id}&id_entidad={$proceso->id_entidad}'><i class="fa fa-dashboard fa-fw"></i></a>                 
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_USER_PERFIL}" href='index.php?page=usuario_mostrar&id_usuario={$indicador->id_responsable}'><i class="fa fa-user fa-fw"></i></a>
                                        </td>
                                    </tr>
                                {/foreach}
                            </tbody>
                        </table>
                    </div>
                {else}
                    <div class="alert alert-info alert-dismissible">
                        <i class="fa fa-info-circle fa-fw"></i> 
                        {$smarty.const.MSG_PROC_NO_INDIC}
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

{if isset($flujograma)}
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-red">
                <div class="panel-heading">
                    <span class="panel-title"><i class="fa fa-random fa-fw"></i> {$smarty.const.TXT_PROC_FLUJO}</span>
                    <i class="fa fa-chevron-up pull-right clickable"></i>
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <img src="index.php?page=archivo_descargar&id={$flujograma->id}" alt="{$smarty.const.TXT_PROC_FLUJO}" class="img-rounded img-responsive" style="margin:0 auto">
                </div>
                <!-- /.panel-body -->        
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
{/if}

{if isset($archivos)}
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-red">
                <div class="panel-heading">
                    <span class="panel-title"><i class="fa fa-file fa-fw"></i> {$smarty.const.TXT_PROC_ARCHIVOS}</span>
                    <i class="fa fa-chevron-up pull-right clickable"></i>
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table datatable table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>{$smarty.const.FIELD_TITULO}</th>
                                    <th>{$smarty.const.FIELD_USER}</th>
                                    <th>{$smarty.const.FIELD_ACCIONES}</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach from=$archivos item=archivo} 
                                    {if $archivo->visible}
                                        <tr>  
                                            <td>
                                                <a title='{$archivo->titulo|htmlentities}: {$archivo->descripcion}' href="index.php?page=archivo_descargar&id={$archivo->id}">{$archivo->titulo|htmlentities}</a>
                                            </td>
                                            <td>
                                                <a title="{$smarty.const.TXT_USER_PERFIL}" href='index.php?page=usuario_mostrar&id_usuario={$archivo->usuario->id}'>{$archivo->usuario->nombre|htmlentities} {$archivo->usuario->apellidos|htmlentities}</a>
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
                </div>
                <!-- /.panel-body -->        
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
{/if}

{if $subprocesos}
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-red">
                <div class="panel-heading">
                    <span class="panel-title"><i class="fa fa-gears fa-fw"></i> {$smarty.const.FIELD_SUBPROCS}</span>
                    <i class="fa fa-chevron-up pull-right clickable"></i>
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table datatable table-striped table-hover">
                            <thead>
                                <tr>   
                                    <th>{$smarty.const.FIELD_COD}</th>
                                    <th>{$smarty.const.FIELD_NOMBRE}</th>
                                    <th>{$smarty.const.FIELD_TIPO_PROC}</th>
                                    <th>{$smarty.const.FIELD_PROC_MADRE}</th>         
                                    <th>{$smarty.const.FIELD_PROPIETARIO}</th>
                                    <th>{$smarty.const.FIELD_ACCIONES}</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach from=$subprocesos item=subproceso}
                                    <tr>    
                                        <td style="white-space:nowrap">{$subproceso->codigo}</td>
                                        <td>
                                            <a title="{$subproceso->nombre}" href="index.php?page=proceso_mostrar&id_proceso={$subproceso->id}&id_entidad={$subproceso->id_entidad}">
                                                {$subproceso->nombre}
                                            </a>
                                        </td>
                                        <td>{$subproceso->alcance}</td>
                                        <td>
                                            {if $subproceso->madre->id > 0}
                                                <a title="{$subproceso->madre->nombre}" href="index.php?page=proceso_mostrar&id_proceso={$subproceso->madre->id}&id_entidad={$subproceso->madre->id_entidad}">
                                                    {$subproceso->madre->nombre}
                                                </a>
                                            {else}
                                                ---
                                            {/if}
                                        </td>
                                        <td>
                                            <a title="{$smarty.const.TXT_USER_PERFIL}" href="index.php?page=usuario_mostrar&id_usuario={$subproceso->propietario->id}">
                                                {$subproceso->propietario->nombre}
                                                {$subproceso->propietario->apellidos}
                                            </a>
                                        </td>
                                        <td style="white-space:nowrap">
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_PROC_FICHA}" href="index.php?page=proceso_mostrar&id_proceso={$subproceso->id}&id_entidad={$subproceso->id_entidad}">
                                                <i class="fa fa-folder fa-fw"></i>
                                            </a>                 
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_ARCHIVOS}" href='index.php?page=archivo_gestionar&id_proceso={$subproceso->id}&id_entidad={$subproceso->id_entidad}'>
                                                <i class="fa fa-file fa-fw"></i>
                                            </a>
                                            {if $_control}
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_EDIT}" href='index.php?page=proceso_editar&id_proceso={$subproceso->id}&id_entidad={$subproceso->id_entidad}'>
                                                    <i class="fa fa-pencil fa-fw"></i>
                                                </a>   
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_BORRAR}" href='index.php?page=proceso_borrar&id_proceso={$subproceso->id}&id_entidad={$subproceso->id_entidad}' onclick="return confirm('{$smarty.const.MSG_PROC_CONFIRM_BORRAR}');" >
                                                    <i class="fa fa-trash fa-fw"></i>
                                                </a>
                                            {/if}
                                        </td>
                                    </tr>
                                {/foreach}
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- /.panel-body -->        
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
{/if}