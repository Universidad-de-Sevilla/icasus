{literal}
<script>

function apunta(form,id_entidad,id_indicador)
{
 var seleccionadas = 0;
 var total = 0;
 var cont = form.elements.length;
 
 for (var i=0;i<cont;i++)
 {
    var entidad = form.elements[i].id.split("_");
    //comprueba si es un input check y si esta marcado
    if (form.elements[i].type == "checkbox" && form.elements[i].checked)
    { 
      if (entidad[0] == id_entidad)
       {
         seleccionadas = seleccionadas + 1;  
       } 
    total = total + 1;  
    }
 }
seleccionadas = 'Seleccionadas '+seleccionadas;
//envia el resultado al id correspondiente
document.getElementById('num_indicadores_'+id_entidad).innerHTML = seleccionadas ;
document.getElementById('num_total_indicadores').innerHTML = total ;
}

function expandir(id)
{
 if (document.getElementById(id).style.display == 'none')
 { document.getElementById(id).style.display = ''; } else  { document.getElementById(id).style.display = 'none'; }
}
</script>
{/literal}

<h2><img src='iconos/32x32/table_edit.png' alt='icono tabla lapiz' /> Edición del cuadro de mando</h2>
<form action='index.php?page=cuadro_grabar' method='post' id='formcuadro' 
	name='formcuadro' class='datos'>
	<input type='hidden' name='privado' value='1' />
        <input type='hidden' name='id' value='{$cuadro->id}' />
	<p><input type='submit' name='enviar' value='Grabar cambios y mostrar' class='submit'/></p>
	<div class='marcosimple'>
		<h3>Cambiar datos del cuadro de mando</h3>
		<input type='hidden' name='privado' value='1' />
		<input type='hidden' name='id' value='{$cuadro->id}' />
		
		<p><label for="nombre">Denominaci&oacute;n </label> &nbsp; <span class="grey">(requerido)</span>
		<input type="text" name="nombre" id="nombre" class="inp" value="{$cuadro->nombre}"/></p>

		<p><label for="comentarios">Comentarios </label> &nbsp; <span class="grey"></span><br />
		<textarea name="comentarios" id="comentarios" class="inp" rows="4" 
		cols="50">{$cuadro->comentarios}
		</textarea></p>
	</div>

	<div class='marcosimple'>
<h3>Quitar indicadores asociados</h3>
	 {foreach from=$entidades_in item=entidad}
		{if $entidad->lista_indicadores|@count > 0}
         <b><a style="margin-left:10px" href="javascript:void(0);" onclick="javascript:expandir('{$entidad->id_entidad}');">{*$entidad->lista_indicadores|@count*}{$entidad->nombre}</a></b> :
         <b id="num_indicadores_{$entidad->id_entidad}" >{*$entidad->lista_indicadores|@count*}</b><br /> 
         <table id="{$entidad->id_entidad}" style="display:none;margin-left:20px">
        <tr><th>&nbsp;</th><th>Código</th><th>Indicador</th></tr>
        {foreach from=$entidad->lista_indicadores item=indicador}
         <tr>
         <td width="5%"><input type='checkbox' name='id_quita[]' value='{$indicador->id_indicador}' onclick="javascript:apunta(this.form,'{$entidad->id_entidad}')"
         id="{$entidad->id_entidad}_check_{$indicador->id_indicador}"/></td>
         <td width="20%">{$indicador->codigo}</td>
         <td width="75%">{$indicador->nombre}</td>
         </tr>
         {/foreach}
         </table>{/if}
        {/foreach}

	</div>

	<div class='marcosimple'>
<h3>Agregar nuevos indicadores</h3>
	 {foreach from=$entidades_out item=entidad}
			{if $entidad->lista_indicadores|@count > 0}
         <b><a style="margin-left:10px" href="javascript:void(0);" onclick="javascript:expandir('{$entidad->id_entidad}_out');">{$entidad->nombre}</a></b> :
         <!-- <b id="num_indicadores_{$entidad->id_entidad}" >(0)</b>--><br /> 
         <table id="{$entidad->id_entidad}_out" style="display:none;margin-left:20px">
        <tr><th>&nbsp;</th><th>Código</th><th>Indicador</th></tr>
        {foreach from=$entidad->lista_indicadores item=indicador}
         <tr>
         <td width="5%"><input type='checkbox' name='id_pon[]' value='{$indicador->id_indicador}' onclick="javascript:apunta(this.form,'{$entidad->id_entidad}')"
         id="{$entidad->id_entidad}_check_{$indicador->id_indicador}"/></td>
         <td width="20%">{$indicador->codigo}</td>
         <td width="75%">{$indicador->nombre}</td>
         </tr>
         {/foreach}
         </table>
	{/if}
        {/foreach}

	</div>
	<p><input type='submit' name='enviar' class='submit' value='Grabar cambios y mostrar' /></p>
</form>

