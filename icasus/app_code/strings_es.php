<?php

/* Este fichero contiene constantes para todos los textos de la aplicación Icasus:
 * Clasificación:
 * TXT_[Nombre]--> Textos en general
 * MSG_[Nombre]--> Avisos/Notificaciones
 * ERR_[Nombre]--> Errores
 * FIELD_[Nombre]--> Campos de las tablas
 */

//---------------------------------------------------------------------------------
//TEXTOS: TXT_[Nombre]
//---------------------------------------------------------------------------------

//Archivos
define('TXT_ARCHIVOS_PROC', 'Archivos del proceso: ');
define('TXT_NEW_FILE_UP', 'Subir nuevo archivo');
define('TXT_FILE_UP', 'Subir archivo');
define('TXT_FILES_UP', 'Subir archivos');
define('TXT_UPDATE_FILE_DATA', 'Actualizar datos del archivo');
define('TXT_UPDATE_FILE', 'Actualizar archivo');
define('TXT_NEW_FILE', 'Nuevo archivo');
define('TXT_DELETE_FILE', 'Borrar archivo');
define('TXT_ARCHIVOS', 'Archivos');
define('TXT_SEL_FILE_TO_IMPORT', 'Elija un archivo para importar');
define('TXT_PROC_FILE', 'Procesa archivo');
define('TXT_PROC_FILES', 'Procesar archivos');
define('TXT_DESCARGA', 'Descargar archivo');
define('TXT_ABRIR_CSV', 'El archivo .csv generado puede abrirse con: ');
define('TXT_FILE_IMPORT_CSV', 'Importar archivo CSV');

//Cuadros de Mando
define('TXT_CUADRO_MANDO', 'Cuadro de Mando');
define('TXT_CUADROS_MANDO', 'Cuadros de Mando');
define('TXT_CUADROS_MANDO_PUBLIC', 'Cuadros de Mando públicos');
define('TXT_NEW_CUADRO', 'Nuevo Cuadro de Mando');
define('TXT_NEW_PANEL', 'Nuevo Panel');
define('TXT_CUADRO_MANDO_PROPIOS', 'Tus Cuadros de Mando');
define('TXT_CUAD_RES', 'Cuadro resumen');
define('TXT_CUADRO_EDIT', 'Editar Cuadro de Mando');
define('TXT_ADD_PANEL', 'Agregar Panel');
define('TXT_PANELES_INFO', 'Información sobre los Paneles');

//Datos
define('TXT_DATOS', 'Datos'); //También existe como FIELD_DATOS
define('TXT_MED_DATO', 'Mediciones del dato');
define('TXT_DATO', 'Dato');
define('TXT_FICHA_DATO', 'Ficha del dato: ');
define('TXT_NEW_DATO', 'Nuevo dato');
define('TXT_VER_DATOS', 'Ver datos');
define('TXT_DATO_PARAM', 'Parámetros del dato');
define('TXT_CREAR_DATO', 'Crear dato');
define('TXT_DAT_LISTAR', 'Listar datos');
define('TXT_RECOG_DAT_REBIUN', 'Recogida Datos Rebiun');
define('TXT_EXPORT_DAT', 'Exportar datos');
define('TXT_OTROS_DAT', 'Otros datos');
define('TXT_DET_DAT_REBIUN', 'Detalle datos Rebiun'); //2012
define('TXT_SUMA_DAT_REB', 'Suma Datos Rebiun');
define('TXT_PROMEDIO_DAT_REB', 'Promedio Datos Rebiun');
define('TXT_EXPORT_CSV_DET_DAT_REBIUN', 'Exportar en CSV detalle datos Rebiun');
define('TXT_EXPORT_CSV_SUM_DAT_REBIUN', 'Exportar en CSV suma datos Rebiun');
define('TXT_EXPORT_CSV_PROM_DAT_REBIUN', 'Exportar en CSV promedio datos Rebiun');


define('TXT_ICASUS', 'ICASUS');
define('TXT_INDIC_PROP', 'Indicadores propios de la Unidad');
define('TXT_INDIC_UNID_SUP', 'Indicadores de la Unidad superior');
define('TXT_INDIC_SEG_UNID', 'Indicadores segregados en los que mide la Unidad');
define('TXT_ASIGNAR_USERS', 'Asignar usuarios');
define('TXT_DESASIGNAR_USERS', 'Desasignar usuarios marcados');
define('TXT_ALL_UNIDS', 'Todas las unidades');
define('TXT_UNIDS', 'Unidades'); //También existe como FIELD_UNIDS
define('TXT_UNID', 'Unidad');
define('TXT_UNID_SEL', 'Seleccione o comience a teclear el nombre de la unidad a la que se copiará el indicador.');
define('TXT_ALTA_USERS', 'Alta de usuarios');
define('TXT_USER_UNIDS', 'Unidades del usuario');
define('TXT_USERS', 'Usuarios');
define('TXT_BAJA_USERS', 'Baja de usuarios');
define('TXT_USERS_ASIG', 'Usuarios asignados actualmente');
define('TXT_USERS_DISP', 'Usuarios disponibles');
define('TXT_VINC_USERS', 'Vincular usuarios');
define('TXT_DESVINC_USERS', 'Desvincular usuarios');

