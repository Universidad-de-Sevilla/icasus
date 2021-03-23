//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/archivo_gestionar.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Incluye el código JavaScript para el fichero archivo_gestionar.tpl
//----------------------------------------------------------------------------

$(document).ready(function () {

    var nombre_archivo;

    //Edición de archivos
    $(".editar_archivo").click(function () {
        var tag = $(this).attr('id');
        var ids = tag.split('-');
        var id = ids[2];
        $('#id_fichero').attr('value', id);
        $('#etitulo').attr('value', $('#l-titulo-' + id).attr('value'));
        $('#edescripcion').text($('#l-descripcion-' + id).data('descripcion'));
        if ($('#l-visible-' + id).is(':checked')) {
            $('#evisible').bootstrapToggle('on');
        }
        else {
            $('#evisible').bootstrapToggle('off');
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

    //Visibilidad de archivos
    $(".visibilidad").change(function () {
        var tag = $(this).attr('id');
        var ids = tag.split('-');
        var id = ids[2];
        var visible = 0;
        if ($(this).is(":checked")) {
            visible = 1;
        }
        $.post('index.php?page=archivo_gestionar_ajax&ajax=true&modulo=visibilidad', {visible: visible, id: id}, function () {
        });
    });

    //Borrado de archivos
    $("a.borrar_archivo").click(function () {
        var tag = $(this).attr('id');
        var ids = tag.split('-');
        var id = ids[2];
        $('#id_borrar').attr('value', id);
        nombre_archivo = $('#l-titulo-' + id).attr('value');
        $('#titulo_borrar, #titulo_borrado').html(nombre_archivo);
    });

    $("#borrar").click(function () {
        var id = $('[name=id_borrar]').val();
        $.post('index.php?page=archivo_gestionar_ajax&ajax=true&modulo=borrar', {id: id}, function () {
            $('#l-borrar-' + id).parents('tr').remove();
            $('#dialogo_borrar').modal('hide');
            $('#dialogo_notificar_borrado_archivo').modal('show');
        });
    });

    //Reset
    $(':reset').click(function () {
        $('#svisible').bootstrapToggle('on');
    });

    //Barra de botones
    var botones_archivo = $('#botones_archivo').html();
    $('#tabla_archivos_filter').append(botones_archivo);
});