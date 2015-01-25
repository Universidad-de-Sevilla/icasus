<!--<div class="box grid_16">
    <div class="block">	
        <div class="button_bar clearfix" style="padding:5px;">
           <a href='index.php?page=proceso_listar&id_entidad={$proceso->id_entidad}'>
                <img src='/icons/ff16/cog.png' alt='{$smarty.const.TXT_ICON}'/><span> {$smarty.const.TXT_PROC_LIST}</span></a>&nbsp;&nbsp;
            <a href='index.php?page=proceso_crear&id_entidad={$proceso->id_entidad}'>
                <img src='/icons/ff16/cog_add.png' alt='{$smarty.const.TXT_ICON}' /><span> {$smarty.const.TXT_PROC_CREAR}</span></a>&nbsp;&nbsp;
            <a href='index.php?page=proceso_editar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}'>
                <img src='/icons/ff16/cog_edit.png' alt='{$smarty.const.TXT_ICON}' /><span> {$smarty.const.TXT_PROC_EDIT}</span></a>&nbsp;&nbsp;
            <a href='index.php?page=proceso_borrar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}'
               onClick='return confirmar();'>
                <img src='/icons/ff16/cog_delete.png' alt='{$smarty.const.TXT_ICON}' /><span> {$smarty.const.TXT_PROC_BORRAR}</span></a>&nbsp;&nbsp;
           <a href='index.php?page=indicador_crear&id_entidad={$proceso->id_entidad}'>
                <img src='/icons/ff16/chart_curve_add.png' alt='{$smarty.const.TXT_ICON}' /><span> {$smarty.const.TXT_INDIC_CREAR}</span></a>&nbsp;&nbsp;
            <a href='index.php?page=archivo_gestionar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}'>
                <img src='/icons/ff16/box.png' alt='{$smarty.const.TXT_ICON}' /><span> {$smarty.const.TXT_ARCHIVOS}</span> </a>
        </div>
    </div>
</div>-->

