<?php

//---------------------------------------------------------------------------------------------------
// Proyecto: Icasus 
// Archivo: lang_es.php
// Desarrolladores:Juanan Ruiz (juanan@us.es), Jesus Martin Corredera (jjmc@us.es),
// Joaquín Valonero Zaera (tecnibus1@us.es)
//---------------------------------------------------------------------------------------------------
/* Este fichero contiene constantes para todos los textos de la aplicación Icasus en español:
 * Clasificación:
 * TXT_[Nombre]--> Textos en general
 * FIELD_[Nombre]--> Campos de las tablas
 * MSG_[Nombre]--> Avisos/Notificaciones
 * ERR_[Nombre]--> Errores
 */

//---------------------------------------------------------------------------------
//TEXTOS: TXT_[Nombre]
//---------------------------------------------------------------------------------

define('TXT_ICASUS', 'icasus');
define('TXT_APP_WEB', 'icasus3.us.es');
define('TXT_APP_DESCRIPCION', 'Indicadores de Calidad de los Servicios de la Universidad de Sevilla');
define('TXT_DEPARTAMENTOS', 'Departamentos');
define('TXT_BIBLIOTECAS', 'Bibliotecas');
define('TXT_DEFINICION', 'Definición');
define('TXT_CONTROL', 'Control');
define('TXT_FICHA', 'Ficha');
define('TXT_NO_ASIG', 'No asignado');
define('TXT_CONTENIDO', 'Contenido de');
define('TXT_INTRO_TEXTO', 'Introduce texto');
define('TXT_REP_GRAFIC', 'Gráficas');
define('TXT_ASCENDENTE', 'Ascendente');
define('TXT_DESCENDENTE', 'Descendente');
define('TXT_DEPENDE', 'Su cálculo depende de los siguientes Indicadores:');
define('TXT_INFLUYE', 'Influye en el cálculo de los siguientes Indicadores:');
define('TXT_ENVIAR_CORREO', 'Enviar E-mail');
define('TXT_LLAMAR_TLF', 'Llamar al teléfono');
define('TXT_INVITADO', 'Invitado');
define('TXT_MANTENIMIENTO', 'Estamos realizando tareas de mantenimiento. Los servicios estarán disponibles lo antes posible, rogamos disculpen las molestias.');
define('TXT_BUSCAR_RESUL', 'Resultados de la búsqueda: ');
define('TXT_RESET', 'Reset');
define('TXT_RESUL', 'Resultado');
define('TXT_SEGUIMIENTO', 'Seguimiento');

//Análisis de Indicadores
define('TXT_ANALISIS', 'Análisis');
define('TXT_ANALISIS_DESC', 'Análisis: comente los resultados obtenidos anteriormente.');
define('TXT_PLAN_ACCION', 'Plan de acción');
define('TXT_PLAN_ACCION_DESC', 'Plan de acción para el año seleccionado.');
define('TXT_TABLA_ANAPLAN', 'Análisis y Planes de acción / Año');

//Archivos
define('TXT_ARCHIVOS', 'Archivos');
define('TXT_ARCHIVO_SUBIR', 'Subir archivo');
define('TXT_ARCHIVO_ACTUALIZAR_DATOS', 'Actualizar datos del archivo');
define('TXT_ARCHIVO_BORRAR', 'Borrar archivo');
define('TXT_ARCHIVOS_GESTION', 'Gestión de archivos');
define('TXT_ARCHIVO_SEL_IMPORT', 'Elija un archivo para importar');
define('TXT_ARCHIVO_PROCESAR', 'Procesa archivo');
define('TXT_ARCHIVOS_PROCESAR', 'Procesar archivos');
define('TXT_ARCHIVO_DESCARGA', 'Descargar archivo');
define('TXT_ARCHIVO_IMPORT_CSV', 'Importar archivo CSV');

//Clasificación
define('TXT_POR_MEDICION', 'Por medición');
define('TXT_POR_ANYO', 'Por año');

//Consulta
define('TXT_CONSULT', 'Consulta avanzada');
define('TXT_CONSULT_INFO', 'Para realizar la consulta busque e incluya los Indicadores que desee. Puede añadir hasta un máximo de 5 operandos a la consulta.');
define('TXT_CONSULT_PARAM', 'Parámetros de la consulta');
define('TXT_CONSULT_OPERAND', 'Indicador operando');
define('TXT_CONSULT_OPER', 'Operador');
define('TXT_CONSULT_INCLUIR', 'Incluir/cambiar operando de la consulta');
define('TXT_CONSULT_QUITAR', 'Retirar último operando de la consulta');
define('TXT_CONSULT_RESUL', 'Resultados de la consulta');
define('TXT_CONSULT_BUSCAR', 'Buscar Indicador');

//Cartas de Compromisos
const TXT_CARTA_TITULO = 'Carta de Compromisos de Servicios';
const TXT_CARTAS_TITULO = 'Cartas de Compromisos de Servicios';
const TXT_CARTA_CREAR = 'Crear Carta de Compromisos';
const TXT_CARTA_EDIT = 'Editar Carta de Compromisos';
const TXT_CARTA_BORRAR = 'Borrar Carta de Compromisos';
const TXT_CARTA_ARCHIVAR = 'Archivar Carta de Compromisos';
const TXT_CARTA_RESTAURAR = 'Restaurar Carta de Compromisos';
const MSG_CARTA_CONFIRM_ARCHIVAR = 'La Carta de Compromisos quedará archivada, pero no se eliminará. No olvide revisar sus indicadores asociados.<br>¿Realmente desea archivar esta Carta?';
const MSG_CARTA_CONFIRM_RESTAURAR = '¿Quiere restaurar esta Carta de Compromisos?';
const MSG_NO_CARTAS_ARCHIVADAS = 'No hay Carta de Compromisos archivadas.';
const MSG_CARTA_ARCHIVADA = 'Se ha archivado la Carta de Compromisos: ';
const MSG_CARTA_RESTAURADA = 'Se ha restaurado la Carta de Compromisos: ';

//Normativas
define('TXT_NORMATIVA_CREAR', 'Incluir Normativa');
define('TXT_NORMATIVA_EDIT', 'Editar Normativa');
define('TXT_NORMATIVA_BORRAR', 'Borrar Normativa');

//Servicios
define('TXT_SERVICIO_CREAR', 'Crear Servicio');
define('TXT_SERVICIO_EDIT', 'Editar Servicio');
define('TXT_SERVICIO_BORRAR', 'Borrar Servicio');

//Compromisos
define('TXT_COMPROMISO_CREAR', 'Crear Compromiso');
define('TXT_COMPROMISO_EDIT', 'Editar Compromiso');
define('TXT_COMPROMISO_BORRAR', 'Borrar Compromiso');

//Derechos
define('TXT_DERECHO_CREAR', 'Crear Derecho');
define('TXT_DERECHO_EDIT', 'Editar Derecho');
define('TXT_DERECHO_BORRAR', 'Borrar Derecho');

//Paneles de Gestión (antes Cuadros de Mando)
const TXT_PANEL_GESTION_CREAR = 'Crear Panel de Gestión';
const TXT_CUADRO_CREAR = TXT_PANEL_GESTION_CREAR;
const TXT_PANEL_GESTION_EDIT = 'Editar Panel de Gestión';
const TXT_CUADRO_EDIT = TXT_PANEL_GESTION_EDIT;
const TXT_PANEL_GESTION_BORRAR = 'Borrar Panel de Gestión';
const TXT_CUADRO_BORRAR = TXT_PANEL_GESTION_BORRAR;
const TXT_PANEL_GESTION_ASOC = 'Sin Panel de Gestión asociado (opcional: seleccione uno del desplegable).';
const TXT_CUADRO_ASOC = TXT_PANEL_GESTION_ASOC;

//Bloques de los Paneles de Gestión (antes Paneles de los Cuadros de Mando)
const TXT_BLOQUE_CREAR = 'Crear bloque';
const TXT_PANEL_CREAR = TXT_BLOQUE_CREAR;
const TXT_BLOQUE_TIPO = 'Tipo de bloque';
const TXT_PANEL_TIPO = TXT_BLOQUE_TIPO;
const TXT_BLOQUE_BORRAR = 'Borrar bloque';
const TXT_PANEL_BORRAR = TXT_BLOQUE_BORRAR;
const TXT_BLOQUE_EDITAR = 'Editar bloque';
const TXT_PANEL_EDITAR = TXT_BLOQUE_EDITAR;
const TXT_BLOQUE_NORMAL = 'Normal';
const TXT_PANEL_NORMAL = TXT_BLOQUE_NORMAL;
const TXT_BLOQUE_GRANDE = 'Grande';
const TXT_PANEL_GRANDE = TXT_BLOQUE_GRANDE;
const TXT_BLOQUE_DATOS = 'Datos del bloque';
const TXT_PANEL_DATOS = TXT_BLOQUE_DATOS;
const TXT_BLOQUE_VENTANA = 'Ventana de tiempo';
const TXT_PANEL_VENTANA = TXT_BLOQUE_VENTANA;
const TXT_BLOQUE_VENTANA_DESC = 'Establece una ventana temporal para el bloque. - Variable: periodo variable, finaliza en el año actual y comienza en un número fijo de años hacia atrás. - Fija: periodo fijo, con un año de inicio y otro de fin. ';
const TXT_PANEL_VENTANA_DESC = TXT_BLOQUE_VENTANA_DESC;
const TXT_BLOQUE_VENTANA_FIJA = 'Fija';
const TXT_PANEL_VENTANA_FIJA = TXT_BLOQUE_VENTANA_FIJA;
const TXT_BLOQUE_VENTANA_VAR = 'Variable';
const TXT_PANEL_VENTANA_VAR = TXT_BLOQUE_VENTANA_VAR;
const TXT_BLOQUE_INDICS = 'Indicadores del bloque';
const TXT_PANEL_INDICS = TXT_BLOQUE_INDICS;
const TXT_BLOQUE_INCLUIR = 'Añadir Indicador al bloque';
const TXT_PANEL_INCLUIR = TXT_BLOQUE_INCLUIR;

