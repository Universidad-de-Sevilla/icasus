//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/medicion_listar.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Incluye el código JavaScript para el fichero medicion_listar.tpl
//----------------------------------------------------------------------------

//Borrado de mediciones
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

//Generación de mediciones
//$('#form_generar').submit(function (e) {
//    e.preventDefault();
////    $('#dialogo_confirmar_generar .modal-body').html("<h4 class='text-center'><i class='fa fa-spinner fa-pulse'></i></h4>");
////    $('#dialogo_confirmar_generar .modal-footer').html('Generando... espere por favor.');
//    $.ajax({
//        type: 'post',
//        url: 'index.php?page=medicion_generar',
//        data: $('#form_generar').serialize(),
//        success: function () {
////            $('#dialogo_confirmar_generar').modal('hide');
////            location.reload();
//        }
//    });
//});

//Tabla de valores
$('.tabla_valores').DataTable({
    "bPaginate": false,
    "bSort": false,
    dom: "<'row'<'col-sm-12'B>>" +
            "<'row'<'col-sm-12'tr>>" +
            "<'row'<'col-sm-12'>>",
    buttons: [
        {extend: 'colvis', text: 'Ver columnas'},
        {
            extend: 'collection',
            text: 'Exportar',
            buttons: [
                {extend: 'csv'},
                {extend: 'excel'},
                {extend: 'print', text: 'Imprimir/PDF'}
            ]
        }
    ]
});