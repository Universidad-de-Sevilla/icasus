<?php
define('IC_VERSION', "2.9.0");
define('IC_FECHA_REVISION', "22/12/2014");

// 2.8.9 - 22/12/2014 - Mejoras en la usabilidad de la aplicación.
// 2.8.7 - 02/12/2014 - Filtrados todos los campos de las peticiones GET y POST con las funciones que proporciona PHP 
// 2.8.6 - 14/11/2014 - Todas las cadenas de textos pasadas a constantes 
// 2.8.5 - 04/11/2014 - Refactorizadas todas las clases PHP a nombres con mayúsculas
// 2.8.4 - 28/10/2014 - Nueva plantilla autocontenida
// 2.8.3 - 27/10/2014 - Corrige errores y muestra versión en pie. Corrige errores en edición de datos e indicadores (#787 y #2725)
// 2.8.2 - 15/10/2014 - Muestra correctamente el tipo de agregación (cálculo del total) de indicadores y datos
// 2.8.1 - 17/09/2014 - Agrupa las gráficas en mediciones_mostrar
// 2.8.0 - 31/07/2014 - Implementa Highchart para representar los gráficos con javascript, corrige errores en valores de referencia y permisos
// 2.7.4 - 06/06/2014 - Corrige error al mostrar valores de referencia en gráficas, atenua su color para distinguirlos de indicadores
// 2.7.3 - 04/06/2014 - Permite crear valores de referencia en datos, corrige error id_unidad en url
// 2.7.2 - 26/05/2014 - Permite rellenar campo 'Históricos' en datos, redondeo a dos decimales en salida, operador % funcionando en consulta avanzada
// 2.7.1 - 29/04/2014 - Corrige un fallo grave al tomar los operadores de agregado de los indicadores que forman parte de indicadores calculados
// 2.7.0 - 28/04/2014 - Los totales de los indicadores calculados se calculan ahora desde los datos de origen
// 2.6.6 - 01/04/2014 - Tablas con múltiples indicadores y pantalla inicio con mediciones pendientes
// 2.6.5 - 06/03/2014 - Nuevo campo etiqueta_mini agregado a consultas API y cambio en color de fondo de dataTables
// 2.6.4 - 24/02/2014 - Falso cálculo de mediana y algún errorcillo suelto
// 2.6.3 - 18/11/2013 - Valores de referencia en cuadros de mando
// 2.6.2 - 15/11/2013 - Valores de referencia en gráficos de indicador y mediciones
// 2.6.1 - 11/11/2013 - Faltaban los gráficos de la ficha de dato y de la de medición
// 2.6.0 - 11/11/2013 - Los gráficos de los indicadores van con flot y se pintan mediciones anuales e intraanuales si las hay
// 2.5.6 - Creación de paneles de barra mejorada
// 2.5.5 - Cambio de los paneles de barra para que muestren subunidades, cambios en permisos sobre mediciones
// 2.5.4 - Mejoras sustanciales en series temporales cuadros de mando
// 2.5.3 - Error: no grababa equipo_de_proceso en ficha de procesos
// 2.5.2 - Error: no grababa variable_control en ficha de procesos
// 2.5.1 - Corregido error en tratamiento fichero CSV
// 2.5.0 - Importación de datos desde ficheros CSV
