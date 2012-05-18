{if $aviso}<p class='aviso'>{$aviso}</p>{/if}
{if $error}<p class='error'>{$error}</p>{/if}
<h3>Acta:</h3>
	<form method="post" action="index.php?page=grupo/acta_modificar"  >

  		<div>
    			<input type="submit" id="graba_acta" title="Grabar datos" value="   Grabar datos" 
     			style="border:0px;background: url('iconos/16x16/disk.png') no-repeat;display:none" 
			onsubmit="javascript:return confirm('Grabar datosdel acta');" />
    			
			<input type="button" id="cerrar_datos_acta" title="cerrar_ventana" value="   Cerrar ventana"
			style="border:0px;background: url('iconos/16x16/cancel.png') no-repeat;display:none"
			onclick="javascript:
     			document.getElementById('graba_acta').style.display='none';
     			document.getElementById('cerrar_datos_acta').style.display='none';
     			document.getElementById('acta').style.display='none';
     			document.getElementById('edita_acta').style.display='inline';
			"/>		
				
			<input type="button" id="edita_acta" title="Modificar datos" value="   Modificar datos" 
     			style="border:0px;background: url('iconos/16x16/book_edit.png') no-repeat;" 
     			onclick="javascript:
     			document.getElementById('acta').style.display='inline';
     			document.getElementById('graba_acta').style.display='inline';
     			document.getElementById('cerrar_datos_acta').style.display='inline';
     			document.getElementById('edita_acta').style.display='none';
     			document.getElementById('numero').focus();" />
  		</div>
  		<div id="acta"  style="display:none">
			<div class="datos_acta">	

				<p><label for='numero'>Número</label> <br />&nbsp; <span class='grey'></span>
        			<input type="text" name="numero" value="{$acta->numero}" />
        		
				<p><label for='nombre'>Nombre</label><br /> &nbsp; <span class='grey'></span>
        			<input type="text" name="nombre" value="{$acta->nombre}" style="width:95%" />
			</div>
			<input type="hidden" name="id_acta" value="{$acta->id_acta}" />
   			<input type="hidden" name="graba" name="graba" value="acta"/>
  		</div>
  	</form>
	<table width="100%">
		<tr><th width="15%">Número</th><td width="85%">{$acta->numero}</td></tr>
		<tr><th>Nombre</th><td>{$acta->nombre}</td></tr>
	</table>
<a href="#notas" style="float:right"><img src="iconos/16x16/note_go.png" /> Ir a notas</a>
<h3>Convocatoria:</h3>
<form method="post" action="index.php?page=grupo/convocatoria_modificar"  >

                <div>
                        <input type="submit" id="graba_convocatoria" title="Grabar convocatoria" value="   Grabar convocatoria" 
                        style="border:0px;background: url('iconos/16x16/disk.png') no-repeat;display:none" 
                        onsubmit="javascript:return confirm('Grabar datos de la convocatoria');" />

                        <input type="button" id="cerrar_datos_convocatoria" title="Cerrar ventana" value="   Cerrar ventana"
                        style="border:0px;background: url('iconos/16x16/cancel.png') no-repeat;display:none"
                        onclick="javascript:
                        document.getElementById('graba_convocatoria').style.display='none';
                        document.getElementById('cerrar_datos_convocatoria').style.display='none';
                        document.getElementById('convocatoria').style.display='none';
                        document.getElementById('edita_convocatoria').style.display='inline';
                        "/>

                        <input type="button" id="edita_convocatoria" title="Modificar datos" value="   Modificar datos" 
                        style="border:0px;background: url('iconos/16x16/book_edit.png') no-repeat;" 
                        onclick="javascript:
                        document.getElementById('convocatoria').style.display='inline';
                        document.getElementById('graba_convocatoria').style.display='inline';
                        document.getElementById('cerrar_datos_convocatoria').style.display='inline';
                        document.getElementById('edita_convocatoria').style.display='none';
                        document.getElementById('lugar').focus();" />
                </div>
		<div id="convocatoria"  style="display:none">
                        <div class="datos_acta">

                                <p><label for='lugar'>Lugar</label><br /> &nbsp; <span class='grey'></span>
                                <input type="text" id="lugar" name="lugar" value="{$acta->lugar}" style="width:95%"/>

                                <p><label for='fecha'>Fecha de inicio</label><br /> &nbsp; <span class='grey'></span>
                                {html_select_date field_order='DMY' prefix="fecha" month_format='%m'  time=$acta->fecha}

                                <p><label for='Hora inicio'>Hora inicio</label><br /> &nbsp; <span class='grey'></span>
                                {html_select_time use_24_hours=true display_seconds=false time=$acta->fecha}
                        </div>
                        <input type="hidden" name="id_acta" value="{$acta->id_acta}" />
                        <input type="hidden" name="graba" value="convocatoria"/>
                </div>
