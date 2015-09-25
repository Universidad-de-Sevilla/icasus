<!-- Diálogo Confirmar Borrado -->
<div class="modal fade" id="dialogo_confirmar_borrado" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h3 class="modal-title" id="myModalLabel"><i class="fa fa-trash fa-fw"></i> {$smarty.const.TXT_MED_BORRAR}: {$medicion->etiqueta}</h3>
            </div>
            <div class="modal-body">
                <p>{$smarty.const.MSG_MED_CONFIRM_BORRAR}</p>
            </div>
            <div class="modal-footer">
                <button type="button" title="{$smarty.const.TXT_NO}" class="btn btn-default btn-danger" data-dismiss="modal"><i class="fa fa-times fa-fw"></i> {$smarty.const.TXT_NO}</button>
                <a title="{$smarty.const.TXT_SI}" class="btn btn-default btn-success" name="borrar" id="borrar" href='index.php?page=medicion_borrar&id_medicion={$medicion->id}&tipo={$tipo}&id_entidad={$indicador->id_entidad}'><i class="fa fa-check fa-fw"></i> {$smarty.const.TXT_SI}</a>
            </div>
        </div>
    </div>
</div>
<!-- /Diálogo Confirmar Borrado -->

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
                {if !$indicador->calculo && $permiso_editar}
                    <a title="{$smarty.const.TXT_VAL_EDIT}" class="btn btn-default btn-danger" href='index.php?page=indicador_subunidad_valor&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                        <i class="fa fa-pencil-square-o fa-fw"></i> {$smarty.const.TXT_VAL_EDIT}
                    </a>
                {/if}
                {if $permiso_editar}
                    <a class="btn btn-default btn-danger" title="{$smarty.const.TXT_MED_BORRAR}" href='javascript:void(0)' data-toggle="modal" data-target="#dialogo_confirmar_borrado">
                        <i class="fa fa-trash fa-fw"></i> {$smarty.const.TXT_MED_BORRAR}
                    </a>
                {/if}
            </div>
            <div class="btn-group" role="group" aria-label="">
                <a title="{$smarty.const.TXT_VAL_REF}" class="btn btn-default btn-danger" href='index.php?page=valor_referencia_crear&id_indicador={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                    <i class="fa fa-tags fa-fw"></i> {$smarty.const.TXT_VAL_REF}
                </a>
            </div>
            <div class="btn-group" role="group" aria-label="">
                <a title="{$smarty.const.TXT_MED_VOLVER}" class="btn btn-default btn-danger" href='index.php?page=medicion_listar&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                    <i class="fa fa-arrow-left fa-fw"></i> {$smarty.const.TXT_MED_VOLVER}
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

