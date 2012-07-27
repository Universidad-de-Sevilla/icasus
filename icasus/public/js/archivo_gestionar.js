//javascript de  la plantilla archivo_gestionar.tpl
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