</form>
	<table width="100%">	
		<tr><th width="15%">Lugar</th><td width="85%" >{$acta->lugar}</td></tr>
                <tr><th>Fecha</th><td>{$acta->fecha|date_format:"%d-%m-%Y"}</td></tr> 
                <tr><th>Hora inicio</th><td>{$acta->fecha|date_format:"%H:%M"}</td></tr>
                <tr><th>Fin</th><td>{$acta->fin|date_format:"%d-%m-%Y"}</td></tr> 
                <tr><th>Hora fin</th><td>{$acta->fin|date_format:"%H:%M"}</td></tr>
	</table>
<a href="#notas" style="float:right"><img src="iconos/16x16/note_go.png" /> Ir a notas</a>
<h3>Temas a tratar/Orden del día:</h3>
<form method="post" action="index.php?page=grupo/asunto_grabar&id_entidad={$acta->id_entidad}">
                <div>
                        <input type="submit" id="graba-asunto" title="Grabar asunto" value="   Grabar asunto" 
                        style="border:0px;background: url('iconos/16x16/disk.png') no-repeat;display:none" />
        
                        <input type="button" id="nuevo-asunto" title="Crear nuevo asunto" value="   Nuevo asunto" 
                        style="border:0px;background: url('iconos/16x16/page_add.png') no-repeat;" 
                        onclick="javascript:
                        document.getElementById('asunto').style.display='inline';
                        document.getElementById('cerrar_nuevo_asunto').style.display='inline';
                        document.getElementById('graba-asunto').style.display='inline';
                        document.getElementById('nuevo-asunto').style.display='none';
                        document.getElementById('numero').focus();" />
        
                        <input type="button" id="cerrar_nuevo_asunto" title="cerrar_ventana" value="   Cerrar ventana"
                        style="border:0px;background: url('iconos/16x16/cancel.png') no-repeat;display:none"
                        onclick="javascript:
                        document.getElementById('asunto').style.display='none';
                        document.getElementById('cerrar_nuevo_asunto').style.display='none';
                        document.getElementById('graba-asunto').style.display='none';
                        document.getElementById('nuevo-asunto').style.display='inline';
                        "/>
 
                </div>
                <div id="asunto" style="display:none">
                        <div class="datos_acta">
                        
                                <p><label for='numero'>Número</label><br /><span class='grey'></span>
                                <input type="text" name="numero" id="numero"/></p>
                                
                                <p><label for='acuerdo'>Asunto</label><br /><span class='grey'></span>
                                <textarea name="asunto"  rows="4" cols="70%"/></textarea>
                        </div>
                        <input type="hidden" name="id_acta" value="{$acta->id_acta}" />
                        <input type="hidden" name="graba"  value="asunto"/>
                </div>
        </form>