//Datos;
define('TXT_DATOS_REBIUN', 'Datos Rebiun');
define('TXT_DATOS_REBIUN_RECOGIDA', 'Recogida de Datos Rebiun');

//Entidades (Unidades)
define('TXT_UNID', 'Unidad');
define('TXT_UNID_ASIG_PRINCIPAL', 'Convertir en Unidad principal: al iniciar sesión accederá directamente a la ficha de esta Unidad (sólo se puede asignar una Unidad como principal).');
define('TXT_UNID_PRINCIPAL', 'Unidad principal: al iniciar sesión accederá directamente a la ficha de esta Unidad.');
define('TXT_UNID_EDIT', 'Editar Unidad');
define('TXT_UNIDS_MEDS_INDIC', 'Unidades con mediciones en el Indicador');
define('TXT_ETIQUETA_MINI_DESCRIPCION', 'Indica como aparece el nombre de la Unidad en las gráficas');
define('TXT_ORGANICA_DESCRIPCION', 'Sólo aparecen en los listados las Unidades orgánicas');

//Indicadores
define('TXT_INDIC_IR', 'Ir al Indicador');
define('TXT_INDIC_CREAR', 'Crear Indicador');
define('TXT_INDIC_EDIT', 'Editar Indicador');
define('TXT_INDIC_BORRAR', 'Borrar Indicador');
define('TXT_INDIC_NO_PROC', 'Sin Proceso asociado');
define('TXT_INDIC_ARCHIVAR', 'Archivar Indicador');
define('TXT_INDIC_ARCHIVADO', 'Indicador archivado: este Indicador ya no está en uso.');
define('TXT_INDIC_ARCHIVADOS', 'Indicadores archivados');
define('TXT_INDIC_RESTAURAR', 'Restaurar Indicador');
define('TXT_INDICS_MIO', 'Mis Indicadores');
define('TXT_INDIC_DAT', 'Datos del Indicador');
define('TXT_INDIC_CONFIRM_ASIG_MED', 'Por favor, confirme si desea asignar esta medición.');
define('TXT_INDIC_ACT_MED', 'Indique si además quiere activarla: ');
define('TXT_INDIC_DAT_DEPENDIENTES', 'Indicadores dependientes');
define('TXT_INDIC_DAT_CALCULADO', 'Calculado automáticamente');
//Control
define('TXT_INDIC_DAT_MED_NULA_AGRUPADOS', 'Mediciones nulas');
define('TXT_INDIC_DAT_MED_NULA', 'Medición nula/Subunidad');
define('TXT_INDIC_DAT_ULTIMA_MOD', 'Última modificación');
define('TXT_INDIC_DAT_SIN_MED', 'Sin mediciones');

//Login
define('TXT_BIENVENIDO', 'Bienvenido a');
define('TXT_LOGIN', 'Iniciar sesión');
define('TXT_LOGIN_PARTE1', 'es una aplicación web para la gestión de la calidad en la');
define('TXT_LOGIN_PARTE2', 'Para acceder al sistema es necesario ser miembro activo de alguno de los grupos de calidad de la Universidad de Sevilla y solicitar autorización de acceso al responsable de su grupo de calidad.');
define('TXT_LOGIN_PARTE3', 'ha sido desarrollado por el');
define('TXT_LOGIN_PARTE4', 'y puede utilizarse como');
define('TXT_LOGIN_PARTE5', 'Puede bajar una primera versión del');
define('TXT_LOGIN_PARTE6', 'en formato PDF (revisión disponible: 8 febrero 2018).');
define('TXT_AREA_REC_HUM', 'Área de Recursos Humanos de la Universidad de Sevilla');
define('TXT_SOFT_LIBRE', 'Software Libre');
define('TXT_IC_MANUAL', 'Manual de usuario de Icasus 3');

//Mediciones
define('TXT_MED_UNICA', 'Medición única en la Unidad actual.');
define('TXT_MED_VER', 'Ver/Editar medición');
define('TXT_MED_AGRED', 'Medición agregada en Subunidades y cumplimentada por los responsables de las Subunidades, o la persona delegada.');
define('TXT_MED_AGRED_CEN', 'Medición agregada en Subunidades y cumplimentada de manera centralizada por el responsable de medición del Indicador.');
define('TXT_MED_BORRAR', 'Borrar medición');
define('TXT_MED_ACT_TODAS', 'Activar todas las mediciones.');
define('TXT_MED_DESACT_TODAS', ' Desactivar todas las mediciones.');
define('TXT_MED_ASIG', ' Asignar la medición.');
define('TXT_MED_CREAR', 'Crear medición/es');
define('TXT_MED_CARGAR', 'Cargar medición/es');
define('TXT_MED_TABLA', 'Tabla de mediciones');
define('TXT_MED_ULTIMA', 'Última medición');
define('TXT_MEDS_BORRAR', 'Borrar mediciones');
define('TXT_MED_RESP_SEL', 'Elegir nuevo responsable de medición ...');

//Menú Principal
define('TXT_INICIO', 'Mi Icasus');
define('TXT_UNIDS_US', 'Unidades');
define('TXT_PLANES_US', 'Planes Estratégicos');
define('TXT_CARTAS_US', 'Cartas de Compromisos');
define('TXT_PROCS_US', 'Procesos');
define('TXT_INDICS_US', 'Indicadores/Datos');
define('TXT_DATOS_US', 'Datos');
const TXT_PANELES_GESTION_US = 'Paneles de Gestión';
const TXT_CUADROS_MANDO_US = TXT_PANELES_GESTION_US;
define('TXT_USERS_US', 'Usuarios');
define('TXT_USERS', 'Usuarios');
define('TXT_AYUDA', 'Ayuda');
define('TXT_UNIVERSIDAD', 'Universidad de Sevilla');
//Menú de Usuario
define('TXT_USER_PERFIL', 'Perfil de usuario');
define('TXT_CERRAR_SESION', 'Cerrar sesión');
//Menú de Unidades
define('TXT_INICIO_DESCRIPCION', 'Mi icasus: listado de sus competencias/responsabilidades.');
define('TXT_PLANES_DESCRIPCION', 'Planes Estratégicos: listado de Planes Estratégicos de la Unidad y gestión de los mismos.');
define('TXT_CARTAS_DESCRIPCION', 'Cartas de Compromisos: listado de las Cartas de Compromisos de la Unidad y gestión de las mismas.');
define('TXT_PROCS_DESCRIPCION', 'Procesos: listado de Procesos de la Unidad y gestión de los mismos. ');
define('TXT_INDICS_DESCRIPCION', 'Indicadores/Datos: listado de Indicadores/Datos de la Unidad y gestión de los mismos.');
const TXT_PANEL_GESTION_DESCRIPCION = 'Paneles de Gestión (antes Cuadros de Mando): listado y administración de Paneles de Gestión de la Unidad.';
const TXT_CUADRO_MANDO_DESCRIPCION = TXT_PANEL_GESTION_DESCRIPCION;
define('TXT_CONSULTA_DESCRIPCION', 'Consulta: efectuar consultas y operaciones que muestran información sobre los Indicadores y Datos de la Unidad.');
define('TXT_CONTROL_DESCRIPCION', 'Control: controle las mediciones, valores y criterios EFQM de los distintos Indicadores/Datos de la Unidad bajo su responsabilidad.');

//Navegación
define('TXT_MOSTRANDO', 'Mostrando');
define('TXT_MOSTRAR_RESUL', 'Mostrar resultado');
define('TXT_MOSTAR_OCULTAR_NAV', 'Mostrar/Ocultar navegación');
define('TXT_REGS_TODOS', 'Todos los registros');
define('TXT_DESDE', 'desde');
define('TXT_VER', 'Ver');
define('TXT_SI', 'Si');
define('TXT_NO', 'No');
define('TXT_PASO', 'Paso');
define('TXT_PRIMER', 'Primer/a');
define('TXT_ULTIMO', 'Último/a');
define('TXT_SIG', 'Siguiente');
define('TXT_ANT', 'Anterior');
define('TXT_DE', 'de');
define('TXT_EDIT', 'Editar');
const TXT_ARCHIVAR = 'Archivar';
const TXT_RESTAURAR = 'Restaurar';
define('TXT_BORRAR', 'Borrar');
define('TXT_DESACT', 'Desactivar');
define('TXT_CERRAR', 'Cerrar');
define('TXT_MARCAR', 'Marcar todos');
define('TXT_DESMARCAR', 'Desmarcar todos');
define('TXT_SEL', 'Seleccionar');
define('TXT_SEL_TODOS', 'Seleccionar todos');
define('TXT_DESEL_TODOS', 'Deseleccionar todos');
define('TXT_SEL_UNO', 'Seleccionar uno');
define('TXT_ELEG_UNO', 'Elegir uno si procede');
define('TXT_VOLVER_ARRIBA', 'Volver arriba');
define('TXT_VOLVER_INDICE', 'Volver al índice');

//Páginas
define('TXT_PAG', 'Página');
define('TXT_PAG_CREAR', 'Crear página');
define('TXT_PAG_EDIT', 'Editar página');

