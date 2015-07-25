<form method="post" action="index.php?page=dato_grabar" id="formdato" name="formdato">
    <input type="hidden" name="id_dato" value="{$dato->id}" />
    <input type="hidden" name="id_entidad" value="{$entidad->id}" />
    <div style="opacity: 1;" class="box tabs" id="tab_crear_dato">
        <ul class="tab_header">
            <li ><a id="tab_datos"  href="#dato"> {$smarty.const.TXT_DATO}</a></li>
            <li ><a id="tab_otras" href="#otras" >{$smarty.const.TXT_OTRAS_PROP}</a></li>
            <li ><a id="tab_subunidades" href="#subunidades" >{$smarty.const.FIELD_SUBUNID_AFECT}</a></li>
        </ul>

        <!-- Tab Dato -->
        <div style="opacity: 1;" id="dato" class="block ui-tabs-panel ui-widget-content ui-corner-bottom">
            <p>&nbsp;</p>
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_COD}</label>
                <div>
                    <input type="text" name="codigo" value="{$dato->codigo}" />
                    <div class="required_tag tooltip hover left" title="{$smarty.const.MSG_FIELD_REQ}"></div>
                </div>
            </fieldset>

            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_NOMBRE}</label>
                <div>
                    <input type="text" name="nombre" value="{$dato->nombre}" />
                    <div class="required_tag tooltip hover left" title="{$smarty.const.MSG_FIELD_REQ}"></div>
                </div>
            </fieldset>

            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_HISTORICO}</label>
                <div><input  type="number" name="historicos" value="{$dato->historicos}"/>
                    <div class="required_tag tooltip hover left" title="{$smarty.const.MSG_FIELD_REQ}"></div></div>
            </fieldset>

            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_RESP_SEG}</label>
                <div>
                    <select name="id_responsable" class="select_box">
                        <option value="">{$smarty.const.TXT_SEL_UNO}</option>
                        {foreach $usuarios_entidades as $usuario_entidad}
                            <option value="{$usuario_entidad->usuario->id}"
                                    {if $usuario_entidad->usuario->id == $dato->id_responsable}
                                        selected
                                    {/if}>
                                {$usuario_entidad->usuario->apellidos}, {$usuario_entidad->usuario->nombre}
                                {if $usuario_entidad->usuario->puesto} - {$usuario_entidad->usuario->puesto|htmlentities} {/if}
                            </option>
                        {/foreach}
                    </select>
                    <div class="required_tag tooltip hover left" title="{$smarty.const.MSG_FIELD_REQ}"></div>
                </div>
            </fieldset>

            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_RESP_MED}</label>
                <div>
                    <select name="id_responsable_medicion" class="select_box">
                        <option value="">{$smarty.const.TXT_SEL_UNO}</option>
                        {foreach $usuarios_entidades as $usuario_entidad}
                            <option value="{$usuario_entidad->usuario->id}"
                                    {if $usuario_entidad->usuario->id == $dato->id_responsable_medicion}
                                        selected
                                    {/if}>
                                {$usuario_entidad->usuario->apellidos}, {$usuario_entidad->usuario->nombre}
                                {if $usuario_entidad->usuario->puesto} - {$usuario_entidad->usuario->puesto|htmlentities} {/if}
                            </option>
                        {/foreach}
                    </select>
                    <div class="required_tag tooltip hover left" title="{$smarty.const.MSG_FIELD_REQ}"></div>
                </div>
            </fieldset>

            <div class="columns clearfix">
                <div class="col_50">
                    <fieldset class="label">
                        <label>{$smarty.const.FIELD_CALCULO}</label>
                        <div><textarea rows="6"  class="" name="calculo" placeholder="{$smarty.const.TXT_SOLO_INDIC_CALC}">{$dato->calculo}</textarea></div>
                    </fieldset>
                </div>
                <div  class="col_50">
                    <fieldset title="{$smarty.const.TXT_INTERVALO}" class="label">
                        <label>{$smarty.const.FIELD_INTERVALO}</label>
                        <div class="col_50">
                            <fieldset class="label_side">
                                <label>{$smarty.const.FIELD_VALOR_MIN}</label>
                                <div><input  type="number" value="{$dato->valor_min}" name="valor_min"/></div>
                            </fieldset>
                        </div>
                        <div class="col_50">
                            <fieldset class="label_side">
                                <label>{$smarty.const.FIELD_VALOR_MAX}</label>
                                <div><input  type="number" value="{$dato->valor_max}" name="valor_max"/></div>
                            </fieldset>
                        </div>
                    </fieldset>
                </div>
            </div>

            <div class="button_bar clearfix" id="footer_tabs">
                <button class="dark send_left" type="reset" value="{$smarty.const.TXT_CANCEL}" name="proceso_cancel" onclick="history.back();"><span>{$smarty.const.TXT_CANCEL}</span></button>
                <button class="green send_right" type="submit"><span>{$smarty.const.TXT_GRABAR}</span></button>
            </div>
        </div>
        <!-- //Tab Dato --> 

        <!-- Tab Otras Propiedades -->
        <div style="opacity: 1;" id="otras" class="block ui-tabs-panel ui-widget-content ui-corner-bottom">
            <p>&nbsp;</p>
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_DESC}</label>
                <div><textarea  class="" name="descripcion">{$dato->descripcion}</textarea></div>
            </fieldset>

            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_OBSERV}</label>
                <div><textarea  class="autogrow" name="observaciones">{$dato->observaciones}</textarea></div>
            </fieldset>

            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_FUENTE_INFO}</label>
                <div><input  type="text" placeholder="{$smarty.const.TXT_FUENTE_INFO}" name="fuente_informacion" value="{$dato->fuente_informacion}"/></div>
            </fieldset>

            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_FUENTE_DAT}</label>
                <div><input  type="text" placeholder="{$smarty.const.TXT_FUENTE_DAT}" name="fuente_datos" value="{$dato->fuente_datos}"/></div>
            </fieldset>

            <div class="columns clearfix">
                <div class="col_50">
                    <fieldset class="label">
                        <label>{$smarty.const.FIELD_VISIBILIDAD}</label>
                        <div>
                            <select name="id_visibilidad"  class="required select_box">
                                {foreach $visibilidades as $visibilidad}
                                    <option value="{$visibilidad->id}"{if $dato->id_visibilidad == $visibilidad->id}selected{/if} >
                                        {$visibilidad->nombre|htmlentities}
                                    </option>
                                {/foreach}
                            </select>
                        </div>
                    </fieldset>
                </div>
                <div class="col_50">
                    <fieldset class="label">
                        <label>{$smarty.const.FIELD_UNID_GEN}</label>
                        <div><input  type="text" name="unidad_generadora" value="{$dato->unidad_generadora}" /></div>
                    </fieldset>
                </div>
            </div>

            <div class="columns clearfix">
                <div class="col_50">
                    <fieldset class="label">
                        <label>{$smarty.const.FIELD_PERIOD}</label>
                        <div>
                            <select name="periodicidad" id="periodicidad" class="required select_box">
                                <option value="Bienal" {if $dato->periodicidad == Bienal}selected{/if} >{$smarty.const.TXT_BIENAL}</option>
                                <option value="Anual" {if $dato->periodicidad == Anual}selected{/if} >{$smarty.const.TXT_ANUAL}</option>
                                <option value="Semestral"{if $dato->periodicidad == Semestral}selected{/if} >{$smarty.const.TXT_SEMESTRAL}</option>
                                <option value="Cuatrimestral"{if $dato->periodicidad == Cuatrimestral}selected{/if} >{$smarty.const.TXT_CUATRIMESTRAL}</option>
                                <option value="Trimestral"{if $dato->periodicidad == Trimestral}selected{/if}> {$smarty.const.TXT_TRIMESTRAL}</option>
                                <option value="Mensual"{if $dato->periodicidad == Mensual}selected{/if} >{$smarty.const.TXT_MENSUAL}</option>   
                            </select>
                        </div>
                    </fieldset>
                </div>
                <div class="col_50">
                    <fieldset title="{$smarty.const.TXT_CALCULO_TOTAL_ANUAL}" class="label" id="total_anual" style="display:{if $dato->periodicidad == Anual OR $dato->periodicidad == Bienal}none{else}block{/if}">
                        <label>{$smarty.const.FIELD_CALC_TOTAL_ANUAL}</label>
                        <div>
                            <select name="id_tipo_agregacion_temporal" id="id_tipo_agregacion_temporal">
                                {foreach $tipos_agregacion as $tipo_agregacion}
                                    {if $tipo_agregacion->id != 0}
                                        <option value="{$tipo_agregacion->id}" {if $dato->id_tipo_agregacion_temporal == $tipo_agregacion->id}selected{/if}>{$tipo_agregacion->descripcion}</option>
                                    {/if}
                                {/foreach}
                            </select>
                        </div>
                    </fieldset>
                </div>
            </div>

            <div class="button_bar clearfix" id="footer_tabs">
                <button class="dark send_left" type="reset" value="{$smarty.const.TXT_CANCEL}" name="proceso_cancel" onclick="history.back();"><span>{$smarty.const.TXT_CANCEL}</span></button>
                <button class="green send_right" type="submit"><span>{$smarty.const.TXT_GRABAR}</span></button>
            </div>
        </div>
        <!-- //Tab Otras Propiedades -->

        <!-- Tab Subunidades afectadas -->
        <div style="opacity: 1;" name="subunidades" id="subunidades" class="block ui-tabs-panel ui-widget-content ui-corner-bottom">
            <p>&nbsp;</p>
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_TIP_MED}</label>
                <div>
                    <p><input type="radio" name="tipo_seleccion_responsable" value="0" class="medicion"{if $dato->desagregado == 0}checked="checked"{/if} > {$smarty.const.TXT_MED_UNICA}</p>
                    <p><input type="radio" name="tipo_seleccion_responsable" value="1" class="medicion"{if $dato->desagregado == 1}checked="checked"{/if} >{$smarty.const.TXT_MED_DES}</p>
                    <p><input type="radio" name="tipo_seleccion_responsable" value="2" class="medicion"{if $dato->desagregado == 2}checked="checked"{/if} > {$smarty.const.TXT_MED_DES_CEN}</p>
                </div>
            </fieldset>

            <fieldset title="{$smarty.const.TXT_CALCULO_TOTAL}" class="label_side" id="total" style="display:{if $dato->desagregado == 0}none{else}block{/if}">
                <label>{$smarty.const.FIELD_CALC_TOTAL}</label>
                <div>
                    <select name="id_tipo_agregacion" id="id_tipo_agregacion">
                        {foreach $tipos_agregacion as $tipo_agregacion}
                            {if $tipo_agregacion->id != 0}
                                <option value="{$tipo_agregacion->id}" {if $dato->id_tipo_agregacion == $tipo_agregacion->id}selected{/if}>{$tipo_agregacion->descripcion}</option>
                            {/if}
                        {/foreach}
                    </select>
                </div>
            </fieldset>

            <fieldset class="label_side">
                <div>
                    <div id="div_unidad" style="display:{if $dato->desagregado != 0}none{else}block{/if}">
                        <input type="checkbox" name="subunidades[]" value="{$entidad->id}" class="unidad"
                               {foreach $indicador_subunidades as $indicador_subunidad}
                                   {if $indicador_subunidad->id_entidad == $entidad->id} checked{/if}
                               {/foreach}
                               /> {$entidad->etiqueta}<hr />
                    </div>
                    <div id="div_subunidades" class="column clearfix" style="display:{if $dato->desagregado == 0}none{else}block{/if}">
                        <div class="col_50">
                            {foreach name="subunidad" from=$subunidades item="subunidad"}
                                {if $smarty.foreach.subunidad.iteration == $subunidades|@count/2+1}</div><div class="col_50">{/if}
                                <input type="checkbox" name="subunidades[]" value="{$subunidad->id}" class="subunidad"
                                       {foreach $indicador_subunidades as $indicador_subunidad}
                                           {if $indicador_subunidad->id_entidad == $subunidad->id} checked{/if}
                                       {/foreach}
                                       /> {$subunidad->etiqueta}<br />
                            {/foreach}
                        </div>
                    </div>
                </div>
            </fieldset>
            <div class="button_bar clearfix" id="footer_tabs">
                <button class="dark send_left" type="reset" value="{$smarty.const.TXT_CANCEL}" name="proceso_cancel" onclick="history.back();"><span>{$smarty.const.TXT_CANCEL}</span></button>
                <button class="green send_right" type="submit"><span>{$smarty.const.TXT_GRABAR}</span></button>
            </div>
        </div>
        <!-- //Tab Subunidades afectadas --> 
    </div>
</form>

<script src="js/dato_editar.js" type="text/javascript"></script>