define('TXT_SEL', 'Seleccionar...');
define('TXT_SEL_UNO', 'Seleccionar uno...');

define('TXT_MED_ACARGO', 'Mediciones a su cargo');
define('TXT_INDIC_MED', 'Mediciones del indicador');

define('TXT_OTRAS_PROP', 'Otras propiedades');
define('TXT_SUBUNIDS', 'Subunidades'); //También existe como FIELD_SUBUNIDS
define('TXT_SUBUNID_AFECT', 'Subunidades afectadas'); //También existe como FIELD_SUBUNID_AFECT
define('TXT_NULL', 'NULO');


define('TXT_NEW_UNID', 'Nueva unidad');
define('TXT_NEW_INDIC', 'Nuevo indicador');
define('TXT_NEW_PAGE', 'Nueva página');
define('TXT_NEW_HELP_PAGE', 'Nueva página de ayuda');


define('TXT_VER', 'Ver');
define('TXT_VER_UNID', 'Ver unidad');
define('TXT_VER_PROC', 'Ver procesos');
define('TXT_VER_INDIC', 'Ver indicadores');

define('TXT_VOLVER_PROC', 'Volver al proceso');
define('TXT_VOLVER_MED', 'Volver a las mediciones');
define('TXT_VOLVER_INDIC', 'Volver al indicador');
define('TXT_VOLVER_INDICE', 'Volver al índice');
define('TXT_CONSULT_PARAM', 'Parámetros de la consulta');

define('TXT_CONSULT', 'Consulta avanzada');
define('TXT_CONSULT_AVAN', 'Consulta avanzada de datos e indicadores');
define('TXT_CONTENT_OF', 'Contenido de');
define('TXT_SHOW', 'Mostrar');
define('TXT_SHOW_RESUL', 'Mostrar resultado');
define('TXT_SHOW_MED', 'Mostrar mediciones');
define('TXT_INDIC_SHOW', 'Mostrar ficha del indicador');
define('TXT_INDIC_FICHA', 'Ficha del indicador');
define('TXT_UNID_FICHA', 'Ficha de Unidad');
define('TXT_PROC_FICHA', 'Ficha del Proceso');


define('TXT_NEW_PROC', 'Nuevo proceso');


define('TXT_CREAR_DIM', 'Crear dimensión');
define('TXT_CREAR_INDIC', 'Crear indicador');
define('TXT_EDIT_DIMS', 'Edición de dimensiones');
define('TXT_VAL_EDIT', 'Edición de valores');
define('TXT_LIST_UNID', 'Lista de unidades');
define('TXT_PROC_LISTAR', 'Listar procesos');
define('TXT_PROC_LIST', 'Lista de Procesos');
define('TXT_PROC_INDIC_LIST', 'Lista de procesos de la Unidad con sus indicadores');
define('TXT_INDIC_LISTAR', 'Listar indicadores');
define('TXT_LIST_DIM', 'Lista de dimensiones');

define('TXT_INDIC_LIST', 'Lista de indicadores');
define('TXT_INFO_LIST', 'Lista de informes disponibles');

define('TXT_A_Q_ESPERAS', '¿A que esperas?');

define('TXT_ADD_VAL', 'Agregar valor');
define('TXT_EDIT_UNID', 'Editar unidad');
define('TXT_EDIT_INDIC', 'Editar indicador');
define('TXT_EDIT_PROP', 'Editar propiedades');
define('TXT_EDIT_VALS', 'Editar valores');
define('TXT_EDIT_DIM', 'Editar dimensión');
define('TXT_IMPORT_VAL', 'Importar valores');
define('TXT_VOLVER', 'Volver al');
define('TXT_VOLVER_LIST', 'Volver al listado');
define('TXT_VAL_REF', 'Valores de referencia');
define('TXT_VAL_REC', 'Valores recogidos');
define('TXT_REL_DIM', 'Relación de dimensiones');
define('TXT_BARRAS', 'Barras');
define('TXT_BARRAS_DESC', 'Puede mostrar varios grupos de indicadores para una subunidad determinada en forma de barras');
define('TXT_LINEAS', 'Líneas');
define('TXT_LINEAS_DESC', 'Muestra varios indicadores para distintas subunidades como gráfica de líneas.');
define('TXT_TABLA', 'Tabla');
define('TXT_TABLA_DESC', 'Puede mostrar un indicador con sus mediciones para una o más subunidades en forma de tabla de datos');
define('TXT_TARTA', 'Tarta');
define('TXT_TARTA_DESC', 'Muestra como se reparte una medición de un indicador entre las subunidades afectadas como gráfica de tarta');
define('TXT_METRICA', 'Métrica');
define('TXT_METRICA_DESC', 'Muestra una medición puntual para una unidad y un indicador en forma de dígitos.');
define('TXT_DET', 'Detalle'); //También existe como FIELD_DET
define('TXT_TODOS', 'Todos');
define('TXT_LIST_TODOS', 'Listar todos');
define('TXT_PUBLIC', 'Público');
define('TXT_PRIVATE', 'Privado');
define('TXT_HISTORICO', 'Histórico anual');
define('TXT_ANUAL', 'Anual');
define('TXT_MENSUAL', 'Mensual');
define('TXT_TRIMESTRAL', 'Trimestral');
define('TXT_CUATRIMESTRAL', 'Cuatrimestral');
define('TXT_SEMESTRAL', 'Semestral');
define('TXT_2_ULT_ANYO', 'Dos últimos años');
define('TXT_2008', '2008');
define('TXT_2009', '2009');
define('TXT_2010', '2010');
define('TXT_2011', '2011');
define('TXT_2012', '2012');
//Tipos de medición
define('TXT_MED_UNICA', 'Medición única en la unidad actual');
define('TXT_MED_DES', 'Medición desagregada en las subunidades y cumplimentada por los responsables de las subunidades, o la persona delegada.');
define('TXT_MED_DES_CEN', 'Medición desagregada en las subunidades y cumplimentada de manera centralizada por el responsable de medición del indicador.');
define('TXT_BORRAR', 'Borrar');
define('TXT_BORRAR_INDIC', 'Borrar indicador');
define('TXT_MED_BORRAR', 'Borrar medición');
define('TXT_EDIT', 'Editar');
define('TXT_INDEF', 'Indefinido');
define('TXT_PROMED', 'Promedio');
define('TXT_SUMA', 'Suma');
define('TXT_SI', 'Si');
define('TXT_NO', 'No');
define('TXT_SIG', 'Siguiente');
define('TXT_ANT', 'Anterior');
define('TXT_REQ', '(Requerido)');

