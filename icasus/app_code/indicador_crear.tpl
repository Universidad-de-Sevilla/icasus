<form method="post" action="index.php?page=indicador_grabar" id="formindicador" name="formindicador">
    <input type="hidden" name="id_entidad" value="{$entidad->id}" />
    <div style="opacity: 1;" class="box tabs" id="tab_crear_indicador">
        <ul class="tab_header">
            <li ><a  href="#indicador" >{$smarty.const.FIELD_INDIC}</a></li>
            <li ><a  href="#otros" >{$smarty.const.TXT_DATOS_OTROS}</a></li>
            <li ><a  href="#subunidades" >{$smarty.const.FIELD_SUBUNID_AFECT}</a></li>
        </ul>
        <div style="opacity: 1;" id="indicador" class="block ui-tabs-panel ui-widget-content ui-corner-bottom">
            <p>&nbsp;</p>
            <div class="columns clearfix">
                <div class="col_40">
                    <fieldset class="label">
                        <label>{$smarty.const.FIELD_COD}</label>
                        <div><input  type="text" name="codigo" class="required2"/><div class="required_tag tooltip hover left" title="{$smarty.const.MSG_FIELD_REQ}"></div> </div>
                    </fieldset>
                </div>
                <div class="col_60">
                    <fieldset class="label">
                        <label>{$smarty.const.FIELD_PROC}</label>
                        <div>
                            <select name="id_proceso" id="id_proceso" class="required2 select_box">
                                <option value="">{$smarty.const.TXT_SEL_UNO}</option>
                                {foreach $procesos as $proceso}
                                    <option value="{$proceso->id}"> {$proceso->nombre} </option>
                                {/foreach}
                            </select>
                            <div class="required_tag tooltip hover left" title="{$smarty.const.MSG_FIELD_REQ}"></div>
                        </div>
                    </fieldset>
                </div>
            </div>
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_NOMBRE}</label>
                <div><textarea name="nombre"class="required2" /></textarea><div class="required_tag tooltip hover left" title="{$smarty.const.MSG_FIELD_REQ}"></div></div>
            </fieldset>
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_FORM}</label>
                <div><textarea  class="required2" name="formulacion"></textarea><div class="required_tag tooltip hover left" title="{$smarty.const.MSG_FIELD_REQ}"></div></div>
            </fieldset>
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_CALCULO}</label>
                <div><textarea  class="" name="calculo" placeholder="{$smarty.const.TXT_SOLO_INDIC_CALC}"></textarea></div>
            </fieldset>
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_HISTORICO}</label>
                <div><input  type="number" name="historicos" /></div>
            </fieldset>
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_RESP_SEG}</label>
                <div>
                    <select name="id_responsable" class="required2 select_box">
                        <option value="">{$smarty.const.TXT_SEL_UNO}</option>
                        {foreach $usuarios_entidad as $usuario_entidad}
                            <option value="{$usuario_entidad->usuario->id}">{$usuario_entidad->usuario->apellidos}, {$usuario_entidad->usuario->nombre} {if $usuario_entidad->usuario->puesto} - {$usuario_entidad->usuario->puesto} {/if}
                            </option>
                        {/foreach}              
                    </select><div class="required_tag tooltip hover left" title="{$smarty.const.MSG_FIELD_REQ}"></div>
                </div>
            </fieldset>
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_RESP_MED}</label>
                <div>
                    <select name="id_responsable_medicion" class="required2 select_box">
                        <option value="">{$smarty.const.TXT_SEL_UNO}</option>
                        {foreach $usuarios_entidad as $usuario_entidad}
                            <option value="{$usuario_entidad->usuario->id}">{$usuario_entidad->usuario->apellidos}, {$usuario_entidad->usuario->nombre} {if $usuario_entidad->usuario->puesto} - {$usuario_entidad->usuario->puesto} {/if}
                            </option>
                        {/foreach}              
                    </select><div class="required_tag tooltip hover left" title="{$smarty.const.MSG_FIELD_REQ}"></div>
                </div>
            </fieldset> 
            <div class="button_bar clearfix" id="footer_tabs">
                <button class="dark send_left" type="reset" value="{$smarty.const.TXT_CANCEL}" name="proceso_cancel" onclick="history.back();"><span>{$smarty.const.TXT_CANCEL}</span></button>
                <button class="btnNext dark send_right img_icon has_text" type="button"><span>{$smarty.const.TXT_SIG}</span></button>
            </div>
        </div><!-- fin tab 1 --> 
        <div style="opacity: 1;" id="otros" class="block ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide">
            <p>&nbsp;</p>
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_DESC}</label>
                <div><textarea  class="inp" name="descripcion"></textarea></div>
            </fieldset>
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_OBSERV}</label>
                <div><textarea  class="inp" name="observaciones"></textarea></div>
            </fieldset>
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_FUENTE_INFO}</label>
                <div><input  type="text" name="fuente_informacion"/></div>	
            </fieldset>
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_FUENTE_DAT}</label>
                <div><input  type="text" name="fuente_datos"/></div>	
            </fieldset>
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_MET}</label>
                <div><input  type="text" name="evidencia" /></div>		
            </fieldset>
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_INTERP}</label>
                <div><input  type="text" name="interpretacion" /></div>
            </fieldset>
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_EFQM}</label>
                <div class="columns clearfix">
                    <div class="col_50">
                        <select name="criterios_efqm[]" id="criterios_efqm" class="select_box" >
                            <option value="">{$smarty.const.TXT_ELEG_UNO}</option>
                            {foreach $criterios_efqm as $criterio_efqm}
                                <option value="{$criterio_efqm->id}">
                                    {$criterio_efqm->codigo} - {$criterio_efqm->nombre|htmlentities}
                                </option>
                            {/foreach}
                        </select>
                    </div>
                    <div class="col_50">
                        <select name="criterios_efqm[]" id="criterios_efqm" class="select_box">
                            <option value="">{$smarty.const.TXT_ELEG_UNO}</option>
                            {foreach $criterios_efqm as $criterio_efqm}
                                <option value="{$criterio_efqm->id}">
                                    {$criterio_efqm->codigo} - {$criterio_efqm->nombre|htmlentities}
                                </option>
                            {/foreach}
                        </select>
                    </div>
                </div>
            </fieldset>
            <div class="columns clearfix">
                <div class="col_25">
                    <fieldset class="label">
                        <label>{$smarty.const.FIELD_PERIOD}</label>
                        <div>
                            <select name="periodicidad" id="periodicidad" class="select_box">
                                <option value="Anual" selected>{$smarty.const.TXT_ANUAL}</option>
                                <option value="Semestral">{$smarty.const.TXT_SEMESTRAL}</option>
                                <option value="Cuatrimestral">{$smarty.const.TXT_CUATRIMESTRAL}</option>
                                <option value="Trimestral">{$smarty.const.TXT_TRIMESTRAL}</option>
                                <option value="Mensual">{$smarty.const.TXT_MENSUAL}</option>
                            </select>
                        </div>
                    </fieldset>
                </div>
                <div class="col_25">
                    <fieldset class="label">
                        <label>{$smarty.const.FIELD_VISIBILIDAD}</label>	
                        <div>
                            <select name="id_visibilidad" id="id_visibilidad" class="required select_box">
                                {foreach $visibilidades as $visibilidad}
                                    <option value="{$visibilidad->id}">
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
                        <div><input  type="text" name="unidad_generadora" /></div>
                    </fieldset>
                </div>
            </div>
            <div class="button_bar clearfix" id="footer_tabs">
                <button class="dark send_left" type="reset" value="{$smarty.const.TXT_CANCEL}" name="proceso_cancel" onclick="history.back();"><span>{$smarty.const.TXT_CANCEL}</span></button>
                <button class="btnNext dark send_right img_icon has_text" type="button"><span>{$smarty.const.TXT_SIG}</span></button>
                <button class="btnPrev dark send_right img_icon has_text" type="button"><span>{$smarty.const.TXT_ANT}</span></button>
            </div>
        </div><!-- fin tab otros datos -->
        <div style="opacity: 1;" id="subunidades" class="block ui-tabs-panel ui-widget-content ui-corner-bottom ui-tabs-hide">
            <p>&nbsp;</p>
            <fieldset class="label_side required">
                <label>{$smarty.const.FIELD_TIP_MED}</label>
                <div>
                    <p><input type="radio" name="tipo_seleccion_responsable" value="0" class="medicion" >{$smarty.const.TXT_MED_UNICA}</p>
                    <p><input type="radio" name="tipo_seleccion_responsable" value="1" class="medicion"> {$smarty.const.TXT_MED_DES}</p>
                    <p><input type="radio" name="tipo_seleccion_responsable" value="2" class="medicion">{$smarty.const.TXT_MED_DES_CEN}</p>
                </div>
            </fieldset>

            <fieldset class="label_side" id="total" style="display:none">
                <label>{$smarty.const.FIELD_CALC_TOTAL}</label>
                <div>
                    <select name="id_tipo_agregacion" id="id_tipo_agregacion">
                        {foreach $tipos_agregacion as $tipo_agregacion}
                            {if $tipo_agregacion->id != 0}
                                <option value="{$tipo_agregacion->id}" >{$tipo_agregacion->descripcion}</option>
                            {/if}
                        {/foreach}
                    </select>
                </div>
            </fieldset>

            <fieldset class="label_side">
                <div>
                    <div id="div_unidad" style="display:none">
                        <input type="checkbox" name="subunidades[]" value="{$entidad->id}" class="unidad" /> {$entidad->nombre}<hr />
                    </div>
                    <div id="div_subunidades" class="column clearfix" style="display:none">
                        <div class="col_50">
                            {foreach name="subunidad" from=$subunidades item="subunidad"}
                                {if $smarty.foreach.subunidad.iteration == $subunidades|@count/2+1}</div><div class="col_50">{/if}
                                <input type="checkbox" name="subunidades[]" value="{$subunidad->id}" class="subunidad"/> {$subunidad->nombre}<br />
                            {/foreach}
                        </div>
                    </div>
                </div>
            </fieldset>
            <div class="button_bar clearfix" id="footer_tabs">
                <button class="dark send_left" type="reset" value="{$smarty.const.TXT_CANCEL}" name="proceso_cancel" onclick="history.back();"><span>{$smarty.const.TXT_CANCEL}</span></button>
                <button class="dark send_right img_icon has_text" type="submit"><span>{$smarty.const.TXT_GRABAR}</span></button>
                <button class="btnPrev dark send_right img_icon has_text" type="button"><span>{$smarty.const.TXT_ANT}</span></button>
            </div>
        </div><!-- fin tab subunidades afectadas --> 
    </div>
</form>

<script src="js/indicador_crear.js" type="text/javascript"></script>