//Planes Estratégicos
const TXT_PLAN_CREAR = 'Crear Plan Estratégico';
const TXT_PLAN_EDIT = 'Editar Plan Estratégico';
const TXT_PLAN_BORRAR = 'Borrar Plan Estratégico';
const TXT_PLAN_ARCHIVAR = 'Archivar Plan Estratégico';
const TXT_PLAN_RESTAURAR = 'Restaurar Plan Estratégico';
const MSG_PLAN_CONFIRM_ARCHIVAR = 'El Plan Estratégico y sus indicadores de control quedarán archivados, pero no se eliminarán.<br>¿Realmente desea archivar este Plan?';
const MSG_PLAN_CONFIRM_RESTAURAR = '¿Quiere restaurar este Plan Estratégico y todas sus dependencias?';
const MSG_NO_PLANES_ARCHIVADOS = 'No hay Planes Estratégicos archivados.';
const MSG_PLAN_ARCHIVADO = 'Se ha archivado el Plan Estratégico: ';
const MSG_PLAN_RESTAURADO = 'Se ha restaurado el Plan Estratégico: ';

//Líneas Estratégicas
define('TXT_LINEA_CREAR', 'Crear Línea Estratégica');
define('TXT_LINEA_EDIT', 'Editar Línea Estratégica');
define('TXT_LINEA_BORRAR', 'Borrar Línea Estratégica');

//Objetivos Estratégicos
define('TXT_OBJEST_CREAR', 'Crear Objetivo Estratégico');
define('TXT_OBJEST_EDIT', 'Editar Objetivo Estratégico');
define('TXT_OBJEST_BORRAR', 'Borrar Objetivo Estratégico');

//Objetivos Operacionales
define('TXT_OBJOP_CREAR', 'Crear Objetivo Operacional');
define('TXT_OBJOP_EDIT', 'Editar Objetivo Operacional');
define('TXT_OBJOP_BORRAR', 'Borrar Objetivo Operacional');
define('TXT_OBJOP_TIPO', 'Tipo de Objetivo Operacional');
define('TXT_OBJOP_PROPIO', 'Propio');
define('TXT_OBJOP_DESC', 'Descendente');

//Procesos
define('TXT_PROC_VER', 'Ver Proceso');
define('TXT_PROC_MAP', 'Mapa de Procesos');
define('TXT_PROC_MAP_EDIT', 'Agregar/editar mapa de Procesos');
define('TXT_PROC_ES_MADRE', 'Es un Proceso madre');
define('TXT_PROC_VERSION', 'Número de la versión actual de la ficha del Proceso');
define('TXT_PROC_EDIT', 'Editar Proceso');
define('TXT_PROC_CREAR', 'Crear Proceso');
define('TXT_PROC_BORRAR', 'Borrar Proceso');
define('TXT_PROC_FLUJO', 'Flujograma');

//Propiedades
define('TXT_OTRAS_PROP', 'Otras propiedades');

//Propiedades HTML: Titles, placeholders, values de botones...
define('TXT_CODIGO', 'Único, fácil de recordar, en mayúsculas y sin espacios');
define('TXT_PESO', 'El peso [0.01,1] indica la importancia del Objetivo Operacional dentro del Objetivo Estratégico al que pertenece. Influye por tanto en el grado de ejecución de éste.');
define('TXT_ESTA', 'Está aquí');
const TXT_HISTORICO = 'Año de inicio de las mediciones';
define('TXT_CALCULO_TOTAL', 'Determina cómo se calcula el total entre todas las Subunidades');
define('TXT_CALCULO_TOTAL_ANUAL', 'Determina cómo se calcula el total anual entre todos los periodos');
const TXT_CALCULO_TOTAL_ANUAL_HIST = 'Determina cómo se calcula el total anual entre todos los periodos (solo aplicable si se ha modificado la periodicidad)';
define('TXT_GRABAR', 'Grabar');
define('TXT_CANCEL', 'Cancelar');
define('TXT_EXAMINAR', 'Examinar...');
define('TXT_NO_ARCHIVO_SEL', 'No se ha seleccionado ningún archivo.');
define('TXT_BTN_ACEPTAR', 'Aceptar');
define('TXT_BTN_GUARDAR', 'Guardar');
define('TXT_SOLO_INDIC_CALC', 'Sólo si el valor del Indicador es calculado automáticamente (en función del valor de otros Indicadores). Deberá indicar una fórmula para el cálculo del mismo.');
define('TXT_FORMULA', "Indique la fórmula para el cálculo, la sintaxis para referirse a Indicadores es la siguiente: [ID del Indicador]. Ejemplo: [1]+[2], el resultado será la suma del valor de Indicador con ID=1 más el Indicador con ID=2. IMPORTANTE: La periodicidad debe ser la misma para todos los Indicadores implicados, de lo contrario no será posible el cálculo.");
define('TXT_FUENTE_INFO', 'Conceptos, ideas, normativas... por las cuales surge el Indicador.');
define('TXT_FUENTE_DAT', 'Documentos, aplicaciones u otras fuentes... de donde se obtienen los valores para el Indicador.');
define('TXT_BUSCAR', 'Buscar...');
define('TXT_VAL_INSERT', 'Introduzca un número (dentro del intervalo si existe), dejar en blanco para valor nulo.');
define('TXT_FECHA_REV_ACTUAL', 'Fecha de la revisión actual');
define('TXT_GRAFICO_AUMENTAR', '(Haga click sobre el gráfico para aumentarlo)');
define('TXT_INTERVALO', 'Sólo si se quieren limitar los valores de las mediciones a un intervalo (cerrado) de posibles valores. Por ejemplo, para resultados de encuestas. No es compatible con el cálculo automático.');
define('TXT_ESTIMACION', 'Una estimación ascendente implica una evolución positiva cuanto más altos sean los valores de las mediciones, la estimación descendente implica lo contrario.');

//Tiempo/Periodicidad
define('TXT_BIENAL', 'Bienal');
define('TXT_ANUAL', 'Anual');
define('TXT_INTRANUAL', 'Intranual');
define('TXT_MENSUAL', 'Mensual');
define('TXT_TRIMESTRAL', 'Trimestral');
define('TXT_CUATRIMESTRAL', 'Cuatrimestral');
define('TXT_SEMESTRAL', 'Semestral');
//Tipos de Cálculo
define('TXT_CALC_AUTO', 'Este Indicador es calculado automáticamente');

//Tipos de Proceso
define('TXT_ESTRATEGICO', '1-Estratégico');
define('TXT_OPERATIVO', '2-Operativo');
define('TXT_APOYO', '3-Apoyo');
define('TXT_INDEF', 'Indefinido');

//Tipos de Representaciones Gráficas: paneles
define('TXT_LINEAS', 'Líneas');
define('TXT_LINEAS_DESC', 'Muestra varios Indicadores para distintas Unidades como gráfica de líneas.');
define('TXT_BARRAS', 'Barras');
define('TXT_BARRAS_DESC', 'Muestra varios Indicadores para distintas Unidades como gráfica de barras.');
define('TXT_MIXTO', 'Mixto');
define('TXT_MIXTO_DESC', 'Muestra un Indicador base como gráfica de barras y el resto de Indicadores complementarios como gráficas de líneas.');
define('TXT_TABLA', 'Tabla');
define('TXT_TABLA_DESC', 'Tabla que muestra varios Indicadores y su evolución total o de una Unidad concreta para un período dado.');
define('TXT_TARTA', 'Tarta');
define('TXT_TARTA_DESC', 'Muestra como se reparte una medición de un Indicador entre las Unidades afectadas como gráfica de tarta.');

//Usuarios
define('TXT_USERS_ASIGNAR', 'Asignar usuarios');
define('TXT_USERS_DESASIGNAR', 'Desasignar usuarios');
define('TXT_USERS_ALTA', 'Alta de usuarios');
define('TXT_USERS_BAJA', 'Baja de usuarios');
define('TXT_USER_UNIDS', 'Mis Unidades');
define('TXT_USER_PROCS', 'Mis Procesos');
define('TXT_USER_INDIC', 'Mis Indicadores');
const TXT_USER_PANELES_GESTION = 'Mis Paneles de Gestión';
const TXT_USER_CUADROS = TXT_USER_PANELES_GESTION;
define('TXT_USER_OBJOPS', 'Mis Objetivos Operacionales');
define('TXT_USERS_ASIG', 'Usuarios asignados');
define('TXT_USER_GESTION', 'Gestión de usuarios');
define('TXT_USER_EDIT', 'Editar usuario');

//Valores
define('TXT_VALS', 'Valores');
define('TXT_VAL_EDIT', 'Editar valores');
define('TXT_VAL_AGREGAR', 'Agregar valor');
define('TXT_VAL_UNID', 'Valor/Unidad');
define('TXT_VAL_IMPORT', 'Importar valores');
define('TXT_VAL_CALCULAR', 'Calcular');
define('TXT_VAL_CALC_DESCRIPCION', 'En Indicadores calculados actualiza los valores recalculando');
define('TXT_VAL_ACTIVO', 'Activo');
define('TXT_VAL_INACTIVO', 'Inactivo');
define('TXT_VAL_REF', 'Valores de referencia');
define('TXT_VAL_TABLA', 'Tabla de valores');
//Valores de referencia
define('TXT_VAL_REF_CREAR', 'Crear valor de referencia');
define('TXT_VAL_REF_EDIT', 'Editar valor de referencia');
define('TXT_VAL_REF_BORRAR', 'Borrar valores de referencia');
define('TXT_VALS_DESACT', 'Desactivar valores');
define('TXT_VAL_REF_NOMBRE', 'Los nombres "Meta" (color verde) y/o "Límite" (color rojo) activarán el control por colores del status en las mediciones.');
define('TXT_VAL_REF_ETIQ', 'La etiqueta indica el nombre con el que aparecerá el valor de referencia en las gráficas y en las mediciones.');
//Status
define('TXT_VAL_LOGRADO', 'Valor óptimo');
define('TXT_VAL_ACEPTABLE', 'Valor aceptable');
define('TXT_VAL_MEJORABLE', 'Valor mejorable');