<div class="box grid_16">
    <div class="toggle_container">
        <h2 class="box_head grad_grey_dark">{$smarty.const.TXT_PROC_PARAM}</h2>
        <a href="#" class="grabber"></a>
        <a href="#" class="toggle"></a>
        <div class="block">
            <div class="button_bar clearfix">
                <a href='index.php?page=proceso_editar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}'>
                    <img src='/icons/ff16/cog_edit.png' alt='{$smarty.const.TXT_ICON}' /><span> {$smarty.const.TXT_PROC_EDIT}</span></a>&nbsp;&nbsp;
                <a href='index.php?page=proceso_borrar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}'
                   onClick='return confirmar();'>
                    <img src='/icons/ff16/cog_delete.png' alt='{$smarty.const.TXT_ICON}' /><span> {$smarty.const.TXT_PROC_BORRAR}</span></a>&nbsp;&nbsp;
                <a href='index.php?page=archivo_gestionar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}'>
                    <img src='/icons/ff16/box.png' alt='{$smarty.const.TXT_ICON}' /><span> {$smarty.const.TXT_ARCHIVOS}</span> </a>
            </div>
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_PROC_MADRE}</label>
                <div>
                    {if $proceso_madre->id > 0}
                        {$proceso_madre->codigo} - {$proceso_madre->nombre} 
                        &nbsp; <a href="index.php?page=proceso_mostrar&id_proceso={$proceso_madre->id}&id_entidad={$proceso->id_entidad}">{$smarty.const.TXT_MOSTRAR}</a>
                    {else}
                        {$smarty.const.TXT_PROC_ES_MADRE}
                    {/if}
                </div>
            </fieldset> 
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_NOMBRE}</label>
                <div>
                    <h3>{$proceso->nombre}</h3>
                </div>
            </fieldset> 
            <div class="columns clearfix">
                <div class="col_33">
                    <fieldset>
                        <label>{$smarty.const.FIELD_COD}</label>
                        <div> {$proceso->codigo} </div>
                    </fieldset> 
                </div>
                <div class="col_33">
                    <fieldset>
                        <label>{$smarty.const.FIELD_VERSION}</label>
                        <div> {$proceso->revision} &nbsp; </div>
                    </fieldset>  
                </div>
                <div class="col_33">
                    <fieldset>
                        <label>{$smarty.const.FIELD_FECHA}</label>
                        <div> {$proceso->fecha_revision|date_format:'%d/%m/%Y'} &nbsp; </div>
                    </fieldset>  
                </div>
            </div>
            <div class="columns clearfix">
                <div class="col_50">
                    <fieldset>
                        <label>{$smarty.const.FIELD_PROPIETARIO}</label>
                        <div>
                            {$propietario->nombre} {$propietario->apellidos} 
                            {if $propietario->puesto} - {$propietario->puesto} {/if}
                        </div>
                    </fieldset> 
                </div>
                <div class="col_50">
                    <fieldset>
                        <label>{$smarty.const.FIELD_TIPO_PROC}</label>
                        <div> {$proceso->alcance} </div>
                    </fieldset> 
                </div>
            </div>
            {if $proceso->mision}
                <fieldset class="label_side">
                    <label>{$smarty.const.FIELD_MISION}</label>
                    <div> {$proceso->mision} </div>
                </fieldset>   
            {/if}
            {if $proceso->equipo_de_proceso}
                <fieldset class="label_side">
                    <label>{$smarty.const.FIELD_EQUIP_PROC}</label>
                    <div> {$proceso->equipo_de_proceso} </div>
                </fieldset>      
            {/if}
            {if $proceso->resultados_clave}
                <fieldset class="label_side">
                    <label>{$smarty.const.FIELD_RESULTS_CLAVE}</label>
                    <div> {$proceso->resultados_clave} </div>
                </fieldset>
            {/if}
            {if $proceso->entradas or $proceso->salidas}
                <div class="columns clearfix">
                    <div class="col_50">
                        <fieldset>
                            <label>{$smarty.const.FIELD_ENTRADAS_PROV}</label>
                            <div> {$proceso->entradas} </div>
                        </fieldset>  
                    </div>
                    <div class="col_50">
                        <fieldset>
                            <label>{$smarty.const.FIELD_SALIDAS_CLIENTS}</label>
                            <div> {$proceso->salidas} </div>
                        </fieldset>   
                    </div>
                </div>
            {/if}
            {if $proceso->actividades}
                <fieldset class="label_side">
                    <label>{$smarty.const.FIELD_ACTIVIDADES}</label>
                    <div> {$proceso->actividades} </div>
                </fieldset> 
            {/if}
            {if $proceso->variables_control}
                <fieldset class="label_side">
                    <label>{$smarty.const.FIELD_VARS_CONTROL}</label>
                    <div> {$proceso->variables_control} </div>
                </fieldset> 
            {/if}
            {if $proceso->documentacion}
                <fieldset class="label_side">
                    <label>{$smarty.const.FIELD_DOCUMENTACION}</label>
                    <div> {$proceso->documentacion} </div>
                </fieldset>
            {/if}
            {if $proceso->mediciones}
                <fieldset class="label_side">
                    <label>{$smarty.const.FIELD_MEDICIONES}</label>
                    <div> {$proceso->mediciones} </div>
                </fieldset>   
            {/if}
            {if $proceso->registros}
                <fieldset class="label_side">
                    <label>{$smarty.const.FIELD_REGISTROS}</label>
                    <div> {$proceso->registros} </div>
                </fieldset>    
            {/if}
        </div>
    </div>
</div>

