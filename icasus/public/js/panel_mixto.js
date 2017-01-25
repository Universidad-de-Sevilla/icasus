//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/panel_mixto.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Incluye el código JavaScript para el fichero panel_mixto.tpl
//----------------------------------------------------------------------------

$(document).ready(function () {

    //Ventana de tiempo
    $('#ventana_tiempo').change(function () {
        if ($('#ventana_tiempo').is(':checked')) {
            $('#ventana_fija').removeClass('hidden');
            $('#anyo_inicio, #anyo_fin').removeAttr('disabled');
            $('#ventana_var').addClass('hidden');
            $('#anyos_atras').attr('disabled', 'disabled');
        }
        else {
            $('#ventana_fija').addClass('hidden');
            $('#anyo_inicio, #anyo_fin').attr('disabled', 'disabled');
            $('#ventana_var').removeClass('hidden');
            $('#anyos_atras').removeAttr('disabled');
        }
    });

    //Cambios de años
    $('#anyo_fin').change(function () {
        var valor = $(this).val();
        $('#anyo_inicio').attr("max", valor);
    });
    $('#anyo_inicio').change(function () {
        var valor = $('#anyo_fin').val();
        $('#anyo_inicio').attr("max", valor);
    });

    //Reset
    $(':reset').click(function () {
        $('#ventana_tiempo').bootstrapToggle('off');
        $('#indicadores_complementarios option:selected').prop('selected', false).trigger('chosen:updated');
    });

});