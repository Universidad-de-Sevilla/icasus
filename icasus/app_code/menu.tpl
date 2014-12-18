<!--
<div id="topbar" class="clearfix">
        
        <a href="index.php" class="logo"><span>Icasus</span></a>
        <div class="user_box dark_box clearfix">
                 <img src="images/profile_new.jpg" width="55" alt="Profile Pic" />  
                <h2>A</h2>
                <h3><a href="#">Usuario</a></h3>
                <ul>
                        <li><a href="#">Configuraci&oacute;n</a><span class="divider">|</span></li>
                        <li><a href="index.php?page=" . IC_TIPO_LOGIN . "&logout=true">Salir</a></li>
                </ul>
        </div>
        
</div>
-->

<div id="sidebar">
    <div class="cog">+</div>
    <a href="index.php" class="logo"><span>{$smarty.const.TXT_ICASUS}</span></a>

    <div class="user_box dark_box clearfix">
        <img align="left" src="theme/danpin/images/profile.jpg" width="55" alt="{$smarty.const.TXT_FOTO_PERFIL}" />  
        <h2 style="font-size:1.6em;">{$smarty.const.TXT_ICASUS}</h2>
        <h3><a href="#">{$_usuario->login}</a></h3>
        <ul>
            <li><a href="index.php?page={$smarty.const.IC_TIPO_LOGIN}&logout=true">{$smarty.const.TXT_CERRAR_SESION}</a></li>
        </ul>
    </div><!-- #user_box -->

    <ul class="side_accordion">
        <li><a href='index.php?page=inicio' accesskey='h'><img src='/icons/ff16/house.png' /> {$smarty.const.TXT_INICIO}</a> 
        <li><a href='index.php?page=cuadro_listar'><img src='/icons/ff16/table.png' /> {$smarty.const.TXT_CUADROS_MANDO}</a></li>
        <li><a href='index.php?page=entidad_listar'><img src='/icons/ff16/chart_organisation.png' />{$smarty.const.FIELD_UNIDS}</a></li>
        <li><a href='index.php?page=usuario_listar'><img src='/icons/ff16/user.png' /> {$smarty.const.TXT_USERS}</a></li>
        <li><a href='index.php?page=pagina_mostrar&alias=indice'><img src='/icons/ff16/user_comment.png' />{$smarty.const.TXT_AYUDA}</a></li>
        <li><a href='index.php?page=nota_mostrar'><img src='/icons/ff16/note_edit.png' /> {$smarty.const.TXT_MIS_NOTAS}</a></li>
    </ul>

    <!-- <form>
            <div id="search_side" class="dark_box"><input class="" type="text" value="Buscador..." onClick="value=''"></div>
    </form>
    -->

    {if isset($entidad)}
       <!-- <ul id="side_links" class="side_links" style="margin-bottom:0;">
            <span>
                <a href="#"><strong>{$smarty.const.TXT_UNID}</strong></a>
            </span>
            <li>
                <ul>
                    <li><a href='index.php?page=entidad_datos&id_entidad={$entidad->id}'><img 
                                src='/icons/ff16/chart_organisation.png' alt='{$smarty.const.TXT_ICON}' /> {$smarty.const.TXT_UNID_FICHA}</a></li>
                    <li><a href='index.php?page=cuadro_unidad&id_entidad={$entidad->id}'><img 
                                src='/icons/ff16/table_go.png' />
                            {$smarty.const.TXT_CUAD_RES}</a></li>
                    <li><a href='index.php?page=consulta_avanzada&id_entidad={$entidad->id}'><img 
                                src='/icons/ff16/book.png' />
                            {$smarty.const.TXT_CONSULT}</a></li>
                    <li><a href='index.php?page=proceso_listar&id_entidad={$entidad->id}'><img 
                                src='/icons/ff16/cog.png' />
                            {$smarty.const.TXT_PROCS}</a></li>
                    <li><a href='index.php?page=indicador_listar&id_entidad={$entidad->id}'><img 
                                src='/icons/ff16/chart_curve.png' />
                            {$smarty.const.FIELD_INDICS}</a></li>
                    <li><a href='index.php?page=dato_listar&id_entidad={$entidad->id}'><img 
                                src='/icons/ff16/chart_bar.png' />
                            {$smarty.const.FIELD_DATOS}</a></li>

                </ul>
            </li>	
        </ul>	-->
    {/if}
    
    <!--
    <ul id="side_links" class="side_links" style="margin-bottom:0;">
            <span>
                            <a href="#"><strong>Enlaces externos</strong></a>
            </span>
            <li>
                    <ul>
                            <li><a href='http://www.us.es/'>Universidad de Sevilla</a></li>
                            <li><a href='https://www.r2h2.us.es/excelencia'>Excelencia</a></li>
                            <li><a href='http://www.r2h2.us.es/'>Recursos Humanos</a></li>
                            <li><a href='http://buzonweb.us.es/'>Correo US</a></li>
                            <li><a href='http://www.google.es/'>Google</a></li>
                    </ul>
            </li>
    </ul>-->
</div><!-- #sidebar -->