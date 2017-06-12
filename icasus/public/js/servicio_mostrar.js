//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/servicio_mostrar.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Código javascript para servicio_mostrar.tpl
//----------------------------------------------------------------------------

//Barras de botones
$(document).ready(function () {
    var botones_ficha = $('#botones_ficha').html();
    var botones_compromiso = $('#botones_compromiso').html();
    $('#btn_ficha').addClass('dt-buttons btn-group pull-right').append(botones_ficha);
    $('#tabla_compromisos_filter').append(botones_compromiso);

    //Borrado de compromisos
    $('#dialogo_confirmar_borrado_compromiso').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget);
        var nombre = button.data('nombre');
        var id_compromiso = button.data('id_compromiso');
        var id_entidad = button.data('id_entidad');
        var modal = $(this);
        var link = 'index.php?page=compromiso_borrar&id_entidad=' + id_entidad + '&id_compromiso=' + id_compromiso;
        modal.find('#nombre_compromiso').text(nombre);
        modal.find('#borrar').attr('href', link);
    });
});