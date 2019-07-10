# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
5.times do
    Faculty.create(
        name: Faker::University.name
        )
end

15.times do 
    CurricularProject.create(
        name: Faker::University.suffix,
        faculty_id: rand(1..5)
    )
end

10.times do 
    ResearchFocus.create(
        name: Faker::Lorem.sentence(3),
        faculty_id: rand(1..5)
    )
end

StateGroup.create(name: "Activo")
StateGroup.create(name: "Inactivo")

10.times do 
    Snies.create(
        code: Faker::Number.number(5),
        name: Faker::Lorem.sentence(3)
    )
end

100.times do
    ResearchGroup.create(
        name: Faker::Company.name,
        acronym: Faker::Company.suffix,
        description: Faker::Lorem.paragraphs,
        faculty_ids: Array.new(2) { rand(1..5)},
        curricular_project_ids: Array.new(2) { rand(1..15)},
        cidcRegistrationDate: Faker::Date.backward(50),
        cidcActNumber: Faker::Number.number(4),
        facultyRegistrationDate: Faker::Date.backward(50),
        facultyActNumber: Faker::Number.number(4),
        state_group_id: rand(1..2),
        snies_id: rand(1..10),
        email: Faker::Internet.email,
        gruplac: Faker::Internet.url('colciencias.com'),
        webpage: Faker::Internet.url,
        mission: Faker::Lorem.paragraphs,
        vision: Faker::Lorem.paragraphs,
        research_focus_ids: Array.new(2) { rand(1..5)},
        colcienciasCode: Faker::Number.number(4)
        
    )
end


Role.create(name:"Director")
DocumentType.create(name:"CC")
Genre.create(name:"Male")
StateResearcher.create(name:"Activo")
ResearcherType.create(name:"Docente")
Researcher.create(name:"Jorge",document_type_id:1,faculty_id:1,curricular_project_id:1,snies_id:1,genre_id:1,researcher_type_id:1,codeNumber:1564,identificationNumber:451,lastName:"bocanegra",academicEmail:"Test")

100.times do |i|
Member.create(role_id:1,researcher_id:1,research_group_id:i+1,state_researcher_id:1)
end
StateSeedbed.create(name: "Activo")
StateSeedbed.create(name: "Inactivo")
100.times do
    ResearchSeedbed.create(
        name: Faker::Company.name,
        acronym: Faker::Company.suffix,
        description: Faker::Lorem.paragraphs,
        faculty_ids: Array.new(2) { rand(1..5)},
        curricular_project_ids: Array.new(2) { rand(1..15)},
        cidcRegistrationDate: Faker::Date.backward(50),
        cidcActNumber: Faker::Number.number(4),
        facultyRegistrationDate: Faker::Date.backward(50),
        facultyActNumber: Faker::Number.number(4),
        state_seedbed_id: rand(1..2),
        snies_id: rand(1..10),
        mail: Faker::Internet.email,
        webpage: Faker::Internet.url,
        mission: Faker::Lorem.paragraphs,
        vision: Faker::Lorem.paragraphs,
        research_focus_ids: Array.new(2) { rand(1..5)}        
    )
end

puts "Seed complete"