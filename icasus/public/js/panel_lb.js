//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/panel_lb.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Incluye el código JavaScript para el fichero panel_linea.tpl y panel_barras.tpl
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

    //Indicadores/datos
    //Buscar
    $('#buscar_indicador').on('keyup', function () {
        var cadena = $(this).val();
        if (cadena) {
            $('#listado_indicadores').removeClass('hidden');
        }
        else
        {
            $('#listado_indicadores').addClass('hidden');
        }
        var id_entidad = $(this).data('id_entidad');
        $.ajax({
            url: "index.php?page=panel_linea&ajax=true&modulo=buscar&id_entidad=" + id_entidad + "&cadena=" + cadena,
            success: function (datos) {
                $('#listado_indicadores').html(datos);
            }
        });
    });

    //Calcular subunidades
    $('#wrapper').on('click', '.indicador_seleccionado', function () {
        var id_indicador = $(this).data('id_indicador');
        var nombre_indicador = $(this).data('nombre_indicador');
        $.ajax({
            url: "index.php?page=panel_linea&ajax=true&modulo=subunidades&id_indicador="
                    + id_indicador + "&nombre_indicador=" + nombre_indicador,
            success: function (datos) {
                $("#lista_subunidades").html(datos);
            }
        });
        $('#dialogo_subunidades .modal-title span').text(nombre_indicador);
        $('#dialogo_subunidades').modal('show');
    });

    //Añadir indicador/dato
    var texto_borrar = $('#indicadores_subunidades_seleccionados').data('texto_borrar');

    $('#wrapper').on('click', '.subunidad_seleccionar', function (e) {
        var sel = $('input[name=id_subunidad]:checked', '#form_unidades');
        var id_subunidad = sel.val();
        if (id_subunidad) {
            e.preventDefault();
            var id_indicador = sel.data('id_indicador');
            var indicador = sel.data('nombre_indicador');
            var subunidad = sel.data('nombre_subunidad');
            $('#indicadores_subunidades').removeClass('hidden');
            $('#indicadores_subunidades_seleccionados').append('<tr class="fila_borrar">' +
                    '<td><input type="hidden" name="id_indicadores[]" value="' + id_indicador + '">' + indicador +
                    '</td>' +
                    '<td><input type="hidden" name="id_subunidades[]" value="' + id_subunidad + '">' + subunidad +
                    '</td>' +
                    '<td class="text-center">' +
                    '<a class="remove_seleccion" title="' + texto_borrar + '" href="#"><i class="fa fa-times fa-fw"></i></a>' +
                    '</td></tr>');
            $('#dialogo_subunidades').modal('hide');
            $('#indicadores').prop('required', false);
            //Actualizamos validaciones
            $('#wrapper #panel_nuevo').validator('destroy');
            $('#wrapper #panel_nuevo').validator();
        }
    });

    //Quitar indicador/dato
    $('#wrapper').on('click', '.remove_seleccion', function (e) {
        e.preventDefault();
        $(this).parents('.fila_borrar').remove();
        if ($('.remove_seleccion').length === 0) {
            $('#indicadores_subunidades').addClass('hidden');
            $('#indicadores').prop('required', true);
        }
    });

    //Reset
    $(':reset').click(function () {
        $('#ventana_tiempo').bootstrapToggle('off');
        //Quitamos todos los indicadores/datos añadidos
        $('.fila_borrar').remove();
        $('#listado_indicadores').addClass('hidden');
        $('#indicadores_subunidades').addClass('hidden');
        $('#indicadores').prop('required', true);
    });

});