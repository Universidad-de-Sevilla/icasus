<div class="box grid_16">
    <div class="block">
        <form method="post" action="index.php?page=proceso_editar&id_entidad={$entidad->id}&id_proceso={$proceso->id}" class="validate_form">
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_PROC_MADRE}</label>
                <div>
                    <select name="madre" class="required select_box">
                        <option value="0">{$smarty.const.TXT_PROC_ES_MADRE}</option>
                        {foreach from=$procesos_madre item=proceso_madre}
                            <option value="{$proceso_madre->id}" {if $proceso_madre->id == $proceso->id_madre} 
                                    selected{/if}>
                                {$proceso_madre->codigo} - {$proceso_madre->nombre}</option>
                            {/foreach} 
                    </select>
                </div>
            </fieldset> 
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_NOMBRE}</label>
                <div>
                    <input type="text" name="nombre" value="{$proceso->nombre}" class="required" />
                    <div class="required_tag"></div>
                </div>
            </fieldset> 
            <div class="columns clearfix">
                <div class="col_33">
                    <fieldset>
                        <label>{$smarty.const.FIELD_COD}</label>
                        <div>
                            <input type="text" name="codigo" value="{$proceso->codigo}" placeholder="{$smarty.const.TXT_INDICAR_COD}" class="required" />
                            <div class="required_tag"></div>
                        </div>
                    </fieldset> 
                </div>
                <div class="col_33">
                    <fieldset>
                        <label>{$smarty.const.FIELD_VERSION}</label>
                        <div>
                            <input type="text" name="revision" value="{$proceso->revision}" placeholder="{$smarty.const.TXT_PROC_VERSION}"  class="required" />
                            <div class="required_tag"></div>
                        </div>
                    </fieldset>  
                </div>
                <div class="col_33">
                    <fieldset>
                        <label>{$smarty.const.FIELD_FECHA}</label>
                        <div>
                            <input type="text" name="fecha_revision" value="{$proceso->fecha_revision|date_format:'%d/%m/%Y'}" placeholder="{$smarty.const.TXT_FECHA_REV_ACTUAL}" class="required" />
                            <div class="required_tag"></div>
                        </div>
                    </fieldset>  
                </div>
            </div>
            <div class="columns clearfix">
                <div class="col_50">
                    <fieldset>
                        <label>{$smarty.const.FIELD_PROPIETARIO}</label>
                        <div>
                            <select name="id_propietario" class="select_box">
                                {foreach from=$usuarios_entidad item=usuario_entidad}
                                    <option value="{$usuario_entidad->usuario->id}" {if $proceso->id_propietario == $usuario_entidad->usuario->id}selected{/if}>{$usuario_entidad->usuario->nombre} {$usuario_entidad->usuario->apellidos} {if $usuario_entidad->usuario->puesto} - {$usuario_entidad->usuario->puesto} {/if}
                                    </option>
                                {/foreach}              
                            </select>
                        </div>
                    </fieldset> 
                </div>
                <div class="col_50">
                    <fieldset>
                        <label>{$smarty.const.FIELD_TIPO_PROC}</label>
                        <div>
                            <select name="alcance" class="select_box">
                                <option value="Indefinido" {if $proceso->alcance == 'Indefinido'} selected {/if}>{$smarty.const.TXT_INDEF}...</option>
                                <option value="Apoyo" {if $proceso->alcance == 'Apoyo'} selected {/if}>{$smarty.const.TXT_APOYO}</option>
                                <option value="Operativo/Clave" {if $proceso->alcance == 'Operativo/Clave'} selected {/if}>{$smarty.const.TXT_OPERATIVO}</option>
                                <option value="Directivo/Estratégico/Gestion" {if $proceso->alcance == 'Directivo/Estratégico/Gestion'} selected {/if}>{$smarty.const.TXT_DIR_GES}</option>
                            </select>
                        </div>
                    </fieldset> 
                </div>
            </div>
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_MISION}</label>
                <div>
                    <textarea  class="autogrow" name="mision">{$proceso->mision}</textarea>
                </div>
            </fieldset>   
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_EQUIP_PROC}</label>
                <div>
                    <textarea class="autogrow" name="equipo_de_proceso">{$proceso->equipo_de_proceso}</textarea>
                </div>
            </fieldset>      
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_RESULTS_CLAVE}</label>
                <div>
                    <textarea class="autogrow" name="resultados_clave">{$proceso->resultados_clave}</textarea>
                </div>
            </fieldset>
            <div class="columns clearfix">
                <div class="col_50">
                    <fieldset>
                        <label>{$smarty.const.FIELD_ENTRADAS_PROV}</label>
                        <div>
                            <textarea name="entradas">{$proceso->entradas}</textarea>
                        </div>
                    </fieldset>  
                </div>
                <div class="col_50">
                    <fieldset>
                        <label>{$smarty.const.FIELD_SALIDAS_CLIENTS}</label>
                        <div>
                            <textarea name="salidas">{$proceso->salidas}</textarea>
                        </div>
                    </fieldset>   
                </div>
            </div>
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_ACTIVIDADES}</label>
                <div>
                    <textarea class="autogrow" name="actividades">{$proceso->actividades}</textarea>
                </div>
            </fieldset> 
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_VARS_CONTROL}</label>
                <div>
                    <textarea class="autogrow" name="variables_control">{$proceso->variables_control}</textarea>
                </div>
            </fieldset> 
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_DOCUMENTACION}</label>
                <div>
                    <input type="text" name="documentacion" value="{$proceso->documentacion}"/>
                </div>
            </fieldset>
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_MEDICIONES}</label>
                <div>
                    <textarea  class="autogrow" name="mediciones">{$proceso->mediciones}</textarea>
                </div>
            </fieldset>   
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_REGISTROS}</label>
                <div>
                    <textarea  class="autogrow" name="registros" id="registros">{$proceso->registros}</textarea>
                </div>
            </fieldset>
            <fieldset class="label_side">
                <label>{$smarty.const.FIELD_OBSERV}</label>
                <div>
                    <textarea  class="autogrow" name="observaciones" id="registros">{$proceso->observaciones}</textarea>
                </div>
            </fieldset>  
            <div class="button_bar clearfix">
                <button class="green send_right" type="submit" value="{$smarty.const.TXT_GRABAR}" name="proceso_submit">
                    <div class="ui-icon ui-icon-check"></div>
                    <span>{$smarty.const.TXT_GRABAR}</span>
                </button>
                <button class="light send_left" type="reset" value="{$smarty.const.TXT_CANCEL}" name="proceso_cancel" 
                        onclick="history.back();">
                    <div class="ui-icon ui-icon-closethick"></div>
                    <span>{$smarty.const.TXT_CANCEL}</span>
                </button>
            </div>    
        </form>
    </div>
</div>
