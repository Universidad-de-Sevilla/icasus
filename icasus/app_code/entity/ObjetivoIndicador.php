<?php

//----------------------------------------------------------------------------------
// Proyecto: Icasus
// Fichero: entity/ObjetivoIndicador.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//----------------------------------------------------------------------------------
// Mapea la tabla objetivos_indicadores de la base de datos.
//----------------------------------------------------------------------------------

class ObjetivoIndicador extends ADOdb_Active_Record
{
    public $_table = 'icasus_objetivo_indicador';
}