define('TXT_CONSULTAS', 'Consultas');
define('TXT_PROCESOS', 'Procesos de la Unidad');
define('TXT_INDICS', 'Indicadores'); //También existe como FIELD_INDICS
define('TXT_INDICS_COPY', 'Copiar indicadores');
define('TXT_INDICS_DIC', 'Diccionario de indicadores');
define('TXT_INDICS_MIO', 'Mis indicadores');



define('TXT_OTRO_OFIMATICA', 'Microsoft Office o cualquier otro programa de ofimática.');
define('TXT_FOOTER', 'ICASUS - APLICACIÓN DE GESTIÓN DE CALIDAD DE LOS SERVICIOS DE LA UNIVERSIDAD DE SEVILLA');

define('TXT_ELEG_UNO', 'Elegir uno si procede');
define('TXT_INFORME_IC', 'Informe generado por ICASUS');
define('TXT_INFORME_REB', 'Informe Rebiun'); //2012??
define('TXT_GRAFIC_INDIC_VAL', 'Gráfica con los valores del indicador');
define('TXT_DAT_INDIC', 'Datos del indicador');
define('TXT_GEN_INFO_WORD_INDIC', 'Generar un informe en Word de este indicador');
define('TXT_RTF', 'Rtf');
define('TXT_EXCEL', 'Excel');
define('TXT_EXPORT_EXCEL_INDIC', 'Exportar los datos del indicador a Excel');
define('TXT_INDIC_PUBLIC', 'Indicadores públicos');
define('TXT_INDIC_SUBUNID_VAL', 'Valores de las subunidades para');
define('TXT_CONFIRM', 'Por favor, confirme que desea');
define('TXT_INDIC_CONFIRM_ASIG_MED', 'Por favor, confirme si desea asignar esta medición.');
define('TXT_INDIC_ACT_MED', 'Marque la casilla si además quiere activarla');
define('TXT_MED_ACT_TODAS', 'Activar todas las mediciones.');
define('TXT_MED_DESACT_TODAS', ' Desactivar todas las mediciones.');
define('TXT_RANGO_FECHAS', 'Rango de fechas');
define('TXT_NO_ASIG', 'No asignado');

