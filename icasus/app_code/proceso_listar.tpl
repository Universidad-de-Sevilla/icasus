<!-- Diálogo Confirmar Borrado -->
<div class="modal fade" id="dialogo_confirmar_borrado" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel"><i class="fa fa-trash fa-fw"></i> {$smarty.const.TXT_PROC_BORRAR}: <span id="nombre_proceso"></span></h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_PROC_CONFIRM_BORRAR}</p>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_NO}" class="btn btn-default btn-danger" data-dismiss="modal"><i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_NO}</button>
                <a title="{$smarty.const.TXT_SI}" class="btn btn-default btn-success" name="borrar" id="borrar"><i class="fa fa-check fa-fw"></i> {$smarty.const.TXT_SI}</a>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Confirmar Borrado -->

<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <h3 title="{$_nombre_pagina}" class="page-header">
            <i class="fa fa-gears fa-fw"></i> {$_nombre_pagina}
        </h3>
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
                {if $_control}
                    <a class="btn btn-default btn-danger" href="index.php?page=proceso_crear&id_entidad={$entidad->id}" title="{$smarty.const.TXT_PROC_CREAR}">
                        <i class="fa fa-plus-circle fa-fw"></i> {$smarty.const.TXT_PROC_CREAR}
                    </a>
                {/if}
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
                <span class="panel-title"><i class="fa fa-gears fa-fw"></i> {$smarty.const.TXT_PROCS}</span>
                <i class="fa fa-chevron-up pull-right clickable"></i>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                {if $procesos}
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
                                {foreach from=$procesos item=proceso}
                                    <tr>    
                                        <td style="white-space:nowrap">{$proceso->codigo}</td>
                                        <td>
                                            <a title="{$proceso->nombre}" href="index.php?page=proceso_mostrar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}">
                                                {$proceso->nombre}
                                            </a>
                                        </td>
                                        <td>{$proceso->alcance}</td>
                                        <td>
                                            {if $proceso->madre->id > 0}
                                                <a title="{$proceso->madre->nombre}" href="index.php?page=proceso_mostrar&id_proceso={$proceso->madre->id}&id_entidad={$proceso->madre->id_entidad}">
                                                    {$proceso->madre->nombre}
                                                </a>
                                            {else}
                                                ---
                                            {/if}
                                        </td>
                                        <td>
                                            <a title="{$smarty.const.TXT_USER_PERFIL}" href="index.php?page=usuario_mostrar&id_usuario={$proceso->propietario->id}">
                                                {$proceso->propietario->nombre}
                                                {$proceso->propietario->apellidos}
                                            </a>
                                        </td>
                                        <td style="white-space:nowrap">
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_PROC_FICHA}" href="index.php?page=proceso_mostrar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}">
                                                <i class="fa fa-folder fa-fw"></i>
                                            </a>                 
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_ARCHIVOS}" href='index.php?page=archivo_gestionar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}'>
                                                <i class="fa fa-file fa-fw"></i>
                                            </a>
                                            {if $_control}
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_EDIT}" href='index.php?page=proceso_editar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}'>
                                                    <i class="fa fa-pencil fa-fw"></i>
                                                </a>   
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_BORRAR}" 
                                                   href='javascript:void(0)' data-toggle="modal" data-target="#dialogo_confirmar_borrado"
                                                   data-id_proceso="{$proceso->id}" data-nombre_proceso="{$proceso->nombre}" data-id_entidad="{$proceso->id_entidad}">
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
                    <div class="alert alert-info alert-dismissible">
                        <i class="fa fa-info-circle fa-fw"></i> 
                        {$smarty.const.MSG_UNID_NO_PROC}
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

{if $entidad->id == 14}
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-red">
                <div class="panel-heading">
                    <span class="panel-title"><i class="fa fa-map fa-fw"></i> {$smarty.const.TXT_PROC_MAP}</span>
                    <i class="fa fa-chevron-up pull-right clickable"></i>
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <img src="images/mapa_procesos_biblioteca.png" alt="{$smarty.const.TXT_PROC_MAP}" usemap="#Map" class="img-rounded img-responsive" style="margin:0 auto">
                    <map name="Map" id="Map">
                        <area shape="rect" coords="96,66,263,94" title="{$smarty.const.TXT_PROC_VER}" href="index.php?page=proceso_mostrar&id_entidad=14&id_proceso=1920" />
                        <area shape="rect" coords="355,66,475,93" title="{$smarty.const.TXT_PROC_VER}" href="index.php?page=proceso_mostrar&id_entidad=14&id_proceso=1921" />
                        <area shape="rect" coords="287,169,362,190" title="{$smarty.const.TXT_PROC_VER}" href="index.php?page=proceso_mostrar&id_entidad=14&id_proceso=1913" />
                        <area shape="rect" coords="277,200,368,225" title="{$smarty.const.TXT_PROC_VER}" href="index.php?page=proceso_mostrar&id_entidad=14&id_proceso=1914" />
                        <area shape="rect" coords="197,264,272,301" title="{$smarty.const.TXT_PROC_VER}" href="index.php?page=proceso_mostrar&id_entidad=14&id_proceso=1915" />
                        <area shape="rect" coords="330,260,438,284" title="{$smarty.const.TXT_PROC_VER}" href="index.php?page=proceso_mostrar&id_entidad=14&id_proceso=1916" />
                        <area shape="rect" coords="330,286,437,311" title="{$smarty.const.TXT_PROC_VER}" href="index.php?page=proceso_mostrar&id_entidad=14&id_proceso=1917" />
                        <area shape="rect" coords="248,349,324,375" title="{$smarty.const.TXT_PROC_VER}" href="index.php?page=proceso_mostrar&id_entidad=14&id_proceso=1918" />
                        <area shape="rect" coords="328,349,398,374" title="{$smarty.const.TXT_PROC_VER}" href="index.php?page=proceso_mostrar&id_entidad=14&id_proceso=1919" />
                        <area shape="rect" coords="42,386,156,432" title="{$smarty.const.TXT_PROC_VER}" href="index.php?page=proceso_mostrar&id_entidad=14&id_proceso=1907" />
                        <area shape="rect" coords="164,387,256,480" title="{$smarty.const.TXT_PROC_VER}" href="index.php?page=proceso_mostrar&id_entidad=14&id_proceso=1922" />
                        <area shape="rect" coords="265,388,389,431" title="{$smarty.const.TXT_PROC_VER}" href="index.php?page=proceso_mostrar&id_entidad=14&id_proceso=1923" />
                        <area shape="rect" coords="393,387,484,432" title="{$smarty.const.TXT_PROC_VER}" href="index.php?page=proceso_mostrar&id_entidad=14&id_proceso=1911" />
                        <area shape="rect" coords="492,387,595,432" title="{$smarty.const.TXT_PROC_VER}" href="index.php?page=proceso_mostrar&id_entidad=14&id_proceso=1912" />
                    </map> 
                </div>
                <!-- /.panel-body -->        
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
{/if}