//Visibilidad, permisos
define('TXT_TODOS', 'Todos');
define('TXT_PUBLICO', 'Público');
define('TXT_PRIVADO', 'Privado');

//-----------------------------------------------------------------------------------
//CAMPOS: FIELD_[Nombre]
//-----------------------------------------------------------------------------------

define('FIELD_ID', 'ID');
define('FIELD_ACCIONES', 'Acciones');
define('FIELD_TITULO', 'Título');
define('FIELD_DESC', 'Descripción');
define('FIELD_VISIB', 'Visible');
define('FIELD_CAT', 'Categoría');
define('FIELD_COD', 'Código');
define('FIELD_NOMBRE', 'Nombre');
define('FIELD_PROPIETARIO', 'Propietario');
define('FIELD_FECHA', 'Fecha');
define('FIELD_WEB', 'Sitio web');
define('FIELD_FUENTE', 'Fuente');
define('FIELD_PERIODO', 'Período');
define('FIELD_VISIBILIDAD', 'Visibilidad');
define('FIELD_LIMITE', 'Límite');
define('FIELD_META', 'Meta');
define('FIELD_CREAC', 'Creación');
const FIELD_ARCHIVADO = 'Archivado';
define('FIELD_FECHA_REV', 'Fecha de revisión');
define('FIELD_FECHA_RECOGIDA', 'Fecha recogida');
define('FIELD_AGREG', 'Agregado');
define('FIELD_INTERP', 'Interpretación');
define('FIELD_INICIO_PERIODO', 'Inicio del período');
define('FIELD_FIN_PERIODO', 'Fin del período');
define('FIELD_INICIO_GRABACION', 'Inicio de grabación');
define('FIELD_FIN_GRABACION', 'Fin de grabación');
define('FIELD_ETIQUETA', 'Etiqueta');
define('FIELD_ETIQUETA_MINI', 'Etiqueta mini');
define('FIELD_CAMBIO_A', 'Cambio a:');
define('FIELD_ALIAS', 'Alias');
define('FIELD_ORDEN', 'Orden');
define('FIELD_ANCHO', 'Ancho');
define('FIELD_ANYO', 'Año');
define('FIELD_TOTAL', 'Total');
define('FIELD_REGISTROS', 'Registros');
define('FIELD_OBSERV', 'Observaciones');
define('FIELD_ACTIVO', 'Activo');
define('FIELD_VERSION', 'Versión');
define('FIELD_COMENTARIOS', 'Comentarios');

//Archivos
define('FIELD_ARCHIVO', 'Archivo');

//Cartas
const FIELD_CARTA = 'Carta de Compromisos';
const FIELD_CARTAS = 'Cartas de Compromiso';

//Normativas
define('FIELD_NORMATIVA', 'Normativa');
define('FIELD_NORMATIVAS', 'Normativas');

//Servicios
define('FIELD_SERVICIO', 'Servicio');
define('FIELD_SERVICIOS', 'Servicios');
define('FIELD_DESCRIPCION', 'Descripción');

//Compromisos
define('FIELD_COMPROMISO', 'Compromiso');
define('FIELD_COMPROMISOS', 'Compromisos');

//Derechos
define('FIELD_DERECHO', 'Derecho');
define('FIELD_DERECHOS', 'Derechos de los usuarios');

//Paneles de Gestión (antes Cuadros de Mando)
const FIELD_PANEL_GESTION = 'Panel de Gestión';
const FIELD_CUADRO_MANDO = FIELD_PANEL_GESTION;
const FIELD_PANELES_GESTION = 'Paneles de Gestión';
const FIELD_CUADROS_MANDO = FIELD_PANELES_GESTION;
//Bloques de loa Paneles de Gestión (antes Paneles de los Cuadros de Mando)
const FIELD_ANYOS_ATRAS = 'Años atrás';
const FIELD_ANYO_FIN = 'Año de fin';

//Datos
define('FIELD_DATO', 'Dato');
define('FIELD_FUENTE_DAT', 'Fuente de Datos');
define('FIELD_DATOS', 'Datos');

//Entidades (Unidades)
define('FIELD_UNID', 'Unidad');
define('FIELD_UNID_SUP', 'Unidad superior');
define('FIELD_UNID_GEN', 'Unidad generadora');
define('FIELD_SUBUNID', 'Subunidad');
define('FIELD_SUBUNIDS', 'Subunidades');
define('FIELD_UNIDS', 'Unidades');
define('FIELD_ORGANICA', 'Orgánica');
define('FIELD_ANOTACION', 'Anotaciones');

//Indicadores
define('FIELD_INDIC', 'Indicador');
define('FIELD_INDIC_TIPO', 'Tipo de Indicador');
define('FIELD_INDIC_BASE', 'Indicador base');
define('FIELD_INDIC_COMPLEMENT', 'Indicadores complementarios');
define('FIELD_INDICS', 'Indicadores');
define('FIELD_FORM', 'Formulación');
define('FIELD_FORMULA', 'Fórmula de cálculo');
define('FIELD_FUENTE_INFO', 'Fuente de Información');
define('FIELD_PERIOD', 'Periodicidad');
define('FIELD_RESP', 'Responsable');
define('FIELD_RESP_SEG', 'Responsable de Seguimiento');
define('FIELD_MET', 'Método de comprobación (evidencia)');
define('FIELD_EFQM', 'Criterios EFQM');
define('FIELD_HISTORICO', 'Histórico');
define('FIELD_ESTIMACION', 'Estimación');
define('FIELD_CALCULO', 'Cálculo');
define('FIELD_CALC_TOTAL', 'Cálculo del total entre Subunidades');
define('FIELD_CALC_TOTAL_ANUAL', 'Cálculo del total anual');
const FIELD_CALC_TOTAL_ANUAL_HIST = 'Cálculo del total anual (histórico)';
define('FIELD_INTERVALO', 'Intervalo de valores [Vmin, Vmax]');
define('FIELD_VALOR_MIN', 'Valor mínimo');
define('FIELD_VALOR_MAX', 'Valor máximo');

//Mediciones
define('FIELD_MED', 'Medición');
define('FIELD_MEDICIONES', 'Mediciones');
define('FIELD_RESP_MED', 'Responsable de medición');
define('FIELD_TIP_MED', 'Tipo de medición');

//Páginas
define('FIELD_PAG_CONTENIDO', 'Contenido de la página (HTML)');

//Planes
define('FIELD_PLAN', 'Plan Estratégico');
const FIELD_PLANES = 'Planes Estratégicos';
const FIELD_PLANES_ARCHIVADOS = 'Planes Estratégicos Archivados';
define('FIELD_ANYO_INICIO', 'Año de inicio');
define('FIELD_DURACION', 'Duración (años)');
const FIELD_PROPOSITO = 'Propósito (Misión)';
const FIELD_MISION = FIELD_PROPOSITO;
define('FIELD_VISION', 'Visión');
define('FIELD_VALORES', 'Valores');
define('FIELD_FCE', 'Factores clave del éxito');
define('FIELD_EJECUCION', 'Ejecución');

//Líneas
define('FIELD_LINEA', 'Línea Estratégica');
define('FIELD_LINEAS', 'Líneas Estratégicas');
define('FIELD_INDICE', 'Índice');

//Objetivos
define('FIELD_OBJ_EST', 'Objetivo Estratégico');
define('FIELD_OBJ_OP', 'Objetivo Operacional');
define('FIELD_OBJS_EST', 'Objetivos Estratégicos');
define('FIELD_OBJS_OP', 'Objetivos Operacionales');
define('FIELD_PESO', 'Peso');

//Procesos
define('FIELD_PROC', 'Proceso');
define('FIELD_PROCS', 'Procesos');
define('FIELD_PROC_MADRE', 'Proceso madre');
define('FIELD_TIPO_PROC', 'Tipo de Proceso');
define('FIELD_SUBPROCS', 'Subprocesos');
define('FIELD_EQUIP_PROC', 'Equipo de Proceso');
define('FIELD_RESULTS_CLAVE', 'Resultados Clave');
define('FIELD_ENTRADAS_PROV', 'Entradas/Proveedores');
define('FIELD_SALIDAS_CLIENTS', 'Salidas/Usuarios');
define('FIELD_ACTIVIDADES', 'Actividades');
define('FIELD_VARS_CONTROL', 'Variables de Control');
define('FIELD_DOCUMENTACION', 'Documentación');

//Usuarios
define('FIELD_LOGIN', 'Login');
define('FIELD_USER', 'Usuario');
define('FIELD_CLAVE', 'Clave de acceso');
define('FIELD_APEL', 'Apellidos');
define('FIELD_TEL', 'Teléfono');
define('FIELD_CORREO', 'Email');
define('FIELD_DNI', 'DNI o NIE (con letra)');
define('FIELD_USER_GRABA', 'Usuario que graba');
define('FIELD_ROL', 'Rol');
define('FIELD_PUESTO', 'Puesto de trabajo');

