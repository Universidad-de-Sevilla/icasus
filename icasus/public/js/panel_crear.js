//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/panel_crear.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
//Incluye el código JavaScript para el fichero panel_crear.tpl
//----------------------------------------------------------------------------

$(function () {
    $('.tipo').on('click', function () {
        var id_entidad = $('#id_entidad').val();
        var tipo = $(this).data('tipo');
        var nombre_panel = $(this).data('nombre_panel');
        $('#nombre_panel').text(': ' + nombre_panel);
        $('#datos_panel').removeClass('active');
        $('#footer_tabs').addClass('hidden');
        $.ajax({
            url: "index.php?page=" + tipo + "&ajax=true&modulo=inicio&id_entidad=" + id_entidad,
            success: function (datos) {
                $("#datos").html(datos);
            }
        });
    });
});