{if $acta->asuntos}
<table>
                        <tr> <th>Acción</th><th>Nº</th><th>Asunto a tratar</th></tr>
                        {foreach from=$acta->asuntos item=asunto}
                        <tr>
                        <td><a href="index.php?page=grupo/asunto_borrar&id_asunto={$asunto->id_asunto}&id_acta={$acta->id_acta}" 
                        onclick="return confirm('¿Desea borrar el asunto nº {$asunto->id_asunto} ?');"><img src='iconos/16x16/page_delete.png' title="Borrar asunto"/></a> &nbsp; 
                        <a href="index.php?page=grupo/asunto_editar&id_asunto={$asunto->id_asunto}&id_acta={$acta->id_acta}" title="Editar asunto" >
                        <img src='iconos/16x16/page_edit.png' /></a></td>
                        <td>{$asunto->numero}</td><td width="100%" >{$asunto->asunto}</td>
                        </tr>
                        {/foreach}
                </table>

{else}
<p class="aviso">No hay asuntos a tratar definidos para este acta</p>
{/if}
<a href="#notas" style="float:right"><img src="iconos/16x16/note_go.png" /> Ir a notas</a>
<h3>Asistentes:</h3>
	<table>
        	<thead>
                <tr><th>Si</th><th>No</th><th>Nombre</th><th>Apellidos</th></tr>
        	</thead>
        	<tbody>
		{foreach from=$acta->usuarios item=usuario}

<tr>    
                        <td >
                         	<input type="radio" name="si{$usuario->id_usuario}" id="si{$usuario->id_usuario}" value="1" 
                         	onclick="javascript:marcar_asistencia({$usuario->id_usuario},{$acta->id_acta},1);" 
				{if $usuario->asiste == 1} checked{/if}
				/> 
                        </td>
                        <td>
                        	<input type="radio" name="si{$usuario->id_usuario}" id="si{$usuario->id_usuario}" value="0"  
                         	onclick="javascript:marcar_asistencia({$usuario->id_usuario},{$acta->id_acta},0);" 
				{if $usuario->asiste == ''} {elseif $usuario->asiste  == 0} checked {/if}
				/>
			</td>
                        <td width="40%" >{$usuario->nombre_usuario}</td><td width="100%">{$usuario->apellidos_usuario}</td>
                </tr>
        	{/foreach}
	</table>
<a href="#notas" style="float:right"><img src="iconos/16x16/note_go.png" /> Ir a notas</a>
<h3>Acuerdos:</h3>
  	<form method="post" action="index.php?page=grupo/acuerdo_grabar">
    		<div>
			<input type="submit" id="graba-acuerdo" title="Grabar acuerdo" value="   Grabar acuerdo" 
     			style="border:0px;background: url('iconos/16x16/disk.png') no-repeat;display:none" onsubmit="javascript:return confirm('');" />

			<input type="button" id="nuevo" title="Crear nuevo acuerdo" value="   Nuevo acuerdo" 
     			style="border:0px;background: url('iconos/16x16/page_add.png') no-repeat;" 
     			onclick="javascript:
     			document.getElementById('acuerdo').style.display='inline';
     			document.getElementById('cerrar_nuevo_acuerdo').style.display='inline';
     			document.getElementById('graba-acuerdo').style.display='inline';
     			document.getElementById('nuevo').style.display='none';
     			document.getElementById('numero').focus();" />

			<input type="button" id="cerrar_nuevo_acuerdo" title="cerrar_ventana" value="   Cerrar ventana"
                        style="border:0px;background: url('iconos/16x16/cancel.png') no-repeat;display:none"
                        onclick="javascript:
                        document.getElementById('acuerdo').style.display='none';
                        document.getElementById('cerrar_nuevo_acuerdo').style.display='none';
                        document.getElementById('graba-acuerdo').style.display='none';
                        document.getElementById('nuevo').style.display='inline';
                        "/>
 
   		</div>
		<div id="acuerdo" style="display:none">
			<div class="datos_acta">
			
				<p><label for=''>Número</label><br /><span class='grey'></span>
				<input type="text" name="numero" id="numero"/></p>
				
				<p><label for=''>Acuerdo</label><br /><span class='grey'></span>
				<textarea name="acuerdo" id="acuerdo" rows="4" cols="70%"/></textarea>
			</div>
     			<input type="hidden" name="id_acta" value="{$acta->id_acta}" />
     			<input type="hidden" name="graba" value="acuerdo"/>
		</div>
  	</form>