//Valores
define('FIELD_VAL', 'Valor');
define('FIELD_VAL_REF', 'Valor de referencia');
define('FIELD_VISIB_GRAFIC', 'Visible en gráfica');

//-------------------------------------------------------------------------------------
//NOTIFICACIONES/AVISOS: MSG_[Nombre]
//-------------------------------------------------------------------------------------

define('MSG_NO_DEF', 'No se han definido.');
define('MSG_TOTAL_LINEAS', 'Total de líneas');
define('MSG_LINEAS_NO_REF_INDIC', 'líneas que no referenciaban a ningún Indicador.');
define('MSG_NO_MET_SOL', 'No existe el método solicitado.');
define('MSG_ERR', 'Por favor inténtelo de nuevo, si el problema persiste póngase en contacto con nosotros en la dirección: ');
define('MSG_CAMPO_REQ', 'Campo obligatorio');
define('MSG_BUSCAR_NO_RESUL', 'No existen resultados para la búsqueda solicitada.');
define('MSG_BUSCAR_NO_TEXTO', 'No introdujo ningún texto para buscar.');
define('MSG_NO_SESION', 'Su sesión ha expirado.');

//Análisis y Planes de acción
define('MSG_ANAPLAN_NO', 'Todavía no se ha registrado ningún análisis ni Plan de acción para el Indicador. Utilice el selector de la parte superior y los cuadros de texto para ello.');

//Archivos
define('MSG_ARCHIVO_BORRAR_CONFIRM', 'Por favor, confirme si desea borrar el archivo');
define('MSG_ARCHIVO_SUBIDA_OK', 'Se ha subido correctamente el archivo.');
define('MSG_ARCHIVO_BORRADO', 'Se ha eliminado con éxito el archivo.');
define('MSG_ARCHIVOS_PROCESADOS', 'Archivos procesados');

//Cartas de Servicios
define('MSG_CARTA_CREADA', 'Se ha creado una nueva Carta de Compromisos.');
define('MSG_CARTA_EDITADA', 'Se ha editado correctamente la Carta de Compromisos.');
define('MSG_CARTA_NO_ARCHIVOS', 'No se han subido archivos para esta Carta de Compromisos.');
define('MSG_CARTAS_NO', 'No hay Cartas de Compromisos definidas para ninguna Unidad.');
define('MSG_CARTA_NO_NORMATIVAS', 'No se han definido Normativas para esta Carta de Compromisos.');
define('MSG_CARTA_NO_DERECHOS', 'No se han definido Derechos para los usuarios de esta Carta de Compromisos.');
define('MSG_CARTA_NO_SERVICIOS', 'No se han definido Servicios para esta Carta de Compromisos.');
define('MSG_CARTA_NO_COMPROMISOS', 'No se han definido Compromisos para esta Carta de Compromisos.');
define('MSG_CARTA_NO_INDICS', 'No se han definido Indicadores para esta Carta de Compromisos.');
define('MSG_CARTA_CONFIRM_EDITAR', 'Va a editar esta Carta de Compromisos, ¿está seguro?');
define('MSG_CARTA_CONFIRM_BORRAR', '¿Desea borrar la Carta de Compromisos?');
define('MSG_CARTA_BORRAR', 'No tiene permisos para borrar esta Carta de Compromisos o ésta todavía contiene Servicios. Bórrelos primero.');
define('MSG_CARTA_BORRADA', 'Se ha eliminado la Carta de Compromisos:');

//Normativas
define('MSG_NORMATIVA_CREADA', 'Se ha inlcuido una nueva Normativa para esta Cartera.');
define('MSG_NORMATIVA_EDITADA', 'Se ha editado la Normativa correctamente.');
define('MSG_NORMATIVA_CONFIRM_EDITAR', 'Va a editar esta Normativa, ¿está seguro?');
define('MSG_NORMATIVA_CONFIRM_BORRAR', '¿Desea borrar esta Normativa?');
define('MSG_NORMATIVA_BORRAR', 'No tiene permisos para borrar la Normativa.');
define('MSG_NORMATIVA_BORRADA', 'Se ha eliminado la Normativa:');

//Servicios
define('MSG_SERVICIO_NO_COMPROMISOS', 'No se han definido Compromisos para este Servicio.');
define('MSG_SERVICIO_NO_INDICS', 'No se han asociado Indicadores a ningún Compromiso de este Servicio.');
define('MSG_SERVICIO_CREADO', 'Se ha creado un nuevo Servicio para esta Cartera.');
define('MSG_SERVICIO_EDITADO', 'Se ha editado el Servicio correctamente.');
define('MSG_SERVICIO_CONFIRM_EDITAR', 'Va a editar este Servicio, ¿está seguro?');
define('MSG_SERVICIO_CONFIRM_BORRAR', '¿Desea borrar este Servicio?');
define('MSG_SERVICIO_BORRAR', 'No tiene permisos para borrar el Servicio o éste todavía contiene Compromisos. Bórrelos primero.');
define('MSG_SERVICIO_BORRADO', 'Se ha eliminado el Servicio:');

//Compromisos
define('MSG_COMPROMISO_NO_INDICS', 'No se han definido Indicadores para este Compromiso.');
define('MSG_COMPROMISO_CREADO', 'Se ha creado un nuevo Compromiso para este Servicio.');
define('MSG_COMPROMISO_EDITADO', 'Se ha editado el Compromiso correctamente.');
define('MSG_COMPROMISO_CONFIRM_EDITAR', 'Va a editar este Compromiso, ¿está seguro?');
define('MSG_COMPROMISO_CONFIRM_BORRAR', '¿Desea borrar este Compromiso?');
define('MSG_COMPROMISO_BORRAR', 'No tiene permisos para borrar el Compromiso.');
define('MSG_COMPROMISO_BORRADO', 'Se ha eliminado el Compromiso:');

//Derechos
define('MSG_DERECHO_CREADO', 'Se ha añadido un nuevo Derecho de los usuarios para esta Cartera.');
define('MSG_DERECHO_EDITADO', 'Se ha editado el Derecho de los usuarios correctamente.');
define('MSG_DERECHO_CONFIRM_EDITAR', 'Va a editar este Derecho, ¿está seguro?');
define('MSG_DERECHO_CONFIRM_BORRAR', '¿Desea borrar este Derecho?');
define('MSG_DERECHO_BORRAR', 'No tiene permisos para borrar el Derecho.');
define('MSG_DERECHO_BORRADO', 'Se ha eliminado el Derecho de los usuarios:');

//Consulta avanzada
define('MSG_NO_CAL', 'No se puede calcular con los parámetros actuales.');
define('MSG_NO_OPERANDOS', 'Todavía no se han añadido Indicadores a la consulta.');

//Paneles de Gestión (antes Cuadros de Mando)
const MSG_PANEL_GESTION_BORRADO = 'Se ha eliminado el Panel de Gestión:';
const MSG_CUADRO_MANDO_BORRADO = MSG_PANEL_GESTION_BORRADO;
const MSG_PANEL_GESTION_CONFIRM_BORRAR = '¿Desea borrar el Panel de Gestión?';
const MSG_CUADRO_MANDO_CONFIRM_BORRAR = MSG_PANEL_GESTION_CONFIRM_BORRAR;
const MSG_PANEL_GESTION_NO_PROPIO = 'No tiene ningún Panel de Gestión propio todavía. Cree un nuevo Panel de Gestión.';
const MSG_CUADRO_MANDO_NO_PROPIO = MSG_PANEL_GESTION_NO_PROPIO;
const MSG_PANEL_GESTION_NO_PUBLIC = 'No existe ningún Panel de Gestión público todavía. Cree un nuevo Panel de Gestión.';
const MSG_CUADRO_MANDO_NO_PUBLIC = MSG_PANEL_GESTION_NO_PUBLIC;
const MSG_PANEL_GESTION_BORRAR = 'No se puede borrar un Panel de Gestión que contenga paneles. Bórrelos primero.';
const MSG_CUADRO_MANDO_BORRAR = MSG_PANEL_GESTION_BORRAR;
const MSG_PANEL_GESTION_CREADO = 'Se ha creado un nuevo Panel de Gestión.';
const MSG_CUADRO_CREADO = MSG_PANEL_GESTION_CREADO;
const MSG_PANEL_GESTION_EDITADO = 'Se ha editado correctamente el Panel de Gestión.';
const MSG_CUADRO_EDITADO = MSG_PANEL_GESTION_EDITADO;
const MSG_PANEL_GESTION_CONFIRM_EDITAR = 'Va a editar este Panel de Gestión, ¿está seguro?';
const MSG_CUADRO_CONFIRM_EDITAR = MSG_PANEL_GESTION_CONFIRM_EDITAR;
//Bloques de los Paneles de Gestión (antes Paneles de los Cuadros de Mando)
const MSG_BLOQUE_NO_VAL = 'No hay valores recogidos para los Indicadores de este bloque.';
const MSG_PANEL_NO_VAL = MSG_BLOQUE_NO_VAL;
const MSG_BLOQUE_INDIC_UNID = 'Seleccione la Unidad del Indicador para la que desea ver sus valores:';
const MSG_PANEL_INDIC_UNID = MSG_BLOQUE_INDIC_UNID;
const MSG_BLOQUE_BORRAR = 'Va a borrar este bloque del Panel de Gestión, ¿está seguro?';
const MSG_PANEL_BORRAR = MSG_BLOQUE_BORRAR;
const MSG_BLOQUE_BORRADO = 'Se ha eliminado con éxito el bloque seleccionado.';
const MSG_PANEL_BORRADO = MSG_BLOQUE_BORRADO;
const MSG_BLOQUE_CARGANDO = 'Cargando bloques, por favor espere.';
const MSG_PANEL_CARGANDO = MSG_BLOQUE_CARGANDO;
const MSG_BLOQUE_EDITADO = "Bloque editado correctamente:";
const MSG_PANEL_EDITADO = MSG_BLOQUE_EDITADO;
const MSG_BLOQUE_CREADO = "Se ha añadido el siguiente bloque al Panel de Control:";
const MSG_PANEL_CREADO = MSG_BLOQUE_CREADO;
const MSG_BLOQUE_CONFIRM_EDITAR = 'Va a editar este bloque, ¿está seguro?';
const MSG_PANEL_CONFIRM_EDITAR = MSG_BLOQUE_CONFIRM_EDITAR;

