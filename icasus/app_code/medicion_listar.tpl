<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <h2 title="{$_nombre_pagina}" class="page-header">
            <i class="fa fa-clock-o fa-fw"></i> {$_nombre_pagina}
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
            <div class="btn-group" role="group" aria-label="">
                {if $_control || $responsable}
                    <a title="{$smarty.const.TXT_MED_GENERAR}" class="btn btn-default btn-danger" href="index.php?page=medicion_generar&id_{$tipo}={$indicador->id}" onclick="return confirm('{$smarty.const.MSG_MED_GENERAR}');">
                        <i class="fa fa-refresh fa-fw"></i> {$smarty.const.TXT_MED_GENERAR}
                    </a>
                    <a title="{$smarty.const.TXT_MED_AGREGAR}" class="btn btn-default btn-danger" href="index.php?page=medicion_crear&id_{$tipo}={$indicador->id}">
                        <i class="fa fa-plus-circle fa-fw"></i> {$smarty.const.TXT_MED_AGREGAR}
                    </a>
                {/if}
                {if !$indicador->calculo}
                    <a title="{$smarty.const.TXT_VAL_EDIT}" class="btn btn-default btn-danger" href='index.php?page=indicador_subunidad_valor&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                        <i class="fa fa-pencil-square-o fa-fw"></i> {$smarty.const.TXT_VAL_EDIT}
                    </a>
                {/if}
                <a title="{$smarty.const.FIELD_RESP_MED}" class="btn btn-default btn-danger" href='index.php?page=medicion_responsable&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                    <i class="fa fa-user fa-fw"></i> {$smarty.const.FIELD_RESP_MED}
                </a>
            </div>
            <div class="btn-group" role="group" aria-label="">
                <a title="{$smarty.const.TXT_VAL_REF}" class="btn btn-default btn-danger" href='index.php?page=valor_referencia_crear&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                    <i class="fa fa-tags fa-fw"></i> {$smarty.const.TXT_VAL_REF}
                </a>
            </div>
            <div class="btn-group" role="group" aria-label="">
                <a title="{$smarty.const.TXT_VOLVER} {$tipo}" class="btn btn-default btn-danger" href='index.php?page={$tipo}_mostrar&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                    <i class="fa fa-arrow-left fa-fw"></i> {$smarty.const.TXT_VOLVER} {$tipo}
                </a>
            </div>
        </div>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<br>
<!-- /Barra de botones -->

<!-- Indicadores/datos calculados -->
{if $indicador->calculo}
    <div class="alert alert-info alert-dismissible">
        <i class="fa fa-info-circle fa-fw"></i> {$smarty.const.TXT_CALC_AUTO} - {$smarty.const.FIELD_FORMULA}: {$indicador->calculo}
        <br>
        {$smarty.const.TXT_DEPENDE}
        <br>
        {foreach $indicadores_influyentes as $indicador_influyente}
            {if $indicador_influyente->id_proceso}
                <a class="btn btn-default btn-primary" href='index.php?page=indicador_mostrar&id_indicador={$indicador_influyente->id}&id_entidad={$entidad->id}' 
                   title="{$smarty.const.TXT_INDIC_MOSTRAR}: {$indicador_influyente->nombre}">
                    <i class="fa fa-dashboard fa-fw"></i> <span class="badge">{$indicador_influyente->id}</span> - {$indicador_influyente->nombre}
                </a>
            {else}
                <a class="btn btn-default btn-primary" href='index.php?page=dato_mostrar&id_dato={$indicador_influyente->id}&id_entidad={$entidad->id}' 
                   title="{$smarty.const.TXT_DATO_MOSTRAR}: {$indicador_influyente->nombre}">
                    <i class="fa fa-database fa-fw"></i> <span class="badge">{$indicador_influyente->id}</span> - {$indicador_influyente->nombre}
                </a>
            {/if}   
        {/foreach}      
    </div> 
{/if}
<!-- /Indicadores/datos calculados -->

