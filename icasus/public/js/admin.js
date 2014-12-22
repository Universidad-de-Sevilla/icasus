// JavaScript del area de administraci�n del tabl�n

/*function nuevoAjax(){ 	var xmlhttp=false; 	try 	{ 		xmlhttp=new ActiveXObject("Msxml2.XMLHTTP"); 	} 	catch(e) 
{ try {xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");} catch(E){ if (!xmlhttp && typeof XMLHttpRequest!='undefined') xmlhttp=new XMLHttpRequest();} } return xmlhttp;  }

function cargaContenido(){
alert("hola");	
}*/


//valida la creacion de una linea
function validacrearlinea(){
	if (document.crearlinea.titulo.value === '')
	{ 
		alert('Debe escribir un titulo');
		return false;
	}
}

//Valida crear objetivo
function validacrearobjetivo(){
	if (document.crearobjetivo.linea.value === '' || document.crearobjetivo.linea.value === 0  )
	{ 
		alert('Debe selecionar una L�nea');
		return false;
	}
	if (document.crearobjetivo.titulo.value === '')
	{ 
		alert('Debe escribir un T�tulo');
		return false;
	}
}

//Valida crear accion
function validacrearaccion(){
	if (document.crearaccion.linea.value === '' || document.crearaccion.linea.value === 0  )
	{ 
		alert('Debe selecionar una L�nea');
		return false;
	}
	if (document.crearaccion.objetivo.value === '' || document.crearaccion.objetivo.value === 0)
	{ 
		alert('Debe seleccionar un Ojetivo');
		return false;
	}
	if (document.crearaccion.titulo.value === '')
	{ 
		alert('Debe escribir un T�tulo');
		return false;
	}
}

//Valida crear indicadores
function validacrearindicador(){
	if (document.crearindicador.linea.value === '' || document.crearindicador.linea.value === 0  )
	{ 
		alert('Debe selecionar una L�nea');
		return false;
	}
	if (document.crearindicador.objetivo.value === '' || document.crearindicador.objetivo.value === 0)
	{ 
		alert('Debe seleccionar un Ojetivo');
		return false;
	}
	if (document.crearindicador.accion.value === '' || document.crearindicador.accion.value === 0)
	{ 
		alert('Debe seleccionar una Acci�n');
		return false;
	}
	if (document.crearindicador.titulo.value === '')
	{ 
		alert('Debe escribir un T�tulo');
		return false;
	}
}


function validamodlinea(){
	if (document.modlinea.titulo.value === '' || document.modlinea.titulo.value === 0)
	{ 
		alert('Debe escribir un T�tulo');
		return false;
	}	
}
//Valida modificaci�n de objetivos
function validamodobjetivo()
{
	if (document.modobjetivo.linea.value ===0 || document.modobjetivo.linea.value === '')
	{ 
		alert('Debe seleccionar una L�nea.');
		return false;
	}
	if (document.modobjetivo.titulo.value ===0 || document.modobjetivo.titulo.value === '')
	{ 
		alert('Debe escribir un T�tulo.');
		return false;
	}
}
//Valida modificaci�n de accion
function validamodaccion()
{
	if (document.modaccion.linea.value ===0 || document.modaccion.linea.value === '')
	{ 
		alert('Debe seleccionar una L�nea.');
		return false;
	}
	
	if (document.modaccion.objetivo.value ===0 || document.modaccion.objetivo.value === '')
	{ 
		alert('Debe seleccionar un Objetivo.');
		return false;
	}
	if (document.modaccion.titulo.value ===0 || document.modaccion.titulo.value === '')
	{ 
		alert('Debe escribir un T�tulo.');
		return false;
	}
}

function validamodindicador()
{
	if (document.modindicador.linea.value ===0 || document.modindicador.linea.value === '')
	{ 
		alert('Debe seleccionar una L�nea.');
		return false;
	}
	if (document.modindicador.objetivo.value ===0 || document.modindicador.objetivo.value === '')
	{ 
		alert('Debe seleccionar un Objetivo.');
		return false;
	}
	if (document.modindicador.accion.value ===0 || document.modindicador.accion.value === '')
	{ 
		alert('Debe seleccionar una Acci�n.');
		return false;
	}
	if (document.modindicador.titulo.value ===0 || document.modindicador.titulo.value === '')
	{ 
		alert('Debe escribir un T�tulo.');
		return false;
	}
}
//Valida formulario de entrada de anuncios

/*function validacrear(){
if (document.crear.categoria.value == 0)
{ 
alert('Debe seleccionar una Categor�a');
return false;
}
if (document.crear.date.value == '00-00-0000')
{ 
alert('Debe escribir un fecha del anuncio');
return false;
}
if (document.crear.anuncio.value == '')
{ 
alert('Debe escribir un Anuncio');
return false;
}

}
*/
//valida formulario del login

function valida()
{
if (document.formlogin.clave.value==='' || document.formlogin.usuario.value==='')
{ 
alert('Indique su nombre de usuario y clave de acceso.');
return false;
}

}



