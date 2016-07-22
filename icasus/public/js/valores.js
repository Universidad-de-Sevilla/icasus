//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/valores.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Incluye el código JavaScript para el fichero valores.tpl
//----------------------------------------------------------------------------

//Variables: Valor mínimo y máximo permitido
valor_min = $("#panel_valores").data("valor_min");
valor_max = $("#panel_valores").data("valor_max");

$(function () {
    var id_indicador = $('#tabla_valores').data('id_indicador');
    var id_entidad = $('#tabla_valores').data('id_entidad');
    var id_medicion = 'null';
    var id_subunidad = 'null';
    var inicio = 'null';
    var fin = 'null';
    var activo = 'null';

    //Diálogo para activar una medición no asignada
    $('#page-wrapper').on('click', '.no_asignada', function () {
        var subunidad = $(this).parent().parent().data('subunidad');
        var id_medicion = $(this).parent().data('id_medicion');
        var id_subunidad = $(this).parent().parent().data('id_subunidad');
        var inicio = $("#inicio").val();
        var fin = $("#fin").val();
        if (inicio === 0) {
            fin = 0;
        }
        $('#nombre_subunidad').html(subunidad);
        $('#modal_asignar_una_medicion').modal('show');
        $('#btn_confirm_med').click(function () {
            var activo = 0;
            if ($('#activo').is(":checked")) {
                activo = 1;
            }
            var parametros = "&id_entidad=" + id_entidad + "&id_indicador=" + id_indicador + "&id_medicion=" + id_medicion + "&id_subunidad=" + id_subunidad + "&inicio=" + inicio + "&fin=" + fin + "&activo=" + activo;
            $("#panel_valores").html("<h4 class='text-center'><i class='fa fa-spinner fa-pulse'></i></h4>");
            $.ajax({
                url: "index.php?page=valores_ajax&ajax=true&modulo=asignar_una_medicion" + parametros,
                success: function (datos) {
                    $("#mostrar_valores").html(datos);
                }
            });
        });
    });

    //Activar un valor
    $('#page-wrapper').on('change', '.activar_uno', function () {
        var activar_uno = $(this);
        var id_valor = $(this).data('id_valor');
        var id_medicion = $(this).parent().parent().data('id_medicion');
        var id_subunidad = $(this).parent().parent().parent().data('id_subunidad');
        var inicio = $("#inicio").val();
        var fin = $("#fin").val();
        if (inicio === 0) {
            fin = 0;
        }
        var activo = 0;
        if (activar_uno.is(':checked')) {
            activo = 1;
        }
        var parametros = "&id_entidad=" + id_entidad + "&id_indicador=" + id_indicador + "&id_medicion=" + id_medicion + "&id_subunidad=" + id_subunidad + "&inicio=" + inicio + "&fin=" + fin + "&activo=" + activo;
        $.ajax({
            url: "index.php?page=valores_ajax&ajax=true&modulo=activar_uno" + parametros,
            success: function () {
                if (activo) {
                    $('#' + id_valor).prop('disabled', false);
                }
                else {
                    $('#' + id_valor).prop('disabled', true);
                }
            }
        });
    });

    //Diaĺogo para activar todas las mediciones para una unidad
    $('#page-wrapper').on('click', '.activar_all', function () {
        var id_medicion = 'null';
        var id_subunidad = $(this).parent().parent().data('id_subunidad');
        var subunidad = $(this).parent().parent().data('subunidad');
        var inicio = $("#inicio").val();
        var fin = $("#fin").val();
        if (inicio === 0) {
            fin = 0;
        }
        var parametros = "&id_entidad=" + id_entidad + "&id_indicador=" + id_indicador + "&id_medicion=" + id_medicion + "&id_subunidad=" + id_subunidad + "&inicio=" + inicio + "&fin=" + fin + "&activo=1";
        $('#nombre_unidad_' + id_subunidad).html(subunidad);
        $("#modal_activar_all_" + id_subunidad).modal('show');
        $('#btn_confirm_all_' + id_subunidad).click(function () {
            $("#panel_valores").html("<h4 class='text-center'><i class='fa fa-spinner fa-pulse'></i></h4>");
            $.ajax({
                url: "index.php?page=valores_ajax&ajax=true&modulo=activar_all" + parametros,
                success: function (datos) {
                    $("#mostrar_valores").html(datos);
                }
            });
        });
    });

    //Diaĺogo para desactivar todas las mediciones para una unidad
    $('#page-wrapper').on('click', '.desactivar_all', function () {
        var id_medicion = 'null';
        var id_subunidad = $(this).parent().parent().data('id_subunidad');
        var subunidad = $(this).parent().parent().data('subunidad');
        var inicio = $("#inicio").val();
        var fin = $("#fin").val();
        if (inicio === 0) {
            fin = 0;
        }
        var parametros = "&id_entidad=" + id_entidad + "&id_indicador=" + id_indicador + "&id_medicion=" + id_medicion + "&id_subunidad=" + id_subunidad + "&inicio=" + inicio + "&fin=" + fin + "&activo=0";
        $('#nombre_unidad_des_' + id_subunidad).html(subunidad);
        $("#modal_desactivar_all_" + id_subunidad).modal('show');
        $('#btn_confirm_des_all_' + id_subunidad).click(function () {
            $("#panel_valores").html("<h4 class='text-center'><i class='fa fa-spinner fa-pulse'></i></h4>");
            $.ajax({
                url: "index.php?page=valores_ajax&ajax=true&modulo=activar_all" + parametros,
                success: function (datos) {
                    $("#mostrar_valores").html(datos);
                }
            });
        });
    });

    //Muestra el selector de los años de las mediciones
    $('#inicio').on('change', function () {
        $("#inicio option:selected").each(function () {
            var elegido = $(this).val();
            if (elegido === 0) {
                $("#end_year").html(' ');
            }
            else
            {
                var parametros = "&id_entidad=" + id_entidad + "&id_indicador=" + id_indicador + "&id_medicion=" + id_medicion + "&id_subunidad=" + id_subunidad + "&inicio=" + elegido + "&fin=" + fin + "&activo=" + activo;
                $.ajax({
                    url: "index.php?page=valores_ajax&ajax=true&modulo=seleccionar_años" + parametros,
                    success: function (datos) {
                        $("#end_year").html(datos);
                    }
                });
            }
        });
    });

    //Muestra las mediciones que están entre los períodos seleccionados
    $('#btn_mostrar').on('click', function () {
        var inicio = $("#inicio").val();
        var fin = $("#fin").val();
        if (inicio === 0) {
            fin = 0;
        }
        var parametros = "&id_entidad=" + id_entidad + "&id_indicador=" + id_indicador + "&id_medicion=" + id_medicion + "&id_subunidad=" + id_subunidad + "&inicio=" + inicio + "&fin=" + fin + "&activo=" + activo;
        $("#panel_valores").html("<h4 class='text-center'><i class='fa fa-spinner fa-pulse'></i></h4>");
        $.ajax({
            url: "index.php?page=valores_ajax&ajax=true&modulo=mostrar_valores" + parametros,
            success: function (datos) {
                $("#mostrar_valores").html(datos);
            }
        });
    });

    //Actualizar valores
    $('#page-wrapper').on('keyup', '.actualizar_dato', function () {
        var actualizar_dato = $(this);
        var valor = $(this).val();
        valor = valor.replace(',', '.');
        if ($.isNumeric(valor) || valor.length === 0) {
            actualizar_dato.css("border-color", "green");
        }
        else {
            actualizar_dato.css("border-color", "red");
        }
    });
    $('#page-wrapper').on('blur', '.actualizar_dato', function () {
        var actualizar_dato = $(this);
        var color_input = $(this).css('border-color');
        var id_valor = $(this).data('id_valor');
        var valor = $(this).val();
        valor = valor.replace(',', '.');
        $('#intervalo').text('[' + valor_min + ', ' + valor_max + '].');
        if ($.isNumeric(valor)) {
            //Si hay un intervalo [min,max]
            if ($.isNumeric(valor_min) && $.isNumeric(valor_max)) {
                if (valor < valor_min || valor > valor_max) {
                    actualizar_dato.css("border-color", "red");
                    $('#dialogo_valor_intervalo').modal('show');
                }
                else {
                    var parametros = "&id_entidad=" + id_entidad + "&id_indicador=" + id_indicador + "&id_medicion=" + id_medicion + "&id_subunidad=" + id_subunidad + "&inicio=" + inicio + "&fin=" + fin + "&activo=" + activo + "&id_valor=" + id_valor + "&valor=" + valor;
                    $.ajax({
                        url: "index.php?page=valores_ajax&ajax=true&modulo=actualizar_dato" + parametros,
                        success: function () {
                            actualizar_dato.css("border-color", color_input);
                            actualizar_dato.val(Math.round(valor * 100) / 100);
                        }
                    });
                }
            }
            //Si hay un valor mínimo
            else if ($.isNumeric(valor_min) && !$.isNumeric(valor_max)) {
                if (valor < valor_min) {
                    actualizar_dato.css("border-color", "red");
                    $('#dialogo_valor_intervalo').modal('show');
                }
                else {
                    var parametros = "&id_entidad=" + id_entidad + "&id_indicador=" + id_indicador + "&id_medicion=" + id_medicion + "&id_subunidad=" + id_subunidad + "&inicio=" + inicio + "&fin=" + fin + "&activo=" + activo + "&id_valor=" + id_valor + "&valor=" + valor;
                    $.ajax({
                        url: "index.php?page=valores_ajax&ajax=true&modulo=actualizar_dato" + parametros,
                        success: function () {
                            actualizar_dato.css("border-color", color_input);
                            actualizar_dato.val(Math.round(valor * 100) / 100);
                        }
                    });
                }
            }
            //Si hay un valor máximo
            else if ($.isNumeric(valor_max) && !$.isNumeric(valor_min)) {
                if (valor > valor_max) {
                    actualizar_dato.css("border-color", "red");
                    $('#dialogo_valor_intervalo').modal('show');
                }
                else {
                    var parametros = "&id_entidad=" + id_entidad + "&id_indicador=" + id_indicador + "&id_medicion=" + id_medicion + "&id_subunidad=" + id_subunidad + "&inicio=" + inicio + "&fin=" + fin + "&activo=" + activo + "&id_valor=" + id_valor + "&valor=" + valor;
                    $.ajax({
                        url: "index.php?page=valores_ajax&ajax=true&modulo=actualizar_dato" + parametros,
                        success: function () {
                            actualizar_dato.css("border-color", color_input);
                            actualizar_dato.val(Math.round(valor * 100) / 100);
                        }
                    });
                }
            }
            //Si no hay definida ninguna restricción en cuanto a los valores
            else {
                var parametros = "&id_entidad=" + id_entidad + "&id_indicador=" + id_indicador + "&id_medicion=" + id_medicion + "&id_subunidad=" + id_subunidad + "&inicio=" + inicio + "&fin=" + fin + "&activo=" + activo + "&id_valor=" + id_valor + "&valor=" + valor;
                $.ajax({
                    url: "index.php?page=valores_ajax&ajax=true&modulo=actualizar_dato" + parametros,
                    success: function () {
                        actualizar_dato.css("border-color", color_input);
                        actualizar_dato.val(Math.round(valor * 100) / 100);
                    }
                });
            }
        }
        else if (actualizar_dato.val().length === 0) {
            var parametros = "&id_entidad=" + id_entidad + "&id_indicador=" + id_indicador + "&id_medicion=" + id_medicion + "&id_subunidad=" + id_subunidad + "&inicio=" + inicio + "&fin=" + fin + "&activo=" + activo + "&id_valor=" + id_valor;
            $.ajax({
                url: "index.php?page=valores_ajax&ajax=true&modulo=actualizar_dato" + parametros,
                success: function () {
                    actualizar_dato.css("border-color", color_input);
                }
            });
        }
        else {
            actualizar_dato.css("border-color", "red");
            $('#dialogo_valor_num').modal('show');
        }
    });
});

//Tablas de valores
$('#tabla_valores').DataTable({
    "bPaginate": false,
    "bSort": false,
    scrollY: "400px",
    scrollX: true,
    scrollCollapse: true,
    paging: false,
    fixedColumns: {
        leftColumns: 2
    },
    dom: "<'row'<'col-sm-12'>>" +
            "<'row'<'col-sm-12'tr>>" +
            "<'row'<'col-sm-12'>>"
});