<!-- Indicadores/datos dependientes -->
{if $indicadores_dependientes}
    <div class="alert alert-info alert-dismissible">
        <i class="fa fa-info-circle fa-fw"></i>  {$smarty.const.TXT_INDIC_DAT_DEPENDIENTES}
        <br>
        {$smarty.const.TXT_INFLUYE}
        <br>
        {foreach $indicadores_dependientes as $indicador_dependiente}
            {if $indicador_dependiente->id_proceso}
                <a class="btn btn-default btn-primary" href='index.php?page=indicador_mostrar&id_indicador={$indicador_dependiente->id}&id_entidad={$entidad->id}' 
                   title="{$smarty.const.TXT_INDIC_MOSTRAR}: {$indicador_dependiente->nombre}">
                    <i class="fa fa-dashboard fa-fw"></i> <span class="badge">{$indicador_dependiente->id}</span> - {$indicador_dependiente->nombre}
                </a>
            {else}
                <a class="btn btn-default btn-primary" href='index.php?page=dato_mostrar&id_dato={$indicador_dependiente->id}&id_entidad={$entidad->id}' 
                   title="{$smarty.const.TXT_DATO_MOSTRAR}: {$indicador_dependiente->nombre}">
                    <i class="fa fa-database fa-fw"></i> <span class="badge">{$indicador_dependiente->id}</span> - {$indicador_dependiente->nombre}
                </a>
            {/if}   
        {/foreach}      
    </div> 
{/if}
<!-- /Indicadores/datos dependientes -->

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-red">
            <div class="panel-heading">
                <span class="panel-title"><i class="fa fa-clock-o fa-fw"></i> {$smarty.const.TXT_MED_TABLA}</span>
                <i class="fa fa-chevron-up pull-right clickable"></i>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                {if $mediciones}
                    <div class="table-responsive">
                        <table class="table datatable table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>{$smarty.const.FIELD_ETIQUETA}</th>
                                    <th>{$smarty.const.FIELD_INICIO_PERIODO}</th>
                                    <th>{$smarty.const.FIELD_FIN_PERIODO}</th>
                                    <th>{$smarty.const.FIELD_OBSERV}</th>
                                    <th>{$smarty.const.FIELD_ACCIONES}</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach $mediciones as $medicion}
                                    <tr>
                                        <td>
                                            <a title="{$smarty.const.TXT_MED_VER}" href="index.php?page=medicion_editar&id_entidad={$entidad->id}&id_medicion={$medicion->id}&tipo={$tipo}">{$medicion->etiqueta}</a>
                                        </td>
                                        <td>{$medicion->periodo_inicio|date_format:"%d-%m-%Y"}</td>
                                        <td>{$medicion->periodo_fin|date_format:"%d-%m-%Y"}</td>
                                        <td>{$medicion->observaciones|truncate:60}</td>
                                        <td>
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_MED_VER}" href="index.php?page=medicion_editar&id_entidad={$entidad->id}&id_medicion={$medicion->id}&tipo={$tipo}"><i class="fa fa-pencil fa-fw"></i></a>
                                            <a class="btn btn-default btn-circle btn-xs" title="{$smarty.const.TXT_MED_BORRAR}" href='index.php?page=medicion_borrar&id_medicion={$medicion->id}&tipo={$tipo}&id_entidad={$indicador->id_entidad}' 
                                               onClick="return confirm('{$smarty.const.MSG_MED_CONFIRM_BORRAR}');">
                                                <i class="fa fa-trash fa-fw"></i>
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
                        {$smarty.const.MSG_MED_NO_TIPO} {$tipo}
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

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-red">
            <div class="panel-heading">
                <span class="panel-title"><i class="fa fa-tag fa-fw"></i> {$smarty.const.TXT_VAL_TABLA}</span>
                <i class="fa fa-chevron-up pull-right clickable"></i>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                {if $mediciones}
                    <div class="table-responsive">
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>{$smarty.const.FIELD_UNID}</th>
                                        {foreach from=$mediciones item=medicion}
                                        <th>{$medicion->etiqueta}</th>
                                        {/foreach}
                                </tr>
                            </thead>
                            <tbody>
                                {foreach from=$subunidades_mediciones item=subunidades}
                                    <tr>
                                        <td>{$subunidades->etiqueta}</td>
                                        {foreach from=$subunidades->mediciones item=medicion}
                                            <td {if $indicador->id_tipo_agregacion == 0 && $subunidades->id == $entidad->id}
                                                {if isset($medicion_lim[$medicion->id]) AND isset($medicion_obj[$medicion->id])}
                                                    {if  $medicion->medicion_valor->valor < $medicion_lim[$medicion->id]}
                                                        class="danger" title="{$smarty.const.TXT_VAL_MEJORABLE}"
                                                    {else if $medicion->medicion_valor->valor >= $medicion_obj[$medicion->id]}
                                                        class="success" title="{$smarty.const.TXT_VAL_LOGRADO}"
                                                    {else}
                                                        class="warning" title="{$smarty.const.TXT_VAL_ACEPTABLE}"
                                                    {/if}
                                                {/if}
                                                {if isset($medicion_obj[$medicion->id]) AND !isset($medicion_lim[$medicion->id])}
                                                    {if $medicion->medicion_valor->valor >= $medicion_obj[$medicion->id] }
                                                        class="success" title="{$smarty.const.TXT_VAL_LOGRADO}"
                                                    {else}
                                                        class="danger" title="{$smarty.const.TXT_VAL_MEJORABLE}"
                                                    {/if}
                                                {/if}
                                                {if isset($medicion_lim[$medicion->id]) AND !isset($medicion_obj[$medicion->id])}
                                                    {if $medicion->medicion_valor->valor < $medicion_lim[$medicion->id] }
                                                        class="danger" title="{$smarty.const.TXT_VAL_MEJORABLE}"
                                                    {else}
                                                        class="success" title="{$smarty.const.TXT_VAL_LOGRADO}"
                                                    {/if}
                                                {/if}
                                                {/if}>
                                                {if $medicion->medicion_valor->valor == NULL} 
                                                    --- 
                                                {else}
                                                    {$medicion->medicion_valor->valor|round:"2"}
                                                    {if $indicador->id_tipo_agregacion == 0}
                                                        {if isset($medicion_lim[$medicion->id]) AND isset($medicion_obj[$medicion->id])}
                                                            {if  $medicion->medicion_valor->valor < $medicion_lim[$medicion->id]}
                                                                <i class="fa fa-circle fa-fw" style="color:red"></i>
                                                            {else if $medicion->medicion_valor->valor >= $medicion_obj[$medicion->id]}
                                                                <i class="fa fa-circle fa-fw" style="color:green"></i>
                                                            {else}
                                                                <i class="fa fa-circle fa-fw" style="color:yellow"></i>
                                                            {/if}
                                                        {/if}
                                                        {if isset($medicion_obj[$medicion->id]) AND !isset($medicion_lim[$medicion->id])}
                                                            {if $medicion->medicion_valor->valor >= $medicion_obj[$medicion->id] }
                                                                <i class="fa fa-circle fa-fw" style="color:green"></i>
                                                            {else}
                                                                <i class="fa fa-circle fa-fw" style="color:red"></i>
                                                            {/if}
                                                        {/if}
                                                        {if isset($medicion_lim[$medicion->id]) AND !isset($medicion_obj[$medicion->id])}
                                                            {if $medicion->medicion_valor->valor < $medicion_lim[$medicion->id] }
                                                                <i class="fa fa-circle fa-fw" style="color:red"></i>
                                                            {else}
                                                                <i class="fa fa-circle fa-fw" style="color:green"></i>
                                                            {/if}
                                                        {/if}
                                                    {/if}
                                                {/if}
                                            </td>
                                        {/foreach}
                                    </tr>
                                {/foreach}
                            </tbody>
                        </table>
                    </div>
                {else}
                    <div class="alert alert-info alert-dismissible">
                        <i class="fa fa-info-circle fa-fw"></i> 
                        {$smarty.const.MSG_INDIC_NO_VAL}
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