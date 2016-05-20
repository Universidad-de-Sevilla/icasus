//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/dato_listar.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Incluye el código JavaScript para el fichero dato_listar.tpl y datos.tpl
//----------------------------------------------------------------------------

//Borrado de datos
$('#dialogo_confirmar_borrado').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget);
    var nombre_dato = button.data('nombre_dato');
    var id_dato = button.data('id_dato');
    var id_entidad = button.data('id_entidad');
    var modal = $(this);
    var link = 'index.php?page=dato_borrar&id_dato=' + id_dato + '&id_entidad=' + id_entidad;
    modal.find('#nombre_dato').text(nombre_dato);
    modal.find('#borrar').attr('href', link);
});

//Barra de botones
$(document).ready(function () {
    var botones = $('#botones').html();
    $('#tabla_datos_filter, #tabla_mis_datos_filter').append(botones);
});