define('TXT_INICIO', 'Inicio');
define('TXT_INDIC_ACARGO', 'Indicadores a su cargo');
define('TXT_REG_EVENTOS', 'Registro de eventos');
define('TXT_BIENVENIDO', 'Bienvenido a Icasus');
define('TXT_UNIVERSIDAD', 'Universidad de Sevilla');
define('TXT_LOGIN', 'Iniciar sesión');
define('TXT_LOGIN_PARTE1', 'es una aplicación web para la gestión de la calidad en la');
define('TXT_LOGIN_PARTE2', 'Para acceder al sistema es necesario ser miembro activo de alguno de los grupos de calidad de la Universidad de Sevilla y solicitar autorización de acceso al responsable de su grupo de calidad.');
define('TXT_LOGIN_PARTE3', 'Icasus ha sido desarrollado por el');
define('TXT_LOGIN_PARTE4', 'y puede utilizarse como');
define('TXT_LOGIN_PARTE5', 'Puede bajar una primera versión del');
define('TXT_LOGIN_PARTE6', 'en formato PDF. Revisión disponible: 26 mayo 2010');
define('TXT_AREA_REC_HUM', 'Área de Recursos Humanos de la Universidad de Sevilla');
define('TXT_SOFT_LIBRE', 'Software Libre');
define('TXT_MANUAL', 'Manual de referencia rápida de Icasus');
define('TXT_MED_PROGRAM', 'Programar medición');
define('TXT_MED_VALORES', 'Valor o conjunto de valores de la medición actual');
define('TXT_MED_DATOS', 'Datos de la medición');
define('TXT_MED_GESTION', 'Gestión de mediciones');
define('TXT_USER_GESTION', 'Gestión de usuarios');
define('TXT_MED_AGREGAR', 'Agregar medición');
define('TXT_TABLA_VAL', 'Tabla de valores');
define('TXT_RESPONSABLES_GRABAR', 'Responsables de grabación');
define('TXT_UNIDS_MEDS_INDIC', 'Unidades con mediciones en el indicador');
define('TXT_MED_SEL_RESP', 'Elegir nuevo responsable grabación ...');
define('TXT_CERRAR_SESION', 'Cerrar sesión');
define('TXT_AYUDA', 'Ayuda');
define('TXT_MIS_NOTAS', 'Mis notas');
define('TXT_USER_NOTAS', 'Notas del usuario');
define('TXT_UNID_ACTUAL', 'Unidad actual');
define('TXT_INTRO_TEXTO', 'Introduce texto');
define('TXT_MAN', 'Manual');
define('TXT_PAGE_EDIT', 'Editar página');
define('TXT_PAGE_TITULO', 'Título de página');
define('TXT_BUSCAR_INDIC_BASE', 'Buscar Indicador base');
define('TXT_BUSCAR_INDIC_COMPLEMENT', 'Buscar Indicadores complementarios');
define('TXT_POR_MEDICION', 'Por medición');
define('TXT_POR_ANYOS', 'Por años');
define('TXT_BUSCAR', 'Buscar...');

define('TXT_ES_PROC_MADRE', 'Es un Proceso Madre');
define('TXT_INDICAR_COD', 'Indique un código estandarizado y único');
define('TXT_PROC_VERSION', 'Número de la versión actual de la ficha de proceso');
define('TXT_FECHA_REV_ACTUAL', 'Fecha de la revisión actual');
define('TXT_APOYO', 'Apoyo');
define('TXT_OPERATIVO', 'Operativo');
define('TXT_DIR_GES', 'Directivo/Gestión');
define('TXT_PROC_EDIT', 'Editar proceso');
define('TXT_PROC_CREAR', 'Crear proceso');
define('TXT_PROC_BORRAR', 'Borrar proceso');
define('TXT_PROC_INDICS', 'Indicadores asociados al proceso');
define('TXT_PROC_FLUJO', 'Flujograma del proceso');
define('TXT_PROC_ARCHIVOS', 'Archivos asociados al proceso');
define('TXT_USER_REL', 'Relación de usuarios');
define('TXT_USER_CREAR', 'Crear usuario');
define('TXT_USER_EDIT', 'Editar usuario');
define('TXT_USER_LIST', 'Lista de usuarios');
define('TXT_USER_DAT', 'Datos del usuario');
define('TXT_REF_NEW', 'Nueva referencia');
define('TXT_REF_EDIT', 'Editar valor de referencia');
define('TXT_REF_CREAR', 'Crear nuevos valores de referencia');
define('TXT_CONSTRUCTOR_INFORMES', 'Constructor de informes');
define('TXT_SEL_RAIZ_COD_UNID', 'Seleccionar la raíz del código de unidad para el grupo que desee:');
define('TXT_DEPARTAMENTOS', 'Departamentos');
define('TXT_BIBLIOTECAS', 'Bibliotecas');
define('TXT_INFORM_SEL_INDIC', 'Seleccionar los indicadores que contendrá el informe:');
define('TXT_NUM_CONVOCATORIAS', 'Número de convocatorias');
define('TXT_PLAZO_CONVOCATORIAS', 'Plazo convocatorias');
define('TXT_INDICE_PARTICIPACION', 'Índice de participación');
define('TXT_INDICE_SATISFACCION', 'Índice de satisfacción general');
define('TXT_VOL_TRAMITACION', 'Volumen tramitación');
define('TXT_FIABILIDAD_TRAMIT_EXPED', 'Volumen tramitación');
define('TXT_PRESTAMO_USER', 'Préstamo por usuario potencial');
define('TXT_INFORM_SEL_ANYO', 'Seleccionar los años que se reflejarán en el informe:');
define('TXT_SEG_INDIC_DEPART', 'Seguimiento Indicadores de los Departamentos');
define('TXT_UNIDS_UE01', 'Unidades UE01 con sus indicadores, valores y fecha');
define('TXT_INDIC_SUBUNID', 'Relación de indicadores de subentidades');
define('TXT_PAGINA', 'página');


//Accesibilidad (atributo alt de las imágenes)
define('TXT_REP_GRAFIC', 'Representación gráfica del indicador');
define('TXT_EXPORT_CSV', 'Exportar en CSV');
define('TXT_ICON', 'Icono');

