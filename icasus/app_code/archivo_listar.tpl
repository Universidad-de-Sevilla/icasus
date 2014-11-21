{if $smarty.get.aviso}<p class='aviso'>{$smarty.get.aviso}</p>
{elseif $aviso}<p class='aviso'>{$aviso}</p>
{/if}

{if $smarty.get.error}<p class='error'>{$smarty.get.error}</p>
{elseif $error}<p class='error'>{$error}</p>
{/if}

<h3>{$smarty.const.TXT_ARCHIVOS_SUBIR}</h3>

<form class="datos" method="post" action="index.php?page=archivo_subir&dir={$directorio}" enctype="multipart/form-data" > 
    <input type="file" name="archivo" class="inp"/>
    <input name="enviar" type="submit" value="{$smarty.const.TXT_ARCHIVO_SUBIR}" />
</form>

<p>{$smarty.const.MSG_REN_FILE}</p>
<p style="color:red">{$smarty.const.MSG_FILE_NAME}</p>

<h3>{$smarty.const.TXT_CONTENIDO} {$directorio}</h3>
<table class="datos">
{foreach from=$archivos item=archivo }
    {* Evitamos que se ven los directorios ".", ".." y cualquier archivo o directorio que empiece por "." *}
    {if $archivo[0][0] == '.'}
    {else}
        <tr bgcolor='#fff8e5'>
        <td><a href="upload/{$directorio}/{$archivo[0]}"><img src='iconos/16x16/page.png' alt='-' /> {$archivo[0]}</a></td>
        <td>{$archivo[1]}</td>
        <td><a href="index.php?page=archivo_borrar&fichero={$archivo[0]}&dir={$directorio}" 
            onclick="javascript: return confirm('{$smarty.const.MSG_CONFIRM_DEL_FILE} : {$archivo[0]}');"><img 
            src='iconos/16x16/cross.png' title ='{$smarty.const.TXT_BORRAR}' alt='{$smarty.const.TXT_BORRAR}' /></a></td>
        </tr>
    {/if}
{/foreach}
</table>
