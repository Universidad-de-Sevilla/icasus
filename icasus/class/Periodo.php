<?php
//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: class/Periodo.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
// Almacena los distintos tipos de periodos de mediciones: anual, trimestral, mensual, etc
//---------------------------------------------------------------------------------------------------

class Periodo extends ADOdb_Active_Record
{
	public $_table = 'periodos';
}

