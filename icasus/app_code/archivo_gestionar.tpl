<div class="box grid_16 clear_fix">
    <a href="javascript:window.history.back()"><img src="/icons/ff16/arrow_undo.png" />{$smarty.const.TXT_CANCELAR}</a>&nbsp; &nbsp; &nbsp;
    <a href="javascript:void(0)" class="dialog_button" data-dialog="dialog_crear"><img src="/icons/ff16/box_bullet_add.png" /> {$smarty.const.TXT_ARCHIVO_SUBIR_NUEVO}</a> &nbsp; &nbsp; &nbsp;
    <a href="index.php?page=proceso_mostrar&id_proceso={$proceso->id}&id_entidad={$proceso->id_entidad}"><img src="/icons/ff16/cog.png" />{$smarty.const.TXT_PROC_VOLVER}</a>
</div>		

<div class="display_none">
    <div id="dialog_crear" class="dialog_content narrow no_dialog_titlebar" title="{$smarty.const.TXT_ARCHIVO_SUBIR}">
        <div class="block">
            <div class="section">
                <h2>{$smarty.const.TXT_ARCHIVO_NUEVO}</h2>
            </div>
            <form action="index.php?page=archivo_gestionar_ajax&ajax=true&modulo=subir" name="subir" method="post" class="validate_form" enctype="multipart/form-data" >
                <input type="hidden" value="{$proceso->id}" name="id_objeto" >
                <fieldset class="label_side">
                    <label>{$marty.const.FIELD_TITULO}</label>
                    <div><b><input  type="text" name="stitulo" value="" class="text required"/></b><div class="required_tag"></div></div>
                </fieldset>
                <fieldset class="label_side">
                    <label>{$marty.const.FIELD_FILE}</label>
                    <div><input  type="file" name="sarchivo" class="uniform required" /><div class="required_tag"></div></div>
                </fieldset>
                <fieldset class="label_side">
                    <label>{$marty.const.FIELD_DESC}</label>
                    <div><textarea  name="sdescripcion" class="autogrow"/></textarea></div>
                </fieldset>
                <fieldset class="label_side">
                    <label>{$marty.const.FIELD_VISIB}</label>
                    <div><input type="radio" name="svisible" value="1" class="required"/> {$marty.const.TXT_SI} <input type="radio" name="svisible" value="0" class="required"/> {$marty.const.TXT_NO}</div>
                </fieldset>
                <div class="button_bar clearfix">
                    <button class="green" type="submit" value="{$smarty.const.TXT_GRABAR}" name="sgrabar" id="sgrabar">
                        <div class="ui-icon ui-icon-check"></div>
                        <span>{$smarty.const.TXT_ARCHIVO_SUBIR}</span>
                    </button>
                    <button class="red dark send_right close_dialog" type="button" value="{$smarty.const.TXT_CANCEL}" name="scancelar" id="scancelar">
                        <div class="ui-icon ui-icon-closethick"></div>
                        <span>{$marty.const.TXT_CANCEL}</span>
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="display_none">
    <div id="dialog_editar" class="dialog_content narrow no_dialog_titlebar" title="Delete Confirmation">
        <div class="block">
            <div class="section">
                <h2>{$marty.const.TXT_ARCHIVO_ACTUALIZAR_DATOS}</h2>
            </div>
            <form action="" name="editar" method="post" class="validate_form" >
                <input type="hidden" value="" name="id_fichero" id="id_fichero" >
                <fieldset class="label_side">
                    <label>{$marty.const.FIELD_TITULO}</label>
                    <div><b><input  type='text' id="etitulo" name='etitulo' value="ww" class="text required"/></b><div class="required_tag"></div></div>
                </fieldset>
                <fieldset class="label_side">
                    <label>{$marty.const.FIELD_DESC}</label>
                    <div><textarea  id="edescripcion" name='edescripcion' class="autogrow"/>ww</textarea></div>
                </fieldset>
                <fieldset class="label_side">
                    <label>{$marty.const.FIELD_VISIB}</label>
                    <div><input type="radio" name='evisible' value="1" class="required"/> {$marty.const.TXT_SI} <input type="radio" name='evisible' value="0" class="required"/>  {$marty.const.TXT_NO}</div>
                </fieldset>
                <div class="button_bar clearfix">
                    <button class="green" type="button" value="{$smarty.const.TXT_GRABAR}" name="egrabar" id="egrabar">
                        <div class="ui-icon ui-icon-check"></div>
                        <span>{$marty.const.TXT_ARCHIVO_ACTUALIZAR}</span>
                    </button>
                    <button class="light  send_right close_dialog" type="button" value="{$smarty.const.TXT_CANCEL}" name="ecancelar" id="ecancelar">
                        <div class="ui-icon ui-icon-closethick"></div>
                        <span> {$marty.const.TXT_CANCEL}</span>
                    </button>
                </div>
            </form>
        </div>
    </div>
</div> 

<div class="display_none">						
    <div id="dialog_delete" class="dialog_content narrow no_dialog_titlebar" title="Delete Confirmation">
        <div class="block">
            <div class="section">
                <h2> {$marty.const.TXT_ARCHIVO_BORRAR}</h2>
                <p>{$marty.const.MSG_CONFIRM_DEL_FILE} <b><span id="titulo_borrar"></span></b>.</p>
            </div>
            <div class="button_bar clearfix">
                <input type="hidden" value="" name="id_borrar" id="id_borrar">
                <button class="delete_confirm dark green no_margin_bottom close_dialog" name="borrar" id="borrar">
                    <div class="ui-icon ui-icon-check"></div>
                    <span>{$marty.const.TXT_BORRAR}</span>
                </button>
                <button class="dark send_right close_dialog">
                    <div class="ui-icon ui-icon-closethick"></div>
                    <span>{$marty.const.TXT_CANCEL}</span>
                </button>
            </div>
        </div>
    </div>
</div> 

<div class="box grid_16 single_datatable">
    <div id="dt1" class="no_margin">
        {if isset($archivos)}
            <table class='display datatable'>
                <thead>
                    <tr><th></th><th>{$marty.const.FIELD_TITULO}</th><th>{$marty.const.FIELD_VISIB}</th><th>{$marty.const.FIELD_USER}</th></tr>
                </thead>
                <tbody>
                    {foreach from=$archivos item=archivo}
                        <tr>
                            <td>
                                <a href="javascript:void(0)" class="borrar_archivo dialog_button" id="l-borrar-{$archivo->id}" data-dialog="dialog_delete"><img src="/icons/ff16/bin.png"></a>
                            </td>
                            <td>
                                <a href="javascript:void(0)" class="editar_archivo dialog_button" id="l-titulo-{$archivo->id}"  value="{$archivo->titulo|htmlentities}" data-dialog="dialog_editar" >
                                    {$archivo->titulo|htmlentities}</a>
                                {if $archivo->descripcion != NULL}<a href='#' id="l-descripcion-{$archivo->id}" title='{$archivo->descripcion|htmlentities}'><big>*</big></a>{/if}
                            </td>
                            <td><a href="javascript:void(0)" id="l-visible-{$archivo->id}" value="{$archivo->visible}" >{$archivo->visible}</a></td>
                            <td>{$archivo->usuario->nombre} {$archivo->usuario->apellidos}</td>
                        </tr>
                    {/foreach}
                </tbody>
            </table>
        {else}
            <div class='alert alert_blue'>
                <img height="24" width="24" src="theme/danpin/images/icons/small/white/alert_2.png">
                {$marty.const.MSG_NO_FILE_PROC}
            </div>
        {/if}
    </div>
</div>  