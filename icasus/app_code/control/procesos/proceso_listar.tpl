<!-- Diálogo Confirmar Borrado -->
<div class="modal fade" id="dialogo_confirmar_borrado" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel"><i
                        class="fa fa-trash fa-fw"></i> {$smarty.const.TXT_PROC_BORRAR}: <span
                        id="nombre_proceso"></span></h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_PROC_CONFIRM_BORRAR}</p>
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
<!-- /Diálogo Confirmar Borrado -->

<!-- Diálogo Mapa -->
<div class="modal fade" id="dialogo_mapa" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel"><i class="fa fa-map fa-fw"></i><sub class="fa fa-plus fa-fw"></sub> {$smarty.const.TXT_PROC_MAP_EDIT}</h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_PROC_MAPA} {mailto address="icasus@us.es" encode="javascript"}</p>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_BTN_ACEPTAR}" class="btn btn-primary" data-dismiss="modal"><i class="fa fa-check fa-fw"></i> {$smarty.const.TXT_BTN_ACEPTAR}</button>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Mapa -->

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

<!-- Breadcrumbs -->
<div class="row">
    <div class="col-lg-12">
        <ol class="breadcrumb">
            <li><i title="{$smarty.const.TXT_ESTA}" class="fa fa-map-marker fa-fw"></i></li>
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
                <a href="#proc_list" title="{$smarty.const.FIELD_PROCS}"
                   aria-controls="{$smarty.const.FIELD_PROCS}" role="tab" data-toggle="tab"><i
                        class="fa fa-gears fa-fw"></i> {$smarty.const.FIELD_PROCS}</a>
            </li>
            {if $procesos_propios}
                <li role="presentation">
                    <a href="#user_procs" title="{$smarty.const.TXT_USER_PROCS}" aria-controls="{$smarty.const.TXT_USER_PROCS}" role="tab" data-toggle="tab"><i class="fa fa-gears fa-fw"></i><sub class="fa fa-user fa-fw"></sub> {$smarty.const.TXT_USER_PROCS}</a>
                </li>
            {/if}
            <li role="presentation">
                <a href="#proc_map" title="{$smarty.const.TXT_PROC_MAP}"
                   aria-controls="{$smarty.const.TXT_PROC_MAP}" role="tab" data-toggle="tab"><i
                        class="fa fa-map fa-fw"></i> {$smarty.const.TXT_PROC_MAP}</a>
            </li>
        </ul>
        <!-- /Nav tabs -->
        <br>
        <!-- Tab panes -->
        <div class="tab-content">

            <!-- Lista de procesos -->
            <div role="tabpanel" class="tab-pane active" id="proc_list">
                <!-- Barra de botones -->
                {if $_control}
                    <div id="botones" class="hidden">
                        <a class="btn btn-danger" href="index.php?page=proceso_crear&id_entidad={$entidad->id}"
                           title="{$smarty.const.TXT_PROC_CREAR}">
                            <i class="fa fa-gear fa-fw"></i><sub class="fa fa-plus fa-fw"></sub>
                        </a>
                    </div>
                {/if}
                <!-- /Barra de botones -->
                {if $procesos}
                    <div class="table-responsive">
                        <table id="tabla_procesos" class="table datatable table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>{$smarty.const.FIELD_COD}</th>
                                    <th>{$smarty.const.FIELD_PROC}</th>
                                    <th>{$smarty.const.FIELD_TIPO_PROC}</th>
                                    <th>{$smarty.const.FIELD_PROC_MADRE}</th>
                                    <th>{$smarty.const.FIELD_PROPIETARIO}</th>
                                    <th>{$smarty.const.FIELD_ACCIONES}</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach from=$procesos item=proceso}
                                    <tr>
                                        <td><span class="label label-primary">{$proceso->codigo}</span></td>
                                        <td>
                                            <a title="{$proceso->nombre}: {$proceso->mision|replace:"\r\n":" "}"
                                               href="index.php?page=proceso_mostrar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}">
                                                {$proceso->nombre}
                                            </a>
                                        </td>
                                        <td>{$proceso->alcance}</td>
                                        <td>
                                            {if $proceso->madre}
                                                <a title="{$proceso->madre->nombre}"
                                                   href="index.php?page=proceso_mostrar&id_proceso={$proceso->madre->id}&id_entidad={$proceso->madre->id_entidad}">
                                                    {$proceso->madre->nombre}
                                                </a>
                                            {else}
                                                ---
                                            {/if}
                                        </td>
                                        <td style="font-size: 12px">
                                            <a title="{$smarty.const.TXT_USER_PERFIL}"
                                               href="index.php?page=usuario_mostrar&id_usuario={$proceso->propietario->id}">
                                                {$proceso->propietario->nombre} {$proceso->propietario->apellidos}
                                            </a>
                                        </td>
                                        <td>
                                            <a class="btn btn-default btn-circle btn-xs"
                                               title="{$smarty.const.TXT_FICHA}"
                                               href="index.php?page=proceso_mostrar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}">
                                                <i class="fa fa-folder fa-fw"></i>
                                            </a>
                                            {if $_control || $permiso_proceso[$proceso->id]}
                                                <a class="btn btn-default btn-circle btn-xs"
                                                   title="{$smarty.const.TXT_ARCHIVOS_GESTION}"
                                                   href='index.php?page=archivo_gestionar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}'>
                                                    <i class="fa fa-archive fa-fw"></i>
                                                </a>
                                                <a class="btn btn-default btn-circle btn-xs"
                                                   title="{$smarty.const.TXT_EDIT}"
                                                   href='index.php?page=proceso_editar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}'>
                                                    <i class="fa fa-pencil fa-fw"></i>
                                                </a>
                                                <a class="btn btn-default btn-circle btn-xs"
                                                   title="{$smarty.const.TXT_BORRAR}"
                                                   href='javascript:void(0)' data-toggle="modal"
                                                   data-target="#dialogo_confirmar_borrado"
                                                   data-id_proceso="{$proceso->id}"
                                                   data-nombre_proceso="{$proceso->nombre}"
                                                   data-id_entidad="{$proceso->id_entidad}">
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
                                {$smarty.const.MSG_UNID_NO_PROC}
                            </div>
                        </div>
                        <!-- /.col-sm-11 -->
                        <div class="col-sm-1">
                            <!-- Barra de botones -->
                            {if $_control}
                                <div class="btn-toolbar" role="toolbar" aria-label="">
                                    <div class="btn-group" role="group" aria-label="">
                                        <a class="btn btn-danger" href="index.php?page=proceso_crear&id_entidad={$entidad->id}"
                                           title="{$smarty.const.TXT_PROC_CREAR}">
                                            <i class="fa fa-gear fa-fw"></i><sub class="fa fa-plus fa-fw"></sub>
                                        </a>
                                    </div>
                                </div>
                            {/if}
                            <!-- /Barra de botones -->
                        </div>
                        <!-- /.col-sm-1 -->
                    </div>
                    <!-- /.row -->
                {/if}
            </div>
            <!-- /Lista de procesos -->

            <!-- Procesos del usuario -->
            {if $procesos_propios}
                <div role="tabpanel" class="tab-pane" id="user_procs">
                    <div class="table-responsive">
                        <table id='tabla_mis_procesos' class="table datatable table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>{$smarty.const.FIELD_COD}</th>
                                    <th>{$smarty.const.FIELD_PROC}</th>
                                    <th>{$smarty.const.FIELD_TIPO_PROC}</th>
                                    <th>{$smarty.const.FIELD_PROC_MADRE}</th>
                                    <th>{$smarty.const.FIELD_ACCIONES}</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach from=$procesos_propios item=proceso}
                                    <tr>    
                                        <td><span class="label label-primary">{$proceso->codigo}</span></td>
                                        <td>
                                            <a title="{$proceso->nombre}: {$proceso->mision|replace:"\r\n":" "}" href="index.php?page=proceso_mostrar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}">
                                                {$proceso->nombre}
                                            </a>
                                        </td>
                                        <td>{$proceso->alcance}</td>
                                        <td>
                                            {if $proceso->madre}
                                                <a title="{$proceso->madre->nombre}" href="index.php?page=proceso_mostrar&id_proceso={$proceso->madre->id}&id_entidad={$proceso->madre->id_entidad}">
                                                    {$proceso->madre->nombre}
                                                </a>
                                            {else}
                                                ---
                                            {/if}
                                        </td>
                                        <td>
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_FICHA}" href="index.php?page=proceso_mostrar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}">
                                                <i class="fa fa-folder fa-fw"></i>
                                            </a>
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_ARCHIVOS_GESTION}" href='index.php?page=archivo_gestionar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}'>
                                                <i class="fa fa-archive fa-fw"></i>
                                            </a>
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_EDIT}" href='index.php?page=proceso_editar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}'>
                                                <i class="fa fa-pencil fa-fw"></i>
                                            </a>   
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_BORRAR}" 
                                               href='javascript:void(0)' data-toggle="modal" data-target="#dialogo_confirmar_borrado"
                                               data-id_proceso="{$proceso->id}" data-nombre_proceso="{$proceso->nombre}" data-id_entidad="{$proceso->id_entidad}">
                                                <i class="fa fa-trash fa-fw"></i>
                                            </a>
                                        </td>
                                    </tr>
                                {/foreach}
                            </tbody>
                        </table>
                    </div>
                </div>
            {/if}
            <!-- /Procesos del usuario -->

            <!-- Mapa de procesos -->
            <div role="tabpanel" class="tab-pane" id="proc_map">
                <!-- Barra de botones -->
                {if $_control}
                    <div class="btn-toolbar pull-right" role="toolbar" aria-label="">
                        <div class="btn-group" role="group" aria-label="">
                            <button class="btn btn-danger" title="{$smarty.const.TXT_PROC_MAP_EDIT}"
                                    data-toggle="modal"
                                    data-target="#dialogo_mapa">
                                <i class="fa fa-map fa-fw"></i><sub class="fa fa-plus fa-fw"></sub>
                            </button>
                        </div>
                    </div>
                {/if}
                <!-- /Barra de botones -->
                {if $entidad->mapa}
                    {if $entidad->id==14}
                        <img src="images/mapa_procesos_biblioteca.png" class="img-responsive img-rounded" alt="{$smarty.const.TXT_PROC_MAP}" usemap="#Map">
                        <map name="Map" id="Map">
                            <area shape="rect" coords="96,66,263,94" title="{$smarty.const.TXT_PROC_VER}"
                                  href="index.php?page=proceso_mostrar&id_entidad=14&id_proceso=1920"/>
                            <area shape="rect" coords="355,66,475,93" title="{$smarty.const.TXT_PROC_VER}"
                                  href="index.php?page=proceso_mostrar&id_entidad=14&id_proceso=1921"/>
                            <area shape="rect" coords="287,169,362,190" title="{$smarty.const.TXT_PROC_VER}"
                                  href="index.php?page=proceso_mostrar&id_entidad=14&id_proceso=1913"/>
                            <area shape="rect" coords="277,200,368,225" title="{$smarty.const.TXT_PROC_VER}"
                                  href="index.php?page=proceso_mostrar&id_entidad=14&id_proceso=1914"/>
                            <area shape="rect" coords="197,264,272,301" title="{$smarty.const.TXT_PROC_VER}"
                                  href="index.php?page=proceso_mostrar&id_entidad=14&id_proceso=1915"/>
                            <area shape="rect" coords="330,260,438,284" title="{$smarty.const.TXT_PROC_VER}"
                                  href="index.php?page=proceso_mostrar&id_entidad=14&id_proceso=1916"/>
                            <area shape="rect" coords="330,286,437,311" title="{$smarty.const.TXT_PROC_VER}"
                                  href="index.php?page=proceso_mostrar&id_entidad=14&id_proceso=1917"/>
                            <area shape="rect" coords="248,349,324,375" title="{$smarty.const.TXT_PROC_VER}"
                                  href="index.php?page=proceso_mostrar&id_entidad=14&id_proceso=1918"/>
                            <area shape="rect" coords="328,349,398,374" title="{$smarty.const.TXT_PROC_VER}"
                                  href="index.php?page=proceso_mostrar&id_entidad=14&id_proceso=1919"/>
                            <area shape="rect" coords="42,386,156,432" title="{$smarty.const.TXT_PROC_VER}"
                                  href="index.php?page=proceso_mostrar&id_entidad=14&id_proceso=1907"/>
                            <area shape="rect" coords="164,387,256,480" title="{$smarty.const.TXT_PROC_VER}"
                                  href="index.php?page=proceso_mostrar&id_entidad=14&id_proceso=1922"/>
                            <area shape="rect" coords="265,388,389,431" title="{$smarty.const.TXT_PROC_VER}"
                                  href="index.php?page=proceso_mostrar&id_entidad=14&id_proceso=1923"/>
                            <area shape="rect" coords="393,387,484,432" title="{$smarty.const.TXT_PROC_VER}"
                                  href="index.php?page=proceso_mostrar&id_entidad=14&id_proceso=1911"/>
                            <area shape="rect" coords="492,387,595,432" title="{$smarty.const.TXT_PROC_VER}"
                                  href="index.php?page=proceso_mostrar&id_entidad=14&id_proceso=1912"/>
                        </map>
                    {elseif $entidad->id==20}
                        <img src="images/mapa_proceso_un09.png" class="img-responsive img-rounded" alt="{$smarty.const.TXT_PROC_MAP}" usemap="#Map">
                        <map name="Map" id="Map">
                            <area shape="rect" coords="770,508,1032,558" title="{$smarty.const.TXT_PROC_VER}"
                                  href="index.php?page=proceso_mostrar&id_entidad=20&id_proceso=1947"/>
                            <area shape="rect" coords="770,592,1030,641" title="{$smarty.const.TXT_PROC_VER}"
                                  href="index.php?page=proceso_mostrar&id_entidad=20&id_proceso=1948"/>
                            <area shape="rect" coords="770,668,1030,722" title="{$smarty.const.TXT_PROC_VER}"
                                  href="index.php?page=proceso_mostrar&id_entidad=20&id_proceso=1949"/>
                            <area shape="rect" coords="770,774,1030,800" title="{$smarty.const.TXT_PROC_VER}"
                                  href="index.php?page=proceso_mostrar&id_entidad=20&id_proceso=1950"/>
                            <area shape="rect" coords="770,830,1030,885" title="{$smarty.const.TXT_PROC_VER}"
                                  href="index.php?page=proceso_mostrar&id_entidad=20&id_proceso=1951"/>
                            <area shape="rect" coords="1110,530,1454,585" title="{$smarty.const.TXT_PROC_VER}"
                                  href="index.php?page=proceso_mostrar&id_entidad=20&id_proceso=1952"/>
                            <area shape="rect" coords="1110,776,1454,830" title="{$smarty.const.TXT_PROC_VER}"
                                  href="index.php?page=proceso_mostrar&id_entidad=20&id_proceso=1953"/>
                        </map>
                    {elseif $entidad->id==51}
                        <img src="images/mapa_procesos_sav.png" class="img-responsive img-rounded" alt="{$smarty.const.TXT_PROC_MAP}">
                    {elseif $entidad->id==55}
                        <img src="images/mapa_procesos_internacional.png" class="img-responsive img-rounded" alt="{$smarty.const.TXT_PROC_MAP}">
                    {elseif $entidad->id==310}
                        <img src="images/mapa_procesos_segeedin.png" class="img-responsive img-rounded" alt="{$smarty.const.TXT_PROC_MAP}">
                    {elseif $entidad->id==28}
                        <img src="images/mapa_procesos_biologia.png" class="img-responsive img-rounded" alt="{$smarty.const.TXT_PROC_MAP}">
                    {elseif $entidad->id==6}
                        <img src="images/mapa_gabinete_juridico.png" class="img-responsive img-rounded" alt="{$smarty.const.TXT_PROC_MAP}">
                    {elseif $entidad->id==16}
                        <img src="images/mapa_procesos_hernando_colon.png" class="img-responsive img-rounded" alt="{$smarty.const.TXT_PROC_MAP}">
                    {elseif $entidad->id==2}
                        <img src="images/mapa_procesos_forpas.png" class="img-responsive img-rounded" alt="{$smarty.const.TXT_PROC_MAP}">
                    {elseif $entidad->id==42}
                        <img src="images/mapa_procesos_psicologia.png" class="img-responsive img-rounded" alt="{$smarty.const.TXT_PROC_MAP}">
                    {elseif $entidad->id==18}
                        <img src="images/mapa_procesos_arquitectura.png" class="img-responsive img-rounded" alt="{$smarty.const.TXT_PROC_MAP}">
                    {/if}
                {else}
                    <div class="row">
                        <div class="col-sm-11">
                            <div class="alert alert-info alert-dismissible">
                                <i class="fa fa-info-circle fa-fw"></i>
                                {$smarty.const.MSG_UNID_NO_MAPA}
                            </div>
                        </div>
                        <!-- /.col-sm-11 -->
                    </div>
                    <!-- /.row -->
                {/if}
            </div>
            <!-- /Mapa de procesos -->

        </div>
        <!-- /Tab panes -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->