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
<h2><img src='https://www.r2h2.us.es/intranet/theme/iconos/32x32/table_add.png' alt='icono tabla lapiz' /> Crear un cuadro de mando</h2>
<form action='index.php?page=cuadromando_grabar' method='post' id='formcuadro' 
        name='formcuadro' class='datos'>
        <input type='hidden' name='privado' value='1' />

        <p><label for="nombre">Nombre</label> &nbsp; <span class="grey">(requerido)</span>
        <br/> <input type="text" name="nombre" id="nombre" class="inp" size='90' /></p>


        <p><label for="comentarios">Comentarios </label> &nbsp; <span class="grey"></span>
        <br /><textarea name="comentarios" id="comentarios" class="inp" rows="4" cols="85"></textarea></p>

        <p><label for="id_pon">Pinche sobre las Unidades y seleccione indicador. El Total de indicadores seleccionados es: <b id="num_total_indicadores"> &nbsp; </b></p>
<div id="ventana">
        {foreach from=$entidades item=entidad}
         <b><a href="javascript:void(0);" onclick="javascript:expandir('{$entidad->id_entidad}');">{$entidad->nombre}</a></b> :
         <b id="num_indicadores_{$entidad->id_entidad}" >(0)</b><br />
         <table id="{$entidad->id_entidad}" style="display:none">
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
        {/foreach}
</div>
<p><input type='submit' name='enviar' value='Grabar cuadro de mando' onclick="alert()"/></p>
</form>
