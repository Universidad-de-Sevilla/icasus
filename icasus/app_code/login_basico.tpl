<div style='width: 335px; float:left; margin:5px;'>
    <img src='theme/usevilla/cuadromando.png' alt='{$smarty.const.TXT_ICON_GRAF_LINEAL}' align='right' /><p><b>{$smarty.const.TXT_ICASUS}</b> {$smarty.const.TXT_LOGIN_PARTE1}
        <a href="http://www.us.es/">{$smarty.const.TXT_UNIVERSIDAD}</a>.</p>

    <p>{$smarty.const.TXT_LOGIN_PARTE2}</p>

    <p>{$smarty.const.TXT_LOGIN_PARTE3} <a href="http://www.r2h2.us.es/">{$smarty.const.TXT_AREA_REC_HUM} </a> 
        {$smarty.const.TXT_LOGIN_PARTE4} <a href="http://forja.rediris.es/projects/icasus/">{$smarty.const.TXT_SOFT_LIBRE}</a>.</p>

    <p>{$smarty.const.TXT_LOGIN_PARTE5}<a href="http://icasus.us.es/upload/ayuda/icasus_manual_breve.pdf"> {$smarty.const.TXT_MANUAL} </a>
        {$smarty.const.TXT_LOGIN_PARTE6}</p>


</div>
<div style='width: 250px; float:left; margin:20px;'>
    <form method="post" action="index.php?page=login_basico" id="formlogin" onsubmit="return login_validar(this);">
        <input type="hidden" name="redirige" value="{*$redirige*}" />
        <input type="hidden" name="autenticar" value="true" />
        <label for="login"><b>{$smarty.const.FIELD_USER}</b></label> <br />
        <input type="text" name="login" id="login" class="inp" /><br />
        <label for="clave"><b>{$smarty.const.FIELD_CLAVE}</b></label> <br />
        <input type="password" name="clave" id="clave" class="inp" /><br />
        <input type="submit" class="submit-btn" value={$smarty.const.TXT_BTN_ENVIAR} />
    </form>
</div>
<!-- Novedades Icasus -->
