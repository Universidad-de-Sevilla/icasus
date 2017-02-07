//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/control_efqm.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Incluye el código JavaScript para el fichero control_efqm.tpl
//----------------------------------------------------------------------------

//Selector de criterios
var id_entidad = $('#criterio').data('id_entidad');
$('#efqm').on('change', function () {
    var efqm = $('#efqm').val();
    $('#dialogo_cargando_control').modal('show');
    $.ajax({
        type: 'POST',
        data: {efqm: efqm},
        url: "index.php?page=control_efqm&ajax=true&modulo=efqm&id_entidad=" + id_entidad,
        success: function (datos) {
            $("#datos_control").html(datos);
            $('#dialogo_cargando_control').modal('hide');
        }
    });
});