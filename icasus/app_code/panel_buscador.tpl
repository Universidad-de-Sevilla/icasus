{if $modulo == 'periodicidad'}
    <div id="periodicidad_etiquetas" class="form-group hidden">
        <label for="id_medicion" class="col-sm-2 control-label">{$smarty.const.TXT_POR_MEDICION} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
        <div class="col-sm-3">
            <select id="id_medicion" required name="id_medicion" class="form-control chosen-select">
                {foreach from=$mediciones item=medicion}
                    <option value="{$medicion->id}">{$medicion->etiqueta}</option>
                {/foreach}
            </select>
            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
            <div class="help-block with-errors"></div>
        </div>  
    </div>
    <div id="periodicidad_años" class="form-group hidden">
        <label for="fecha" class="col-sm-2 control-label">{$smarty.const.TXT_POR_ANYO} <i title="{$smarty.const.MSG_CAMPO_REQ}" class="fa fa-asterisk fa-fw"></i></label>
        <div class="col-sm-3">
            <select id="fecha" required  name="fecha" class="form-control chosen-select">
                {foreach from=$anos item=ano}
                    <option value="{$ano->periodo_inicio|date_format:"%Y"}">{$ano->periodo_inicio|date_format:"%Y"}</option>
                {/foreach}
            </select>
            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
            <div class="help-block with-errors"></div>
        </div>    
    </div>
{/if}

{if $modulo == 'indicador_barra_base'}
    <div class="col-sm-8 col-sm-offset-2 " style="overflow-y: auto;height: 30vh;">
        {if $indicadores}
            <ul class="list-unstyled">
                {foreach from=$indicadores item=item}
                    <li>
                        <div class="radio">
                            <label>
                                <input data-id_entidad="{$id_entidad}" data-id_indicador="{$item->id}"
                                       data-nombre_indicador="{$item->nombre}" class="indicador_base_seleccionado_barra" type="radio" 
                                       name="id_indicador" value="{$item->id}" required> 
                                {$item->nombre}
                            </label>
                        </div>
                    </li>
                {/foreach}
            </ul>
            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
            <div class="help-block with-errors"></div>
        {else}
            <div class="alert alert-info alert-dismissible">
                <i class="fa fa-info-circle fa-fw"></i> 
                {$smarty.const.MSG_INDIC_NO_ENC}
            </div>
        {/if}
    </div>
{/if}

{if $modulo == 'indicadores_barra_complementarios'}
    <div class="col-sm-8 col-sm-offset-2 " style="overflow-y: auto;height: 30vh;">
        {if $indicadores}
            <ul class="list-unstyled">
                {foreach from=$indicadores item=item}
                    <li>
                        <div class="radio">
                            <label>
                                <input data-id_entidad="{$id_entidad}" data-id_indicador="{$item->id}"
                                       data-nombre_indicador="{$item->nombre}" class="indicador_complementario_seleccionado_barra" type="radio" 
                                       name="id_indicador" value="{$item->id}"> 
                                {$item->nombre}
                            </label>
                        </div>
                    </li>
                {/foreach}
            </ul>
        {else}
            <div class="alert alert-info alert-dismissible">
                <i class="fa fa-info-circle fa-fw"></i> 
                {$smarty.const.MSG_INDIC_NO_ENC}
            </div>
        {/if}
    </div>
{/if}

{if $modulo == 'indicadores_linea'}
    <div class="col-sm-8 col-sm-offset-2 " style="overflow-y: auto;height: 30vh;">
        {if $indicadores}
            <ul class="list-unstyled">
                {foreach from=$indicadores item=item}
                    <li>
                        <div class="radio">
                            <label>
                                <input data-id_entidad="{$id_entidad}" data-id_indicador="{$item->id}"
                                       data-nombre_indicador="{$item->nombre}" class="indicador_seleccionado_linea" type="radio" 
                                       name="id_indicador" value="{$item->id}" required> 
                                {$item->nombre}
                            </label>
                        </div>
                    </li>
                {/foreach}
            </ul>
            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
            <div class="help-block with-errors"></div>
        {else}
            <div class="alert alert-info alert-dismissible">
                <i class="fa fa-info-circle fa-fw"></i> 
                {$smarty.const.MSG_INDIC_NO_ENC}
            </div>
        {/if}
    </div>
{/if}

{if $modulo == 'indicador_tarta'}
    <div class="col-sm-8 col-sm-offset-2 " style="overflow-y: auto;height: 30vh;">
        {if $indicadores}
            <ul class="list-unstyled">
                {foreach from=$indicadores item=item}
                    <li>
                        <div class="radio">
                            <label>
                                <input data-id_entidad="{$id_entidad}" data-id_indicador="{$item->id}"
                                       class="indicador_seleccionado_tarta" type="radio" 
                                       name="id_indicador" value="{$item->id}" required> 
                                {$item->nombre}
                            </label>
                        </div>
                    </li>
                {/foreach}
            </ul>
            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
            <div class="help-block with-errors"></div>
        {else}
            <div class="alert alert-info alert-dismissible">
                <i class="fa fa-info-circle fa-fw"></i> 
                {$smarty.const.MSG_INDIC_NO_ENC}
            </div>
        {/if}
    </div>
{/if}

{if $modulo == 'indicador_metrica'}
    <div class="col-sm-8 col-sm-offset-2 " style="overflow-y: auto;height: 30vh;">
        {if $indicadores}
            <ul class="list-unstyled">
                {foreach from=$indicadores item=item}
                    <li>
                        <div class="radio">
                            <label>
                                <input data-id_entidad="{$id_entidad}" data-id_indicador="{$item->id}"
                                       class="indicador_seleccionado_metrica" type="radio" 
                                       name="id_indicador" value="{$item->id}" required> 
                                {$item->nombre}
                            </label>
                        </div>
                    </li>
                {/foreach}
            </ul>
            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
            <div class="help-block with-errors"></div>
        {else}
            <div class="alert alert-info alert-dismissible">
                <i class="fa fa-info-circle fa-fw"></i> 
                {$smarty.const.MSG_INDIC_NO_ENC}
            </div>
        {/if}
    </div>
{/if}

{if $modulo == 'indicador_subunidades'}
    <div class="col-sm-8 col-sm-offset-2 " style="overflow-y: auto;height: 30vh;">
        {if $indicadores}
            <ul class="list-unstyled">
                {foreach from=$indicadores item=item}
                    <li>
                        <div class="radio">
                            <label>
                                <input data-id_entidad="{$id_entidad}" data-id_indicador="{$item->id}"
                                       class="indicador_seleccionado" type="radio" 
                                       name="id_indicador" value="{$item->id}" required> 
                                {$item->nombre}
                            </label>
                        </div>
                    </li>
                {/foreach}
            </ul>
            <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
            <div class="help-block with-errors"></div>
        {else}
            <div class="alert alert-info alert-dismissible">
                <i class="fa fa-info-circle fa-fw"></i> 
                {$smarty.const.MSG_INDIC_NO_ENC}
            </div>
        {/if}
    </div>
{/if}

<script src="js/panel_buscador.js"></script>