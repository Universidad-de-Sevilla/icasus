<div class="box grid_16">
    <div class="toggle_container">
        <h2 class="box_head grad_grey_dark">{$smarty.const.TXT_USER_UNIDS}</h2>
        <a href="#" class="grabber"></a>
        <a href="#" class="toggle"></a>
        {if $entidades_usuario }
            <div class="block">
                <div id="dt1" class="no_margin">
                    <table class="display datatable">
                        <thead>
                            <tr>
                                <th>{$smarty.const.FIELD_COD}</th>
                                <th>{$smarty.const.FIELD_UNID}</th>
                                <th>{$smarty.const.FIELD_ROL}</th>
                                <th>{$smarty.const.FIELD_ACCIONES}</th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach from=$entidades_usuario item=entidad}
                                <tr>
                                    <td>{$entidad->entidad->codigo}</td>
                                    <td><a title="{$smarty.const.TXT_UNID_FICHA}" href='index.php?page=entidad_datos&id_entidad={$entidad->entidad->id}'><img src='/icons/ff16/chart_organisation.png' /> {$entidad->entidad->nombre}</a></td>
                                    <td>{$entidad->rol->nombre}</td>
                                    <td  width="16%">
                                        <a title="{$smarty.const.TXT_PROCS}" href='index.php?page=proceso_listar&id_entidad={$entidad->entidad->id}'><img src='/icons/ff16/cog.png' /></a>&nbsp;
                                        <a title="{$smarty.const.FIELD_INDICS}" href='index.php?page=indicador_listar&id_entidad={$entidad->entidad->id}'><img src='/icons/ff16/chart_curve.png' /></a>&nbsp;
                                        <a title="{$smarty.const.FIELD_DATOS}" href='index.php?page=dato_listar&id_entidad={$entidad->entidad->id}'><img src='/icons/ff16/chart_bar.png' /></a>&nbsp;
                                        <a title="{$smarty.const.TXT_CONSULT}" href='index.php?page=consulta_avanzada&id_entidad={$entidad->entidad->id}'><img src='/icons/ff16/book.png' /></a>&nbsp;
                                        <a title="{$smarty.const.TXT_CUAD_RES}" href='index.php?page=cuadro_unidad&id_entidad={$entidad->entidad->id}'><img src='/icons/ff16/table_go.png' /></a> 
                                            {if $entidad->rol->id == 1 OR $entidad->rol->id == 2}
                                            &nbsp;<a title="{$smarty.const.TXT_CONTROL}" href='index.php?page=control&modulo=inicio&id_entidad={$entidad->entidad->id}'><img src='/icons/ff16/eye.png' /></a>
                                            {/if}
                                        <!--
                                        <a href="index.php?page=plan_estrategico/plan_listar&id_entidad={$entidad->entidad->id}&entidad={$entidad->entidad->nombre|htmlentities}">Planificaci&oacute;n</a> -
                                        <a href='index.php?page=grupo/acta_listar&id_entidad={$entidad->entidad->id}' title="Ver las actas de este equipo">Actas</a> 
                                        -->
                                    </td>
                                </tr>
                            {/foreach}
                        </tbody>
                    </table>
                </div>
            {else}
                <div class="alert alert_blue">{$smarty.const.MSG_UNID_NO_ASIG}</div>
            {/if}
        </div>
    </div>
</div>

<div class="box grid_16">
    <div class="toggle_container">
        <h2 class="box_head grad_grey_dark">{$smarty.const.TXT_UNID_TODAS}</h2>
        <!--
              <div class="box grid_16">
                      <div class="block">	
                              <form action='index.php?page=entidad_listar' method="post" class="mini" name="formlogin">
                              <input name='id_entidad' type='hidden' value='{$entidad->id}'/>
                              <label for='criterio'>B&uacute;squeda:</label> 
                              <input name='criterio' type='text' class='inp' value='{if isset($criterio)}{$criterio}{/if}'/>
                              </form>
                      </div>
              </div>		
        -->
        <a href="#" class="grabber"></a>
        <a href="#" class="toggle"></a>
        {if isset($entidades)}
            <div class="block">
                <div id="dt1" class="no_margin">
                    <table class="display datatable"> 
                        <thead>
                            <tr>
                                <th>{$smarty.const.FIELD_COD}</th>
                                <th>{$smarty.const.FIELD_UNID}</th>
                                <th>{$smarty.const.FIELD_ACCIONES}</th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach from=$entidades item=entidad}
                                <tr class="gradeX">
                                    <td>{$entidad->codigo}</td>
                                    <td><a title="{$smarty.const.TXT_UNID_FICHA}" href='index.php?page=entidad_datos&id_entidad={$entidad->id}'><img src='/icons/ff16/chart_organisation.png' /> {$entidad->nombre}</a></td>
                                    <td  width="16%"> 
                                        <a title="{$smarty.const.TXT_PROCS}" href='index.php?page=proceso_listar&id_entidad={$entidad->id}'><img src='/icons/ff16/cog.png' /></a>&nbsp;
                                        <a title="{$smarty.const.FIELD_INDICS}" href='index.php?page=indicador_listar&id_entidad={$entidad->id}'><img src='/icons/ff16/chart_curve.png' /></a>&nbsp; 
                                        <a title="{$smarty.const.FIELD_DATOS}" href='index.php?page=dato_listar&id_entidad={$entidad->id}'><img src='/icons/ff16/chart_bar.png' /></a>&nbsp;
                                        <a title="{$smarty.const.TXT_CONSULT}" href='index.php?page=consulta_avanzada&id_entidad={$entidad->id}'><img src='/icons/ff16/book.png' /></a>&nbsp;
                                        <a title="{$smarty.const.TXT_CUAD_RES}" href='index.php?page=cuadro_unidad&id_entidad={$entidad->id}'><img src='/icons/ff16/table_go.png' /></a>&nbsp; 
                                    </td>
                                </tr>
                            {/foreach}
                        </tbody>
                    </table>
                </div>		  
            {/if}
        </div>
    </div>
</div>