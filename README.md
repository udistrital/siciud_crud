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

# Modelo de Datos

![entrada](https://github.com/edissonca/siciud-backend/blob/GROUP-003/docs/research-unit-ER.png)

[Modelo de Datos API SICIUD](https://github.com/edissonca/siciud-backend/blob/GROUP-003/docs/research-unit-ER.png)

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
~~~
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
~~~

## Variables de Entorno
~~~
SICIUD_CRUD__PGDB=[nombre de la base de datos]
SICIUD_CRUD__PGPASS=[password del usuario]
SICIUD_CRUD__PGURLS=[direccion de la base de datos]
SICIUD_CRUD__PGUSER=[usuario con acceso a la base de datos]
SICIUD_CRUD__PGSCHEMA=[esquema donde se ubican las tablas]
SICIUD_CRUD_API_PORT=[puerto de ejecucion]
~~~

## Ejecución del Proyecto

### Ejecución Dockerfile

```bash
# Does not apply
```

### Ejecución docker-compose

```bash
# Does not apply
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