//Texto botones
define('TXT_GRABAR', 'Grabar');
define('TXT_CANCEL', 'Cancelar');
define('TXT_GEN_INFO', 'Generar informe');
define('TXT_BTN_ENVIAR', 'Enviar');
define('TXT_BTN_GUARDAR', 'Guardar');
define('TXT_BTN_GRABAR_NOTA', 'Grabar nota');

//-------------------------------------------------------------------------------------
//NOTIFICACIONES/AVISOS: MSG_[Nombre]
//-------------------------------------------------------------------------------------

//Archivos
define('MSG_CONFIRM_DEL_FILE', 'Por favor, confirme si desea borrar el archivo.');
define('MSG_FILE_CORRECT_UPLOAD', 'Se ha subido correctamente el archivo.');
define('MSG_NO_FILE_PROC', 'No se han subido archivos para este proceso.');
define('MSG_REN_FILE', 'Recuerda que el nombre del archivo es el que se verá en la relación inferior, por ello renombra tu archivo antes de subirlo para que sea clarificador para los que vayan a descargarlos.');
define('MSG_FILE_NAME', 'IMPORTANTE: los nombres de los archivos no deben contener caracteres como ñ, acentos o espacios en blanco.');
define('MSG_ARCHIVO_BORRADO', 'Se ha borrado el archivo.');

//Cuadros de Mando
define('MSG_CUADRO_BORRADO', 'Se ha eliminado un Cuadro de Mando.');
define('MSG_BORRAR_PANEL', 'Va a borrar del Cuadro de Mando el siguiente Panel:');
define('MSG_NO_DEF_CUADRO', 'No has definido ningún Cuadro de Mando propio todavía.');
define('MSG_NO_CUADRO_PUBLIC', 'No existe ningún Cuadro de Mando público todavía.');

//Datos
define('MSG_DAT_BORRADO', 'Se ha borrado el dato: ');
define('MSG_INDIC_NO_DATOS', 'No hay datos.');
define('MSG_EXPORT_OK', 'Los datos se han exportado correctamente: ');
define('MSG_DAT_NO_VAL_REF', 'Es un dato y éstos no tienen asociados valores de referencia.');


define('MSG_UNID_NO_PROC', 'No hay procesos definidos para esta Unidad.');
define('MSG_INDIC_NO_UNID_SUP', 'No hay indicadores definidos en la unidad superior.');
define('MSG_UNID_ELIM', 'Se han eliminado de la Unidad');
define('MSG_UNID_ADD', 'Se han agregado a la Unidad');
define('MSG_UNID_MOD', 'La unidad se ha modificado con los datos que aparecen a continuación.');
define('MSG_UNID_NO_USERS', 'No se han vinculado usuarios a esta Unidad.');
define('MSG_UNID_NO_DATOS', 'No hay datos definidos para esta Unidad.');
define('MSG_UNID_NO_INDIC', 'No hay indicadores definidos para esta Unidad.');
define('MSG_UNID_SUBUNIDS_NO_INDIC', 'No hay indicadores definidos para las subunidades de esta unidad.');
define('MSG_NO_DEF', 'No se han definido.');
define('MSG_UNID_SUP_NO_PROC', 'La Unidad madre no tiene procesos.');
define('MSG_UNID_NO_SEG', 'Esta Unidad no mide indicadores segregados.');
define('MSG_UNID_NO_SUBUNIDS', 'Esta unidad no tiene subunidades.');
define('MSG_NO_SUBUNID_DATO_ASIG', 'No se han asignado subunidades a este dato (corregir)');
define('MSG_INDIC_NO_SUBUNID_ASIG', 'No se han asignado subunidades a este indicador (corregir)');
define('MSG_INDIC_NO_VAL', 'No hay valores recogidos para este indicador.');
define('MSG_INDIC_NO_ENC', 'No se han encontrado indicadores.');


define('MSG_EXITO_OP', 'Operación realizada con éxito.');
define('MSG_NO_MET_SOL', 'No existe el método solicitado.');
define('MSG_NO_MED_INDIC', 'Todavía no se han definido mediciones para este indicador.');
define('MSG_NO_DAT_INDIC', 'Todavía no se han introducido datos en este indicador.');
define('MSG_NO_MED_TIPO', 'Todavía no se han establecido mediciones para este');
define('MSG_FALTAN_PARAM_MET', 'Faltan parámetros para ejecutar el método');


define('MSG_INDIC_BORRADO', 'Se ha borrado el indicador.');

define('MSG_DIM_CREADA', 'Se ha creado una dimensión.');
define('MSG_DIM_EDITED', 'Se ha modificado una dimensión.');
define('MSG_UNID_CREADA', 'La unidad se ha creado correctamente con los datos que aparecen a continuación: ');
define('MSG_UNID_NO_ASIG', 'No tiene asignada ninguna unidad.');
define('MSG_MED_NO_ASIG', 'No tiene asignada ninguna medición.');
define('MSG_ERR', 'Por favor inténtelo de nuevo, si el problema persiste póngase en contacto con nosotros en la dirección: ');
define('MSG_NO_SESION', 'Debe iniciar sesión.');

