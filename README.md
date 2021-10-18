# icasus

Icasus es una herramienta para la implantación y el seguimiento de un 
sistema de gestión de excelencia.

Es una herramienta fundamental de consulta para EVALUAR y DECIDIR QUÉ, 
QUIÉN, CÓMO y CUÁNDO medimos.

Permite llevar un inventario de todos los procesos de una organización 
compleja, pudiendo medir los indicadores que miden estos procesos de 
manera desagregada para cada una de las subunidades que componen un área.

Permite también relacionar los indicadores entre si para realizar 
cálculos, hacer consultas para contrastar resultados y crear cuadros de 
mando para presentar la información estratégica de una manera clara e 
intuitiva.

Toda la información de procesos, indicadores y cuadros de mando se 
encuentra centralizada y actualizada constantemente.

![alt text](https://github.com/Universidad-de-Sevilla/icasus/raw/master/icasus/public/images/ayuda/pantalla_inicio_unidad.png "Captura de pantalla de una unidad")

Se ha desarrollado en la Universidad de Sevilla por el personal 
informático de la Dirección de Recursos Humanos y con la colaboración 
de la Biblioteca Universitaria que ha hecho de Icasus la columna 
vertebral de su sistema de gestión de calidad y excelencia.

Es una herramienta que se encuentra en continuo desarrollo para irse 
adaptando a los cambios que la propia universidad está realizando en 
su camino hacia una gestión excelente.

Icasus es una herramienta de software libre por lo que puede ser 
utilizada y modificada por cualquiera que lo desee.  

Utiliza php, mysql, bootstrap3, smarty, adodb y active record.

## Instalación de la aplicación

1. Clona el proyecto con Git o bien descarga un comprimido desde https://github.com/Universidad-de-Sevilla/icasus/archive/master.zip
y descomprime su contenido. Después, cámbiate al directorio del proyecto.

2. Crea una carpeta "templates_c" dentro de la carpeta "icasus" de la aplicación con permisos de lectura y escritura para el 
usuario bajo el que corre tu servidor web. Crea otra carpeta "private_upload" con los mismos permisos y con las 
subcarpetas "carta", "plan", "proceso" y "unidad". Puedes crear todas las carpetas golpe y porrazo con
(no olvides asignar después los permisos para el usuario del servicio web):
```shell
mkdir -m 775 -p icasus/templates_c icasus/private_upload/{carta,plan,proceso,unidad}`
```

4. Crea una nueva base de datos en tu servidor mysql y haz un volcado del script "icasus/tablas_icasus.sql" para generar 
las tablas necesarias. También puedes volcar los valores por defecto de las tablas auxiliares, cuyo contenido es más o menos estático
usando las consultas: volcado_criterios_efqm, volcado_roles, volcado_tipo_agregacion, volcado_visibilidad. Si lo deseas
también puedes crear algunas unidades y usuarios de prueba para poder empezar a "hacer algo" tras la instalación, utiliza 
las consultas volcado_usuarios_demo y volcado_entidades_demo.

Por último copia el fichero "icasus/app_code/app_config.php.sample" a un nuevo fichero con el nombre "icasus/app_code/app_config.php". 
Edita su contenido para configurar el acceso a la base de datos, algunas rutas y la url del sitio.

Con eso podrías acceder a http://tuservidor.com/icasus/public/index.php y ver la pantalla de login. Usa "admin" con la 
clave "admin" para acceder si has volcado los usuarios de prueba.

## Volcado de datos de usuarios y entidades/unidades

La aplicación no dispone de herramientas para crear usuarios o entidades. Se presupone que estos datos se incorporarán 
a la base de datos utilizando un volcado desde otra aplicación o base de datos.

A continuación te indico cuales serían los campos imprescindibles que necesitan estas tablas para funcionar:
### Tabla icasus_usuario
- id (entero) - Se puede facilitar o dejar que SQL lo asigne automáticamente
- login (texto 50) - Se puede usar el correo 
- clave (texto 45) - No es obligatoria, cuidado porque no va encriptada
- nombre(texto 45)
- apellidos (texto 75)
- nif (texto 10)
- correo (texto 75)
- puesto (texto 250) No es obligatorio pero si se facilita aparece junto al nombre del usuario a la hora de asignar responsabilidades


### Tabla icasus_entidad
- id (entero) - En esta tabla es mejor proveerlo para poder indicar las relaciones entre unidades usando el campo id_madre
- nombre (texto 75)
- etiqueta (texto 50)
- etiqueta_mini (texto 12)
- codigo (texto 50)
- id_madre (entero) - Codigo de la unidad superior, si no tiene introducir 0.


## Tips & Bugs
En versiones posteriores a mySQL 5.7.0 el modo "ONLY_FULL_GROUP_BY" que viene implementado por defecto en el servidor 
entra en conflicto con algunas consultas de Icasus, para evitarlo debes añadir la siguiente línea de código al archivo 
"/etc/mysql/my.cnf" dentro de la sección '[mysqld]'

`sql_mode = "STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"`