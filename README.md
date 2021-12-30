
# siciud_crud

## Descripción

API para la gestión de la información del SICIUD, esta versión recibe el nombre de SICIUD versión 2.

Esta versión cuenta con el módulo de Unidades de Investigación que agrupa los **Grupos de Investigación**, 
los **Semilleros de Investigación** y una nueva unidad de investigación llamada **Red de Investigación**.

Este módulo requirió una integración con la API de *Terceros CRUD* (con el fin de eliminar redundancias y 
tener integridad de los datos de los investigadores y usuarios vinculados a la Universidad Distrital) y 
una Nuxeo (para la gestión y almacenamiento de los documentos requeridos en los diferentes módulos del SICIUD,
por ejemplo: Actas de creación de las Unidades de Investigación) labor apoyada por la Oficina Asesora de Sistemas 
(OAS).

# Modelo de Datos

![entrada](https://github.com/NemediDev/siciud-v2-back/blob/staging/docs/DiagramaDatos2021.png)

[Modelo de Datos API SICIUD](https://github.com/NemediDev/siciud-v2-back/blob/staging/docs/DiagramaDatos2021.png)

# Especificaciones Técnicas

## Tecnologías Implementadas y Versiones

Este proyecto está desarrollado en el lenguaje Ruby versión 2.6, generado mediante el 
framework [Ruby on Rails](https://rubyonrails.org/) versión 5.2 y como motor de base de datos
PostgreSQL.

* [Ruby](https://www.ruby-lang.org/es/) 2.6.2
* [Ruby on Rails](https://rubyonrails.org/) 5.2.3
* [PostgreSQL](https://www.postgresql.org/) 12

## Instalación

* Paso previo: Instalar Ruby
    * Opción 1, [Instalar Ruby](https://www.ruby-lang.org/es/documentation/installation/)
    * Opción 2, [Ruby Version Manager - rvm](https://rvm.io/rvm/install) (Recomendada)

* Instalación

```bash
# Clonar el proyecto,  rama master - main
git clone https://github.com/edissonca/siciud-backend.git

# Rama development
git clone -b development https://github.com/edissonca/siciud-backend.git

# Moverse a la carpeta del repositorio
cd siciud_crud

# Instale las gemas, instale la gema bundler
gem install bundler

# Instala las gemas requeridas
bundle install

# Configure las variables de entorno y ejecute el servidor
rails s
```

## Variables de Entorno

```sh
SICIUD_CRUD_PGDB=[nombre de la base de datos]
SICIUD_CRUD_PGHOST=[host de la base de datos]
SICIUD_CRUD_PGPORT=[puerto de la base de datos]
SICIUD_CRUD_PGUSER=[usuario con acceso a la base de datos]
SICIUD_CRUD_PGPASS=[contraseña del usuario]
SICIUD_CRUD_PGSCHEMA=[esquema de la base de datos]
```

## Ejecución del Proyecto

### Ejecución Dockerfile

```sh
# 1. Clonar el repositorio
git clone -b development https://github.com/edissonca/siciud-backend.git

# 2. Moverse a la carpeta del repositorio
cd siciud-backend

# 3. Establecer las variables de entorno descritas en "Variables de Entorno"

# 4. Ejecutar el build
docker build --build-arg SICIUD_CRUD_PGDB --build-arg SICIUD_CRUD_PGHOST --build-arg SICIUD_CRUD_PGPORT --build-arg SICIUD_CRUD_PGUSER --build-arg SICIUD_CRUD_PGPASS --build-arg SICIUD_CRUD_PGSCHEMA -t siciud_crud .

# 5. Correr la imagen para generar el contenedor
docker run -it --rm -p 8080:8080 siciud_crud

# Use la opción "-e" para modificar la variable de entorno requerida, ejemplo
docker run -it --rm -e SICIUD_CRUD_PGHOST="x.x.x.x" -p 8080:8080 siciud_crud

# 6. Comprobar que funciona correctamente
Realice una petición a cualquiera de los endpoints
```

### Ejecución docker-compose

Para desarrollo puede utilizar esta opción:

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

### Ejecución Pruebas

```bash
# Does not apply
```

### Ejecución CI

| Develop                                                                                                                                                                                                  | Release 0.0.1                                                                                                                                                                                                   | Master                                                                                                                                                                            |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [![Build Status](https://hubci.portaloas.udistrital.edu.co/api/badges/udistrital/siciud_crud/status.svg?ref=refs/heads/develop)](https://hubci.portaloas.udistrital.edu.co/udistrital/siciud_crud) | [![Build Status](https://hubci.portaloas.udistrital.edu.co/api/badges/udistrital/siciud_crud/status.svg?ref=refs/heads/release/0.0.1)](https://hubci.portaloas.udistrital.edu.co/udistrital/siciud_crud) | [![Build Status](https://hubci.portaloas.udistrital.edu.co/api/badges/udistrital/siciud_crud/status.svg)](https://hubci.portaloas.udistrital.edu.co/udistrital/siciud_crud) |

### Licencia

This file is part of siciud_crud.

siciud_crud is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

siciud_crud is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with siciud_crud. If not, see https://www.gnu.org/licenses/.