<!-- Navegación -->
{if count($mediciones)> 1}
    <div class="row">
        <div class="col-lg-12">
            <div class="btn-toolbar" role="toolbar" aria-label="">
                <div class="btn-group" role="group" aria-label="">
                    <a title="{$smarty.const.TXT_PRIMER}" class="btn btn-default btn-danger {if $indice == 0}disabled{/if}" href='index.php?page=medicion_editar&id_entidad={$entidad->id}&id_medicion={$mediciones[0]->id}&tipo={$tipo}'>
                        <i class="fa fa-step-backward fa-fw"></i> {$smarty.const.TXT_PRIMER}
                    </a>
                    <a title="{$smarty.const.TXT_ANT}" class="btn btn-default btn-danger {if $indice == 0}disabled{/if}" href='index.php?page=medicion_editar&id_entidad={$entidad->id}&id_medicion={$mediciones[$indice-1]->id}&tipo={$tipo}'>
                        <i class="fa fa-play fa-rotate-180 fa-fw"></i> {$smarty.const.TXT_ANT}
                    </a>
                    <a title="{$smarty.const.TXT_SIG}" class="btn btn-default btn-danger {if $indice == (count($mediciones)-1)}disabled{/if}" href='index.php?page=medicion_editar&id_entidad={$entidad->id}&id_medicion={$mediciones[$indice+1]->id}&tipo={$tipo}'>
                        <i class="fa fa-play fa-fw"></i> {$smarty.const.TXT_SIG}
                    </a>
                    <a title="{$smarty.const.TXT_ULTIMO}" class="btn btn-default btn-danger {if $indice == (count($mediciones)-1)}disabled{/if}" href='index.php?page=medicion_editar&id_entidad={$entidad->id}&id_medicion={$mediciones[(count($mediciones)-1)]->id}&tipo={$tipo}'>
                        <i class="fa fa-step-forward fa-fw"></i> {$smarty.const.TXT_ULTIMO}
                    </a>
                </div>
            </div>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <br>
{/if}
<!-- /Navegación -->

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
                <span class="panel-title"><i class="fa fa-clock-o fa-fw"></i> {$smarty.const.TXT_MED_DATOS}</span>
                <i class="fa fa-chevron-up pull-right clickable"></i>
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <!-- Parámetros de la medición -->
                <div class="col-lg-6">
                    <table class="table table-striped table-hover">
                        <tbody>
                            <tr>
                                <th>{$smarty.const.FIELD_ETIQUETA}</th>
                                <td>
                                    {if $permiso_editar == true && !$indicador->calculo}
                                        <div>
                                            <span id="et">
                                                <a href="javascript:void(0)" onclick="javascript:etiqueta_editar('{$medicion->id}', 'et', 'etiqueta');">{if $medicion->etiqueta != NULL}{$medicion->etiqueta}{else}---{/if}</a>
                                            </span>
                                        </div>
                                    {else}
                                        <div>{$medicion->etiqueta}</div>
                                    {/if}
                                </td>
                            </tr>
                            <tr>
                                <th>{$smarty.const.FIELD_OBSERV}</th>
                                <td>
                                    {if $permiso_editar == true}
                                        <div>
                                            <span id="ob">
                                                <a href="javascript:void(0)" onclick="javascript:observaciones_editar('{$medicion->id}', 'ob', 'observaciones');">{if $medicion->observaciones != ''}{$medicion->observaciones}{else}---{/if}</a>
                                            </span>
                                        </div>
                                    {else}
                                        <div>{if $medicion->observaciones != ''}{$medicion->observaciones}{else}---{/if}</div>
                                    {/if}
                                </td>
                            </tr>
                            <tr>
                                <th>{$smarty.const.FIELD_INICIO_PERIODO}</th>
                                <td>
                                    {if $permiso_editar == true && !$indicador->calculo}
                                        <div>
                                            <span id="pi">
                                                <a href="javascript:void(0)" onclick="fecha_editar('{$medicion->id}', 'pi');">
                                                    {if $medicion->periodo_inicio}
                                                        {$medicion->periodo_inicio|date_format:"%d-%m-%Y"}
                                                    {else}
                                                        ---
                                                    {/if}
                                                </a>
                                            </span>
                                        </div>
                                    {else}
                                        <div>{$medicion->periodo_inicio|date_format:"%d-%m-%Y"}</div>
                                    {/if}
                                </td>
                            </tr>
                            <tr>
                                <th>{$smarty.const.FIELD_FIN_PERIODO}</th>
                                <td>
                                    {if $permiso_editar == true && !$indicador->calculo}
                                        <div>
                                            <span id="pf">
                                                <a href="javascript:void(0)" onclick="fecha_editar('{$medicion->id}', 'pf');">
                                                    {if $medicion->periodo_fin}
                                                        {$medicion->periodo_fin|date_format:"%d-%m-%Y"}
                                                    {else}
                                                        ---
                                                    {/if}
                                                </a>
                                            </span>
                                        </div>
                                    {else}
                                        <div>{$medicion->periodo_fin|date_format:"%d-%m-%Y"}</div>
                                    {/if}
                                </td>
                            </tr>

                            <tr>
                                <th>{$smarty.const.FIELD_INICIO_GRABACION}</th>
                                <td>
                                    {if $permiso_unidad == true && !$indicador->calculo}
                                        <div>
                                            <span id="gi" data-grabacion_inicio="{$medicion->grabacion_inicio}">
                                                <a href="javascript:void(0)" onclick="fecha_editar('{$medicion->id}', 'gi');">
                                                    {if $medicion->grabacion_inicio}
                                                        {$medicion->grabacion_inicio|date_format:"%d-%m-%Y"}
                                                    {else}
                                                        ---
                                                    {/if}
                                                </a>
                                            </span>
                                        </div>
                                    {else}
                                        <div>{$medicion->grabacion_inicio|date_format:"%d-%m-%Y"}</div>
                                    {/if}
                                </td>
                            </tr>
                            <tr>
                                <th>{$smarty.const.FIELD_FIN_GRABACION}</th>
                                <td>
                                    {if $permiso_unidad == true && !$indicador->calculo}
                                        <div>
                                            <span id="gf" data-grabacion_fin="{$medicion->grabacion_fin}">
                                                <a href="javascript:void(0)" onclick="fecha_editar('{$medicion->id}', 'gf');">
                                                    {if $medicion->grabacion_fin}
                                                        {$medicion->grabacion_fin|date_format:"%d-%m-%Y"}
                                                    {else}
                                                        ---
                                                    {/if}
                                                </a>
                                            </span>
                                        </div>
                                    {else}
                                        <div>{$medicion->grabacion_fin|date_format:"%d-%m-%Y"}</div>
                                    {/if}
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- /.col-lg-6 -->
                <!-- /Parámetros de la medición -->
                <!-- Gráfica de tarta -->
                <div class="col-lg-6">

                    <div id="grafica" style="margin:10px;">
                        {if $pinta_grafico}
                            <div class="block">
                                <div class="titulo-panel">
                                    <strong>{$panel->nombre}</strong>&nbsp;{$smarty.const.TXT_GRAFICO_AUMENTAR}
                                </div>
                                <div class="section">
                                    <div id="container" 
                                         data-id_indicador="{$indicador->id}" 
                                         data-nombre_indicador="{$indicador->nombre}" 
                                         data-id_medicion="{$medicion->id}">
                                    </div>
                                </div>
                            </div>
                        {else}
                            <div class="alert alert_blue">
                                <img height="24" width="24" src="theme/danpin/images/icons/small/white/alert_2.png">
                                {$smarty.const.MSG_VAL_NO_ASIG}
                            </div>
                        {/if}
                    </div>

                </div>
                <!-- /.col-lg-6 -->
                <!-- /Gráfica de tarta -->
            </div>
            <!-- /.panel-body -->        
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="box grid_16">
    <h2 class="box_head grad_grey_dark">{$smarty.const.TXT_MED_DATOS}</h2>
    <a href="#" class="grabber"></a>
    <a href="#" class="toggle"></a>
    <div class="toggle_container">
        <div class="box grid_8">
            <div class="block" style="margin:10px;">
                {if isset($valores_referencia_medicion)}
                    {foreach $valores_referencia_medicion as $valor_referencia_medicion}
                        {if $valor_referencia_medicion->valor_referencia->activo}
                            <fieldset class="label_side">
                                <label>{$valor_referencia_medicion->valor_referencia->etiqueta}</label>
                                {if $permiso_editar == true}
                                    <div>
                                        <span id="referencia_{$valor_referencia_medicion->id}">
                                            <a href="javascript:void(0)" onclick="referencia_editar('{$valor_referencia_medicion->id}');">
                                                {if $valor_referencia_medicion->valor == NULL}
                                                    ---
                                                {else}
                                                    {$valor_referencia_medicion->valor|round:"2"}
                                                {/if}
                                            </a>
                                        </span>
                                    </div>
                                {else}
                                    <div>  
                                        {if $valor_referencia_medicion->valor == NULL}
                                            ---
                                        {else}
                                            {$valor_referencia_medicion->valor|round:"2"}
                                        {/if}
                                    </div>
                                {/if}
                            </fieldset>
                        {/if}
                    {/foreach}
                {else}
                    <fieldset class="label_side">
                        <div>{$smarty.const.MSG_INDIC_NO_VAL_REF}</div>
                    </fieldset>
                {/if}
            </div>
        </div>
    </div>
