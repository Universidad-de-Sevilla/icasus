<!-- Nombre página -->
<div class="row">
    <div class="col-lg-12">
        <h3 title="{$_nombre_pagina}" class="page-header">
            <i class="fa fa-user fa-fw"></i> {$_nombre_pagina}
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
                <a title="{$smarty.const.TXT_REP_GRAFIC}" class="btn btn-default btn-danger" href='index.php?page=graficas_mostrar&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                    <i class="fa fa-area-chart fa-fw"></i> {$smarty.const.TXT_REP_GRAFIC}
                </a>
            </div>
            <div class="btn-group" role="group" aria-label="">    
                <a title="{$smarty.const.TXT_MED_MOSTRAR}" class="btn btn-default btn-danger" href='index.php?page=medicion_listar&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                    <i class="fa fa-clock-o fa-fw"></i> {$smarty.const.TXT_MED_MOSTRAR}
                </a>
                {if !$indicador->calculo && ($_control || $responsable)}
                    <a title="{$smarty.const.TXT_VAL_EDIT}" class="btn btn-default btn-danger" href='index.php?page=indicador_subunidad_valor&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                        <i class="fa fa-pencil-square-o fa-fw"></i> {$smarty.const.TXT_VAL_EDIT}
                    </a>
                {/if}
            </div>
            <div class="btn-group" role="group" aria-label="">
                <a title="{$smarty.const.TXT_VAL_REF}" class="btn btn-default btn-danger" href='index.php?page=valor_referencia_crear&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                    <i class="fa fa-tags fa-fw"></i> {$smarty.const.TXT_VAL_REF}
                </a>
            </div>
            <div class="btn-group" role="group" aria-label="">
                <a title="{$smarty.const.TXT_VOLVER} {$tipo}" class="btn btn-default btn-danger" href='index.php?page={$tipo}_mostrar&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                    <i class="fa fa-arrow-left fa-fw"></i>
                </a>
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
                <span class="panel-title"><i class="fa fa-sitemap fa-fw"></i> {$smarty.const.TXT_UNIDS_MEDS_INDIC}</span>
                <i class="fa fa-chevron-up pull-right clickable"></i>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                {if $indicadores_subunidades}
                    <div class="table-responsive">
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>   
                                    <th>{$smarty.const.FIELD_UNID}</th>
                                    <th>{$smarty.const.FIELD_RESP_GRABAR}</th>
                                    <th>{$smarty.const.FIELD_PUESTO}</th>
                                    <th>{$smarty.const.FIELD_CAMBIO_A}</th>
                                </tr>
                            </thead>
                            <tbody>
                                {foreach from=$indicadores_subunidades item=indicador_subunidad}
                                    <tr>
                                        <td>{$indicador_subunidad->entidad->nombre}</td>
                                        <td>{$indicador_subunidad->usuario->nombre} {$indicador_subunidad->usuario->apellidos}</td>
                                        <td>{$indicador_subunidad->usuario->puesto}</td>
                                        <td>
                                            {if $indicador_subunidad->entidad->usuario}
                                                <select id="{$indicador_subunidad->id}" name="responsable" class="form-control chosen-select identificador">
                                                    <option value="0">{$smarty.const.TXT_SEL_RESP_GRABAR}</option>
                                                    {foreach from=$indicador_subunidad->entidad->usuario item=item}
                                                        {if $item->id_usuario != $indicador_subunidad->id_usuario}
                                                            <option value="{$item->usuario->id}">{$item->usuario->nombre} {$item->usuario->apellidos}</option>
                                                        {/if}
                                                    {/foreach}
                                                </select>
                                            {else}
                                                ---
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
                        {$smarty.const.MSG_MED_NO_ASIG}
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