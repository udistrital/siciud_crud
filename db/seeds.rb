# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Role.create(name: "Director")
Role.create(name: "Docente")
Role.create(name: "Estudiante")
Role.create(name: "Egresado")
Role.create(name: "Líder semillero")
Role.create(name: "Invitado")
Role.create(name: "Sin asignar")

GmState.create(name: "Activo")
GmState.create(name: "Inactivo")

UserRole.create(name: "Administrador")
UserRole.create(name: "Gestor")
UserRole.create(name: "Editor")
UserRole.create(name: "Lector")
UserRole.create(name: "Integrante")
puts "Seed complete"
