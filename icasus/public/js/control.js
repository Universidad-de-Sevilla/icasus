//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/control.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Incluye el código JavaScript para el fichero control.tpl
//----------------------------------------------------------------------------

//Selector de periodos
var id_entidad = $('#periodo').data('id_entidad');
$('#Year').on('change', function () {
    var fecha = $('#Year').val();
    if (fecha === '') {
        fecha = new Date().getFullYear();
    }
    $('#dialogo_cargando_control').modal('show');
    $.ajax({
        url: "index.php?page=control&ajax=true&modulo=filtrOnlyear&id_entidad=" + id_entidad + "&fecha=" + fecha,
        success: function (datos) {
            $("#datos_control").html(datos);
            $('#dialogo_cargando_control').modal('hide');
        }
    });
});

//Barra de botones
$(document).ready(function () {
    var botones = $('#botones').html();
    $('#tabla_nulos_filter').append(botones);
});