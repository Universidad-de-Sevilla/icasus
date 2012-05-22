{if $aviso}<p class='aviso'>{$aviso}</p>{/if}
{if $error}<p class='error'>{$error}</p>{/if}
<h3>Listar actas</h3>
{if $rol == 3}
<a href='index.php?page=grupo/acta_crear&id_entidad={$id_entidad}'><img src='iconos/16x16/report_add.png' />  Crear actas</a>
{/if}
{if $actas}
<table>
<thead>
<tr><th>Nº</th><th>Nombre</th><th>Fecha inicio</th><th>Fecha fin</th><th>Acciones</th></tr>
</thead>
<tbody>
{foreach from=$actas item=acta}
<tr>
<td>{$acta->numero}</td><td>{$acta->nombre}</td><td>{$acta->fecha|date_format:"%d-%m-%Y"}</td><td>{$acta->fin|date_format:"%d-%m-%Y"}</td>
<td>
{if $rol == 3}
<a href="index.php?page=grupo/acta&id_entidad={$acta->id_entidad}&id_acta={$acta->id_acta}">Editar</a> -
{/if}
<a href="index.php?page=grupo/acta_leer&id_acta={$acta->id_acta}">Leer</a>
</td>
</tr>
{/foreach}
</table>
{else}
<p class="aviso">Este equipo no tiene actas.</p>
{/if}
