{if $aviso}<p class='aviso'>{$aviso}</p>{/if} 
{if $error}<p class='error'>{$error}</p>{/if} 
<div style='width: 335px; float:left; margin:5px;'>
<img src='theme/usevilla/cuadromando.png' alt='icono grafica lineal' align='right' /><p><b>Icasus</b> es una aplicación web para la gestión de la calidad en la 
<a href="http://www.us.es/">Universidad de Sevilla</a>.</p>

<p>Para acceder al sistema es necesario ser miembro activo de alguno de los 
grupos de calidad de la Universidad de Sevilla y solicitar autorización de acceso 
al responsable de su grupo de calidad.</p>

<p>Icasus ha sido desarrollado por el <a href="http://www.r2h2.us.es/">Área de Recursos Humanos</a> 
de la Universidad de Sevilla y <a href="http://forja.rediris.es/projects/icasus/">puede utilizarse 
como software libre</a>.</p>
<p>Puede bajar una primera versión del <a href="http://icasus.us.es/upload/ayuda/icasus_manual_breve.pdf">Manual de referencia rápida de Icasus</a> en formato PDF. Revisión disponible: 26 mayo
2010</p>


</div>
<div style='width: 250px; float:left; margin:20px;'>
<form method="post" action="index.php?page=login" id="formlogin" onsubmit="return login_validar(this)">
    <input type="hidden" name="acceso" value="1" />
    <label for="login">Usuario</label> <br />
    <input type="text" name="login" id="login" class="inp" />
    <label for="clave">Clave</label> <br />
    <input type="password" name="clave" id="clave" class="inp" /><br />
    <input type="submit" class="submit-btn" value="Enviar" />
</form>
</div>
<!--
<p class='aviso'>Hemos realizado una nueva actualización de Icasus (11/11/2009 10:00).
Por favor si observas algún error escribe a <a href='mailto:juanan@us.es'><img
src='iconos/16x16/email_edit.png' /> juanan@us.es</a> o llama al <img
src='iconos/16x16/phone.png' /> 87458</p>                  
-->
<!-- Novedades Icasus -->
<p style="clear:both;">&nbsp;</p>
{$pagina->contenido}