<div>
  	{if $acta->acuerdos}
  		<table>
          		<tr> <th>Acción</th><th>Nº</th><th>Texto</th></tr>
          		{foreach from=$acta->acuerdos item=acuerdo}
          		<tr>
	 		<td><a href="index.php?page=grupo/acuerdo_borrar&id_acuerdo={$acuerdo->id_acuerdo}&id_acta={$acta->id_acta}" 
			onclick="return confirm('¿Desea borrar el acuerdo nº {$acta->numero}? ');"><img src='iconos/16x16/page_delete.png' title="Borrar acuerdo"/></a> &nbsp; 
			<a href="index.php?page=grupo/acuerdo_editar&id_acuerdo={$acuerdo->id_acuerdo}&id_acta={$acta->id_acta}" title="Editar acuerdo" >
			<img src='iconos/16x16/page_edit.png' /></a></td>
			<td>{$acuerdo->numero}</td><td width="100%" >{$acuerdo->acuerdo}</td>
			</tr>
        		{/foreach}
        	</table>
  	{else}
    		<p class="aviso">No hay acuerdos en este acta</p>
  		{/if}
</div>

<a href="#notas" style="float:right"><img src="iconos/16x16/note_go.png" /> Ir a notas</a>
<h3>Tareas:</h3>
<form method="post" action="index.php?page=grupo/tarea_grabar" style="100%">
		<div> 
			<input type="submit" id="grabatarea" title="Grabar tarea" value="   Grabar tarea"  
         		style="border:0px;background:#fff url('iconos/16x16/disk.png') no-repeat;display:none" />

 			<input type="button" id="nueva" title="Crear nueva tarea" value="   Nueva tarea" 
 			style="border:0px;background:#fff url('iconos/16x16/plugin_add.png') no-repeat;" 
 			onclick="javascript:
 			document.getElementById('tarea').style.display='inline';
 			document.getElementById('grabatarea').style.display='inline';
 			document.getElementById('cerrar_nueva_tarea').style.display='inline';
 			document.getElementById('nueva').style.display='none';
 			document.getElementById('number').focus();" />

                        <input type="button" id="cerrar_nueva_tarea" title="Cerrar ventana" value="   Cerrar ventana"
                        style="border:0px;background: url('iconos/16x16/cancel.png') no-repeat;display:none"
                        onclick="javascript:
                        document.getElementById('tarea').style.display='none';
                        document.getElementById('cerrar_nueva_tarea').style.display='none';
                        document.getElementById('grabatarea').style.display='none';
                        document.getElementById('nueva').style.display='inline';
                        "/>
 
		</div>
		<div id="tarea" style="display:none">
			<div class="datos_acta">
				<p><label for='numero'>Número</label><br /> &nbsp; <span class='grey'></span>
				<input type="text" name="number" id="number"/> </td></tr>
				<p><label for='tarea'>Tarea</label><br /> &nbsp; <span class='grey'></span>
   				<textarea name="tarea" id="tarea" rows="4" cols="65"/></textarea></td></tr>
				<p><label for='Responsable'>Responsable</label><br /> &nbsp; <span class='grey'></span>
   				<select name="responsable">
   				{foreach from=$acta->usuarios item=usuario}
   				<option value="{$usuario->id_usuario}">{$usuario->nombre_usuario} {$usuario->apellidos_usuario}</option>
   				{/foreach}
   				</select>
				<p><label for='adjudicacion'>Fecha adjudicación</label><br /> &nbsp; <span class='grey'></span>
				{html_select_date field_order='DMY' prefix="adjudicacion" month_format='%m'}
				<p><label for='estimada'>Fecha estimada</label><br /> &nbsp; <span class='grey'></span>
				{html_select_date field_order='DMY' prefix="estimada" month_format='%m'}
			</div>
   			<input type="hidden" name="id_acta" value="{$acta->id_acta}" />
   			<input type="hidden" name="graba" name="graba" value="tarea"/>
		</div>
	</form>