</div>

<div class="box grid_16">
    <h2 class="box_head grad_grey_dark">{$smarty.const.TXT_MED_VALORES}</h2>
    <a href="#" class="grabber"></a>
    <a href="#" class="toggle"></a>
    <div class="toggle_container">
        <div class="button_bar clearfix">
                <!--<a href="index.php?page=medicion_generar&id_{$tipo}={$indicador->id}" onclick="return confirm('{$smarty.const.MSG_MED_GENERAR}');">
                    <img src='/icons/ff16/time_go.png' /> {$smarty.const.TXT_MED_GENERAR}
                </a>&nbsp;&nbsp;
                <a href="index.php?page=medicion_crear&id_{$tipo}={$indicador->id}"><img src='/icons/ff16/time_add.png' /> {$smarty.const.TXT_MED_AGREGAR}
                </a>&nbsp;&nbsp;-->
            {if !$indicador->calculo}
                <a href='index.php?page=indicador_subunidad_valor&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'>
                    <img src='/icons/ff16/tag_blue_edit.png' /> {$smarty.const.TXT_VAL_EDIT}
                </a>&nbsp;&nbsp;
            {/if}
            {if $permiso_editar}
                <a class='confirmar' href='index.php?page=medicion_borrar&id_medicion={$medicion->id}&tipo={$tipo}&id_entidad={$indicador->id_entidad}'>
                    <img src='/icons/ff16/time_delete.png' /> {$smarty.const.TXT_MED_BORRAR}
                </a>&nbsp;&nbsp;
            {/if}
            <a href='index.php?page=valor_referencia_crear&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'><img 
                    src='/icons/ff16/tag.png' /> {$smarty.const.TXT_VAL_REF}
            </a>&nbsp;&nbsp;
            <a href='index.php?page=medicion_listar&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'><img src='/icons/ff16/time.png' /> {$smarty.const.TXT_MED_VOLVER}</a>&nbsp;&nbsp;
            <a href='index.php?page={$tipo}_mostrar&id_{$tipo}={$indicador->id}&id_entidad={$indicador->id_entidad}'><img src='/icons/ff16/chart_curve.png' /> {$smarty.const.TXT_VOLVER} {$tipo}</a>&nbsp;&nbsp;
        </div> 
        {if $valores}
            <div id="valors" data-valor_min="{$indicador->valor_min}" data-valor_max="{$indicador->valor_max}">
                <table class="static">
                    <thead>
                        <tr>
                            <th>{$smarty.const.FIELD_UNID}</th>
                            <th>{$smarty.const.FIELD_VAL}</th>
                            <th>{$smarty.const.FIELD_STATUS}</th>
                            <th>{$smarty.const.FIELD_FECHA_RECOGIDA}</th>
                            <th>{$smarty.const.FIELD_USER_GRABA}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach $valores as $valor}
                            {*El indicador/dato es agregado pero por si se calcula por mediana nos cercioramos de no
                            listar la Unidad madre en orden, la pondremos al final*}
                            {if $valor->id_entidad!=$entidad->id && $indicador->id_tipo_agregacion!= 0}
                                <tr>
                                    <td>{$valor->entidad->etiqueta}</td>
                                    <td>
                                        {if $permiso_editar && !$indicador->calculo}
                                            <a href="javascript:void(0)" onclick="fila_editar('{$medicion->id}', '{$valor->id}');">
                                                {if $valor->valor == NULL}
                                                    ---
                                                {else}
                                                    {$valor->valor|round:"2"}
                                                {/if}
                                            </a>
                                        {else}
                                            {if $valor->valor == NULL}
                                                ---
                                            {else}
                                                {$valor->valor|round:"2"}
                                            {/if}
                                        {/if}
                                    </td>
                                    <td style="text-align: center"> 
                                        ---
                                    </td>
                                    <td>{$valor->fecha_recogida|date_format:"%d-%m-%Y"}</td>
                                    <td>{$valor->usuario->nombre} {$valor->usuario->apellidos}</td>  
                                </tr>
                            {/if}
                            {*El indicador/dato es no agregado*}
                            {if $indicador->id_tipo_agregacion== 0}
                                <tr>
                                    <td>{$valor->entidad->etiqueta}</td>
                                    <td>
                                        {if $permiso_editar && !$indicador->calculo}
                                            <a href="javascript:void(0)" onclick="fila_editar('{$medicion->id}', '{$valor->id}');">
                                                {if $valor->valor == NULL}
                                                    ---
                                                {else}
                                                    {$valor->valor|round:"2"}
                                                {/if}
                                            </a>
                                        {else}
                                            {if $valor->valor == NULL}
                                                ---
                                            {else}
                                                {$valor->valor|round:"2"}
                                            {/if}
                                        {/if}
                                    </td>
                                    <td style="text-align: center"> 
                                        {if $valor->valor != NULL}
                                            {if isset($medicion_lim) AND isset($medicion_obj)}
                                                {if  $valor->valor < $medicion_lim}
                                                    <img src='/icons/ff16/bullet_red.png' />
                                                {else if $valor->valor >= $medicion_obj}
                                                    <img src='/icons/ff16/bullet_green.png' />
                                                {else}
                                                    <img src='/icons/ff16/bullet_yellow.png' />
                                                {/if}
                                            {else if isset($medicion_obj)}
                                                {if $valor->valor >= $medicion_obj }
                                                    <img src='/icons/ff16/bullet_green.png' />
                                                {else}
                                                    <img src='/icons/ff16/bullet_red.png' />
                                                {/if}
                                            {else if isset($medicion_lim)}
                                                {if $valor->valor < $medicion_lim }
                                                    <img src='/icons/ff16/bullet_red.png' />
                                                {else}
                                                    <img src='/icons/ff16/bullet_green.png' />
                                                {/if}
                                            {else}
                                                ---
                                            {/if}
                                        {else}
                                            ---
                                        {/if}
                                    </td>
                                    <td>{$valor->fecha_recogida|date_format:"%d-%m-%Y"}</td>
                                    <td>{$valor->usuario->nombre} {$valor->usuario->apellidos}</td>  
                                </tr>
                            {/if}
                        {/foreach}
                        <!-- TOTALES -->
                        {*El indicador/dato es agregado y no se calcula por mediana*}
                        {if $indicador->id_tipo_agregacion!= 0 && $indicador->id_tipo_agregacion!= 4}
                            <tr style="font-weight: bold">
                                <td style="border-left:solid 2px #BF2453;border-top:solid 2px #BF2453;border-bottom:solid 2px #BF2453;">{$smarty.const.FIELD_TOTAL}: {$entidad->nombre} ({$agregacion})</td>
                                <td style="border-top:solid 2px #BF2453;border-bottom:solid 2px #BF2453">
                                    {if $total === NULL}
                                        ---
                                    {else}
                                        {$total|round:"2"}
                                    {/if}
                                </td>
                                <td style="text-align: center;border-top:solid 2px #BF2453;border-bottom:solid 2px #BF2453"> 
                                    {if $total != NULL}
                                        {if isset($medicion_lim) AND isset($medicion_obj)}
                                            {if  $total < $medicion_lim}
                                                <img src='/icons/ff16/bullet_red.png' />
                                            {else if $total >= $medicion_obj}
                                                <img src='/icons/ff16/bullet_green.png' />
                                            {else}
                                                <img src='/icons/ff16/bullet_yellow.png' />
                                            {/if}
                                        {else if isset($medicion_obj)}
                                            {if $total >= $medicion_obj }
                                                <img src='/icons/ff16/bullet_green.png' />
                                            {else}
                                                <img src='/icons/ff16/bullet_red.png' />
                                            {/if}
                                        {else if isset($medicion_lim)}
                                            {if $total < $medicion_lim }
                                                <img src='/icons/ff16/bullet_red.png' />
                                            {else}
                                                <img src='/icons/ff16/bullet_green.png' />
                                            {/if}
                                        {else}
                                            ---
                                        {/if}
                                    {else}
                                        ---
                                    {/if}
                                </td>
                                <td style="border-top:solid 2px #BF2453;border-bottom:solid 2px #BF2453">---</td>
                                <td style="border-right:solid 2px #BF2453;border-top:solid 2px #BF2453;border-bottom:solid 2px #BF2453">---</td>  
                            </tr>
                        {/if}
                        {*El indicador/dato es agregado y se calcula por mediana*}
                        {if $indicador->id_tipo_agregacion!= 0 && $indicador->id_tipo_agregacion== 4}
                            {foreach $valores as $valor}
                                {if $valor->id_entidad==$entidad->id}
                                    <tr style="font-weight: bold">
                                        <td style="border-left:solid 2px #BF2453;border-top:solid 2px #BF2453;border-bottom:solid 2px #BF2453;">{$smarty.const.FIELD_TOTAL}: {$entidad->nombre} ({$agregacion})</td>
                                        <td style="border-top:solid 2px #BF2453;border-bottom:solid 2px #BF2453">
                                            {if $permiso_editar && !$indicador->calculo}
                                                <a href="javascript:void(0)" onclick="fila_editar('{$medicion->id}', '{$valor->id}');">
                                                    {if $valor->valor == NULL}
                                                        ---
                                                    {else}
                                                        {$valor->valor|round:"2"}
                                                    {/if}
                                                </a>
                                            {else}
                                                {if $valor->valor == NULL}
                                                    ---
                                                {else}
                                                    {$valor->valor|round:"2"}
                                                {/if}
                                            {/if}
                                        </td>
                                        <td style="text-align: center;border-top:solid 2px #BF2453;border-bottom:solid 2px #BF2453"> 
                                            {if $valor->valor != NULL}
                                                {if isset($medicion_lim) AND isset($medicion_obj)}
                                                    {if  $valor->valor < $medicion_lim}
                                                        <img src='/icons/ff16/bullet_red.png' />
                                                    {else if $valor->valor >= $medicion_obj}
                                                        <img src='/icons/ff16/bullet_green.png' />
                                                    {else}
                                                        <img src='/icons/ff16/bullet_yellow.png' />
                                                    {/if}
                                                {else if isset($medicion_obj)}
                                                    {if $valor->valor >= $medicion_obj }
                                                        <img src='/icons/ff16/bullet_green.png' />
                                                    {else}
                                                        <img src='/icons/ff16/bullet_red.png' />
                                                    {/if}
                                                {else if isset($medicion_lim)}
                                                    {if $valor->valor < $medicion_lim }
                                                        <img src='/icons/ff16/bullet_red.png' />
                                                    {else}
                                                        <img src='/icons/ff16/bullet_green.png' />
                                                    {/if}
                                                {else}
                                                    ---
                                                {/if}
                                            {else}
                                                ---
                                            {/if}
                                        </td>
                                        <td style="border-top:solid 2px #BF2453;border-bottom:solid 2px #BF2453">
                                            {$valor->fecha_recogida|date_format:"%d-%m-%Y"}
                                        </td>
                                        <td style="border-right:solid 2px #BF2453;border-top:solid 2px #BF2453;border-bottom:solid 2px #BF2453">
                                            {$valor->usuario->nombre} {$valor->usuario->apellidos}
                                        </td>  
                                    </tr>
                                {/if}
                            {/foreach}
                        {/if}
                        <!-- //TOTALES -->
                    </tbody>
                </table>
            </div>
        {else}
            <div class="alert alert_red">{$smarty.const.ERR_MED_NO_VAL}</div>
        {/if}
    </div>
</div>