//Entidades (Unidades)
define('MSG_UNID_NO_PROC', 'No hay Procesos definidos para esta Unidad.');
define('MSG_UNID_NO_MAPA', 'No existe un mapa de Procesos definido para esta Unidad.');
define('MSG_UNID_NO_ARCHIVOS', 'No se han subido archivos en esta Unidad.');
define('MSG_UNID_NO_USERS', 'No se han vinculado usuarios a esta Unidad.');
define('MSG_UNID_USERS_TODOS', 'Todos los usuarios disponibles están asignados.');
define('MSG_UNID_USERS_BORRADOS', 'Se han eliminado de la Unidad');
define('MSG_UNID_USERS_AGREGADOS', 'Se han agregado a la Unidad');
define('MSG_UNID_CONFIRM_EDITAR', 'Va a editar esta Unidad, ¿está seguro?');
define('MSG_UNID_EDITADA', 'La Unidad se ha modificado con los datos que aparecen a continuación.');
define('MSG_UNID_NO_INDIC', 'No hay Indicadores activos en esta Unidad.');
define('MSG_UNID_NO_INDIC_PROC', 'No hay Indicadores (Proceso) activos en esta Unidad.');
define('MSG_UNID_NO_INDIC_CONTROL', 'No hay Indicadores (Control) activos en esta Unidad.');
define('MSG_UNID_NO_DATOS', 'No hay Indicadores (Datos) activos en esta Unidad.');
define('MSG_UNID_NO_INDIC_ARCHIVADOS', 'No hay Indicadores archivados en esta Unidad.');
define('MSG_UNID_NO_DATO_ARCHIVADOS', 'No hay Datos archivados en esta Unidad.');
const MSG_UNID_NO_PANELES_GESTION = 'No hay Paneles de Gestión definidos para esta Unidad.';
const MSG_UNID_NO_CUADROS = MSG_UNID_NO_PANELES_GESTION;
define('MSG_UNID_NO_PLANES', 'No hay Planes Estratégicos definidos para esta Unidad.');
define('MSG_UNID_NO_CARTAS', 'No hay Cartas de Compromisos definidas para esta Unidad.');
define('MSG_UNID_NO_IND_NO_DAT', 'No hay Indicadores ni Datos definidos para esta Unidad.');
define('MSG_UNID_NO_SUBUNIDS', 'Esta Unidad no tiene Subunidades.');
define('MSG_UNID_NO_ASIG', 'No tiene asignada ninguna Unidad.');
define('MSG_UNIDS_NO_EXISTEN', 'Actualmente, no existen Unidades orgánicas.');

//Indicadores
define('MSG_INDICS_NO', 'No hay Indicadores activos.');
define('MSG_INDICS_NO_PROC', 'No hay Indicadores (Proceso) activos.');
define('MSG_INDICS_NO_CONTROL', 'No hay Indicadores (Control) activos.');
define('MSG_INDICS_NO_DATOS', 'No hay Indicadores (Datos) activos.');
define('MSG_INDICS_NO_ARCHIVADOS', 'No hay Indicadores archivados.');
define('MSG_INDIC_NO_SUBUNID_ASIG', 'No se han asignado Unidad/Subunidades a este Indicador (corregir).');
define('MSG_INDIC_NO_VAL', 'No hay valores recogidos para este Indicador.');
define('MSG_INDIC_NO_VAL_PERIODO', 'No hay valores recogidos para este Indicador durante el período establecido.');
define('MSG_INDIC_CREADO', 'Se ha creado un nuevo Indicador.');
define('MSG_INDIC_NO_ENC', 'No se han encontrado Indicadores.');
define('MSG_INDIC_CONFIRM_ARCHIVAR', 'El Indicador quedará archivado pero no se eliminará, ¿realmente desea archivar este Indicador?');
define('MSG_INDIC_CONFIRM_BORRAR', '¿Realmente quiere borrar este Indicador?');
define('MSG_INDIC_CONFIRM_RESTAURAR', '¿Realmente quiere restaurar este Indicador?');
define('MSG_INDIC_CONFIRM_EDITAR', 'Va a editar este Indicador, ¿está seguro?');
define('MSG_INDIC_BORRADO', 'Se ha borrado el Indicador: ');
const MSG_INDIC_ARCHIVADO = 'Se ha archivado el Indicador: ';
const MSG_INDIC_CONTROL_ARCHIVADOS = 'Indicadores de Control archivados: ';
const MSG_INDIC_RESTAURADO = 'Se ha restaurado el Indicador: ';
const MSG_INDIC_CONTROL_RESTAURADOS = 'Indicadores de Control restaurados: ';
define('MSG_INDIC_ACTUALIZADO', 'Se han actualizado los datos del Indicador.');
define('MSG_INDIC_NO_VAL_REF', 'No se han definido valores de referencia para este Indicador.');
define('MSG_INDIC_NO_MED', 'Todavía no se han creado mediciones para este Indicador.');
define('MSG_INDIC_PERIODICIDAD', 'IMPORTANTE: Cambió la periodicidad del Indicador. Por favor, revise las mediciones: borre aquellas que considere no válidas.');
define('MSG_INDIC_NO_ASIG', 'No dispone de Indicadores bajo su responsabilidad.');

//Mediciones
define('MSG_MED_NO_REBIUN', 'No se han generado las mediciones del año anterior para los Datos Rebiun. Por favor, genere antes las mediciones.');
define('MSG_MED_NO_ASIG', 'No tiene asignada ninguna medición.');
define('MSG_MED_BORRADA', 'La/s medición/es se ha/n borrado con éxito.');
define('MSG_MED_CONFIRM_BORRAR', 'Confirme si desea borrar esta medición. Recuerde que se borrarán los valores y los valores de referencia recogidos para esta medición.');
define('MSG_MEDS_CONFIRM_BORRAR', 'Confirme si desea borrar las mediciones seleccionadas. Recuerde que se borrarán todos los valores y valores de referencia de las mediciones que sean eliminadas.');
define('MSG_MEDS_GRABADAS', 'Mediciones grabadas');
define('MSG_MED_ETIQUETA_NULA', 'La etiqueta no puede estar vacía. Puede restituir el valor anterior pulsando el icono "X" (cancelar).');
define('MSG_MED_VAL_NO_PERIODO', 'No se pueden grabar valores, esta fuera del periodo de grabación:');
define('MSG_MED_VAL_NULO', 'Está intentando introducir un valor vacío. Puede restituir el valor anterior pulsando el icono "X" (cancelar). Puede dejarlo en blanco (nulo) introduciendo tres guiones seguidos (---).');
define('MSG_MED_VAL_INTERVALO', 'Debe insertar un valor que esté dentro del intervalo de valores permitidos por el Indicador:');
define('MSG_MED_VAL_NOMUM', 'Está intentando introducir un dato que no es reconocido como número.');
define('MSG_MEDS_INDIC_NO_UNID', 'Mediciones en la muestra, de Indicadores que no pertenecen a la Unidad actual.');
define('MSG_MED_CREADA', 'Se ha agregado correctamente una nueva medición. Unidades afectadas: ');
define('MSG_MED_CREAR', 'Esta acción, creará automáticamente todas las mediciones (si no existen), desde el inicio del año seleccionado (mínimo = año del histórico) hasta el fin del año actual. Tomará algun tiempo en función del año seleccionado y la periodicidad del Indicador, ¿está seguro?');
define('MSG_MED_CARGAR', 'Esta acción, cargará la cantidad indicada de registros de las mediciones del Indicador. Tomará algo de tiempo en función del número de registros seleccionado, ¿está seguro?');
define('MSG_MED_GENERANDO', 'Generando mediciones... espere por favor.');
define('MSG_MED_CARGANDO', 'Cargando mediciones... espere por favor.');
define('MSG_MED_GENERADA', 'Se ha/n generado correctamente todas la/s medición/es.');
define('MSG_MED_EXISTE', 'Se ha/n generado sólo la/s medición/es no existente/s desde el año seleccionado.');
define('MSG_MEDS_NO_MARCADAS', 'No se ha marcado ninguna medición para borrar.');
define('MSG_MED_RESP_ARCHIVADO', 'No se pueden editar responsables de medición en Indicadores archivados. Restaure primero el Indicador.');

//Páginas
define('MSG_PAG_NUEVA_OK', 'La página se ha creado correctamente.');
define('MSG_PAG_CONFIRM_EDITAR', 'Va a editar esta página, ¿está seguro?');
define('MSG_PAG_EDIT_OK', 'La página se ha modificado correctamente.');

