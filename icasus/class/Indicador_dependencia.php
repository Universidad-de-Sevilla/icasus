<?php
//----------------------------------------------------------------------------------
// Proyecto: Icasus
// Fichero: class/Indicador_dependencia.php
// Tipo: definicion de clase
// Desarrolladores: Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//----------------------------------------------------------------------------------
// Relaciona los indicadores calculados con aquellos de los que depende su valor.
//----------------------------------------------------------------------------------

class Indicador_dependencia extends ADOdb_Active_Record
{
     public $_table = 'indicadores_dependencias';
}
