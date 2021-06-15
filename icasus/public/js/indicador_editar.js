//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/indicador_editar.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
//Incluye el código JavaScript para el fichero indicador_editar.tpl
//----------------------------------------------------------------------------

$(document).ready(function () {
    //mostrar tipo de medición
    $('.medicion').on('click', function () {
        var valor = $(this).attr('value');
        //Agregado
        if (valor === '1' || valor === '2')
        {
            $('#total').removeClass('hidden');
            $('#div_unidad').addClass('hidden');
            $('#div_subunidades').removeClass('hidden');
            $(".unidad").removeAttr("checked");
            $(".subunidad").prop("checked", 'true');
        }
        //No agregado
        else if (valor === '0')
        {
            $('#total').addClass('hidden');
            $('#div_unidad').removeClass('hidden');
            $('#div_subunidades').addClass('hidden');
            $(".subunidad").removeAttr("checked");
            $(".unidad").prop("checked", 'true');
        }
        $('.subunidad').trigger('change');
    });

    $('#marcar_todos').on('click', function () {
        $(".subunidad").prop("checked", 'true');
        $('.subunidad').trigger('change');
    });

    $('#desmarcar_todos').on('click', function () {
        $(".subunidad").removeAttr("checked");
        $('.subunidad').trigger('change');
    });

    $('.subunidad').click(function () {
        $('.subunidad').trigger('change');
    });

    //Control
    $('#activar_control').change(function () {
        if ($('#activar_control').is(':checked')) {
            $('#proceso').addClass('hidden');
            $('#id_proceso').attr('disabled', 'disabled');
        }
        else {
            $('#proceso').removeClass('hidden');
            $('#id_proceso').removeAttr('disabled');
        }
    });

    //Cálculo automático
    $('#activar_calculo').change(function () {
        if ($('#activar_calculo').is(':checked')) {
            $('#formula_calculo').removeClass('hidden');
            $('#intervalo').addClass('hidden');
            $('#calculo').removeAttr('disabled');
            $('.heredado').removeClass('hidden');
            $('.manual').addClass('hidden');
            $("#id_tipo_agregacion").trigger("chosen:updated");
        }
        else {
            $('#calculo').attr('disabled', 'disabled');
            $('#formula_calculo').addClass('hidden');
            $('#intervalo').removeClass('hidden');
            $('.heredado').addClass('hidden');
            $('.manual').removeClass('hidden');
            $("#id_tipo_agregacion").trigger("chosen:updated");
        }
    });

    //Intervalo
    $('#activar_intervalo').change(function () {
        if ($('#activar_intervalo').is(':checked')) {
            $('#vmin,#vmax').removeClass('hidden');
            $('#calculo_automatico').addClass('hidden');
            $('#valor_min,#valor_max').removeAttr('disabled');
        }
        else {
            $('#valor_min,#valor_max').attr('disabled', 'disabled');
            $('#vmin,#vmax').addClass('hidden');
            $('#calculo_automatico').removeClass('hidden');
        }
    });

    //Validación del intervalo
    $('#valor_max').change(function () {
        var valor = parseFloat($(this).val()) - 0.01;
        $('#valor_min').attr("max", valor);
    });

    $('#valor_min').change(function () {
        var valor = parseFloat($(this).val()) + 0.01;
        $('#valor_max').attr("min", valor);
    });

    //Periodicidad y mostrar selección de agregación temporal
    $('#periodicidad').on('change', function () {
        let valor = $(this).find('option:selected').text();
        let divTotal = $('#total_anual')
        let labelTotal = $('#agregacion_anual');
        let agregacion = $('#id_tipo_agregacion_temporal');
        if (valor === 'Bienal' || valor === 'Anual') {
            // Cambiar etiqueta del cálculo anual y añadir la opción 0 (no agregable).
            labelTotal.html(divTotal.data('label_hist'));
            divTotal.tooltip('hide').attr('data-original-title', divTotal.data('title_hist')).tooltip('show');
            if (agregacion.find('option:first-child').val() !== '0') {
                agregacion.prepend('<option value="0">' + divTotal.data('option0') + '</option>')
                    .trigger("chosen:updated");
            }
        } else {
            // Cambiar etiqueta del cálculo anual y quitar la opción 0 (no agregable).
            labelTotal.html(divTotal.data('label'));
            divTotal.tooltip('hide').attr('data-original-title', divTotal.data('title')).tooltip('show');
            if (agregacion.find('option:first-child').val() === '0') {
                agregacion.find('option:first-child').remove();
                agregacion.trigger("chosen:updated");
            }
        }
    });
});