define('MSG_INDIC_COPY', 'Indicadores copiados.');
define('MSG_INDIC_NO_PUBLIC', 'Este indicador no está definido como público.');
define('MSG_MED_BORRADA', 'La medición se ha borrado con éxito.');
define('MSG_INDIC_NO_VAL_REF', 'No se han definido valores de referencia para este indicador.');

define('MSG_MED_CREADA', 'Se ha agregado correctamente una nueva medición. Unidades afectadas: ');
define('MSG_GUARDAR_OK', 'Se han guardado los cambios correctamente.');
define('MSG_FIELD_REQ', '(Campo requerido)');
define('MSG_NEW_PAGE_OK', 'La página se ha creado correctamente.');
define('MSG_PAGE_EDIT_OK', 'La página se ha modificado correctamente.');
define('MSG_PROC_BORRADO', 'Se ha borrado el proceso.');
define('MSG_USER_BORRADO', 'Se ha borrado el usuario.');
define('MSG_USER_CREADO', 'Se ha creado un nuevo usuario en el sistema.');
define('MSG_USER_EDITED', 'El usuario se ha modificado correctamente.');
define('MSG_PROC_GRABAR', 'Se ha grabado un nuevo proceso para esta unidad.');
define('MSG_PROC_NO_INDIC', 'No se ha definido ningún indicador para este proceso.');
define('MSG_VAL_BORRADO', 'Se ha borrado un valor.');
define('MSG_VAL_EXPORT', 'Exportando valores para:');
define('MSG_VAL_GRABAR', 'El valor se ha grabado correctamente.');

//----------------------------------------------------------------------------------
//ERRORES: ERR_[Nombre]
//----------------------------------------------------------------------------------


//Archivos
define('ERR_DEL_FILE', "Faltan datos para procesar la solicitud de borrado del archivo.");
define('ERR_NO_FILE', 'No existe el archivo con el identificador:');
define('ERR_FILE_RECORD', 'Error no se han podido grabar los datos del archivo.');
define('ERR_FILE_UPLOAD', 'No se ha podido subir el archivo, consulte al administrador del sistema.');
define('ERR_FALTAN_PARAM_FILE_UP', 'Faltan parámetros para subir el archivo.');
define('ERR_FILE_NO_SEL', 'No se ha especificado ningún archivo para subir.');

//Cuadros de Mando
define('ERR_CUAD_MANDO', 'El Cuadro de Mando no existe o no tiene permisos para consultarlo.');
define('ERR_CUAD_MANDO_PARAM', 'Parámetros insuficientes para mostrar el Cuadro de Mando.');
define('ERR_CUAD_MANDO_EDIT', 'El Cuadro de Mando no existe o no tiene permisos para editarlo.');

//Datos
define('ERR_PARAM_CREA_DAT', 'Faltan parámetros para crear un nuevo dato.');
define('ERR_BORRAR_DAT_MED', 'Tiene mediciones asociadas al dato, necesita borrar primero las mediciones.');
define('ERR_BORRAR_DAT_NO_AUT', 'No tiene permisos para borrar el dato.');
define('ERR_GRABAR', 'No se ha podido grabar el dato.');
define('ERR_DATO_MOSTRAR', 'No se puede mostrar el dato, el identificador no existe en la base de datos.');
define('ERR_AUT_IMPORT_DAT_UNID', 'No tiene autorización para importar datos en esta unidad.');
define('ERR_EDIT_NO_AUT', 'No tiene permisos suficientes para editar datos de esta unidad.');




define('ERR', 'Error');
define('ERR_PERMISOS', 'No tiene permisos para relizar esta acción.');
define('ERR_ERR', 'Error');
define('ERR_404', 'Error 404: no encontramos la página que ha solicitado:');
define('ERR_AUT', 'No está autorizado para realizar esta operación.');
define('ERR_MED_CREAR', 'Faltan datos para procesar la petición de creación de medición.');
define('ERR_MED_AUT', 'No tiene permisos suficientes para agregar mediciones a este');
define('ERR_MED_TIPO_NO_BD', 'solicitado no existe en la base de datos');
define('ERR_OP_BD', 'No ha podido realizarse la operación por un error en la base de datos.');
define('ERR_CON_BD', 'Error de conexión a la base de datos.');
define('ERR_CONSULTA_OP', 'Fallo en la consulta getOperador.');
define('ERR_CONSULTA_EXE', 'Fallo en la consulta ejecución');
define('ERR_DIR', 'Error no se ha podido crear el directorio tipo objeto.');
define('ERR_SUBDIR', 'Error no se ha podido crear el subdirectorio objeto.');
define('ERR_NO_DIR_NAME', 'No se ha proporcionado un nombre de directorio.');

define('ERR_PARAM', 'Faltan parámetros para realizar esta acción.');

define('ERR_PARAM_INC', 'Parámetros incorrectos.');

define('ERR_FALTAN_PAR_IMPORT', 'Faltan parámetros para la importación.');
define('ERR_PARAM_PAG', 'Faltan parámetros para mostrar la página solicitada.');
define('ERR_PARAM_GRAFIC', 'Faltan parámetros para mostrar la gráfica.');
define('ERR_FALTAN_PARAM_CONSULTA', 'Parámetros insuficientes para realizar la consulta.');