<div style="margin-top:20px">
	{if $acta->tareas}
  		<table>
			<tr><th>Acción</th><th>Nº</th><th>Usuario</th><th>Tarea</th><th>Adjudicación</th><th>Estimación</th><th>Finalización</th></tr>
        		{foreach from=$acta->tareas item=tarea}
           		<tr>
			<td><a href="index.php?page=grupo/tarea_borrar&id_tarea={$tarea->id_tarea}&id_acta={$acta->id_acta}"
			onclick="return confirm('¿Desea borrar la tarea nº {$tarea->numero} ?');"><img src='iconos/16x16/plugin_delete.png' title="Borrar tarea"/></a> &nbsp; 
			<a href="index.php?page=grupo/tarea_editar&id_tarea={$tarea->id_tarea}&id_acta={$acta->id_acta}">
			<img src='iconos/16x16/plugin_edit.png' title="Editar tarea"/></a></td>
			<td>{$tarea->numero}</td><td>{$tarea->nombre}</td>
			<td width="100%" >{$tarea->tarea}</td><td>{$tarea->adjudicacion|date_format:"%d-%m-%Y"}</td>
			<td>{$tarea->estimada|date_format:"%d-%m-%Y"}</td>
			<td>{$tarea->finalizacion|date_format:"%d-%m-%Y"}</td>
	   		</tr>
        		{/foreach}
   		</table>
	{else}
		<p class="aviso">No hay tareas definidas en este acta</p>
	{/if}
</div>
<h3>Acciones:</h3>
<a href="index.php?page=grupo/acta_cerrar&id_entidad={$acta->id_entidad}&id_acta={$acta->id_acta}">
<img src='iconos/16x16/report_key.png' title="Cerrar acta"/> Cerrar Acta</a> &nbsp;
<a href="index.php?page=grupo/acta_exportar_word&id_acta={$acta->id_acta}">
<img src='iconos/16x16/page_word.png' title="Generar word"/> Generar word</a>&nbsp;
<!-- 
<a href="index.php?page=grupo/acta_exportar_word&id_acta={$acta->id_acta}">
<img src='iconos/16x16/report_user.png' title="Convocatoria de reunion de equipo"/> Convocatoria de Grupo</a>&nbsp;
<a href="index.php?page=grupo/acta_exportar_word&id_acta={$acta->id_acta}">
<img src='iconos/16x16/report_link.png' title="Enviar actas"/> Enviar Actas</a>
-->
<h3>Notas:</h3><a name="notas"></a>
	<form id="nota" name="nota" action="index.php?page=grupo/nota_grabar&id_acta={$acta->id_acta}" METHOD="POST" >
	
		<input type="button" id="imgEdit" name="imgEdit" value="   Editar" 
                style="border:0px;background: url('iconos/16x16/note_edit.png') no-repeat"
		onclick="
  		document.getElementById('notas').readOnly = false;
  		document.getElementById('notas').style.backgroundColor='#f6f6f6';         
  		document.getElementById('notas').style.border='1px dashed #c9c9c0';        
  		document.getElementById('notas').style.padding='15px';        
  		document.getElementById('imgEdit').style.display='none';      
  		document.getElementById('imgSave').style.display='inline';    
  		document.getElementById('notas').focus();
		" />
		<input type="submit" id="imgSave" name="imagSave" value="   Grabar nota" 
		style="display:none;border:0px;background: url('iconos/16x16/disk.png') no-repeat" / >  
		
		<textarea id="notas" name="notas" rows="20" cols="75%" style="padding: 15px;border:0" 
		readonly="readonly">{$acta->descripcion}</textarea>
		
		<input type="hidden"  name="graba" value="nota" /> 
	</form>
