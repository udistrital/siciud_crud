# SICIUD CRUD

## Descripción
API para la gestión de la información del SICIUD, esta versión recibe el nombre de SICIUD versión 2.

Esta versión cuenta con el módulo de Unidades de Investigación que agrupa los **Grupos de Investigación**, 
los **Semilleros de Investigación** y una nueva unidad de investigación llamada **Red de Investigación**.

Este módulo requirió una integración con la API de *Terceros CRUD* (con el fin de eliminar redundancias y 
tener integridad de los datos de los investigadores y usuarios vinculados a la Universidad Distrital) y 
una Nuxeo (para la gestión y almacenamiento de los documentos requeridos en los diferentes módulos del SICIUD,
por ejemplo: Actas de creación de las Unidades de Investigación) labor apoyada por la Oficina Asesora de Sistemas 
(OAS).


# Especificaciones Técnicas

## Tecnologías Implementadas y Versiones
Este proyecto está desarrollado en el lenguaje Ruby versión 2.6, generado mediante el 
framework [Ruby on Rails](https://rubyonrails.org/) versión 5.2 y como motor de base de datos
PostgreSQL.

* [Ruby](https://www.ruby-lang.org/es/) 2.6.x
* [Ruby on Rails](https://rubyonrails.org/) 5.2.x
* [PostgreSQL](https://www.postgresql.org/) 12.x

## Instalación

* Paso previo: Instalar Ruby
    * Opción 1, [Instalar Ruby](https://www.ruby-lang.org/es/documentation/installation/)
    * Opción 2, [Ruby Version Manager - rvm](https://rvm.io/rvm/install) (Recomendada)
* Instalación
```sh
# Clonar el proyecto
# Rama master - main
git clone https://github.com/edissonca/siciud-backend.git
# Rama development
git clone -b development https://github.com/edissonca/siciud-backend.git

# Moverse a la carpeta del repositorio
cd siciud_crud

# Instale las gemas
# Instale la gema bundler
gem install bundler
# Instala las gemas requeridas
bundle install
# Configure las variables de entorno
# Ejecute el servidor
rails s
```

## Variables de Entorno
```sh
# Variables de entorno de las Bases de Datos de Producción, Desarrollo y Pruebas.
SICIUD_CRUD_PGDB_PROD=[nombre de la base de datos de producción]
SICIUD_CRUD_PGDB_DEV=[nombre de la base de datos de desarrollo]
SICIUD_CRUD_PGDB_TEST=[nombre de la base de datos de prueba]

# Variables generales Base de Datos
SICIUD_CRUD_PGHOST=[host de la base de datos]
SICIUD_CRUD_PGPORT=[puerto de la base de datos]
SICIUD_CRUD_PGUSER=[usuario con acceso a la base de datos]
SICIUD_CRUD_PGPASS=[password del usuario]

# Variables del API
SICIUD_CRUD_API_PORT=[puerto de ejecucion]
```

## Ejecución del Proyecto

### Ejecución Docker

### Ejecución docker-compose
Para desarrollo puede utilizar esta opción.
```sh
# 1. Clonar el repositorio
git clone -b development https://github.com/edissonca/siciud-backend.git

# 2. Moverse a la carpeta del repositorio
cd siciud-backend

# 3. Establecer las variables de entorno descritas en "Variables de Entorno"

# 4. Ejecutar el compose del contenedor
docker-compose up

# Puede utilizar -d, para correr los contenedores en segundo plano (Detached mode)
docker-compose up -d

# 6. Comprobar que los contenedores estén en ejecución
docker ps
```

# Modelo de Datos
En el siguiente diagrama para facilitar la visualización de las relaciones entre 
las tablas se omite la relación de cada una de las tablas presentes con la tabla users,
cada tabla cuenta con los campos *created_by* y *updated_by* los cuales almacenan el id del Usuario
que realiza la creación o la actualización de un registro correspondientemente.
![entrada](https://github.com/edissonca/siciud-backend/blob/GROUP-003/docs/research-unit-ER.png)

[Modelo de Datos API SICIUD](https://github.com/edissonca/siciud-backend/blob/GROUP-003/docs/research-unit-ER.png)

# Licencia

