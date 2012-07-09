{literal}
<script>
$(document).ready(function(){
	/*
	$("#sgrabar").click(function(){
		var titulo = $('[name=stitulo]').val();
		var archivo = $('[name=sarchivo]').val();
		var id_objeto = $('[name=id_objeto]').val();
		var descripcion = $('[name=sdescripcion]').val();
		var visible = $('input:radio[name=svisible]:checked').val();
		$.post('index.php?page=archivo_gestionar_ajax&ajax=true&modulo=subir',{visible:visible,id_objeto:id_objeto,titulo:titulo,archivo:archivo,descripcion:descripcion},function(){
			location.reload(); 
		});
	});
	*/
  $("a.editar_archivo").click(function(){
    var tag = $(this).attr('id');
    var ids = tag.split('-');
    id = ids[2];
		$('#id_fichero').attr('value',id);
    $('#etitulo').attr('value',$('#l-titulo-'+id).attr('value'));
    $('#edescripcion').attr('value',$('#l-descripcion-'+id).attr('title'));
		$('input:radio[name="evisible"][value='+$('#l-visible-'+id).attr('value')+']').attr('checked', true);
  });
	$("#egrabar").click(function(){
		var titulo = $('[name=etitulo]').val();
		var id = $('[name=id_fichero]').val();
		var descripcion = $('[name=edescripcion]').val();
		var visible = $('input:radio[name=evisible]:checked').val();
		$.post('index.php?page=archivo_gestionar_ajax&ajax=true&modulo=actualizar',{visible:visible,id:id,titulo:titulo,descripcion:descripcion},function(){
			location.reload(); 
		});
	});
	$("a.borrar_archivo").click(function(){
		var tag = $(this).attr('id');
    var ids = tag.split('-');
    id = ids[2];
		$('#id_borrar').attr('value',id);
		$('#titulo_borrar').html($('#l-titulo-'+id).attr('value'));
	});	
	$("#borrar").click(function(){
    var id = $('[name=id_borrar]').val();
		$.post('index.php?page=archivo_gestionar_ajax&ajax=true&modulo=borrar',{id:id},function(){location.reload();});
	});
});
</script>
{/literal}
<div class="box grid_16 clear_fix">
  <a href="javascript:window.history.back();"><img src="/icons/ff16/arrow_undo.png" /> Cancelar</a>&nbsp; &nbsp; &nbsp;
  <a href="javascript:void(0)" class="dialog_button" data-dialog="dialog_crear"><img src="/icons/ff16/box_bullet_add.png" /> Subir nuevo archivo</a> &nbsp; &nbsp; &nbsp;
  <a href="index.php?page=proceso_mostrar&id_proceso={$proceso->id}"><img src="/icons/ff16/cog.png" />Volver al proceso</a>
</div>		

<div class="display_none">
	<div id="dialog_crear" class="dialog_content narrow no_dialog_titlebar" title="Subir archivo">
		<div class="block">
			<div class="section">
				<h2>Nuevo archivo</h2>
			</div>
			<form action="index.php?page=archivo_gestionar_ajax&ajax=true&modulo=subir" name="subir" method="post" class="validate_form" enctype="multipart/form-data" >
			<input type="hidden" value="{$proceso->id}" name="id_objeto" >
			<fieldset class="label_side">
				<label>Título</label>
				<div><b><input  type="text" name="stitulo" value="" class="text required"/></b><div class="required_tag"></div></div>
			</fieldset>
			<fieldset class="label_side">
				<label>Archivo</label>
				<div><input  type="file" name="sarchivo" class="uniform required" /><div class="required_tag"></div></div>
			</fieldset>
			<fieldset class="label_side">
				<label>Descripción</label>
				<div><textarea  name="sdescripcion" class="autogrow"/></textarea></div>
			</fieldset>
			<fieldset class="label_side">
				<label>Visible</label>
				<div><input type="radio" name="svisible" value="1" class="required"/> Si <input type="radio" name="svisible" value="0" class="required"/> No</div>
			</fieldset>
			<div class="button_bar clearfix">
				<button class="green" type="submit" value="Grabar" name="sgrabar" id="sgrabar">
					<div class="ui-icon ui-icon-check"></div>
					<span>Subir archivo</span>
				</button>
				<button class="red dark send_right close_dialog" type="button" value="cancelar" name="scancelar" id="scancelar">
					<div class="ui-icon ui-icon-closethick"></div>
					<span>Cancelar</span>
				</button>
				</form>
			</div>
    </div>
  </div>
