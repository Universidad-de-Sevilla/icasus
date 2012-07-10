<a href="javascript:void(0)"		
onclick="javascript:mostrarDIV('notas_grabar.php','&id_acta={$acta->id_acta}&nota='+escape(tinyMCE.get('notas').getContent()),'ventana')"><img
src='iconos/16x16/disk.png'style="margin:10px 0 0 0"> Grabar</a>
<p style="margin-left:20px"><textarea id="notas" name="notas" rows="20" cols="75%" />{$acta->descripcion}</textarea></p>
