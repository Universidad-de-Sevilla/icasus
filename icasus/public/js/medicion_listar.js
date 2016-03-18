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
$('#btn_confirm_generar').click(function (e) {
    e.preventDefault();
    var texto_generando = $(this).data('texto_generando');
    $('#form_generar').submit();
    $('#dialogo_confirmar_generar .modal-body').html("<h4 class='text-center'><i class='fa fa-spinner fa-pulse'></i> " + texto_generando + "</h4>");
});

//Carga de mediciones
$('#btn_confirm_cargar').click(function (e) {
    e.preventDefault();
    var texto_cargando = $(this).data('texto_cargando');
    $('#form_cargar').submit();
    $('#dialogo_confirmar_cargar .modal-body').html("<h4 class='text-center'><i class='fa fa-spinner fa-pulse'></i> " + texto_cargando + "</h4>");
});

//Tabla anual y de valores
$('.tabla_valores,.tabla_anual').DataTable({
    "bPaginate": false,
    "bSort": false,
    dom: "<'row'<'col-sm-12'B>>" +
            "<'row'<'col-sm-12'tr>>" +
            "<'row'<'col-sm-12'>>",
    buttons: [
        {extend: 'colvis', text: "<i title='Ver columnas' class='fa fa-columns fa-fw'></i> <i class='fa fa-caret-down'></i>"},
        {
            extend: 'collection',
            text: "<i title='Exportar' class='fa fa-share-square-o fa-fw'></i> <i class='fa fa-caret-down'></i>",
            buttons: [
                {extend: 'csv', text: "<i title='Exportar a CSV' class='fa fa-file-text-o fa-fw'></i> Exportar a CSV"},
                {extend: 'excel', text: "<i title='Exportar a Excel' class='fa fa-file-excel-o fa-fw'></i> Exportar a Excel"},
                {extend: 'print', text: "<i title='Imprimir/PDF' class='fa fa-print fa-fw'></i> Imprimir/PDF"}
            ]
        }
    ]
});