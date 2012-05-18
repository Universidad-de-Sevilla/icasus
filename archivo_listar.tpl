{if $smarty.get.aviso}<p class='aviso'>{$smarty.get.aviso}</p>
{elseif $aviso}<p class='aviso'>{$aviso}</p>
{/if}

{if $smarty.get.error}<p class='error'>{$smarty.get.error}</p>
{elseif $error}<p class='error'>{$error}</p>
{/if}

<h3>Subir ficheros</h3>

<form class="datos" method="post" action="index.php?page=archivo_subir&dir={$directorio}" enctype="multipart/form-data" > 
    <input type="file" name="archivo" class="inp"/>
    <input name="enviar" type="submit" value="Subir archivo" />
</form>

<p>Recuerda que el nombre del archivo es el que se verá en la relación inferior, por ello renombra tu archivo antes de subirlo para que sea clarificador para los que vayan a descargarlos.</p>
<p style="color:red">IMPORTANTE: el nombre de los ficheros no deben contener caracteres como ñ, acentos o espacios en blanco.</p>

<h3>Contenido de {$directorio}</h3>
<table class="datos">
{foreach from=$archivos item=archivo }
    {* Evitamos que se ven los directorios ".", ".." y cualquier archivo o directorio que empiece por "." *}
    {if $archivo[0][0] == '.'}
    {else}
        <tr bgcolor='#fff8e5'>
        <td><a href="upload/{$directorio}/{$archivo[0]}"><img src='iconos/16x16/page.png' alt='-' /> {$archivo[0]}</a></td>
        <td>{$archivo[1]}</td>
        <td><a href="index.php?page=archivo_borrar&fichero={$archivo[0]}&dir={$directorio}" 
            onclick="javascript: return confirm('Quieres borrar el archivo : {$archivo[0]}');"><img 
            src='iconos/16x16/cross.png' title ='Borrar' alt='Borrar' /></a></td>
        </tr>
    {/if}
{/foreach}
</table>
