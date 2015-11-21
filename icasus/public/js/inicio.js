//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/inicio.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Incluye el código JavaScript para el fichero inicio.tpl y usuario_mostrar.tpl
//----------------------------------------------------------------------------

//Borrado de procesos
$('#dialogo_confirmar_borrado_proceso').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget);
    var nombre_proceso = button.data('nombre_proceso');
    var id_proceso = button.data('id_proceso');
    var id_entidad = button.data('id_entidad');
    var modal = $(this);
    var link = 'index.php?page=proceso_borrar&id_proceso=' + id_proceso + '&id_entidad=' + id_entidad;
    modal.find('#nombre_proceso').text(nombre_proceso);
    modal.find('#borrar').attr('href', link);
});

//Borrado de indicadores
$('#dialogo_confirmar_borrado_indicador').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget);
    var nombre_indicador = button.data('nombre_indicador');
    var id_indicador = button.data('id_indicador');
    var id_entidad = button.data('id_entidad');
    var modal = $(this);
    var link = 'index.php?page=indicador_borrar&id_indicador=' + id_indicador + '&id_entidad=' + id_entidad;
    modal.find('#nombre_indicador').text(nombre_indicador);
    modal.find('#borrar').attr('href', link);
});

//Borrado de datos
$('#dialogo_confirmar_borrado_dato').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget);
    var nombre_dato = button.data('nombre_dato');
    var id_dato = button.data('id_dato');
    var id_entidad = button.data('id_entidad');
    var modal = $(this);
    var link = 'index.php?page=dato_borrar&id_dato=' + id_dato + '&id_entidad=' + id_entidad;
    modal.find('#nombre_dato').text(nombre_dato);
    modal.find('#borrar').attr('href', link);
});

//Borrado de cuadros de mando
$('#dialogo_confirmar_borrado_cuadro').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget);
    var nombre_cuadro = button.data('nombre_cuadro');
    var id_cuadro = button.data('id_cuadro');
    var modal = $(this);
    var link = 'index.php?page=cuadro_borrar&id_cuadro=' + id_cuadro + '&id_entidad=14';
    modal.find('#nombre_cuadro').text(nombre_cuadro);
    modal.find('#borrar').attr('href', link);
});