</div>

<div class="display_none">
	<div id="dialog_editar" class="dialog_content narrow no_dialog_titlebar" title="Delete Confirmation">
		<div class="block">
			<div class="section">
				<h2>Actualizar datos del archivo</h2>
			</div>
			<form action="" name="editar" method="post" class="validate_form" >
			<input type="hidden" value="" name="id_fichero" id="id_fichero" >
			<fieldset class="label_side">
				<label>Título</label>
				<div><b><input  type='text' id="etitulo" name='etitulo' value="ww" class="text required"/></b><div class="required_tag"></div></div>
			</fieldset>
			<fieldset class="label_side">
				<label>Descripción</label>
				<div><textarea  id="edescripcion" name='edescripcion' class="autogrow"/>ww</textarea></div>
			</fieldset>
			<fieldset class="label_side">
				<label>Visible</label>
				<div><input type="radio" name='evisible' value="1" class="required"/> Si <input type="radio" name='evisible' value="0" class="required"/> No</div>
			</fieldset>
			<div class="button_bar clearfix">
				<button class="green" type="button" value="Grabar" name="egrabar" id="egrabar">
					<div class="ui-icon ui-icon-check"></div>
					<span>Actualizar archivo</span>
				</button>
				<button class="light  send_right close_dialog" type="button" value="cancelar" name="ecancelar" id="ecancelar">
					<div class="ui-icon ui-icon-closethick"></div>
					<span>Cancelar</span>
				</button>
			</div>
    </div>
  </div>
</div> 

<div class="display_none">						
	<div id="dialog_delete" class="dialog_content narrow no_dialog_titlebar" title="Delete Confirmation">
		<div class="block">
			<div class="section">
				<h2>Borrar fichero</h2>
				<p>Por favor confirme que quiere borrar el fichero <b><span id="titulo_borrar"></span></b>.</p>
			</div>
			<div class="button_bar clearfix">
				<input type="hidden" value="" name="id_borrar" id="id_borrar">
				<button class="delete_confirm dark green no_margin_bottom close_dialog" name="borrar" id="borrar">
					<div class="ui-icon ui-icon-check"></div>
					<span>Borrar</span>
				</button>
				<button class="dark send_right close_dialog">
					<div class="ui-icon ui-icon-closethick"></div>
					<span>Cancelar</span>
				</button>
			</div>
		</div>
	</div>
</div> 
									
	<div class="box grid_16 single_datatable">
		<div id="dt1" class="no_margin">
			{if isset($archivos)}
				<table class='display datatable'>
					<thead>
						<tr><th></th><th>Título</th><th>Visible</th><th>Usuario</th></tr>
					</thead>
					<tbody>
					{foreach from=$archivos item=archivo}
						<tr>
							<td>
								<a href="javascript:void(0)" class="borrar_archivo dialog_button" id="l-borrar-{$archivo->id}" data-dialog="dialog_delete"><img src="/icons/ff16/bin.png"></a>
							</td>
							<td>
									<a href="javascript:void(0)" class="editar_archivo dialog_button" id="l-titulo-{$archivo->id}"  value="{$archivo->titulo|htmlentities}" data-dialog="dialog_editar" >
									{$archivo->titulo|htmlentities}</a>
									{if $archivo->descripcion != NULL}<a href='#' id="l-descripcion-{$archivo->id}" title='{$archivo->descripcion|htmlentities}'><big>*</big></a>{/if}
							</td>
							<td><a href="javascript:void(0)" id="l-visible-{$archivo->id}" value="{$archivo->visible}" >{$archivo->visible}</a></td>
							<td>{$archivo->usuario->nombre|htmlentities} {$archivo->usuario->apellidos|htmlentities}</td>
						</tr>
					{/foreach}
					</tbody>
				</table>
			{else}
				<div class='alert alert_blue'>
				<img height="24" width="24" src="theme/danpin/images/icons/small/white/alert_2.png">
				No se han subido archivos para este proceso.
				</div>
			{/if}
		</div>
	</div>  

