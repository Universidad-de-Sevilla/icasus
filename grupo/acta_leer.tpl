{if $aviso}<p class='aviso'>{$aviso}</p>{/if}
{if $error}<p class='error'>{$error}</p>{/if}
{if $acta}
<div style="margin:15px 0 15px 0">
    <a href="http://icasus.us.es/grupo/acta_exportar.php?id_acta={$acta->id_acta}">      <img src='iconos/16x16/page_word.png' title="Generar word"/> Generar word</a>&nbsp;
</div>
<div style="padding:15px;border:1px dotted #07a">
<h3>Acta nº {$acta->numero} de {$acta->fecha|date_format:"%d-%m-%Y"} del Equipo "{$acta->entidad[0]->nombre}"</h3>
<p><b>Asuntos / Temas tratados:</b><br />
<ul style="list-style:none;">
{foreach from=$acta->asuntos item=asunto}
<li><b>{$asunto->numero}.-</b> {$asunto->asunto}</li>
{/foreach}
</ul></p>

<p><b>Asistentes:</b><br />
<ul style="list-style:none;">
{foreach from=$acta->usuarios item=asiste}
{if $asiste->asiste  == 1}
<li>{$asiste->nombre_usuario} {$asiste->apellidos_usuario}</li>
{/if}
{/foreach}
</ul></p>

<p><b>Ausentes:</b><br />
<ul style="list-style:none;">
{foreach from=$acta->usuarios item=asiste}
{if $asiste->asiste == 0}
<li>{$asiste->nombre_usuario} {$asiste->apellidos_usuario}</li>
{/if}
{/foreach}
</ul></p>

<p><b>Acuerdos:</b><br />
<ul style="list-style:none;">
{foreach from=$acta->acuerdos item=acuerdo}
<li><b>{$acuerdo->numero}.-</b> {$acuerdo->acuerdo}</li>
{/foreach}
</ul></p>

<p><b>Tareas:</b><br />
<ul style="list-style:none">
{foreach from=$acta->tareas item=tarea}
<li style="padding-top:10px;margin-top:10px;"><b>{$tarea->numero}.-</b> {$tarea->tarea}</li>
<li><b>Responsable:</b> {$tarea->nombre}</li>
<li style="padding-bottom:10px;border-bottom:1px solid #e9e9e9"><b>Adjudicación:</b> {$tarea->adjudicacion|date_format:"%d-%m-%Y"} <b>Estimada:</b> {$tarea->estimada|date_format:"%d-%m-%Y"} <b>Fin:</b> {$tarea->finalizacion|date_format:"%d-%m-%Y"}</li>
{/foreach}
</ul></p>
<!--
<p><b>Notas:</b><br />
<ul style="list-style:none">
<li>{$acta->descripcion}</li>
</ul></p>
-->
</div>
<div style="margin:15px 0 0 0" >
</div>
    <a href="http://wiki.us.es/icasus/grupo/acta_exportar.php?id_acta={$acta->id_acta}">      <img src='iconos/16x16/page_word.png' title="Generar word"/> Generar word</a>&nbsp;
{else}
<p class="aviso">Este equipo no tiene actas.</p>
{/if}
