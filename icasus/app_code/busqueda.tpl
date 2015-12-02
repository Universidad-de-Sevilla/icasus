<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <h3 title="{$_nombre_pagina}" class="page-header">
            <i class="fa fa-search fa-fw"></i> {$_nombre_pagina}
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
            <li title="{$_nombre_pagina}" class="active">{$_nombre_pagina}</li>
        </ol>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<!-- /Breadcrumbs -->

{if $texto}
    <div class="row">
        <div class="col-lg-12">

            <!-- Nav tabs -->
            <ul class="nav nav-tabs" role="tablist">     
                <li id="tab_unidades" role="presentation" class="active">
                    <a href="#unidades" title="{$smarty.const.FIELD_UNIDS}" aria-controls="{$smarty.const.FIELD_UNIDS}" role="tab" data-toggle="tab"><i class="fa fa-sitemap fa-fw"></i> {$smarty.const.FIELD_UNIDS}</a>
                </li>
                <li id="tab_procesos" role="presentation">
                    <a href="#procesos" title="{$smarty.const.TXT_PROCS}" aria-controls="{$smarty.const.TXT_PROCS}" role="tab" data-toggle="tab"><i class="fa fa-gears fa-fw"></i> {$smarty.const.TXT_PROCS}</a>
                </li>
                <li id="tab_indicadores" role="presentation">
                    <a href="#indicadores" title="{$smarty.const.FIELD_INDICS}" aria-controls="{$smarty.const.FIELD_INDICS}" role="tab" data-toggle="tab"><i class="fa fa-dashboard fa-fw"></i> {$smarty.const.FIELD_INDICS}</a>
                </li>
                <li id="tab_datos" role="presentation">
                    <a href="#datos" title="{$smarty.const.FIELD_DATOS}" aria-controls="{$smarty.const.FIELD_DATOS}" role="tab" data-toggle="tab"><i class="fa fa-database fa-fw"></i> {$smarty.const.FIELD_DATOS}</a>
                </li>
                <li id="tab_cuadros" role="presentation">
                    <a href="#cuadros" title="{$smarty.const.TXT_CUADROS_MANDO}" aria-controls="{$smarty.const.TXT_CUADROS_MANDO}" role="tab" data-toggle="tab"><i class="fa fa-th fa-fw"></i> {$smarty.const.TXT_CUADROS_MANDO}</a>
                </li>
            </ul>
            <!-- /Nav tabs -->
            <br>
            <!-- Tab panes -->
            <div class="tab-content">

                <!-- Tab unidades -->
                <div id="unidades" role="tabpanel" class="tab-pane active">
                    {if $entidades}
                        <div class="table-responsive">
                            <table class="table datatable table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>{$smarty.const.FIELD_COD}</th>
                                        <th>{$smarty.const.FIELD_UNID}</th>
                                        <th>{$smarty.const.FIELD_ACCIONES}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {foreach from=$entidades item=entidad}
                                        <tr>
                                            <td><span class="label label-primary">{$entidad->codigo}</span></td>
                                            <td><a title="{$entidad->nombre}" href='index.php?page=entidad_mostrar&id_entidad={$entidad->id}'>{$entidad->nombre}</a></td>
                                            <td>
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_UNID_FICHA}" href='index.php?page=entidad_mostrar&id_entidad={$entidad->id}'><i class="fa fa-folder fa-fw"></i></a>
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_PROCS}" href='index.php?page=proceso_listar&id_entidad={$entidad->id}'><i class="fa fa-gears fa-fw"></i></a>
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.FIELD_INDICS}" href='index.php?page=indicador_listar&id_entidad={$entidad->id}'><i class="fa fa-dashboard fa-fw"></i></a>
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.FIELD_DATOS}" href='index.php?page=dato_listar&id_entidad={$entidad->id}'><i class="fa fa-database fa-fw"></i></a>
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_CONSULT}" href='index.php?page=consulta_avanzada&id_entidad={$entidad->id}'><i class="fa fa-commenting fa-fw"></i></a>
                                            </td>
                                        </tr>
                                    {/foreach}
                                </tbody>
                            </table>
                        </div>
                    {else}
                        <div class="alert alert-info alert-dismissible">
                            <i class="fa fa-info-circle fa-fw"></i> 
                            {$smarty.const.MSG_BUSCAR_NO_RESUL}
                        </div>
                    {/if}

                </div>
                <!-- /Tab unidades -->

                <!-- Tab procesos -->
                <div id="procesos" role="tabpanel" class="tab-pane">
                    {if $procesos}
                        <div class="table-responsive">
                            <table class="table datatable table-condensed table-striped table-hover">
                                <thead>
                                    <tr>   
                                        <th>{$smarty.const.FIELD_COD}</th>
                                        <th>{$smarty.const.FIELD_UNID}</th>
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
                                            <td><span class="label label-primary">{$proceso->codigo}</span></td>
                                            <td><a title="{$smarty.const.TXT_UNID_FICHA}" href='index.php?page=entidad_mostrar&id_entidad={$proceso->entidad->id}'>{$proceso->entidad->etiqueta}</a></td>
                                            <td>
                                                <a title="{$proceso->nombre}: {$proceso->mision}" href="index.php?page=proceso_mostrar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}">
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
                                            <td>
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_PROC_FICHA}" href="index.php?page=proceso_mostrar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}">
                                                    <i class="fa fa-folder fa-fw"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    {/foreach}
                                </tbody>
                            </table>
                        </div>
                    {else}
                        <div class="alert alert-info alert-dismissible">
                            <i class="fa fa-info-circle fa-fw"></i> 
                            {$smarty.const.MSG_BUSCAR_NO_RESUL}
                        </div> 
                    {/if}
                </div>
                <!-- /Tab procesos -->

                <!-- Tab indicadores -->
                <div id="indicadores" role="tabpanel" class="tab-pane">
                    {if $indicadores}
                        <div class="table-responsive">
                            <table class="table table-condensed datatable table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>{$smarty.const.FIELD_COD}</th>
                                        <th>{$smarty.const.FIELD_UNID}</th>
                                        <th>{$smarty.const.FIELD_INDIC}</th>
                                        <th>{$smarty.const.FIELD_PROC}</th>
                                        <th>{$smarty.const.FIELD_PERIOD}</th>
                                        <th>{$smarty.const.FIELD_RESP}</th>
                                        <th>{$smarty.const.FIELD_RESP_MED}</th>
                                        <th>{$smarty.const.FIELD_ACCIONES}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {foreach from=$indicadores item=indicador} 
                                        <tr>
                                            <td><span class="label label-primary">{$indicador->codigo}</span></td>
                                            <td><a title="{$smarty.const.TXT_UNID_FICHA}" href='index.php?page=entidad_mostrar&id_entidad={$indicador->id_entidad}'>{$indicador->entidad->etiqueta}</a></td>
                                            <td>
                                                {if $indicador->calculo}
                                                    <i class="fa fa-calculator fa-fw" title="{$smarty.const.TXT_CALC_AUTO}: {$indicador->calculo}"></i>
                                                {/if}
                                                {if $indicador->id_tipo_agregacion!= 0}
                                                    <i class="fa fa-sitemap fa-fw" title="{$smarty.const.FIELD_AGREG}"></i>
                                                {/if}
                                                <a href='index.php?page=indicador_mostrar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}' 
                                                   title="{$indicador->nombre}: {$indicador->descripcion}">
                                                    {$indicador->nombre}</a>
                                            </td>
                                            <td>
                                                <a title="{$smarty.const.TXT_PROC_VER}" href='index.php?page=proceso_mostrar&id_proceso={$indicador->id_proceso}&id_entidad={$indicador->id_entidad}'>
                                                    {$indicador->proceso->nombre}
                                                </a>
                                            </td>
                                            <td>{$indicador->periodicidad}</td>
                                            <td>
                                                <a title="{$smarty.const.TXT_USER_PERFIL}" href='index.php?page=usuario_mostrar&id_usuario={$indicador->id_responsable}&id_entidad={$indicador->id_entidad}'>
                                                    {$indicador->responsable->nombre} 
                                                    {$indicador->responsable->apellidos}</a>
                                            </td>
                                            <td>
                                                <a title="{$smarty.const.TXT_USER_PERFIL}" href='index.php?page=usuario_mostrar&id_usuario={$indicador->id_responsable_medicion}&id_entidad={$indicador->id_entidad}'>
                                                    {$indicador->responsable_medicion->nombre} 
                                                    {$indicador->responsable_medicion->apellidos}</a>
                                            </td>
                                            <td>
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_INDIC_MOSTRAR}" href='index.php?page=indicador_mostrar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                                                    <i class="fa fa-folder fa-fw"></i>
                                                </a>
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_REP_GRAFIC}" href='index.php?page=graficas_mostrar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                                                    <i class="fa fa-area-chart fa-fw"></i>
                                                </a>
                                                <a class="btn btn-default btn-circle btn-xs" href='index.php?page=medicion_listar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}' 
                                                   title="{$smarty.const.TXT_INDIC_MED}: {$indicador->nombre}" target="_blank">
                                                    <i class="fa fa-clock-o fa-fw"></i>
                                                </a>
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_VAL_REF}" href='index.php?page=valor_referencia_crear&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}' target="_blank">
                                                    <i class="fa fa-tags fa-fw"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    {/foreach}
                                </tbody>
                            </table>
                        </div>
                    {else}
                        <div class="alert alert-info alert-dismissible">
                            <i class="fa fa-info-circle fa-fw"></i> 
                            {$smarty.const.MSG_BUSCAR_NO_RESUL}
                        </div> 
                    {/if}
                </div>
                <!-- /Tab indicadores -->

                <!-- Tab datos -->
                <div id="datos" role="tabpanel" class="tab-pane">
                    {if $datos}
                        <div class="table-responsive">
                            <table class="table table-condensed datatable table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>{$smarty.const.FIELD_COD}</th>
                                        <th>{$smarty.const.FIELD_UNID}</th>
                                        <th>{$smarty.const.FIELD_DATO}</th>  
                                        <th>{$smarty.const.FIELD_PERIOD}</th>
                                        <th>{$smarty.const.FIELD_RESP}</th>
                                        <th>{$smarty.const.FIELD_RESP_MED}</th>
                                        <th>{$smarty.const.FIELD_ACCIONES}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {foreach from=$datos item=dato} 
                                        <tr>
                                            <td><span class="label label-primary">{$dato->codigo}</span></td>
                                            <td><a title="{$smarty.const.TXT_UNID_FICHA}" href='index.php?page=entidad_mostrar&id_entidad={$dato->id_entidad}'>{$dato->entidad->etiqueta}</a></td>
                                            <td>
                                                {if $dato->calculo}
                                                    <i class="fa fa-calculator fa-fw" title="{$smarty.const.TXT_CALC_AUTO}: {$dato->calculo}"></i>
                                                {/if}
                                                {if $dato->id_tipo_agregacion!= 0}
                                                    <i class="fa fa-sitemap fa-fw" title="{$smarty.const.FIELD_AGREG}"></i>
                                                {/if}
                                                <a href='index.php?page=dato_mostrar&id_dato={$dato->id}&id_entidad={$dato->id_entidad}' 
                                                   title="{$dato->nombre}: {$dato->descripcion}">
                                                    {$dato->nombre}</a>
                                            </td>
                                            <td>{$dato->periodicidad}</td>
                                            <td>
                                                <a title="{$smarty.const.TXT_USER_PERFIL}" href='index.php?page=usuario_mostrar&id_usuario={$dato->id_responsable}&id_entidad={$dato->id_entidad}'>
                                                    {$dato->responsable->nombre} 
                                                    {$dato->responsable->apellidos}</a>
                                            </td>
                                            <td>
                                                <a title="{$smarty.const.TXT_USER_PERFIL}" href='index.php?page=usuario_mostrar&id_usuario={$dato->id_responsable_medicion}&id_entidad={$dato->id_entidad}'>
                                                    {$dato->responsable_medicion->nombre} 
                                                    {$dato->responsable_medicion->apellidos}</a>
                                            </td>
                                            <td>
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_DATO_MOSTRAR}" href='index.php?page=dato_mostrar&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'>
                                                    <i class="fa fa-folder fa-fw"></i>
                                                </a>
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_REP_GRAFIC}" href='index.php?page=graficas_mostrar&id_dato={$dato->id}&id_entidad={$dato->id_entidad}'>
                                                    <i class="fa fa-area-chart fa-fw"></i>
                                                </a>
                                                <a class="btn btn-default btn-circle btn-xs" href='index.php?page=medicion_listar&id_dato={$dato->id}&id_entidad={$dato->id_entidad}' 
                                                   title="{$smarty.const.TXT_DATO_MEDICIONES}: {$dato->nombre}" target="_blank">
                                                    <i class="fa fa-clock-o fa-fw"></i>
                                                </a>
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_VAL_REF}" href='index.php?page=valor_referencia_crear&id_dato={$dato->id}&id_entidad={$dato->id_entidad}' target="_blank">
                                                    <i class="fa fa-tags fa-fw"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    {/foreach}
                                </tbody>
                            </table>
                        </div>
                    {else}
                        <div class="alert alert-info alert-dismissible">
                            <i class="fa fa-info-circle fa-fw"></i> 
                            {$smarty.const.MSG_BUSCAR_NO_RESUL}
                        </div> 
                    {/if}
                </div>
                <!-- /Tab datos -->

                <!-- Tab cuadros -->
                <div id="cuadros" role="tabpanel" class="tab-pane">
                    {if $cuadros_publicos}
                        <div class="table-responsive">
                            <table class="table datatable table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>{$smarty.const.FIELD_NOMBRE}</th>
                                        <th>{$smarty.const.FIELD_VISIBILIDAD}</th>
                                        <th>{$smarty.const.FIELD_COMENTARIOS}</th>
                                        <th>{$smarty.const.FIELD_ACCIONES}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {foreach from=$cuadros_publicos item=cuadro}
                                        <tr>
                                            <td><a title="{$cuadro->nombre}" href="index.php?page=cuadro_mostrar&id={$cuadro->id}">{$cuadro->nombre}</a></td>            
                                            <td>
                                                {if $cuadro->privado == 0}{$smarty.const.TXT_PUBLICO}
                                                {else}{$smarty.const.TXT_PRIVADO}
                                                {/if}
                                            </td>
                                            <td>{$cuadro->comentarios}</td>
                                            <td>
                                                <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_VER}" href="index.php?page=cuadro_mostrar&id={$cuadro->id}"><i class="fa fa-eye fa-fw"></i></a>
                                            </td>
                                        </tr>
                                    {/foreach}
                                </tbody>
                            </table>
                        </div>
                    {else}
                        <div class="alert alert-info alert-dismissible">
                            <i class="fa fa-info-circle fa-fw"></i> 
                            {$smarty.const.MSG_BUSCAR_NO_RESUL}
                        </div> 
                    {/if}
                </div>
                <!-- /Tab cuadros -->

            </div>
            <!-- /Tab panes -->
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
{else}
    <div class="row">
        <div class="col-lg-12">
            <div class="alert alert-warning alert-dismissible">
                <i class="fa fa-exclamation-triangle fa-fw"></i> 
                {$smarty.const.MSG_BUSCAR_NO_TEXTO}
            </div>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
{/if}