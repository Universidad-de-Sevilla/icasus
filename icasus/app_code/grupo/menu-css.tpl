{literal}
<style>
a.acta {padding:40px 20px 5px 20px;color:grey;background: url('iconos/32x32/acta-gris.png') top center no-repeat;}
a:hover.acta  {background: url('iconos/32x32/acta.png') top center no-repeat;color:#07a}
a.convocatoria {padding:40px 20px 5px 20px;color:grey;background: url('iconos/32x32/convocatoria-gris.png') top center no-repeat;}
a:hover.convocatoria {background: url('iconos/32x32/convocatoria.png') top center no-repeat;color:#07a}
a.asunto {padding:40px 20px 5px 20px;color:grey;background: url('iconos/32x32/asunto-gris.png') top center no-repeat;}
a:hover.asunto {background: url('iconos/32x32/asunto.png') top center no-repeat;color:#07a}
a.asistente {padding:40px 20px 5px 20px;color:grey;background: url('iconos/32x32/asistente-gris.png') top center no-repeat;}
a:hover.asistente {background: url('iconos/32x32/asistente.png') top center no-repeat;color:#07a}
a.acuerdo {padding:40px 20px 5px 20px;color:grey;background: url('iconos/32x32/acuerdo-gris.png') top center no-repeat;}
a:hover.acuerdo {background: url('iconos/32x32/acuerdo.png') top center no-repeat;color:#07a}
a.tarea {padding:40px 20px 5px 20px;color:grey;background: url('iconos/32x32/tarea-gris.png') top center no-repeat;}
a:hover.tarea {background: url('iconos/32x32/tarea.png') top center no-repeat;color:#07a}
a.nota {padding:40px 20px 5px 20px;color:grey;background: url('iconos/32x32/nota-gris.png') top center no-repeat;}
a:hover.nota {background: url('iconos/32x32/nota.png') top center no-repeat;color:#07a}


.acta-s {background: url('iconos/32x32/acta.png') top center no-repeat;color:#07a;padding:40px 20px 5px 20px;color:grey;} 
.convocatoria-s {background: url('iconos/32x32/convocatoria.png') top center no-repeat;color:#07a;padding:40px 20px 5px 20px;color:grey;} 
.asunto-s {background: url('iconos/32x32/asunto.png') top center no-repeat;color:#07a;padding:40px 20px 5px 20px;color:grey;} 
.asistente-s {background: url('iconos/32x32/asistente.png') top center no-repeat;color:#07a;padding:40px 20px 5px 20px;color:grey;} 
.acuerdo-s {background: url('iconos/32x32/acuerdo.png') top center no-repeat;color:#07a;padding:40px 20px 5px 20px;color:grey;} 
.tarea-s {background: url('iconos/32x32/tarea.png') top center no-repeat;color:#07a;padding:40px 20px 5px 20px;color:grey;} 
.nota-s {background: url('iconos/32x32/nota.png') top center no-repeat;color:#07a;padding:40px 20px 5px 20px;color:grey;} 
</style>
<script type="text/javascript" src="js/tiny_mce/tiny_mce.js"></script>
{/literal}

<p style="padding:40px 0 10px 0;border-bottom:1px dotted #0077aa">

<a href="javascript:void(0);" class="acta" id="acta"
onclick="javascript:activarTAB('acta');mostrarDIV('nombre.php','&id_acta={$smarty.get.id_acta}','ventana');"  
>Acta</a>

<a href="javascript:void(0);" class="convocatoria" id="convocatoria" 
onclick="javascript:activarTAB('convocatoria');mostrarDIV('convocatoria.php','&id_acta={$smarty.get.id_acta}','ventana');" 
>Convocatoria</a>

<a  href="javascript:void(0);" class="asunto" id="asunto" 
onclick="javascript:activarTAB('asunto');mostrarDIV('asuntos.php','&id_acta={$smarty.get.id_acta}','ventana');" 
>Asuntos</a>

<a href="javascript:void(0);" class="asistente" id="asistente"
onclick="javascript:activarTAB('asistente');mostrarDIV('asistentes.php','&id_acta={$smarty.get.id_acta}','ventana');" 
>Asistentes</a>

<a href="javascript:void(0);" class="acuerdo" id="acuerdo"
onclick="javascript:activarTAB('acuerdo');mostrarDIV('acuerdos.php','&id_acta={$smarty.get.id_acta}','ventana');" 
>Acuerdos</a>

<a href="javascript:void(0);" class="tarea" id="tarea"
onclick="javascript:activarTAB('tarea');mostrarDIV('tareas.php','&id_acta={$smarty.get.id_acta}','ventana');" 
>Tareas</a>

<a  href="javascript:void(0);" class="nota" id="nota"
onclick="javascript:activarTAB('nota');mostrarDIV('notas.php','&id_acta={$smarty.get.id_acta}','ventana');" 
>Notas</a>

</p>
<div id="ventana">

<img src="iconos/mano2.jpg" align="right" >

</div>
