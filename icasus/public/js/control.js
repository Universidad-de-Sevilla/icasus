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
    $.ajax({
        url: "index.php?page=control&ajax=true&modulo=filtrOnlyear&id_entidad=" + id_entidad + "&fecha=" + fecha,
        success: function (datos) {
            $("#dt1").html(datos);
        }
    });
});