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
//Si cambia la longitud del documento
onElementHeightChange(document.body, function () {
    backToTop();
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

//Datatables
$(document).ready(function () {
    $('.datatable').DataTable({
        "pagingType": "full_numbers",
        "iDisplayLength": 25,
        dom: "<'row'<'col-sm-2'B><'col-sm-5'l><'col-sm-5'f>>" +
                "<'row'<'col-sm-12'tr>>" +
                "<'row'<'col-sm-5'i><'col-sm-7'p>>",
        buttons: [
            {extend: 'colvis', text: "<i title='Ver columnas' class='fa fa-columns fa-fw'></i>"},
            {
                extend: 'collection',
                text: "<i title='Exportar' class='fa fa-share-square-o fa-fw'></i>",
                buttons: [
                    {extend: 'csv', text: "<i title='Exportar a CSV' class='fa fa-file-text-o fa-fw'></i> Exportar a CSV"},
                    {extend: 'excel', text: "<i title='Exportar a Excel' class='fa fa-file-excel-o fa-fw'></i> Exportar a Excel"},
                    {extend: 'print', text: "<i title='Imprimir/PDF' class='fa fa-print fa-fw'></i> Imprimir/PDF"}
                ]
            }
        ]
    });
});

//Map Responsive
$(document).ready(function () {
    $('img[usemap]').rwdImageMaps();
});

//Chosen selects (añade búsqueda a los html select)
$(".chosen-select").chosen({
    disable_search_threshold: 10,
    no_results_text: "Oops, no se encuentran registros coincidentes"
});

//Habilita enlaces directos a pestañas dentro de una página
var url = document.location.toString();
if (url.match('#')) {
    $('.nav-tabs a[href=#' + url.split('#')[1] + ']').tab('show');
}