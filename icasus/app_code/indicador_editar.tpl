<form method="post" action="index.php?page=indicador_grabar&id_indicador={$indicador->id}" id="formindicador" name="formindicador">
    <input type="hidden" name="id_entidad" value="{$entidad->id}" />

    <div style="opacity: 1;" class="box tabs" id="tab_editar_indicador">
        <ul class="tab_header">
            <li ><a  href="#indicador" id="tab_indicador">{$smarty.const.FIELD_INDIC}</a></li>
            <li ><a  href="#otros" id="tab_otros">{$smarty.const.TXT_OTRAS_PROP}</a></li>
            <li ><a  href="#subunidades" id="tab_subunidades">{$smarty.const.FIELD_SUBUNID_AFECT}</a></li>
        </ul>

        <!-- Tab Indicador -->
        <div style="opacity: 1;" id="indicador" class="block ui-tabs-panel ui-widget-content ui-corner-bottom">
            <p>&nbsp;</p>
            <div class="columns clearfix">
                <div class="col_40">
                    <fieldset class="label">
                        <label>{$smarty.const.FIELD_COD}</label>
                        <div><input  type="text" name="codigo" value="{$indicador->codigo}" /><div class="required_tag tooltip hover left" title="{$smarty.const.MSG_FIELD_REQ}"></div> </div>
                    </fieldset>
                </div>
                <div class="col_60">
                    <fieldset class="label">
                        <label>{$smarty.const.FIELD_PROC}</label>
                        <div>
                            <select name="id_proceso" id="id_proceso" class="required2 select_box">
                                <option value="">{$smarty.const.TXT_SEL_UNO}</option>
                                {foreach $procesos as $proceso}
                                    <option value="{$proceso->id}" {if $indicador->id_proceso == $proceso->id}selected{/if}> {$proceso->nombre} </option>
                                {/foreach}
                            </select>
                            <div class="required_tag tooltip hover left" title="{$smarty.const.MSG_FIELD_REQ}"></div>
                        </div>
                    </fieldset>
                </div>
            </div>
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_NOMBRE}</label>
                <div><textarea name="nombre" />{$indicador->nombre}</textarea><div class="required_tag tooltip hover left" title="{$smarty.const.MSG_FIELD_REQ}"></div></div>
            </fieldset>
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_FORM}</label>
                <div><textarea   name="formulacion">{$indicador->formulacion}</textarea><div class="required_tag tooltip hover left" title="{$smarty.const.MSG_FIELD_REQ}"></div></div>
            </fieldset>
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_HISTORICO}</label>
                <div><input  type="number" name="historicos" value="{$indicador->historicos}" /><div class="required_tag tooltip hover left" title="{$smarty.const.MSG_FIELD_REQ}"></div></div>
            </fieldset>
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_RESP_SEG}</label>
                <div>
                    <select name="id_responsable" class="required2 select_box">
                        <option value="">{$smarty.const.TXT_SEL_UNO}</option>
                        {foreach $usuarios_entidades as $usuario_entidad}
                            <option value="{$usuario_entidad->usuario->id}"{if $indicador->id_responsable == $usuario_entidad->usuario->id}selected{/if}>{$usuario_entidad->usuario->apellidos}, {$usuario_entidad->usuario->nombre} {if $usuario_entidad->usuario->puesto} - {$usuario_entidad->usuario->puesto} {/if}
                            </option>
                        {/foreach}
                    </select><div class="required_tag tooltip hover left" title="{$smarty.const.MSG_FIELD_REQ}"></div>
                </div>
            </fieldset>
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_RESP_MED}</label>
                <div>
                    <select name="id_responsable_medicion" class="select_box">
                        <option value="">{$smarty.const.TXT_SEL_UNO}</option>
                        {foreach $usuarios_entidades as $usuario_entidad}
                            <option value="{$usuario_entidad->usuario->id}"{if $indicador->id_responsable_medicion == $usuario_entidad->usuario->id}selected{/if}>{$usuario_entidad->usuario->apellidos}, {$usuario_entidad->usuario->nombre} {if $usuario_entidad->usuario->puesto} - {$usuario_entidad->usuario->puesto} {/if}
                            </option>
                        {/foreach}
                    </select><div class="required_tag tooltip hover left" title="{$smarty.const.MSG_FIELD_REQ}"></div>
                </div>
            </fieldset>

            <div class="columns clearfix">
                <div class="col_50">
                    <fieldset class="label">
                        <label>{$smarty.const.FIELD_CALCULO}</label>
                        <div><textarea rows="6"  class="" name="calculo" placeholder="{$smarty.const.TXT_SOLO_INDIC_CALC}">{$indicador->calculo}</textarea></div>
                    </fieldset>
                </div>
                <div  class="col_50">
                    <fieldset title="{$smarty.const.TXT_INTERVALO}" class="label">
                        <label>{$smarty.const.FIELD_INTERVALO}</label>
                        <div class="col_50">
                            <fieldset class="label_side">
                                <label>{$smarty.const.FIELD_VALOR_MIN}</label>
                                <div><input  type="number" value="{$indicador->valor_min}" name="valor_min"/></div>
                            </fieldset>
                        </div>
                        <div class="col_50">
                            <fieldset class="label_side">
                                <label>{$smarty.const.FIELD_VALOR_MAX}</label>
                                <div><input  type="number" value="{$indicador->valor_max}" name="valor_max"/></div>
                            </fieldset>
                        </div>
                    </fieldset>
                </div>
            </div>

            <div class="button_bar clearfix" id="footer_tabs">
                <button class="dark send_left" type="reset" value="{$smarty.const.TXT_CANCEL}" name="proceso_cancel" onclick="history.back();"><span>{$smarty.const.TXT_CANCEL}</span></button>
                <button class="green send_right img_icon has_text" type="submit"><span>{$smarty.const.TXT_GRABAR}</span></button>
            </div>
        </div>
        <!-- //Tab Indicador --> 

        <!-- Tab Otras Propiedades -->
        <div style="opacity: 1;" id="otros" class="block ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide">
            <p>&nbsp;</p>
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_DESC}</label>
                <div><textarea  class="inp" name="descripcion">{$indicador->descripcion}</textarea></div>
            </fieldset>
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_OBSERV}</label>
                <div><textarea  class="inp" name="observaciones">{$indicador->observaciones}</textarea></div>
            </fieldset> 
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_FUENTE_INFO}</label>
                <div><input  type="text" placeholder="{$smarty.const.TXT_FUENTE_INFO}" name="fuente_informacion" value="{$indicador->fuente_informacion}"/></div>
            </fieldset>
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_FUENTE_DAT}</label>
                <div><input  type="text" placeholder="{$smarty.const.TXT_FUENTE_DAT}" name="fuente_datos" value="{$indicador->fuente_datos}"/></div>
            </fieldset>
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_MET}</label>
                <div><input  type="text" name="evidencia" value="{$indicador->evidencia}" /></div>
            </fieldset>
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_INTERP}</label>
                <div><input  type="text" name="interpretacion" value="{$indicador->interpretacion}" /></div>
            </fieldset>
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_EFQM}</label>
                <div class="columns clearfix">
                    <div class="col_50">
                        <select name="criterios_efqm[]" id="criterios_efqm" class="select_box" >
                            <option value="">{$smarty.const.TXT_ELEG_UNO}</option>
                            {foreach $criterios_efqm as $criterio_efqm}
                                <option value="{$criterio_efqm->id}"
                                        {if $indicador->criterios_efqm}
                                            {if $indicador->criterios_efqm[0]->criterio_efqm->id == $criterio_efqm->id}selected{/if}
                                        {/if}
                                        >{$criterio_efqm->codigo} - {$criterio_efqm->nombre|htmlentities}
                                </option>
                            {/foreach}
                        </select>
                    </div>
                    <div class="col_50">
                        <select name="criterios_efqm[]" id="criterios_efqm" class="select_box">
                            <option value="">{$smarty.const.TXT_ELEG_UNO}</option>
                            {foreach $criterios_efqm as $criterio_efqm}
                                <option value="{$criterio_efqm->id}"
                                        {if $indicador->criterios_efqm|@count gt 1}
                                            {if $indicador->criterios_efqm[1]->criterio_efqm->id == $criterio_efqm->id}selected{/if}
                                        {/if}
                                        >
                                    {$criterio_efqm->codigo} - {$criterio_efqm->nombre|htmlentities}
                                </option>
                            {/foreach}
                        </select>
                    </div>
                </div>
            </fieldset>
            <div class="columns clearfix">     
                <div class="col_50">
                    <fieldset class="label">
                        <label>{$smarty.const.FIELD_VISIBILIDAD}</label>
                        <div>
                            <select name="id_visibilidad" id="id_visibilidad" class="required select_box">
                                {foreach $visibilidades as $visibilidad}
                                    <option value="{$visibilidad->id}" {if $visibilidad->id == $indicador->visibilidad->id}selected{/if} >
                                        {$visibilidad->nombre}
                                    </option>
                                {/foreach}
                            </select>
                        </div>
                    </fieldset>
                </div>
                <div class="col_50">
                    <fieldset class="label">
                        <label>{$smarty.const.FIELD_UNID_GEN}</label>
                        <div><input  type="text" name="unidad_generadora" value="{$indicador->unidad_generadora}" /></div>
                    </fieldset>
                </div>
            </div>
            <div class="columns clearfix">
                <div class="col_50">
                    <fieldset class="label">
                        <label>{$smarty.const.FIELD_PERIOD}</label>
                        <div>
                            <select name="periodicidad" id="periodicidad" class="select_box">
                                <option value="Bienal"{if {$indicador->periodicidad} == Bienal}selected{/if} >{$smarty.const.TXT_BIENAL}</option>
                                <option value="Anual"{if {$indicador->periodicidad} == Anual}selected{/if} >{$smarty.const.TXT_ANUAL}</option>
                                <option value="Semestral"{if $indicador->periodicidad == Semestral}selected{/if} >{$smarty.const.TXT_SEMESTRAL}</option>
                                <option value="Cuatrimestral" {if $indicador->periodicidad == Cuatrimestral}selected{/if} >{$smarty.const.TXT_CUATRIMESTRAL}</option>
                                <option value="Trimestral" {if $indicador->periodicidad == Trimestral}selected{/if} >{$smarty.const.TXT_TRIMESTRAL}</option> 
                                <option value="Mensual" {if $indicador->periodicidad == Mensual}selected{/if} >{$smarty.const.TXT_MENSUAL}</option>     
                            </select>
                        </div>
                    </fieldset>
                </div>
                <div class="col_50">
                    <fieldset title="{$smarty.const.TXT_CALCULO_TOTAL_ANUAL}" class="label" id="total_anual" style="display:{if $indicador->periodicidad == Anual OR $indicador->periodicidad == Bienal}none{else}block{/if}">
                        <label>{$smarty.const.FIELD_CALC_TOTAL_ANUAL}</label>
                        <div>
                            <select name="id_tipo_agregacion_temporal" id="id_tipo_agregacion_temporal">
                                {foreach $tipos_agregacion as $tipo_agregacion}
                                    {if $tipo_agregacion->id != 0}
                                        <option value="{$tipo_agregacion->id}" {if $indicador->id_tipo_agregacion_temporal == $tipo_agregacion->id}selected{/if}>{$tipo_agregacion->descripcion}</option>
                                    {/if}
                                {/foreach}
                            </select>
                        </div>
                    </fieldset>
                </div>
            </div> 
            <div class="button_bar clearfix" id="footer_tabs">
                <button class="dark send_left" type="reset" value="{$smarty.const.TXT_CANCEL}" name="proceso_cancel" onclick="history.back();"><span>{$smarty.const.TXT_CANCEL}</span></button>
                <button class="green send_right img_icon has_text" type="submit"><span>{$smarty.const.TXT_GRABAR}</span></button>
            </div>
        </div>
        <!-- //Tab Otras Propiedades -->

        <!-- Tab Subunidades afectadas -->
        <div style="opacity: 1;" id="subunidades" class="block ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide">
            <p>&nbsp;</p>
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_TIP_MED}</label>
                <div>
                    <p><input type="radio" name="tipo_seleccion_responsable" value="0" class="medicion"{if $indicador->desagregado == 0}checked="checked"{/if}> {$smarty.const.TXT_MED_UNICA}</p>
                    <p><input type="radio" name="tipo_seleccion_responsable" value="1" class="medicion"{if $indicador->desagregado == 1}checked="checked"{/if}> {$smarty.const.TXT_MED_DES}</p>
                    <p><input type="radio" name="tipo_seleccion_responsable" value="2" class="medicion"{if $indicador->desagregado == 2}checked="checked"{/if}> {$smarty.const.TXT_MED_DES_CEN}</p>
                </div>
            </fieldset>

            <fieldset title="{$smarty.const.TXT_CALCULO_TOTAL}" class="label_side" id="total" style="display:{if $indicador->desagregado == 0}none{else}block{/if}">
                <label>{$smarty.const.FIELD_CALC_TOTAL}</label>
                <div>
                    <select name="id_tipo_agregacion" id="id_tipo_agregacion">
                        {foreach $tipos_agregacion as $tipo_agregacion}
                            {if $tipo_agregacion->id != 0 AND $tipo_agregacion->id != 5}
                                <option value="{$tipo_agregacion->id}" {if $indicador->id_tipo_agregacion == $tipo_agregacion->id}selected{/if}>{$tipo_agregacion->descripcion}</option>
                            {/if}
                        {/foreach}
                    </select>
                </div>
            </fieldset>

            <fieldset class="label_side">
                <div>
                    <div id="div_unidad">
                        <input type="checkbox" name="subunidades[]" value="{$entidad->id}" class="unidad"
                               {foreach $indicador_subunidades as $indicador_subunidad}
                                   {if $indicador_subunidad->id_entidad == $entidad->id} checked{/if}
                               {/foreach}/> {$entidad->etiqueta}
                        <hr/>
                    </div>
                    <div id="div_subunidades" class="column clearfix" style="display:{if $indicador->desagregado == 0}none{else}block{/if}">
                        <div class="col_50">
                            {foreach name="subunidad" from=$subunidades item="subunidad"}
                                {if $smarty.foreach.subunidad.iteration == $subunidades|@count/2+1}</div><div class="col_50">{/if}
                                <input type="checkbox" name="subunidades[]" value="{$subunidad->id}" class="subunidad"
                                       {foreach $indicador_subunidades as $indicador_subunidad}
                                           {if $indicador_subunidad->id_entidad == $subunidad->id} checked{/if}
                                       {/foreach}/> {$subunidad->etiqueta}<br/>
                            {/foreach}
                        </div>
                    </div>
                </div>
            </fieldset>
            <div class="button_bar clearfix" id="footer_tabs">
                <button class="dark send_left" type="reset" value="{$smarty.const.TXT_CANCEL}" name="proceso_cancel" onclick="history.back();"><span>{$smarty.const.TXT_CANCEL}</span></button>
                <button class="green send_right img_icon has_text" type="submit"><span>{$smarty.const.TXT_GRABAR}</span></button>
            </div>
        </div>
        <!-- //Tab Subunidades afectadas --> 
    </div>
</form>

<script src="js/indicador_editar.js" type="text/javascript"></script>