define('ERR_UNID_NO_SEL', 'No se ha especificado una unidad para asignar usuarios.');

define('ERR_ENTIDAD', 'No ha especificado la unidad.');
define('ERR_UNID_LIST_INDIC', 'No ha especificado la unidad cuyos indicadores desea listar.');
define('ERR_MOD_UNID', 'No se ha podido modificar la unidad');

define('ERR_BORRAR_INDIC_MED', 'Tiene mediciones asociadas al indicador, necesita borrar primero las mediciones.');

define('ERR_BORRAR_INDIC_NO_AUT', 'No tiene permisos para borrar el indicador.');

define('ERR_EDIT_INDIC_NO_AUT', 'No tiene permisos suficientes para editar indicadores de esta unidad');

define('ERR_INDIC_GRABAR', 'No se ha podido grabar el indicador.');

define('ERR_INDIC_MOSTRAR', 'No se puede mostrar el indicador, el identificador no existe en la base de datos.');
define('ERR_NO_AUT_MOD', 'No tiene permisos para acceder a este módulo de la aplicación.');
define('ERR_CREA_DIM', 'No se ha podido crear la dimensión.');
define('ERR_INFORM_INDIC', 'No se puede generar el informe del indicador por falta de parámetros.');
define('ERR_LOGIN', 'Usuario o clave incorrecta.');
define('ERR_LOGIN_SSO', 'El usuario pertenece al colectivo que tiene permiso para utilizar esta herramienta pero no se ha podido dar de alta en la herramienta. Contactar con icasus@us.es');
define('ERR_LOGIN_SSO_AUT', 'La relacion de este usuario con la Universidad no es la definida para utilizar esta herramienta. Contactar con icasus@us.es');
define('ERR_MED_NO_VAL', 'Error: no existen valores pendientes ni recogidos para esta medición.');
define('ERR_MED_GRABAR', 'Ha ocurrido un error al grabar la medición, inténtelo de nuevo o contacte con los administradores de Icasus.');
define('ERR_GUARDAR', 'Hubo un problema, no se han podido guardar los cambios.');
define('ERR_PROC_BORRAR', 'Tiene indicadores asociados al proceso, necesita borrar primero los indicadores.');
define('ERR_PROC_BORRAR_NO_AUT', 'No tiene persimos para borrar el proceso.');
define('ERR_PROC_GRABAR', 'Ha ocurrido un error al grabar el proceso.');
define('ERR_VAL_GRABAR', 'Se ha producido un error, no se ha grabado el valor.');
define('ERR_USER_EDIT_NO_AUT', 'No tiene permiso para editar a este usuario.');

//-----------------------------------------------------------------------------------
//CAMPOS EN LAS TABLAS: FIELD_[Nombre]
//-----------------------------------------------------------------------------------


//Cuadros de Mando
define('FIELD_NOMBRE_CUADRO', 'Nombre del Cuadro de Mandos');

//Datos
define('FIELD_RESP_DATO', 'Responsable del dato');
define('FIELD_FUENTE_DAT', 'Fuente de datos');
define('FIELD_DATOS', 'Datos'); //También existe como TXT_DATOS
define('FIELD_DAT_REL', 'Datos relacionados');


define('FIELD_ID', 'Identificador');
define('FIELD_ACCIONES', 'Acciones');
define('FIELD_RESP', 'Responsable');
define('FIELD_RESP_SEG', 'Responsable de seguimiento');
define('FIELD_RESP_MED', 'Responsable de medición');

define('FIELD_RESP_GRABAR', 'Responsable de grabación');
define('FIELD_TITULO', 'Título');
define('FIELD_FILE', 'Archivo');
define('FIELD_DESC', 'Descripción');
define('FIELD_VISIB', 'Visible');
define('FIELD_USER', 'Usuario');
define('FIELD_COD', 'Código');
define('FIELD_NAME', 'Nombre');
define('FIELD_APEL', 'Apellidos');
define('FIELD_PROC', 'Proceso');
define('FIELD_PROC_MADRE', 'Proceso Madre');
define('FIELD_PROPIETARIO', 'Propietario');
define('FIELD_UNID', 'Unidad');
define('FIELD_UNID_RPT', 'Unidad RPT');
define('FIELD_PUESTO', 'Puesto de trabajo');
define('FIELD_UNID_SUP', 'Unidad superior');
define('FIELD_INDIC', 'Indicador');
define('FIELD_FECHA', 'Fecha');
define('FIELD_FECHA_HORA', 'Fecha/Hora');
define('FIELD_VAL', 'Valor');
define('FIELD_CALCULO', 'Cálculo');
define('FIELD_WEB', 'Sitio web');
define('FIELD_ROL', 'Rol');
define('FIELD_CORREO', 'Correo electrónico');
define('FIELD_TEL', 'Teléfono');
define('FIELD_FUENTE', 'Fuente');

