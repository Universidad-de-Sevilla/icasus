function llamarasincrono(url, id_contenedor){

                var pagina_requerida = false

                if (window.XMLHttpRequest) {// Si es Mozilla, Safari etc

                pagina_requerida = new XMLHttpRequest()

                } else if (window.ActiveXObject){ // pero si es IE

                try {

                pagina_requerida = new ActiveXObject("Msxml2.XMLHTTP")

                }

                catch (e){ // en caso que sea una versióntigu

                try{

                pagina_requerida = new ActiveXObject("Microsoft.XMLHTTP")

                }

                        catch (e){}

                }

        }

        else

        return false

        pagina_requerida.onreadystatechange=function(){ // funcióe respuesta

        cargarpagina(pagina_requerida, id_contenedor)

}

var vr=document.getElementById('linea').value;

pagina_requerida.open('GET', url+'&id_linea='+vr, true) // asignamos los médos open y send

pagina_requerida.send(null)
function cargarpagina (pagina_requerida, id_contenedor)
{
    if (pagina_requerida.readyState == 4 && (pagina_requerida.status == 200 || window.location.href.indexOf ("http") == - 1))
    document.getElementById (id_contenedor).innerHTML = pagina_requerida.responseText;
}
}
