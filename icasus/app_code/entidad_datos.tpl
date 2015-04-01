<h3> 
    {if $_control}
        <a href='index.php?page=entidad_editar&id_entidad={$entidad->id}'><img src='/icons/ff16/chart_organisation_edit.png' />
            {$smarty.const.TXT_UNID_EDIT}
        </a>&nbsp;&nbsp; 
    {/if}
    <a href='index.php?page=csv_importar&id_entidad={$entidad->id}'><img src='/icons/ff16/lorry.png' />
        {$smarty.const.TXT_VAL_IMPORT}
    </a>
</h3>

<div class="box grid_16">
    <h2 class="box_head grad_grey_dark">{$smarty.const.TXT_UNID_PARAM}</h2> 
    <a href="#" class="grabber"></a>
    <a href="#" class="toggle"></a>
    <div class="block">
        <fieldset class="label_side">
            <label>{$smarty.const.FIELD_COD}</label>
            <div class="clearfix">
                <span>{$entidad->codigo}</span>
            </div>
        </fieldset>	
        <fieldset class="label_side">
            <label>{$smarty.const.FIELD_NOMBRE}</label>
            <div class="clearfix">
                <span>{$entidad->nombre}</span>
            </div>
        </fieldset>	
        <fieldset class="label_side">
            <label>{$smarty.const.FIELD_WEB}</label>
            <div class="clearfix">
                <span><a href='{$entidad->web}'>{$entidad->web}</a></span>
            </div>
        </fieldset>	
        <fieldset class="label_side">
            <label>{$smarty.const.FIELD_UNID_SUP}</label>
            <div class="clearfix">
                <span><a href="index.php?page=entidad_datos&id_entidad={$entidad->madre->id}">{$entidad->madre->nombre}</a></span>
            </div>
        </fieldset>	
    </div>
</div>

<div class="box grid_16">
    <div class="toggle_container">
        <h2 class="box_head grad_grey_dark">{$smarty.const.TXT_USERS}</h2> 
        <a href="#" class="grabber"></a>
        <a href="#" class="toggle"></a>
        <div class="block">
            <div class="button_bar clearfix">
                {if $_control}
                    <a href='index.php?page=entidad_poblar&id_entidad={$entidad->id}'>
                        <img src='/icons/ff16/user_add.png' />
                        {$smarty.const.TXT_USERS_VINC}
                    </a>&nbsp;&nbsp;
                    <a href='index.php?page=entidad_despoblar&id_entidad={$entidad->id}'>
                        <img src='/icons/ff16/user_delete.png' />
                        {$smarty.const.TXT_USERS_DESVINC}
                    </a>
                {/if}
            </div>
            {if $usuarios}
                <div id="dt1" class="no_margin">
                    <table class='display datatable'>
                        <thead>
                            <tr>
                                <th>{$smarty.const.FIELD_ROL}</th>
                                <th>{$smarty.const.FIELD_NOMBRE}</th>
                                <th>{$smarty.const.FIELD_APEL}</th>
                                <th>{$smarty.const.FIELD_CORREO}</th>
                                <th>{$smarty.const.FIELD_TEL}</th>
                                <th>{$smarty.const.FIELD_ACCIONES}</th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach from=$usuarios item=usuario}
                                <tr class="gradeX">
                                    <td>{$usuario->rol->nombre}</td>
                                    <td>{$usuario->usuario->nombre}</td>
                                    <td>{$usuario->usuario->apellidos}</td>
                                    <td>
                                        <a href='mailto:{$usuario->usuario->correo}'>{$usuario->usuario->correo}
                                        </a>
                                    </td>
                                    <td>{$usuario->usuario->telefono}</td>
                                    <td>
                                        <a title="{$smarty.const.FIELD_DET}" href='index.php?page=usuario_mostrar&id_usuario={$usuario->usuario->id}&id_entidad={$entidad->id}'>
                                            <img src='/icons/ff16/magnifier.png' />
                                        </a>
                                    </td>
                                </tr>
                            {/foreach}
                        </tbody>
                    </table>
                </div>
            {else}
                <div class="alert alert_blue">{$smarty.const.MSG_UNID_NO_USERS}</div>
            {/if}
        </div>
    </div>
</div>

<div class="box grid_16">
    <h2 class="box_head grad_grey_dark">{$smarty.const.FIELD_SUBUNIDS}</h2>
    <a href="#" class="grabber"></a>
    <a href="#" class="toggle"></a>
    {if $subentidades}
        <div class="block">
            <div id="dt1" class="no_margin">
                <table class="display datatable">
                    <thead>
                        <tr>
                            <th>{$smarty.const.FIELD_COD}</th>
                            <th>{$smarty.const.FIELD_NOMBRE}</th>
                            <th>{$smarty.const.FIELD_ACCIONES}</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach from=$subentidades item=subentidad}
                            <tr class="gradeX">
                                <td>{$subentidad->codigo}</td>
                                <td><a title="{$smarty.const.TXT_UNID_FICHA}" href='index.php?page=entidad_datos&id_entidad={$subentidad->id}'>
                                        <img src='/icons/ff16/chart_organisation.png' /> {$subentidad->nombre}</a></td>
                                <td style="white-space:nowrap"> 
                                    <a title="{$smarty.const.TXT_PROCS}" href='index.php?page=proceso_listar&id_entidad={$subentidad->id}'><img src='/icons/ff16/cog.png' /></a>&nbsp;
                                    <a title="{$smarty.const.FIELD_INDICS}" href='index.php?page=indicador_listar&id_entidad={$subentidad->id}'><img src='/icons/ff16/chart_curve.png' /></a>&nbsp;
                                    <a title="{$smarty.const.FIELD_DATOS}" href='index.php?page=dato_listar&id_entidad={$subentidad->id}'><img src='/icons/ff16/chart_bar.png' /></a>&nbsp;
                                    <a title="{$smarty.const.TXT_CONSULT}" href='index.php?page=consulta_avanzada&id_entidad={$subentidad->id}'><img src='/icons/ff16/book.png' /></a>&nbsp;
                                    <a title="{$smarty.const.TXT_CUAD_RES}" href='index.php?page=cuadro_unidad&id_entidad={$subentidad->id}'><img src='/icons/ff16/table_go.png' /></a>
                                </td>
                            </tr>
                        {/foreach}
                    </tbody>
                </table>
            </div>
        </div>
    {else}
        <div class="alert alert_blue">{$smarty.const.MSG_UNID_NO_SUBUNIDS}</div>
    {/if}
</div>