//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/panel_tabla.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Incluye el código JavaScript para el fichero panel_tabla.tpl
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

    //Indicadores y datos
    $('#indicadores, #datos').change(function () {
        if ($("#datos option:selected").length === 0 &&
                $("#indicadores option:selected").length === 0) {
            $('#indicadores_datos').prop('required', true);
        }
        else {
            $('#indicadores_datos').prop('required', false);
        }
        //Actualizamos validaciones
        $('#wrapper #panel_nuevo').validator('destroy');
        $('#wrapper #panel_nuevo').validator();
    });

    $('#sel_todos_indics').on('click', function () {
        $("#indicadores option").prop("selected", true).trigger('chosen:updated');
        $('#indicadores').trigger('change');
    });

    $('#desel_todos_indics').on('click', function () {
        $("#indicadores option").prop("selected", false).trigger('chosen:updated');
        $('#indicadores').trigger('change');
    });

    $('#sel_todos_datos').on('click', function () {
        $("#datos option").prop("selected", true).trigger('chosen:updated');
        $('#datos').trigger('change');
    });

    $('#desel_todos_datos').on('click', function () {
        $("#datos option").prop("selected", false).trigger('chosen:updated');
        $('#datos').trigger('change');
    });

    //Reset
    $(':reset').click(function () {
        $('#ventana_tiempo').bootstrapToggle('off');
        $('#indicadores option:selected').prop('selected', false).trigger('chosen:updated');
        $('#datos option:selected').prop('selected', false).trigger('chosen:updated');
        $('#indicadores_datos').prop('required', true);
    });

});