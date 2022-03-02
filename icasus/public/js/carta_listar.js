//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/carta_listar.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Código javascript para carta_listar.tpl
//----------------------------------------------------------------------------

$(document).ready(function () {
    //Barras de botones
    var botones_plan = $('#botones_carta').html();
    $('#tabla_cartas_filter').append(botones_plan);

    //Borrado de Cartas de Servicios
    $('#dialogo_confirmar_borrado_carta').on('show.bs.modal', function (event) {
        let button = $(event.relatedTarget);
        let fecha_carta = button.data('fecha_carta');
        let id_carta = button.data('id_carta');
        let id_entidad = button.data('id_entidad');
        let modal = $(this);
        let link = 'index.php?page=carta_borrar&id_carta=' + id_carta + '&id_entidad=' + id_entidad;
        modal.find('#fecha_carta').text(fecha_carta);
        modal.find('#borrar').attr('href', link);
    });

    //Archivado de Cartas de Servicios
    $('#dialogo_confirmar_archivado_carta').on('show.bs.modal', function (event) {
        let button = $(event.relatedTarget);
        let fecha_carta = button.data('fecha_carta');
        let id_carta = button.data('id_carta');
        let id_entidad = button.data('id_entidad');
        let modal = $(this);
        let link = 'index.php?page=carta_archivar&id_carta=' + id_carta + '&id_entidad=' + id_entidad + '&modulo=archivar';
        modal.find('#fecha_carta').text(fecha_carta);
        modal.find('#archivar').attr('href', link);
    });

    //Restauración de Cartas de Servicios
    $('#dialogo_confirmar_restauracion_carta').on('show.bs.modal', function (event) {
        let button = $(event.relatedTarget);
        let fecha_carta = button.data('fecha_carta');
        let id_carta = button.data('id_carta');
        let id_entidad = button.data('id_entidad');
        let modal = $(this);
        let link = 'index.php?page=carta_archivar&id_carta=' + id_carta + '&id_entidad=' + id_entidad + '&modulo=restaurar';
        modal.find('#fecha_carta').text(fecha_carta);
        modal.find('#restaurar').attr('href', link);
    });
});