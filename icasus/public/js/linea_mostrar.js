//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/linea_mostrar.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Código javascript para linea_mostrar.tpl
//----------------------------------------------------------------------------

//Barras de botones
$(document).ready(function () {
    var botones_ficha = $('#botones_ficha').html();
    var botones_objest = $('#botones_objest').html();
    $('#btn_ficha').addClass('dt-buttons btn-group pull-right').append(botones_ficha);
    $('#tabla_objest_filter').append(botones_objest);
});

//Borrado de objetivos estratégicos
$('#dialogo_confirmar_borrado_objest').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget);
    var nombre = button.data('nombre');
    var id_entidad = button.data('id_entidad');
    var id_objest = button.data('id_objest');
    var modal = $(this);
    var link = 'index.php?page=objest_borrar&id_objest=' + id_objest + '&id_entidad=' + id_entidad;
    modal.find('#nombre_objest').text(nombre);
    modal.find('#borrar').attr('href', link);
});

//Borrado de objetivos operacionales
$('#dialogo_confirmar_borrado_objop').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget);
    var nombre = button.data('nombre');
    var id_objop = button.data('id_objop');
    var id_entidad = button.data('id_entidad');
    var modal = $(this);
    var link = 'index.php?page=objop_borrar&id_entidad=' + id_entidad + '&id_objop=' + id_objop;
    modal.find('#nombre_objop').text(nombre);
    modal.find('#borrar').attr('href', link);
});

//Resultados
$('#page-wrapper').on('click', '.editar', function () {
    var id_linea = $(this).data('id_linea');
    var anyo = $(this).data('anyo');
    $('#page-wrapper #resultado_' + anyo).children('textarea').attr('readonly', false);
    $("#page-wrapper #edicion_" + anyo).load("index.php?page=linea_ajax&ajax=true&modulo=editar_resultado&id_linea=" + id_linea + "&anyo=" + anyo);
});

//Grabación de resultados
$('#page-wrapper').on('click', '.grabar', function () {
    var id_linea = $(this).data('id_linea');
    var anyo = $(this).data('anyo');
    var resultado = $('#page-wrapper #resultado_' + anyo).children('textarea').val();
    $.ajax({
        type: "POST",
        data: {'resultado': resultado},
        url: "index.php?page=linea_ajax&ajax=true&modulo=grabar_resultado&id_linea=" + id_linea + "&anyo=" + anyo,
        success: function () {
            $("#page-wrapper #edicion_" + anyo).load("index.php?page=linea_ajax&ajax=true&modulo=cancelar_edicion&id_linea=" + id_linea + "&anyo=" + anyo);
            $("#page-wrapper #resultado_" + anyo).load("index.php?page=linea_ajax&ajax=true&modulo=cancelar_resultado&id_linea=" + id_linea + "&anyo=" + anyo);
        }
    });
});

//Cancelar edición
$('#page-wrapper').on('click', '.cancelar', function () {
    var id_linea = $(this).data('id_linea');
    var anyo = $(this).data('anyo');
    $("#page-wrapper #edicion_" + anyo).load("index.php?page=linea_ajax&ajax=true&modulo=cancelar_edicion&id_linea=" + id_linea + "&anyo=" + anyo);
    $("#page-wrapper #resultado_" + anyo).load("index.php?page=linea_ajax&ajax=true&modulo=cancelar_resultado&id_linea=" + id_linea + "&anyo=" + anyo);
});