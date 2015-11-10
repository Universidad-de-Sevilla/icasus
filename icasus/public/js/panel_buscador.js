//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/panel_buscador.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Incluye el código JavaScript para el fichero panel_buscador.tpl
//----------------------------------------------------------------------------

$('.indicador_seleccionado_tarta').on('click', function () {
    var id_indicador = $(this).data('id_indicador');
    $('#mediciones_tarta').html('');
    $('#mediciones_tarta').removeClass('hidden');
    $.ajax({
        url: "index.php?page=" + page + "&ajax=true&modulo=mediciones_tarta&id_indicador="
                + id_indicador,
        success: function (datos) {
            $("#mediciones_tarta").html(datos);
        }
    });
});
$('.indicador_seleccionado_metrica').on('click', function () {
    var id_indicador = $(this).data('id_indicador');
    $('#subunidades_metrica').html('');
    $('#subunidades_metrica').removeClass('hidden');
    $('#mediciones_metrica').html('');
    $.ajax({
        url: "index.php?page=" + page + "&ajax=true&modulo=subunidades_metrica&id_indicador="
                + id_indicador,
        success: function (datos) {
            $("#subunidades_metrica").html(datos);
        }
    });
});
$('.indicador_seleccionado').on('click', function () {
    var id_indicador = $(this).data('id_indicador');
    $('#subunidades').html('');
    $.ajax({
        url: "index.php?page=" + page + "&ajax=true&modulo=subunidades&id_indicador="
                + id_indicador,
        success: function (datos) {
            $("#subunidades").html(datos);
        }
    });
});