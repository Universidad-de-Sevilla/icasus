<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Util
 *
 * @author joaquin
 */
//Clase que contiene métodos estáticos de utilidad para la aplicación
class Util
{

    //Saneamiento SQL
    static function mysqlCleaner($data)
    {
        return(stripslashes(mysql_real_escape_string($data)));
    }

}
