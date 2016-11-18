//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/panel_tarta.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Incluye el código JavaScript para el fichero panel_tarta.tpl
//----------------------------------------------------------------------------

$(document).ready(function () {

    //Cambio de indicador/dato
    $('#indicador').change(function () {
        var id_indicador = $(this).val();
        $.ajax({
            url: "index.php?page=panel_tarta&ajax=true&modulo=mediciones&id_indicador="
                    + id_indicador,
            success: function (datos) {
                $("#mediciones_tarta").html(datos);
            }
        });
    });

});