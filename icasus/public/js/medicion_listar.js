//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/medicion_listar.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Incluye el código JavaScript para el fichero medicion_listar.tpl
//----------------------------------------------------------------------------

//Borrado de procesos
$('#dialogo_confirmar_borrado').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget);
    var etiqueta_medicion = button.data('etiqueta_medicion');
    var id_medicion = button.data('id_medicion');
    var id_entidad = button.data('id_entidad');
    var tipo = button.data('tipo');
    var modal = $(this);
    var link = 'index.php?page=medicion_borrar&id_medicion=' + id_medicion + '&tipo=' + tipo + '&id_entidad=' + id_entidad;
    modal.find('#etiqueta_medicion').text(etiqueta_medicion);
    modal.find('#borrar').attr('href', link);
});