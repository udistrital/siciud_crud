# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"
5.times do
  Faculty.create(
    name: Faker::University.name,
  )
end

15.times do
  CurricularProject.create(
    name: Faker::University.suffix,
    faculty_id: rand(1..5),
  )
end

10.times do
  ResearchFocus.create(
    name: Faker::Lorem.sentence(3),
    faculty_id: rand(1..5),
  )
end

StateGroup.create(name: "Activo")
StateGroup.create(name: "Inactivo")

10.times do
  Snies.create(
    code: Faker::Number.number(5),
    name: Faker::Lorem.sentence(3),
  )
end

100.times do
  ResearchGroup.create(
    name: Faker::Company.name,
    acronym: Faker::Company.suffix,
    description: Faker::Lorem.paragraphs,
    faculty_ids: Array.new(2) { rand(1..5) },
    curricular_project_ids: Array.new(2) { rand(1..15) },
    cidcRegistrationDate: Faker::Date.backward(50),
    cidcActNumber: Faker::Number.number(4),
    facultyRegistrationDate: Faker::Date.backward(50),
    facultyActNumber: Faker::Number.number(4),
    state_group_id: rand(1..2),
    snies_id: rand(1..10),
    email: Faker::Internet.email,
    gruplac: Faker::Internet.url("colciencias.com"),
    webpage: Faker::Internet.url,
    mission: Faker::Lorem.paragraphs,
    vision: Faker::Lorem.paragraphs,
    research_focus_ids: Array.new(2) { rand(1..5) },
    colcienciasCode: Faker::Number.number(4),

  )
end

Role.create(name: "Director")
Role.create(name: "Estudiante")
DocumentType.create(name: "CC")
Genre.create(name: "Male")
StateResearcher.create(name: "Activo")
ResearcherType.create(name: "Docente")
Researcher.create(name: "Jorge",
                  document_type_id: 1,
                  faculty_id: 1,
                  curricular_project_id: 1,
                  snies_id: 1,
                  researcher_type_id: 1,
                  codeNumber: 1564,
                  identificationNumber: 451,
                  lastName: "bocanegra")

100.times do |i|
  GroupMember.create(role_id: 1, researcher_id: 1, research_group_id: i + 1, state_researcher_id: 1)
end
100.times do |i|
  GroupMember.create(role_id: 2, researcher_id: 1, research_group_id: i + 1, state_researcher_id: 1)
end
StateSeedbed.create(name: "Activo")
StateSeedbed.create(name: "Inactivo")
100.times do
  ResearchSeedbed.create(
    name: Faker::Company.name,
    acronym: Faker::Company.suffix,
    description: Faker::Lorem.paragraphs,
    faculty_ids: Array.new(2) { rand(1..5) },
    curricular_project_ids: Array.new(2) { rand(1..15) },
    cidcRegistrationDate: Faker::Date.backward(50),
    cidcActNumber: Faker::Number.number(4),
    facultyRegistrationDate: Faker::Date.backward(50),
    facultyActNumber: Faker::Number.number(4),
    state_seedbed_id: rand(1..2),
    snies_id: rand(1..10),
    email: Faker::Internet.email,
    webpage: Faker::Internet.url,
    mission: Faker::Lorem.paragraphs,
    vision: Faker::Lorem.paragraphs,
    research_focus_ids: Array.new(2) { rand(1..5) },
  )
end


EntityType.create(name: "Publica")
EntityType.create(name: "Privada")
EntityType.create(name: "Mixta")
AgreementStatus.create(name: "Activo")
AgreementStatus.create(name: "Inactivo")
AgreementStatus.create(name: "Aprobado")
AgreementStatus.create(name: "Vigente")
AgreementStatus.create(name: "Finalizado")
AgreementStatus.create(name: "Cancelado")
AgreementStatus.create(name: "En prueba")
AgreementStatus.create(name: "Aplazado")
AgreementStatus.create(name: "En proceso de finalizacion")
AgreementType.create(name: "Marco")
AgreementType.create(name: "Especifico")
AgreementType.create(name: "Acuerdo de Cooperacion")
AgreementType.create(name: "Contrato")
AgreementType.create(name: "Inter Administrativo")
Agreement.create(name: "Prueba", startDate: "2019-09-10", finalDate: "2019-09-10", agreementNumber: 5200, agreement_status_id: 1, agreement_type_id: 1, duration: 2, availability: 300, bizagiNumber: 300, description: "Acuerdo")
FundingEntity.create(name: "Colciencias", entity_type_id: 1,country: "Colombia",city: "Bogota",mobileNumber:503241,address:"Cra 88")
Contribution.create(funding_entity_id: 1, agreement_id: 1, inKindContribution: 50000, cashContribution: 50000)
Contribution.create(funding_entity_id: 1, agreement_id: 1, inKindContribution: 50000, cashContribution: 50000)
ArpRole.create(name: "Investigador Principal")
ArpRole.create(name: "CoInvestigador")
ArpRole.create(name: "Auxiliar de investigacion")
ArpRole.create(name: "Estudiante de pregrado")
ArpRole.create(name: "Estudiante de maestria")
ArpRole.create(name: "Estudiante de doctorado")
ArpRole.create(name: "Joven investigador")
ProductType.create(name:"Articulo")
ProductType.create(name:"Capitulo de libro")
ProductType.create(name:"Libro")

puts "Seed complete"
