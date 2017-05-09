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
        var button = $(event.relatedTarget);
        var fecha_carta = button.data('fecha_carta');
        var id_carta = button.data('id_carta');
        var id_entidad = button.data('id_entidad');
        var modal = $(this);
        var link = 'index.php?page=carta_borrar&id_carta=' + id_carta + '&id_entidad=' + id_entidad;
        modal.find('#fecha_carta').text(fecha_carta);
        modal.find('#borrar').attr('href', link);
    });
});


