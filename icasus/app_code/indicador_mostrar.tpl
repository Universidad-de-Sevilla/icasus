<!-- Diálogo Confirmar Borrado -->
<div class="modal fade" id="dialogo_confirmar_borrado" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel"><i class="fa fa-trash fa-fw"></i> {$smarty.const.TXT_INDIC_BORRAR}: {$indicador->nombre}</h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_INDIC_CONFIRM_BORRAR}</p>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_NO}" class="btn btn-default btn-danger" data-dismiss="modal"><i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_NO}</button>
                <a title="{$smarty.const.TXT_SI}" class="btn btn-default btn-success" name="borrar" id="borrar" href='index.php?page=indicador_borrar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'><i class="fa fa-check fa-fw"></i> {$smarty.const.TXT_SI}</a>
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
            <div class="btn-group" role="group" aria-label="">
                {if $_control || $responsable}
                    <a title="{$smarty.const.TXT_INDIC_EDIT}" class="btn btn-default btn-danger" href='index.php?page=indicador_editar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                        <i class="fa fa-pencil fa-fw"></i> {$smarty.const.TXT_INDIC_EDIT}
                    </a>
                    <a title="{$smarty.const.TXT_INDIC_BORRAR}" class="btn btn-default btn-danger" href='javascript:void(0)' 
                       data-toggle="modal" data-target="#dialogo_confirmar_borrado">
                        <i class="fa fa-trash fa-fw"></i> {$smarty.const.TXT_INDIC_BORRAR}
                    </a>
                {/if}
            </div>
            <div class="btn-group" role="group" aria-label="">
                <a title="{$smarty.const.TXT_REP_GRAFIC}" class="btn btn-default btn-danger" href='index.php?page=graficas_mostrar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                    <i class="fa fa-area-chart fa-fw"></i> {$smarty.const.TXT_REP_GRAFIC}
                </a>
            </div>
            <div class="btn-group" role="group" aria-label="">    
                <a title="{$smarty.const.TXT_MED_MOSTRAR}" class="btn btn-default btn-danger" href='index.php?page=medicion_listar&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                    <i class="fa fa-clock-o fa-fw"></i> {$smarty.const.TXT_MED_MOSTRAR}
                </a>
                {if !$indicador->calculo && ($_control || $responsable)}
                    <a title="{$smarty.const.TXT_VAL_EDIT}" class="btn btn-default btn-danger" href='index.php?page=indicador_subunidad_valor&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                        <i class="fa fa-pencil-square-o fa-fw"></i> {$smarty.const.TXT_VAL_EDIT}
                    </a>
                {/if}
                {if $_control}
                    <a title="{$smarty.const.FIELD_RESP_MED}" class="btn btn-default btn-danger" href='index.php?page=medicion_responsable&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                        <i class="fa fa-user fa-fw"></i> {$smarty.const.FIELD_RESP_MED}
                    </a>
                {/if}
            </div>
            <div class="btn-group" role="group" aria-label="">
                <a title="{$smarty.const.TXT_VAL_REF}" class="btn btn-default btn-danger" href='index.php?page=valor_referencia_crear&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                    <i class="fa fa-tags fa-fw"></i> {$smarty.const.TXT_VAL_REF}
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
                <span class="panel-title"><i class="fa fa-dashboard fa-fw"></i> {$smarty.const.TXT_INDIC_PARAM}</span>
                <i class="fa fa-chevron-up pull-right clickable"></i>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <table class="table table-striped table-hover">
                    <tbody>
                        <tr>
                            <th>{$smarty.const.FIELD_ID}</th>
                            <td>{$indicador->id}</td>
                        </tr>
                        <tr>
                            <th>{$smarty.const.FIELD_COD}</th>
                            <td>{$indicador->codigo}</td>
                        </tr>
                        <tr>
                            <th>{$smarty.const.FIELD_PROC}</th>
                            <td>
                                <a href="index.php?page=proceso_mostrar&id_proceso={$indicador->proceso->id}&id_entidad={$indicador->id_entidad}">{$indicador->proceso->codigo} - {$indicador->proceso->nombre}</a>
                            </td>
                        </tr>
                        <tr>
                            <th>{$smarty.const.FIELD_NOMBRE}</th>
                            <td>{$indicador->nombre}</td>
                        </tr>
                        <tr>
                            <th>{$smarty.const.FIELD_DESC}</th>
                            <td> 
                                {if $indicador->descripcion != ""}
                                    {$indicador->descripcion}
                                {else}
                                    ---
                                {/if}
                            </td>
                        </tr>
                        <tr>
                            <th>{$smarty.const.FIELD_HISTORICO}</th>
                            <td>{$indicador->historicos}</td>
                        </tr>
                        <tr>
                            <th>{$smarty.const.FIELD_PERIOD}</th>
                            <td>{$indicador->periodicidad}</td>
                        </tr>      
                        <tr title="{$smarty.const.TXT_CALCULO_TOTAL_ANUAL}">
                            <th>{$smarty.const.FIELD_CALC_TOTAL_ANUAL}</th>
                            <td>{$indicador->tipo_agregacion_temporal->descripcion}</td>
                        </tr>
                        <tr>
                            <th>{$smarty.const.FIELD_OBSERV}</th>
                            <td> 
                                {if $indicador->observaciones != ""}
                                    {$indicador->observaciones}
                                {else}
                                    ---
                                {/if}
                            </td>
                        </tr>
                        <tr>
                            <th>{$smarty.const.FIELD_FORM}</th>
                            <td>{$indicador->formulacion}</td>
                        </tr>
                        {if $indicador->calculo}
                            <tr>
                                <th>{$smarty.const.FIELD_FORMULA}</th>
                                <td>{$indicador->calculo}</td>
                            </tr>
                        {/if}
                        <tr>
                            <th>{$smarty.const.FIELD_RESP_SEG}</th>
                            <td> {$indicador->responsable->nombre} {$indicador->responsable->apellidos}
                                {if $indicador->responsable->puesto} - {$indicador->responsable->puesto} {/if}
                            </td>
                        </tr>
                        <tr>
                            <th>{$smarty.const.FIELD_RESP_MED}</th>
                            <td> {$indicador->responsable_medicion->nombre} {$indicador->responsable_medicion->apellidos}
                                {if $indicador->responsable_medicion->puesto} - {$indicador->responsable_medicion->puesto} {/if}
                            </td>
                        </tr>
                        <tr>
                            <th>{$smarty.const.FIELD_FUENTE_INFO}</th>
                            <td> 
                                {if $indicador->fuente_informacion != ""}
                                    {$indicador->fuente_informacion}
                                {else}
                                    ---
                                {/if}
                            </td>
                        </tr>
                        <tr>
                            <th>{$smarty.const.FIELD_FUENTE_DAT}</th>
                            <td> 
                                {if $indicador->fuente_datos != ""}
                                    {$indicador->fuente_datos}
                                {else}
                                    ---
                                {/if}
                            </td>
                        </tr>
                        <tr>
                            <th>{$smarty.const.FIELD_MET}</th>
                            <td> 
                                {if $indicador->evidencia != ""}
                                    {$indicador->evidencia}
                                {else}
                                    ---
                                {/if}
                            </td>
                        </tr>
                        <tr>
                            <th>{$smarty.const.FIELD_INTERP}</th>
                            <td> 
                                {if $indicador->interpretacion != ""}
                                    {$indicador->interpretacion}
                                {else}
                                    ---
                                {/if}
                            </td>
                        </tr>
                        <tr>
                            <th>{$smarty.const.FIELD_INTERVALO}</th>
                            <td>
                                {if $indicador->valor_min != NULL && $indicador->valor_max != NULL}
                                    [{$indicador->valor_min}, {$indicador->valor_max}] 
                                {else}
                                    {$smarty.const.TXT_NO_ASIG}
                                {/if}
                            </td>
                        </tr>
                        <tr>
                            <th>{$smarty.const.FIELD_EFQM}</th>
                            <td>
                                {if is_array($indicador->criterios_efqm)}
                                    <ul> 
                                        {foreach $indicador->criterios_efqm as $indicador_criterio_efqm}
                                            <li>
                                                {$indicador_criterio_efqm->criterio_efqm->codigo} - {$indicador_criterio_efqm->criterio_efqm->nombre}
                                            </li>
                                        {/foreach}
                                    </ul>
                                {else}
                                    {$smarty.const.MSG_NO_DEF}
                                {/if}
                            </td>
                        </tr>
                        <tr>
                            <th>{$smarty.const.FIELD_VISIBILIDAD}</th>
                            <td>{$indicador->visibilidad->nombre|htmlentities}</td>
                        </tr>
                        <tr>
                            <th>{$smarty.const.FIELD_UNID_GEN}</th>
                            <td> 
                                {if $indicador->unidad_generadora != ""}
                                    {$indicador->unidad_generadora}
                                {else}
                                    ---
                                {/if}
                            </td>
                        </tr>
                        <tr>
                            <th>{$smarty.const.FIELD_SUBUNID_AFECT}</th>
                            <td>
                                {if $indicador_subunidades}
                                    <ul>
                                        {foreach $indicador_subunidades as $indicador_subunidad}
                                            <li>
                                                <a href="index.php?page=entidad_datos&id_entidad={$indicador_subunidad->entidad->id}">{$indicador_subunidad->entidad->etiqueta}</a>
                                            </li>
                                        {/foreach}
                                    </ul>
                                {else}
                                    {$smarty.const.MSG_INDIC_NO_SUBUNID_ASIG}
                                {/if}
                            </td>
                        </tr>
                        <tr title="{$smarty.const.TXT_CALCULO_TOTAL}">
                            <th>{$smarty.const.FIELD_CALC_TOTAL}</th>
                            <td>{$indicador->tipo_agregacion->descripcion}</td>
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