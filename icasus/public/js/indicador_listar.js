//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/indicador_listar.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Incluye el código JavaScript para el fichero indicador_listar.tpl e indicadores.tpl
//----------------------------------------------------------------------------

//Borrado de indicadores
$('#dialogo_confirmar_borrado').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget);
    var nombre_indicador = button.data('nombre_indicador');
    var id_indicador = button.data('id_indicador');
    var id_entidad = button.data('id_entidad');
    var modal = $(this);
    var link = 'index.php?page=indicador_borrar&id_indicador=' + id_indicador + '&id_entidad=' + id_entidad;
    modal.find('#nombre_indicador').text(nombre_indicador);
    modal.find('#borrar').attr('href', link);
});

//Barra de botones
$(document).ready(function () {
    var botones = $('#botones').html();
    var boton_rebiun = $('#boton_rebiun').html();
    $('#tabla_indicadores_filter,#tabla_indicadores_ctl_filter,#tabla_datos_filter,#tabla_mis_indicadores_filter,#tabla_indicadores_archivados_filter').append(botones);
    $('#tabla_datos_filter').append(boton_rebiun);
});