<div class="box grid_16">
    <h2 class="box_head grad_grey_dark">{$smarty.const.TXT_PROC_INDICS}</h2>
    <a href="#" class="grabber"></a>
    <a href="#" class="toggle"></a>
    <div class="block">	
        <div class="button_bar clearfix">
            <a href='index.php?page=proceso_editar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}'>
                <img src='/icons/ff16/cog_edit.png' alt='{$smarty.const.TXT_ICON}' /><span> {$smarty.const.TXT_PROC_EDIT}</span></a>&nbsp;&nbsp;
            <a href='index.php?page=proceso_borrar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}'
               onClick='return confirmar();'>
                <img src='/icons/ff16/cog_delete.png' alt='{$smarty.const.TXT_ICON}' /><span> {$smarty.const.TXT_PROC_BORRAR}</span></a>&nbsp;&nbsp;
            <a href='index.php?page=archivo_gestionar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}'>
                <img src='/icons/ff16/box.png' alt='{$smarty.const.TXT_ICON}' /><span> {$smarty.const.TXT_ARCHIVOS}</span> </a>
        </div>
        {if $indicadores}
            <div id="dt1" class="no_margin">
                <table class="display datatable"> 
                    <thead>
                        <tr>
                            <th>{$smarty.const.FIELD_COD}</th>
                            <th>{$smarty.const.FIELD_INDIC}</th>
                            <th>{$smarty.const.FIELD_RESP}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach from=$indicadores item=indicador} 
                            <tr>
                                <td>{$indicador->codigo}</td>
                                <td>
                                    <a href='index.php?page=indicador_mostrar&id_indicador={$indicador->id}&id_entidad={$proceso->id_entidad}'>{$indicador->nombre}</a>
                                    <a href='#' title='{$indicador->descripcion}'><big>*</big></a>
                                </td>
                                <td>
                                    {$indicador->responsable->nombre} {$indicador->responsable->apellidos}
                                     <!--<a href='index.php?page=usuario_datos&id_usuario={$indicador->id_responsable}'></a>-->
                                </td>
                            </tr>
                        {/foreach}
                    </tbody>
                </table>
            </div>
        {else}
            <div class='alert alert_blue'>
                <img height="24" width="24" src="theme/danpin/images/icons/small/white/alert_2.png"> 
                {$smarty.const.MSG_PROC_NO_INDIC}
            </div>
        {/if}
    </div>
</div>

{if isset($flujograma)}
    <div class="box grid_16">
        <h2 class="box_head grad_grey_dark">{$smarty.const.TXT_PROC_FLUJO}</h2>
        <a href="#" class="grabber"></a>
        <a href="#" class="toggle"></a>
        <div class="block">
            <div class="button_bar clearfix">
                <a href='index.php?page=proceso_editar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}'>
                    <img src='/icons/ff16/cog_edit.png' alt='{$smarty.const.TXT_ICON}' /><span> {$smarty.const.TXT_PROC_EDIT}</span></a>&nbsp;&nbsp;
                <a href='index.php?page=proceso_borrar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}'
                   onClick='return confirmar();'>
                    <img src='/icons/ff16/cog_delete.png' alt='{$smarty.const.TXT_ICON}' /><span> {$smarty.const.TXT_PROC_BORRAR}</span></a>&nbsp;&nbsp;
                <a href='index.php?page=archivo_gestionar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}'>
                    <img src='/icons/ff16/box.png' alt='{$smarty.const.TXT_ICON}' /><span> {$smarty.const.TXT_ARCHIVOS}</span> </a>
            </div>
            <p align="center"><img src="index.php?page=archivo_descargar&id={$flujograma->id}" alt="{$smarty.const.TXT_PROC_FLUJO}" /></p>
        </div>
    </div> <!-- .box .grid_16 -->
{/if}