//Planes
define('MSG_PLANES_NO', 'No hay Planes Estratégicos definidos para ninguna Unidad.');
define('MSG_PLAN_CONFIRM_BORRAR', '¿Realmente quiere borrar este Plan?');
define('MSG_PLAN_CREADO', 'Se ha creado un nuevo Plan Estratégico para esta Unidad.');
define('MSG_PLAN_EDITADO', 'Se ha editado el Plan correctamente.');
define('MSG_PLAN_CONFIRM_EDITAR', 'Va a editar este Plan, ¿está seguro?');
define('MSG_PLAN_BORRADO', 'Se ha eliminado el Plan Estratégico:');
define('MSG_PLAN_BORRAR', 'No tiene permisos para borrar el Plan o éste todavía contiene Líneas Estratégicas. Bórrelas primero.');
define('MSG_PLAN_NO_LINEAS', 'No hay Líneas Estratégicas definidas para este Plan.');
define('MSG_PLAN_NO_OBJEST', 'No hay Objetivos Estratégicos definidos para las Líneas Estratégicas del Plan.');
define('MSG_PLAN_NO_OBJOP', 'No hay Objetivos Operacionales definidos para los Objetivos Estratégicos de las Líneas Estratégicas del Plan.');
define('MSG_PLAN_NO_ARCHIVOS', 'No se han subido archivos para este Plan Estratégico.');

//Líneas
define('MSG_LINEA_CONFIRM_BORRAR', '¿Realmente quiere borrar esta Línea?');
define('MSG_LINEA_CREADA', 'Se ha creado una nueva Línea Estratégica para este Plan.');
define('MSG_LINEA_EDITADA', 'Se ha editado la Línea correctamente.');
define('MSG_LINEA_CONFIRM_EDITAR', 'Va a editar esta Línea, ¿está seguro?');
define('MSG_LINEA_BORRADA', 'Se ha eliminado la Línea Estratégica:');
define('MSG_LINEA_BORRAR', 'No tiene permisos para borrar la Línea o ésta todavía contiene Objetivos Estratégicos. Bórrelos primero.');
define('MSG_LINEA_NO_OBJEST', 'No hay Objetivos Estratégicos definidos para esta Línea Estratégica del Plan.');
define('MSG_LINEA_NO_OBJOP', 'No hay Objetivos Operacionales definidos para los Objetivos Estratégicos de esta Línea Estratégica del Plan.');

//Objetivos Estratégicos
define('MSG_OBJEST_CONFIRM_BORRAR', '¿Realmente quiere borrar este Objetivo Estratégico?');
define('MSG_OBJEST_CREADO', 'Se ha creado un nuevo Objetivo Estratégico para esta Línea del Plan:');
define('MSG_OBJEST_EDITADO', 'Se ha editado el Objetivo Estratégico correctamente.');
define('MSG_OBJEST_CONFIRM_EDITAR', 'Va a editar este Objetivo Estratégico, ¿está seguro?');
define('MSG_OBJEST_BORRADO', 'Se ha eliminado el Objetivo Estratégico:');
define('MSG_OBJEST_BORRAR', 'No tiene permisos para borrar el Objetivo Estratégico o éste todavía contiene Objetivos Operacionales. Bórrelos primero.');
define('MSG_OBJEST_NO_OBJOP', 'No hay Objetivos Operacionales definidos para este Objetivo Estratégico de esta Línea Estratégica del Plan.');

//Objetivos Operacionales
define('MSG_OBJOP_CONFIRM_BORRAR', '¿Realmente quiere borrar este Objetivo Operacional?');
define('MSG_OBJOP_CREADO', 'Se ha creado un nuevo Objetivo Operacional para el actual Objetivo Estratégico:');
define('MSG_OBJOP_EDITADO', 'Se ha editado el Objetivo Operacional correctamente.');
define('MSG_OBJOP_CONFIRM_EDITAR', 'Va a editar este Objetivo Operacional, ¿está seguro?');
define('MSG_OBJOP_BORRADO', 'Se ha eliminado el Objetivo Operacional:');
define('MSG_OBJOP_BORRAR', 'No tiene permisos para borrar el Objetivo Operacional.');
define('MSG_OBJOP_NO_INDICS_CORREL', 'No se han definido los Indicadores de Correlación para este Objetivo Operacional.');
define('MSG_OBJOP_NO_INDICS_CONTROL', 'No se han definido los Indicadores de Control para este Objetivo Operacional.');
define('MSG_OBJOP_VALOR_EJ', 'Debe introducir un valor numérico y positivo en el porcentaje de ejecución.');
define('MSG_OBJOP_NO_SUBUNID_ASIG', 'No se han asignado Unidad/Subunidades a este Objetivo Operacional (corregir).');
define('MSG_OBJOP_NO_ASIG', 'No dispone de Objetivos Operacionales bajo su responsabilidad.');

