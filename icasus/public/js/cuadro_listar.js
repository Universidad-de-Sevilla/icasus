//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/cuadro_listar.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Incluye el código JavaScript para el fichero cuadro_listar.tpl
//----------------------------------------------------------------------------

//Borrado de cuadros de mando
$('#dialogo_confirmar_borrado').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget);
    var nombre_cuadro = button.data('nombre_cuadro');
    var id_cuadro = button.data('id_cuadro');
    var modal = $(this);
    var link = 'index.php?page=cuadro_borrar&id_cuadro=' + id_cuadro;
    modal.find('#nombre_cuadro').text(nombre_cuadro);
    modal.find('#borrar').attr('href', link);
});

//Barra de botones
$(document).ready(function () {
    var botones = $('#botones').html();
    $('#tabla_cuadros_filter, #tabla_mis_cuadros_filter').append(botones);
});