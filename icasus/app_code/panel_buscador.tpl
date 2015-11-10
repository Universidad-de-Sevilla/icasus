{if $modulo == 'periodicidad'}
    <span id="periodicidad_etiquetas" style="display:none">
        {$smarty.const.TXT_POR_MEDICION}:
        <select required name="id_medicion">
            <option value="">{$smarty.const.TXT_SEL_UNO}</option>
            {foreach from=$mediciones item=medicion}
                <option value="{$medicion->id}">{$medicion->etiqueta}</option>
            {/foreach}
        </select>
    </span>
    <span id="periodicidad_años" style="display:none">
        {$smarty.const.TXT_POR_ANYOS}:
        <select required  name="fecha">
            <option value="">{$smarty.const.TXT_SEL_UNO}</option>
            {foreach from=$anos item=ano}
                <option value="{$ano->periodo_inicio|date_format:"%Y"}">{$ano->periodo_inicio|date_format:"%Y"}</option>
            {/foreach}
        </select>
    </span>
{/if}

{if $modulo == 'indicador_barra_base'}
    <div class="clearfix">
        <ul style="list-style:none">
            {if $indicadores}
                {foreach from=$indicadores item=item}
                    <li>
                        <input data-id_entidad="{$id_entidad}" data-nombre_indicador="{$item->nombre}" 
                               data-id_indicador="{$item->id}"	class="required indicador_base_seleccionado_barra" 
                               type="radio" 	name="id_indicador" value="{$item->id}"> 
                        {$item->nombre}
                    </li>
                {/foreach}
            {else}
                <li><span class="text error">{$smarty.const.MSG_INDIC_NO_ENC}</span></li>
                {/if}
        </ul>
    </div>
    <div class="required_tag tooltip hover left"></div>
{/if}

{if $modulo == 'indicadores_barra_complementarios'}
    <div class="clearfix">
        <ul style="list-style:none">
            {if $indicadores}
                {foreach from=$indicadores item=item}
                    <li>
                        <input data-id_entidad="{$id_entidad}" data-nombre_indicador="{$item->nombre}" 
                               data-id_indicador="{$item->id}"	class="required indicador_complementario_seleccionado_barra" 
                               type="radio" 	name="id_indicador" value="{$item->id}"> 
                        {$item->nombre}
                    </li>
                {/foreach}
            {else}
                <li><span class="text error">{$smarty.const.MSG_INDIC_NO_ENC}</span></li>
                {/if}
        </ul>
    </div>
    <div class="required_tag tooltip hover left"></div>
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
    <div class="clearfix">
        <ul style="list-style:none">
            {if $indicadores}
                {foreach from=$indicadores item=item}
                    <li><input data-id_entidad="{$id_entidad}" data-id_indicador="{$item->id}"
                               class="required indicador_seleccionado" type="radio" 
                               name="id_indicador" value="{$item->id}"> 
                        {$item->nombre}</li>
                    {/foreach}
                {else}
                <li><span class="text error">{$smarty.const.MSG_INDIC_NO_ENC}</span></li>
                {/if}
        </ul>
    </div>
    <div class="required_tag tooltip hover left"></div>
{/if}

<script src="js/panel_buscador.js"></script>