define('FIELD_FUENTE_INFO', 'Fuente de información');

define('FIELD_UNID_GEN', 'Unidad generadora');
define('FIELD_UNID_DEST', 'Unidad de destino');
define('FIELD_HISTORICO', 'Histórico');
define('FIELD_PERIOD', 'Periodicidad');
define('FIELD_PERIODO', 'Periodo');
define('FIELD_INDI_DAT_REL', 'Indicadores/datos relacionados');

define('FIELD_COMENTARIOS', 'Comentarios');
define('FIELD_VISIBILIDAD', 'Visibilidad');
define('FIELD_TIP_MED', 'Tipo de medición');
define('FIELD_TIPO_PROC', 'Tipo de proceso');
define('FIELD_CALC_TOTAL', 'Cálculo del total');
define('FIELD_FORM', 'Formulación');
define('FIELD_UMBRAL', 'Umbral');
define('FIELD_OBJ', 'Objetivo');
define('FIELD_OBJP', 'Objetivo Pactado');
define('FIELD_OBJC', 'Objetivo Carta de Servicio');
define('FIELD_CREAC', 'Creación');
define('FIELD_MOD', 'Modificación');
define('FIELD_VERSION', 'Versión');
define('FIELD_FECHA_INIC', 'Fecha inicio');
define('FIELD_FECHA_FIN', 'Fecha fin');
define('FIELD_FECHA_REV', 'Fecha de revisión');
define('FIELD_FECHA_OBTENCION', 'Fecha de obtención');
define('FIELD_FECHA_RECOGIDA', 'Fecha recogida');
define('FIELD_AGREG', 'Agregado');
define('FIELD_MET', 'Método de comprobación/evidencia');
define('FIELD_INTERP', 'Interpretación');
define('FIELD_INDIC_REL', 'Indicadores relacionados');
define('FIELD_EFQM', 'Criterios EFQM');
define('FIELD_STANDARD', 'Estándar');
define('FIELD_INFORM', 'Informe');
define('FIELD_NIVEL_DES', 'Nivel de desagregación');
define('FIELD_SUBUNID', 'Subunidad');
define('FIELD_SUBUNIDS', 'Subunidades'); //También existe como TXT_SUBUNIDS
define('FIELD_SUBUNID_AFECT', 'Subunidades afectadas'); //También existe como TXT_SUBUNID_AFECT
define('FIELD_SUBPROCS', 'Subprocesos');
define('FIELD_SUBPROC', 'Subproceso');
define('FIELD_INICIO_PERIODO', 'Inicio del periodo');
define('FIELD_FIN_PERIODO', 'Fin del periodo');
define('FIELD_INICIO_GRABACION', 'Inicio de grabación');
define('FIELD_FIN_GRABACION', 'Fin de grabación');
define('FIELD_MEDIDOR', 'Medidor');
define('FIELD_ETIQUETA', 'Etiqueta');
define('FIELD_PENDIENTES', 'Pendientes');
define('FIELD_EVENTO', 'Evento');
define('FIELD_OBJETO', 'Objeto');
define('FIELD_CLAVE', 'Clave de acceso');
define('FIELD_REP_CLAVE', 'Repetir clave de acceso');
define('FIELD_MED', 'Medición');
define('FIELD_VAL_REF', 'Valor de referencia');
define('FIELD_USER_GRABA', 'Usuario que graba');
define('FIELD_CAMBIO_A', 'Cambio a:');
define('FIELD_ALIAS', 'Alias');
define('FIELD_PAGE_CONTENT', 'Contenido de la página');
define('FIELD_ORDEN', 'Orden');
define('FIELD_ANCHO', 'Ancho');
define('FIELD_ANYOS', 'Años');
define('FIELD_INDIC_BASE', 'Indicador base');
define('FIELD_INDIC_COMPLEMENT', 'Indicadores complementarios');
define('FIELD_TOTAL', 'Total');
define('FIELD_INDICS', 'Indicadores'); //También existe como TXT_INDICS
define('FIELD_MISION', 'Misión');
define('FIELD_EQUIP_PROC', 'Equipo de proceso');
define('FIELD_RESULTS_CLAVE', 'Resultados clave');
define('FIELD_ENTRADAS_PROV', 'Entradas/Proveedores');
define('FIELD_SALIDAS_CLIENTS', 'Salidas/Clientes');
define('FIELD_ACTIVIDADES', 'Actividades');
define('FIELD_VARS_CONTROL', 'Variables de control');
define('FIELD_DOCUMENTACION', 'Documentación');
define('FIELD_MEDICIONES', 'Mediciones');
define('FIELD_REGISTROS', 'Registros');
define('FIELD_DNI', 'DNI o NIE (con letra)');
define('FIELD_LOGIN', 'Login');
define('FIELD_DET', 'Detalle'); //También existe como TXT_DET
define('FIELD_OBSERV', 'Observaciones');
define('FIELD_VISIB_GRAFIC', 'Visible en gráfica');
define('FIELD_ACTIVO', 'Activo');
define('FIELD_UNIDS', 'Unidades'); //También existe como TXT_UNIDS