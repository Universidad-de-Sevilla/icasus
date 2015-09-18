//------------------------------------------------------------------------------
// Proyecto: Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/indicador_crear.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//------------------------------------------------------------------------------
// Incluye el código JavaScript para el fichero indicador_crear.tpl
//------------------------------------------------------------------------------

$(document).ready(function () {
    //Navegación
    //Botón siguiente dirige a otros
    $('#btn_nxt_otros').on('click', function (e) {
        e.preventDefault();
        //Si no hay cálculo automático
        if (!$('#activar_calculo').is(':checked')) {
            //Retiramos de la validación el cálculo
            $('#formula_calculo').removeClass('has-error');
        }
        //Si no hay intervalo
        if (!$('#activar_intervalo').is(':checked')) {
            //Retiramos de la validación el intervalo
            $('#vmin,#vmax').removeClass('has-error');
        }
        var validar = $('form').validator('validate');
        //Retiramos validación de páginas posteriores
        $('#div_unidad').removeClass('has-error');
        $('#div_subunidades').removeClass('has-error');
        //Si no hay errores de validación avanzamos
        if (!validar.has('.has-error').length) {
            $('#tab_indicador').removeClass('active');
            $('#tab_indicador').addClass('disabled');
            $('#indicador').removeClass('active');
            $('#tab_otros').removeClass('disabled');
            $('#tab_otros').addClass('active');
            $('#otros').addClass('active');
        }
    });
    //Botón anterior dirige a indicador
    $('#btn_prev_indicador').on('click', function (e) {
        e.preventDefault();
        $('#tab_otros').removeClass('active');
        $('#tab_otros').addClass('disabled');
        $('#otros').removeClass('active');
        $('#tab_indicador').removeClass('disabled');
        $('#tab_indicador').addClass('active');
        $('#indicador').addClass('active');
    });
    //Botón siguiente dirige a subunidades
    $('#btn_nxt_subunidades').on('click', function (e) {
        e.preventDefault();
        $('#tab_otros').removeClass('active');
        $('#tab_otros').addClass('disabled');
        $('#otros').removeClass('active');
        $('#tab_subunidades').removeClass('disabled');
        $('#tab_subunidades').addClass('active');
        $('#subunidades').addClass('active');
    });
    //Botón anterior dirige a otros
    $('#btn_prev_otros').on('click', function (e) {
        e.preventDefault();
        $('#tab_subunidades').removeClass('active');
        $('#tab_subunidades').addClass('disabled');
        $('#subunidades').removeClass('active');
        $('#tab_otros').removeClass('disabled');
        $('#tab_otros').addClass('active');
        $('#otros').addClass('active');

    });

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
    });

    $('#marcar_todos').on('click', function () {
        $(".subunidad").prop("checked", 'true');
    });

    $('#desmarcar_todos').on('click', function () {
        $(".subunidad").removeAttr("checked");
    });

    //Cálculo automático
    $('#activar_calculo').change(function () {
        if ($('#activar_calculo').is(':checked')) {
            $('#formula_calculo').removeClass('hidden');
            $('#intervalo').addClass('hidden');
            $('#calculo').removeAttr('disabled');
        }
        else {
            $('#calculo').attr('disabled', 'disabled');
            $('#formula_calculo').addClass('hidden');
            $('#intervalo').removeClass('hidden');
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

    //Periodicidad y mostrar selección de agregación temporal
    $('#periodicidad').on('change', function () {
        var valor = $("#periodicidad option:selected").text();
        if (valor === 'Bienal' || valor === 'Anual')
        {
            $('#total_anual').addClass('hidden');
        }
        else
        {

            $('#total_anual').removeClass('hidden');
        }
    });

    //Reset
    $(':reset').click(function () {
        $('#activar_calculo,#activar_intervalo').bootstrapToggle('off');
    });
});