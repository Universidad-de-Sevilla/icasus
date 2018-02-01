//--------------------------------------------------------------------------
// Proyecto Icasus <https://gestionproyectos.us.es/projects/r2h2-icasus/>
// Archivo: public/js/index.js
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//--------------------------------------------------------------------------
// Incluye el código JavaScript para el fichero index.tpl
//----------------------------------------------------------------------------

//Loads the correct sidebar on window load,
//collapses the sidebar on window resize.
// Sets the min-height of #page-wrapper to window size
$(function () {
    $(window).bind("load resize", function () {
        topOffset = 50;
        width = (this.window.innerWidth > 0) ? this.window.innerWidth : this.screen.width;
        if (width < 768) {
            $('div.navbar-collapse').addClass('collapse');
            topOffset = 100; // 2-row-menu
        } else {
            $('div.navbar-collapse').removeClass('collapse');
        }

        height = ((this.window.innerHeight > 0) ? this.window.innerHeight : this.screen.height) - 1;
        height = height - topOffset;
        if (height < 1)
            height = 1;
        if (height > topOffset) {
            $("#page-wrapper").css("min-height", (height) + "px");
        }
    });

    var url = window.location;
    var element = $('ul.nav a').filter(function () {
        return this.href == url || url.href.indexOf(this.href) == 0;
    }).addClass('active').parent().parent().addClass('in').parent();
    if (element.is('li')) {
        element.addClass('active');
    }
});

//Collapsible panels
jQuery(function ($) {
    $('.panel-heading i.clickable').on("click", function (e) {
        if ($(this).hasClass('panel-collapsed')) {
            // expand the panel
            $(this).parents('.panel').find('.panel-body').slideDown();
            $(this).removeClass('panel-collapsed');
            $(this).removeClass('fa-chevron-down').addClass('fa-chevron-up');
        }
        else {
            // collapse the panel
            $(this).parents('.panel').find('.panel-body').slideUp();
            $(this).addClass('panel-collapsed');
            $(this).removeClass('fa-chevron-up').addClass('fa-chevron-down');
        }
    });
});

// Back to Top
// Only enable if the document has a long scroll bar
// Note the window height + offset
backToTop();

//Si cambia la longitud del documento recargamos backToTop
onElementHeightChange(document.body, function () {
    // backToTop();
});

function backToTop() {
    if (($(window).height() + 100) < $(document).height()) {
        $('#top-link-block').removeClass('hidden').affix({
            // how far to scroll down before link "slides" into view
            offset: {top: 100}
        });
    }
}
//Detecta cambios de longitud del documento
function onElementHeightChange(elm, callback) {
    var lastHeight = elm.clientHeight, newHeight;
    (function run() {
        newHeight = elm.clientHeight;
        if (lastHeight != newHeight)
            callback();
        lastHeight = newHeight;

        if (elm.onElementHeightChangeTimer)
            clearTimeout(elm.onElementHeightChangeTimer);

        elm.onElementHeightChangeTimer = setTimeout(run, 200);
    })();
}

//Tooltips
$(function () {
    $('[data-toggle="tooltip"]').tooltip();
});

//Datatables
$(document).ready(function () {
    datatables = $('.datatable').DataTable({
        "pagingType": "full_numbers",
        "iDisplayLength": 25,
        fixedHeader: true,
        dom: "<'row'<'col-sm-2'B><'col-sm-5'l><'col-sm-5'f>>" +
                "<'row'<'col-sm-12'tr>>" +
                "<'row'<'col-sm-5'i><'col-sm-7'p>>",
        buttons: [
            {extend: 'colvis', text: "<i title='Ver columnas' class='fa fa-columns fa-fw'></i> <i class='fa fa-caret-down'></i>"},
            {
                extend: 'collection',
                text: "<i title='Exportar' class='fa fa-share-square-o fa-fw'></i> <i class='fa fa-caret-down'></i>",
                buttons: [
                    {extend: 'csv', text: "<i title='Exportar a CSV' class='fa fa-file-text-o fa-fw'></i> Exportar a CSV"},
                    {extend: 'excel', text: "<i title='Exportar a Excel' class='fa fa-file-excel-o fa-fw'></i> Exportar a Excel"},
                    {extend: 'print', text: "<i title='Imprimir/PDF' class='fa fa-print fa-fw'></i> Imprimir/PDF"}
                ]
            }
        ]
    });

    $('.ficha').DataTable({
        "bPaginate": false,
        "bSort": false,
        dom: "<'row'<'col-sm-12'B<'#btn_ficha'>>>",
        buttons: [
            {
                extend: 'collection',
                text: "<i title='Exportar' class='fa fa-share-square-o fa-fw'></i> <i class='fa fa-caret-down'></i>",
                buttons: [
                    {extend: 'csv', text: "<i title='Exportar a CSV' class='fa fa-file-text-o fa-fw'></i> Exportar a CSV"},
                    {extend: 'excel', text: "<i title='Exportar a Excel' class='fa fa-file-excel-o fa-fw'></i> Exportar a Excel"},
                    {extend: 'print', text: "<i title='Imprimir/PDF' class='fa fa-print fa-fw'></i> Imprimir/PDF"}
                ]
            }
        ]
    });

    //Reajustamos las cabeceras de las datatables al cambiar de pestaña
    $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
        datatables.fixedHeader.adjust();
    });

    //Reajustamos las cabeceras de las datatables al hacer scroll
    $('.table-responsive').on('scroll', function () {
        datatables.fixedHeader.adjust();
    });
});

//Opciones generales de los gráficos
Highcharts.setOptions({
    lang: {
        decimalPoint: ',',
        thousandsSep: '.'
    }
});

//Map Responsive
$(document).ready(function () {
    $('img[usemap]').rwdImageMaps();
});

//Chosen selects (añade búsqueda a los html select)
$(".chosen-select").chosen({
    disable_search_threshold: 10,
    no_results_text: "No se encontraron registros coincidentes con:",
    search_contains: true
});

//Habilita enlaces directos a pestañas dentro de una página
var url = document.location.toString();
if (url.match('#')) {
    $('.nav-tabs a[href=#' + url.split('#')[1] + ']').tab('show');
}
//Si queremos modificar el historial para volver atrás a la misma pestaña
//$('a[data-toggle="tab"]').click(function () {
//    var url = document.location.toString();
//    history.replaceState(null, '', url.split('#')[0] + $(this).attr("href"));
//});

// Comprobamos via ajax si la sesión está abierta y 
// avisamos si no estamos en la página de login
var sesion_activa;
function check_sesion() {
    var on_login = $('body').data('on_login');
    $.ajax({
        url: "index.php?page=check_sesion&ajax=true",
        success: function (res) {
            if (res !== '1' && !on_login) {
                $('#dialogo_sesion_expirada').modal('show');
            }
        }
    });
}
sesion_activa = setInterval(check_sesion, 10000);