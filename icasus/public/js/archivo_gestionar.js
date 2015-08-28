//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/archivo_gestionar.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Incluye el código JavaScript para el fichero archivo_gestionar.tpl
//----------------------------------------------------------------------------

$(document).ready(function () {
    $(".editar_archivo").click(function () {
        var tag = $(this).attr('id');
        var ids = tag.split('-');
        var id = ids[2];
        $('#id_fichero').attr('value', id);
        $('#etitulo').attr('value', $('#l-titulo-' + id).attr('value'));
        $('#edescripcion').text($('#l-descripcion-' + id).data('descripcion'));
        if ($('#l-visible-' + id).data('visibilidad')) {
            $('#evisible').bootstrapToggle('on');
        }
    });
    $("#egrabar").click(function () {
        var id = $('[name=id_fichero]').val();
        var titulo = $('[name=etitulo]').val();
        var descripcion = $('[name=edescripcion]').val();
        var visible = 0;
        if ($('input:checkbox[name=evisible]').is(':checked')) {
            visible = 1;
        }
        //Validamos y enviamos
        if (!(titulo === '')) {
            $.post('index.php?page=archivo_gestionar_ajax&ajax=true&modulo=actualizar', {visible: visible, id: id, titulo: titulo, descripcion: descripcion}, function () {
            });
        }
    });
    $(".visibilidad").change(function () {
        var id = $(this).data('id');
        var visible = 0;
        if ($(this).is(":checked")) {
            visible = 1;
        }
        $.post('index.php?page=archivo_gestionar_ajax&ajax=true&modulo=visibilidad', {visible: visible, id: id}, function () {
        });
    });
    $("a.borrar_archivo").click(function () {
        var tag = $(this).attr('id');
        var ids = tag.split('-');
        var id = ids[2];
        $('#id_borrar').attr('value', id);
        $('#titulo_borrar').html($('#l-titulo-' + id).attr('value'));
    });
    $("#borrar").click(function () {
        var id = $('[name=id_borrar]').val();
        $.post('index.php?page=archivo_gestionar_ajax&ajax=true&modulo=borrar', {id: id}, function () {
            location.reload();
        });
    });
});