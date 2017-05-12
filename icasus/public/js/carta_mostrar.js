//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/carta_mostrar.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Código javascript para carta_mostrar.tpl
//----------------------------------------------------------------------------

//Barras de botones
$(document).ready(function () {
    var botones_ficha = $('#botones_ficha').html();
    var botones_servicio = $('#botones_servicio').html();
//    var botones_indics = $('#botones_indics').html();
    var botones_archivo = $('#botones_archivo').html();
    $('#btn_ficha').addClass('dt-buttons btn-group pull-right').append(botones_ficha);
    $('#tabla_servicios_filter').append(botones_servicio);
//    $('#tabla_indics_control_filter').append(botones_indics);
    $('#tabla_archivos_filter').append(botones_archivo);

    //Borrado de servicios
    $('#dialogo_confirmar_borrado_servicio').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget);
        var nombre = button.data('nombre');
        var id_servicio = button.data('id_servicio');
        var id_entidad = button.data('id_entidad');
        var modal = $(this);
        var link = 'index.php?page=servicio_borrar&id_entidad=' + id_entidad + '&id_servicio=' + id_servicio;
        modal.find('#nombre_servicio').text(nombre);
        modal.find('#borrar').attr('href', link);
    });

//Borrado de compromisos
//$('#dialogo_confirmar_borrado_compromiso').on('show.bs.modal', function (event) {
//    var button = $(event.relatedTarget);
//    var nombre = button.data('nombre');
//    var id_entidad = button.data('id_entidad');
//    var id_compromiso = button.data('id_compromiso');
//    var modal = $(this);
//    var link = 'index.php?page=compromiso_borrar&id_compromiso=' + id_compromiso + '&id_entidad=' + id_entidad;
//    modal.find('#nombre_compromiso').text(nombre);
//    modal.find('#borrar').attr('href', link);
//});
});