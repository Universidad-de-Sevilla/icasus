//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/proceso_listar.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Incluye el código JavaScript para el fichero proceso_listar.tpl y procesos.tpl
//----------------------------------------------------------------------------

//Borrado de procesos
$('#dialogo_confirmar_borrado').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget);
    var nombre_proceso = button.data('nombre_proceso');
    var id_proceso = button.data('id_proceso');
    var id_entidad = button.data('id_entidad');
    var modal = $(this);
    var link = 'index.php?page=proceso_borrar&id_proceso=' + id_proceso + '&id_entidad=' + id_entidad;
    modal.find('#nombre_proceso').text(nombre_proceso);
    modal.find('#borrar').attr('href', link);
});

//Habilita que el mapa de procesos sea responsivo al cambiar de pestaña
$(window).on('show.bs.tab', function () {
    $(this).trigger('resize');
});

//Barra de botones
$(document).ready(function () {
    var botones = $('#botones').html();
    $('#tabla_procesos_filter').append(botones);
});