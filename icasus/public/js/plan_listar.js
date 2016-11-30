//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/plan_listar.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Código javascript para plan_listar.tpl
//----------------------------------------------------------------------------

$(document).ready(function () {
    //Barras de botones
    var botones_plan = $('#botones_plan').html();
    $('#tabla_planes_filter, #tabla_user_objops_filter').append(botones_plan);

    //Borrado de planes estratégicos
    $('#dialogo_confirmar_borrado_plan').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget);
        var periodo_plan = button.data('periodo_plan');
        var id_plan = button.data('id_plan');
        var id_entidad = button.data('id_entidad');
        var modal = $(this);
        var link = 'index.php?page=plan_borrar&id_plan=' + id_plan + '&id_entidad=' + id_entidad;
        modal.find('#periodo_plan').text(periodo_plan);
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
});