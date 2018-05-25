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

![alt text](https://github.com/Universidad-de-Sevilla/icasus/raw/master/icasus/public/images/captura_icasus.png "Captura de pantalla de una unidad")

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

1. Clona el proyecto con con git o descarga un comprimido desde https://github.com/Universidad-de-Sevilla/icasus/archive/master.zip

2. Crea una carpeta "templates_c" dentro de la carpeta "icasus/icasus" de la aplicación con permisos de lectura y escritura para el 
usuario bajo el que corre tu servidor web. Crea otra carpeta "private_upload" con los mismos permisos y con las 
subcarpetas "carta", "plan", "proceso" y "unidad". Puedes hacerlo todo de golpe y porrazo con:
`mkdir -m 774 -p templates_c private_upload/{carta,plan,proceso,unidad}`

3. Crea una nueva base de datos en tu servidor mysql y haz un volcado del script "icasus/tablas_icasus.sql" para generar 
las tablas necesarias. También puedes volcar los valores por defecto de las tablas auxiliares, cuyo contenido es más o menos estático
usando las consultas: volcado_criterios_efqm, volcado_roles, volcado_tipo_agregacion, volcado_visibilidad. Si lo deseas
también puedes crear algunas unidades y usuarios de prueba para poder empezar a "hacer algo" tras la instalación, utiliza 
las consultas volcado_usuarios_demo y volcado_entidades_demo.

Por último copia el fichero "icasus/app_code/app_config.php.sample" a un nuevo fichero con el nombre "icasus/app_code/app_config.php". 
Edita su contenido para configurar el acceso a la base de datos, algunas rutas y la url del sitio.

Con eso podrías acceder a http://tuservidor.com/icasus/public/index.php y ver la pantalla de login. Usa "admin" con la 
clave "admin" para acceder si has volcado los usuarios de prueba.