//Procesos
define('MSG_PROCS_NO', 'No hay Procesos definidos para ninguna Unidad.');
define('MSG_PROC_NO_ASIG', 'No dispone de Procesos en propiedad.');
define('MSG_PROC_NO_SUBPROCS', 'Este Proceso no tiene subprocesos.');
define('MSG_PROC_NO_FLUJO', 'Este Proceso no tiene flujograma. Suba el archivo de imagen correspondiente y defina su descripción como flujograma.');
define('MSG_PROC_BORRADO', 'Se ha borrado el Proceso: ');
define('MSG_PROC_CONFIRM_EDITAR', 'Va a editar este Proceso, ¿está seguro?');
define('MSG_PROC_CONFIRM_BORRAR', '¿Realmente quiere borrar este Proceso?');
define('MSG_PROC_GRABAR', 'Se ha grabado un nuevo Proceso para esta Unidad.');
define('MSG_PROC_EDITADO', 'Se ha modificado el Proceso correctamente.');
define('MSG_PROC_NO_INDIC', 'No se ha definido ningún Indicador para este Proceso.');
define('MSG_PROC_NO_INDIC_ARCHIVADOS', 'No hay Indicadores archivados en este Proceso.');
define('MSG_PROC_NO_ARCHIVOS', 'No se han subido archivos para este Proceso.');
define('MSG_PROC_MAPA', 'Prepare un archivo de imagen con el mapa 
    de procesos, un ancho aproximado de 1200 píxeles y formato PNG, JPG o GIF. Vaya a la ficha de su unidad y en la 
    pestaña archivos suba el fichero con el nombre que desee pero indicando sólo la palabra "mapa" en la descripción. 
    Vuelva al listado de procesos y allí aparecera el mapa en su apartado correspondiente.');

//Usuarios
define('MSG_USER_CREADO', 'Se ha creado un nuevo usuario en el sistema.');
define('MSG_USER_EDITADO', 'El usuario se ha modificado correctamente.');
define('MSG_USER_CONFIRM_EDITAR', 'Va a editar este usuario, ¿está seguro?');
define('MSG_USERS_CONFIRM_VINC', '¿Desea vincular a la Unidad los usuarios marcados?');
define('MSG_USERS_CONFIRM_DESVINC', '¿Desea desvincular de la Unidad los usuarios marcados?');
define('MSG_USERS_NO_MARCADOS', 'No se ha marcado ningun usuario.');

//Valores
define('MSG_VAL_NO_ASIG', 'Todavía no se han asignado valores a esta medición.');
define('MSG_VALS_CALCULADOS', 'Se han calculado/actualizado los valores correctamente.');
define('MSG_VALS_CONFIRM_DESACT', '¿Desea desactivar los valores marcados?');
define('MSG_VAL_REF_NO_VALIDO', 'Valor de referencia incorrecto para la estimación actual');
define('MSG_VALS_REF_CONFIRM_BORRAR', '¿Desea borrar los valores de referencia marcados?');
define('MSG_VAL_REF_CREADO', 'Se ha añadido correctamente el valor de referencia:');
define('MSG_VAL_REF_EDITADO', 'Se ha editado correctamente el valor de referencia:');
define('MSG_VALS_REF_BORRADO', 'Se han borrado:');
define('MSG_VALS_REF_NO_MARCADOS', 'No se ha marcado ningún valor de referencia.');
define('MSG_VALS_REF_STATUS', 'Cree valores de referencia con el nombre "Meta" (color verde) y/o "Límite" (color rojo) para activar el control del status por colores en las mediciones.');
define('MSG_VALS_DESACT', 'Se han desactivado:');
define('MSG_VALS_NO_MARCADOS', 'No se ha seleccionado ningún valor para desactivar.');
define('MSG_VAL_ARCHIVADO', 'No se pueden editar valores en Indicadores archivados. Restaure primero el Indicador.');

//Control
define('MSG_CONTROL_MED_INFO', 'El control de mediciones se muestra por años. Seleccione un año en el desplegable para visualizar los resultados. Sólo aparecerán los indicadores bajo su responsabilidad o todos si también es responsable de la Unidad.');
define('MSG_CONTROL_EFQM_INFO', 'El control EFQM se muestra por criterios. Seleccione un criterio en el desplegable para visualizar los resultados. Aparecerán los indicadores asociados a dicho criterio.');
define('MSG_CONTROL_PLANES_INFO', 'El control de Planes Estratégicos se muestra por años. Le permite ver los resultados no grabados para un año en un Plan, Línea, Objetivo Estratégico u Operacional. Seleccione un año en el desplegable para visualizar los resultados. Sólo aparecerán los Objetivos Operacionales bajo su responsabilidad o todo si también es responsable de la Unidad.');
define('MSG_CONTROL_EFQM_NO_RESUL', 'No se ha seleccionado ningún criterio EFQM o no existen indicadores/datos para los criterios seleccionados.');
define('MSG_CONTROL_NO_RESPONSABLE', 'Usted no es responsable de esta unidad y tampoco de ningún Proceso, Indicador u Objetivo de la misma.');
define('MSG_CONTROL_CARGA', 'Cargando datos de control, por favor espere.');
define('MSG_CONTROL_NO_MED_NULO', 'No se ha encontrado Indicadores con mediciones nulas para el año seleccionado, o no existen mediciones para este año.');
define('MSG_CONTROL_NO_VAL', 'No existen mediciones o no se han grabado valores durante el año seleccionado.');
define('MSG_CONTROL_NO_MED', 'No se han creado mediciones para el año seleccionado.');
define('MSG_CONTROL_MED', 'No existen indicadores sin mediciones para el año seleccionado.');
define('MSG_CONTROL_NO_RESUL', 'No existen resultados no grabados o Planes Estratégicos para el año seleccionado.');

//----------------------------------------------------------------------------------
//ERRORES: ERR_[Nombre]
//----------------------------------------------------------------------------------

define('ERR', 'Error');
define('ERR_PERMISOS', 'No tiene permisos para realizar esta acción.');
define('ERR_404', 'Error 404: no encontramos la página que ha solicitado:');
define('ERR_AUT', 'No está autorizado para realizar esta operación.');
define('ERR_OP_BD', 'No ha podido realizarse la operación por un error en la base de datos.');
define('ERR_CON_BD', 'Error de conexión a la base de datos.');
define('ERR_CONSULTA_OP', 'Fallo en la consulta getOperador.');
define('ERR_CONSULTA_EXE', 'Fallo en la ejecución de la consulta');
define('ERR_DIR', 'Error no se ha podido crear el directorio tipo objeto.');
define('ERR_SUBDIR', 'Error no se ha podido crear el subdirectorio objeto.');
define('ERR_NO_DIR_NAME', 'No se ha proporcionado un nombre de directorio.');
define('ERR_PARAM', 'Faltan parámetros para realizar esta acción.');
define('ERR_GUARDAR', 'Hubo un problema, no se han podido guardar los cambios.');

//Archivos
define('ERR_ARCHIVO_BORRAR', "Faltan datos para procesar la solicitud de borrado del archivo.");
define('ERR_ARCHIVO_NO', 'No existe el archivo con el identificador:');
define('ERR_ARCHIVO_GRABAR', 'Error no se han podido grabar los datos del archivo.');
define('ERR_ARCHIVO_SUBIR', 'No se ha podido subir el archivo, consulte al administrador del sistema.');
define('ERR_ARCHIVO_NO_SEL', 'No se ha especificado ningún archivo para subir.');

//Cartas de Servicios
define('ERR_CARTA_MOSTRAR', 'No se puede mostrar la Cartera de Sercicios, el identificador no existe en la base de datos.');
define('ERR_CARTA_EDIT', 'La Carta de Compromisos no existe o no tiene permisos para editarla.');

//Normativas
define('ERR_NORMATIVA_MOSTRAR', 'No se puede mostrar la Normativa, el identificador no existe en la base de datos.');
define('ERR_NORMATIVA_EDIT', 'La Normativa no existe o no tiene permisos para editarla.');

//Servicios
define('ERR_SERVICIO_MOSTRAR', 'No se puede mostrar el Servicio, el identificador no existe en la base de datos.');
define('ERR_SERVICIO_VAL_INDICE', 'Ya existe un Servicio con el mismo índice para esta Carta de Compromisos.');
define('ERR_SERVICIO_EDIT', 'El Servicio no existe o no tiene permisos para editarlo.');

//Compromisos
define('ERR_COMPROMISO_MOSTRAR', 'No se puede mostrar el Compromiso, el identificador no existe en la base de datos.');
define('ERR_COMPROMISO_VAL_INDICE', 'Ya existe un Compromiso con el mismo índice para este Servicio.');
define('ERR_COMPROMISO_EDIT', 'El Compromiso no existe o no tiene permisos para editarlo.');

//Derechos
define('ERR_DERECHO_MOSTRAR', 'No se puede mostrar el Derecho, el identificador no existe en la base de datos.');
define('ERR_DERECHO_EDIT', 'El Derecho no existe o no tiene permisos para editarlo.');

//Panel de Gestión (antes Cuadros de Mando)
const ERR_PANEL_GESTION_MANDO = 'El Panel de Gestión no existe o no tiene permisos para consultarlo.';
const ERR_CUAD_MANDO = ERR_PANEL_GESTION_MANDO;
const ERR_PANEL_GESTION_EDIT = 'El Panel de Gestión no existe o no tiene permisos para editarlo.';
const ERR_CUAD_MANDO_EDIT = ERR_PANEL_GESTION_EDIT;
//Bloques (antes Paneles)
const ERR_BLOQUE_VAL_ORDEN = 'Ya existe un bloque con el mismo orden en este Panel de Gestión.';
const ERR_PANEL_VAL_ORDEN = ERR_BLOQUE_VAL_ORDEN;

//Entidades (Unidades)
define('ERR_UNID_MOSTRAR', 'No se puede mostrar la Unidad, el identificador no existe en la base de datos.');
define('ERR_UNID_EDIT', 'No se ha podido modificar la Unidad.');

//Indicadores
define('ERR_INDIC_BORRAR_MED', 'Tiene mediciones asociadas al Indicador, necesita borrar primero las mediciones.');
define('ERR_INDIC_BORRAR_DEP', 'Este Indicador influye en el cálculo de otros Indicadores. Debe eliminar éstos primero.');
define('ERR_INDIC_ARCHIVAR_DEP', 'Este Indicador influye en el cálculo de otros Indicadores. Debe archivar éstos primero.');
define('ERR_INDIC_BORRAR_OBJOP', 'No se puede borrar el Indicador, está asociado al menos con un Objetivo Operacional de un Plan Estratégico.');
const ERR_INDIC_BORRAR_BLOQUE = 'No se puede borrar el Indicador, está asociado al menos con un bloque de los Paneles de Gestión. Debe quitarse antes del bloque.';
const ERR_INDIC_BORRAR_PANEL = ERR_INDIC_BORRAR_BLOQUE;
define('ERR_INDIC_GRABAR', 'No se ha podido grabar el Indicador.');
define('ERR_INDIC_MOSTRAR', 'No se puede mostrar el Indicador, el identificador no existe en la base de datos.');

//Mediciones
define('ERR_MED_MOSTRAR', 'No se puede mostrar la medicion, el identificador no existe en la base de datos.');
define('ERR_MED_NO_VAL', 'No existen valores pendientes ni recogidos para esta medición.');
define('ERR_MED_GRABAR', 'Ha ocurrido un error al grabar la medición, inténtelo de nuevo o contacte con los administradores de icasus.');
define('ERR_MED_BORRAR', 'No se puede borrar la medicion ya que influye en el cálculo de otros Indicadores. Borre éstos primero');
define('ERR_MED_RESP', 'No tiene permisos suficientes para editar responsables.');

//Planes
define('ERR_PLAN_MOSTRAR', 'No se puede mostrar el Plan Estratégico, el identificador no existe en la base de datos.');
define('ERR_PLAN_EDIT', 'El Plan Estratégico no existe o no tiene permisos para editarlo.');
define('ERR_PLAN_VAL_ANYO', 'Ya existe un Plan con el mismo año de inicio.');

//Líneas
define('ERR_LINEA_MOSTRAR', 'No se puede mostrar la Línea, el identificador no existe en la base de datos.');
define('ERR_LINEA_EDIT', 'La Línea Estratégica no existe o no tiene permisos para editarla.');
define('ERR_LINEA_VAL_INDICE', 'Ya existe una Línea con el mismo índice para este Plan.');

//Objeticos Estratégicos
define('ERR_OBJEST_MOSTRAR', 'No se puede mostrar el Objetivo Estratégico, el identificador no existe en la base de datos.');
define('ERR_OBJEST_EDIT', 'El Objetivo Estratégico no existe o no tiene permisos para editarlo.');
define('ERR_OBJEST_VAL_INDICE', 'Ya existe un Objetivo Estratégico con el mismo índice para esta Línea del Plan.');

//Objeticos Operacionales
define('ERR_OBJOP_MOSTRAR', 'No se puede mostrar el Objetivo Operacional, el identificador no existe en la base de datos.');
define('ERR_OBJOP_EDIT', 'El Objetivo Operacional no existe o no tiene permisos para editarlo.');
define('ERR_OBJOP_VAL_INDICE', 'Ya existe un Objetivo Operacional con el mismo índice para este Objetivo Estratégico de esta Línea del Plan.');

//Procesos
define('ERR_PROC_MOSTRAR', 'No se puede mostrar el Proceso, el identificador no existe en la base de datos.');
define('ERR_PROC_BORRAR', 'Tiene Indicadores asociados al Proceso, necesita borrar primero los Indicadores.');
define('ERR_PROC_GRABAR', 'Ha ocurrido un error al grabar el Proceso.');

//Usuarios
define('ERR_USER_MOSTRAR', 'No se puede mostrar el usuario, el identificador no existe en la base de datos.');
define('ERR_LOGIN', 'Usuario o clave incorrecta.');
define('ERR_LOGIN_SSO', 'El usuario pertenece al colectivo que tiene permiso para utilizar esta herramienta pero no se ha podido dar de alta en la herramienta. Contactar con icasus@us.es');
define('ERR_LOGIN_SSO_AUT', 'La relacion de este usuario con la Universidad no es la definida para utilizar esta herramienta. Contactar con icasus@us.es');

//Valores
define('ERR_VAL_REF_BORRAR', 'No se puede borrar un valor de referencia con valores asignados a alguna medición.');
define('ERR_VAL_EDIT', 'No tiene permisos suficientes para editar valores.');
