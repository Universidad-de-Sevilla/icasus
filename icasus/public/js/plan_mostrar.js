//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/plan_mostrar.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Código javascript para plan_mostrar.tpl
//----------------------------------------------------------------------------

//Barras de botones
$(document).ready(function () {
    var botones_ficha = $('#botones_ficha').html();
    var botones_linea = $('#botones_linea').html();
    $('#btn_ficha').addClass('dt-buttons btn-group pull-right').append(botones_ficha);
    $('#tabla_lineas_filter').append(botones_linea);
});

//Borrado de líneas estratégicas
$('#dialogo_confirmar_borrado_linea').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget);
    var nombre = button.data('nombre');
    var id_linea = button.data('id_linea');
    var id_entidad = button.data('id_entidad');
    var modal = $(this);
    var link = 'index.php?page=linea_borrar&id_entidad=' + id_entidad + '&id_linea=' + id_linea;
    modal.find('#nombre_linea').text(nombre);
    modal.find('#borrar').attr('href', link);
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

//Resúmenes
$('#anyo').on('change', function () {
    var id_plan = $('#anyo').data('id_plan');
    var anyo = $('#anyo').val();
    $('#plan_anyo').html("<h4 class='text-center'><i class='fa fa-spinner fa-pulse'></i></h4>");
    $.ajax({
        url: "index.php?page=plan_ajax&ajax=true&id_plan=" + id_plan + "&anyo=" + anyo,
        success: function () {
            $('#plan_anyo').load("index.php?page=plan_ajax&ajax=true&id_plan=" + id_plan + "&anyo=" + anyo);
        }
    });
});