{if isset($archivos)}
    <div class="box grid_16">
        <h2 class="box_head grad_grey_dark">{$smarty.const.TXT_PROC_ARCHIVOS}</h2>
        <a href="#" class="grabber"></a>
        <a href="#" class="toggle"></a>
        <div class="block">
            <div class="button_bar clearfix">
                <a href='index.php?page=proceso_editar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}'>
                    <img src='/icons/ff16/cog_edit.png' alt='{$smarty.const.TXT_ICON}' /><span> {$smarty.const.TXT_PROC_EDIT}</span></a>&nbsp;&nbsp;
                <a href='index.php?page=proceso_borrar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}'
                   onClick='return confirmar();'>
                    <img src='/icons/ff16/cog_delete.png' alt='{$smarty.const.TXT_ICON}' /><span> {$smarty.const.TXT_PROC_BORRAR}</span></a>&nbsp;&nbsp;
                <a href='index.php?page=archivo_gestionar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}'>
                    <img src='/icons/ff16/box.png' alt='{$smarty.const.TXT_ICON}' /><span> {$smarty.const.TXT_ARCHIVOS}</span> </a>
            </div>
            <div id="dt1" class="no_margin">
                <table class="display datatable"> 
                    <thead>
                        <tr>
                            <th>{$smarty.const.FIELD_TITULO}</th>
                            <th>{$smarty.const.FIELD_USER}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach from=$archivos item=archivo} 
                            <tr>
                                <td><a href="index.php?page=archivo_descargar&id={$archivo->id}">{$archivo->titulo|htmlentities}</a> 
                                    {if $archivo->descripcion != NULL}<a href='#' title='{$archivo->descripcion}'><big>*</big></a>{/if}
                                </td>
                                <td>{$archivo->usuario->nombre|htmlentities} {$archivo->usuario->apellidos|htmlentities}</td>
                            </tr>
                        {/foreach}
                    </tbody>
                </table>
            </div>
        </div>
    </div>	
{/if}

{if $subprocesos}
    <div class="box grid_16">
        <h2 class="box_head grad_grey_dark">{$smarty.const.FIELD_SUBPROCS}</h2>
        <a href="#" class="grabber"></a>
        <a href="#" class="toggle"></a>
        <div class="block">
            <div class="button_bar clearfix">
                <a href='index.php?page=proceso_editar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}'>
                    <img src='/icons/ff16/cog_edit.png' alt='{$smarty.const.TXT_ICON}' /><span> {$smarty.const.TXT_PROC_EDIT}</span></a>&nbsp;&nbsp;
                <a href='index.php?page=proceso_borrar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}'
                   onClick='return confirmar();'>
                    <img src='/icons/ff16/cog_delete.png' alt='{$smarty.const.TXT_ICON}' /><span> {$smarty.const.TXT_PROC_BORRAR}</span></a>&nbsp;&nbsp;
                <a href='index.php?page=archivo_gestionar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}'>
                    <img src='/icons/ff16/box.png' alt='{$smarty.const.TXT_ICON}' /><span> {$smarty.const.TXT_ARCHIVOS}</span> </a>
            </div>
            <div id="dt1" class="no_margin">
                <table class="display datatable"> 
                    <thead>
                        <tr>
                            <th>{$smarty.const.FIELD_SUBPROC}</th>
                            <th>{$smarty.const.FIELD_NOMBRE}</th>
                            <th>{$smarty.const.FIELD_PROPIETARIO}</th>
                            <th>{$smarty.const.FIELD_ACCIONES}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach from=$subprocesos item=subproceso}
                            <tr>
                                <td>{$subproceso->codigo}</td>
                                <td>{$subproceso->nombre}</td>
                                <td>{$subproceso->propietario->nombre} {$subproceso->propietario->apellidos}</td>
                                <td><a href="index.php?page=proceso_mostrar&id_proceso={$subproceso->id}&id_entidad={$subproceso->id_entidad}">{$smarty.const.TXT_VER}</a>
                                    - <a href="index.php?page=proceso_editar&id_proceso={$subproceso->id}&id_entidad={$subproceso->id_entidad}">{$smarty.const.TXT_EDIT}</a>
                                    - <a href='index.php?page=proceso_borrar&id_proceso={$subproceso->id}&id_entidad={$subproceso->id_entidad}'
                                         onClick='return confirmar();'>{$smarty.const.TXT_BORRAR}</a></td>
                            </tr>
                        {/foreach}
                    </tbody>
                </table>
            </div>
        </div>
    </div>		
{/if}
