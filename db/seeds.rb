# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"


#########################################################################################
#             Necesarios para el modulo de grupos                                       #
#########################################################################################

ResearchFocus.create(name: "DEMO- Genética de la Conservación, Ornitología")
ResearchFocus.create(name: "DEMO- Biologia Molecular")
ResearchFocus.create(name: "DEMO- Limnologia Ecologia")
ResearchFocus.create(name: "DEMO- Mutagenesis y genómica")
ResearchFocus.create(name: "DEMO- DESARROLLO DE SATELITES")
ResearchFocus.create(name: "DEMO- ESTRATEGIAS EN CANNABIS MEDICINAL")
ResearchFocus.create(name: "DEMO- GESTIÓN Y SISTEMAS DE INFORMACIÓN EN SALUD")
ResearchFocus.create(name: "DEMO- LINEA DE INVESTIGACION EN TELESALUD Y TELEMEDICINA")
ResearchFocus.create(name: "DEMO- REDES DE NUEVA GENERACIÓN")
ResearchFocus.create(name: "DEMO- Ambientes y Herramientas Virtuales de Aprendizaje")
ResearchFocus.create(name: "DEMO- Gamificación y Video juegos")
ResearchFocus.create(name: "DEMO- Ingeniería Web")

StateGroup.create(name: "Activo")
StateGroup.create(name: "Inactivo")

GroupType.create(name: "Grupo de Investigación")
GroupType.create(name: "Semillero de Investigación")
GroupType.create(name: "Redes de Investigación")

30.times do
  name_rg = Faker::Company.name
  acronym_rg = ""
  name_rg.split.each do |word|
    acronym_rg += word[0]
  end

  ResearchGroup.create(
      name: name_rg,
      acronym: acronym_rg,
      description: Faker::Lorem.paragraphs.join(),
      cidc_registration_date: Faker::Date.backward(50),
      cidc_act_number: Faker::Number.number(4),
      faculty_registration_date: Faker::Date.backward(50),
      faculty_act_number: Faker::Number.number(4),
      state_group_id: rand(1..2),
      snies_id: Faker::Number.number(5).to_s,
      email: Faker::Internet.email,
      gruplac: Faker::Internet.url("colciencias.com"),
      webpage: Faker::Internet.url,
      mission: Faker::Lorem.paragraphs.join(),
      vision: Faker::Lorem.paragraphs.join(),
      research_focus_ids: Array.new(2) { rand(1..5) },
      colciencias_code: Faker::Number.number(14),
      group_type_id: rand(1..3)
  )
end

puts "Grupos ok"

Role.create(name: "Director")
Role.create(name: "Estudiante")

CineBroadArea.create(name: "Programas y certificaciones genéricos", code: "00")
CineBroadArea.create(name: "Educación", code: "01")
CineBroadArea.create(name: "Artes y Humanidades", code: "02")
CineBroadArea.create(name: "Ciencias Sociales, periodismo e información", code: "03")
CineBroadArea.create(name: "Administración de Empresas y Drecho", code: "04")
CineBroadArea.create(name: "Ciencias Naturales, Matemáticas y Estadística", code: "05")
CineBroadArea.create(name: "Tecnologías de la Información y la Comunicación (TIC)", code: "06")
CineBroadArea.create(name: "Ingeniería, Industria y Construcción", code: "07")
CineBroadArea.create(name: "Agropecuario, Silvicultura, Pesca y Veterinaria", code: "08")
CineBroadArea.create(name: "Salud y Bienestar", code: "09")
CineBroadArea.create(name: "Servicios", code: "10")

CineSpecificArea.create(name: "Programas y certificaciones básicos", code: "001", cine_broad_area_id: 1)
CineSpecificArea.create(name: "Alfabetización y Aritmética Elemental", code: "002", cine_broad_area_id: 1)
CineSpecificArea.create(name: "Competencias personales y desarrollo", code: "003", cine_broad_area_id: 1)
CineSpecificArea.create(name: "Educación", code: "011", cine_broad_area_id: 2)
CineSpecificArea.create(name: "Programas y certificaciones interdisciplinarios relativos a educación", code: "018", cine_broad_area_id: 2)
CineSpecificArea.create(name: "Artes", code: "021", cine_broad_area_id: 3)
CineSpecificArea.create(name: "Humanidades (excepto idiomas)", code: "022", cine_broad_area_id: 3)
CineSpecificArea.create(name: "Idiomas", code: "023", cine_broad_area_id: 3)
CineSpecificArea.create(name: "Programas y certificaciones Interdisciplinarios relativos a Artes y Humanidades", code: "028", cine_broad_area_id: 3)
CineSpecificArea.create(name: "Ciencias Sociales  y del Comportamiento", code: "031", cine_broad_area_id: 4)

CineDetailedArea.create(name: "Programas y certificaciones básicos", code: "0011", cine_specific_area_id: 1)
CineDetailedArea.create(name: "Alfabetización y Aritmética Elemental", code: "0021", cine_specific_area_id: 2)
CineDetailedArea.create(name: "Competencias personales y desarrollo", code: "0031", cine_specific_area_id: 3)
CineDetailedArea.create(name: "Ciencias de la educación", code: "0111", cine_specific_area_id: 4)
CineDetailedArea.create(name: "Formación para docentes de educación preprimaria", code: "0112", cine_specific_area_id: 4)
CineDetailedArea.create(name: "Formación para docentes sin asignatura de especialización", code: "0113", cine_specific_area_id: 4)
CineDetailedArea.create(name: "Formación para docentes con asignatura de especialización", code: "0114", cine_specific_area_id: 4)
CineDetailedArea.create(name: "Educación no clasificada en otra parte", code: "0119", cine_specific_area_id: 4)
CineDetailedArea.create(name: "Programas y certificaciones interdisciplinarios relativos a educación", code: "0188", cine_specific_area_id: 5)
CineDetailedArea.create(name: "Técnicas Audiovisuales y Producción para Medios de Comunicación", code: "0211", cine_specific_area_id: 6)
CineDetailedArea.create(name: "Diseño Industrial de Moda e Interioes", code: "0212", cine_specific_area_id: 6)
CineDetailedArea.create(name: "Bellas Artes", code: "0213", cine_specific_area_id: 6)
CineDetailedArea.create(name: "Artesanías", code: "0214", cine_specific_area_id: 6)
CineDetailedArea.create(name: "Música y Artes Escénicas", code: "0215", cine_specific_area_id: 6)
CineDetailedArea.create(name: "Artes no clasificadas en otra parte", code: "0219", cine_specific_area_id: 6)
CineDetailedArea.create(name: "Religión y Teología", code: "0221", cine_specific_area_id: 7)
CineDetailedArea.create(name: "Historia y Arqueología", code: "0222", cine_specific_area_id: 7)
CineDetailedArea.create(name: "Filosofía y Ética", code: "0223", cine_specific_area_id: 7)
CineDetailedArea.create(name: "Humanidades (excepto idiomas) no clasificados en otra parte", code: "0229", cine_specific_area_id: 7)
CineDetailedArea.create(name: "Adquisición del lenguaje", code: "0231", cine_specific_area_id: 8)
CineDetailedArea.create(name: "Literatura y Lingüistica", code: "0232", cine_specific_area_id: 8)
CineDetailedArea.create(name: "Idiomas no clasificados en otra parte", code: "0239", cine_specific_area_id: 8)
CineDetailedArea.create(name: "Programas y certificaciones Interdisciplinarios relativos a Artes y Humanidades", code: "0288", cine_specific_area_id: 9)
CineDetailedArea.create(name: "Economía", code: "0311", cine_specific_area_id: 10)
CineDetailedArea.create(name: "Ciencias Políticas y Educación Cívica", code: "0312", cine_specific_area_id: 10)

OecdKnowledgeArea.create(name: "Ciencias Naturales", code: "1")
OecdKnowledgeArea.create(name: "Ingeniería y Tecnología", code: "2")
OecdKnowledgeArea.create(name: "Ciencias Médicas y de la Salud", code: "3")
OecdKnowledgeArea.create(name: "Ciencias Agrícolas", code: "4")
OecdKnowledgeArea.create(name: "Otras 2 más", code: "5-6")


OecdKnowledgeSubarea.create(name: "Matemática", code: "1A", oecd_knowledge_area_id: 1)
OecdKnowledgeSubarea.create(name: "Computación y Ciencias de la Información", code: "1B", oecd_knowledge_area_id: 1)
OecdKnowledgeSubarea.create(name: "Ciencias Físicas", code: "1C", oecd_knowledge_area_id: 1)
OecdKnowledgeSubarea.create(name: "Otras 4 más", code: "1D-1G", oecd_knowledge_area_id: 1)
OecdKnowledgeSubarea.create(name: "Ingeniería Civil", code: "2A", oecd_knowledge_area_id: 2)
OecdKnowledgeSubarea.create(name: "Ingenierías Eléctrica, Electrónica e informática", code: "2B", oecd_knowledge_area_id: 2)
OecdKnowledgeSubarea.create(name: "Otros 9 más", code: "2C-2k", oecd_knowledge_area_id: 2)
OecdKnowledgeSubarea.create(name: "Medicina Básica", code: "3A", oecd_knowledge_area_id: 3)
OecdKnowledgeSubarea.create(name: "Medicina Clínica", code: "3B", oecd_knowledge_area_id: 3)
OecdKnowledgeSubarea.create(name: "Ciencias de la Salud", code: "3C", oecd_knowledge_area_id: 3)
OecdKnowledgeSubarea.create(name: "Otras 2 más", code: "3D-3E", oecd_knowledge_area_id: 3)


OecdDiscipline.create(name: "Matemáticas puras", code: "1A01", oecd_knowledge_subarea_id: 1)
OecdDiscipline.create(name: "Matemáticas aplicadas", code: "1A02", oecd_knowledge_subarea_id: 1)
OecdDiscipline.create(name: "Estadísticas y probabilidades (Investigación en metodologías)", code: "1A03", oecd_knowledge_subarea_id: 1)
OecdDiscipline.create(name: "Ciencias de la computación", code: "1B01", oecd_knowledge_subarea_id: 2)
OecdDiscipline.create(name: "Ciencias de la información y bioinformática (hardware en 2,b y aspectos socuales en 5,8", code: "1B02", oecd_knowledge_subarea_id: 2)
OecdDiscipline.create(name: "Física atómica, molecular y química", code: "1C01", oecd_knowledge_subarea_id: 3)
OecdDiscipline.create(name: "Física de la materia", code: "1C02", oecd_knowledge_subarea_id: 3)
OecdDiscipline.create(name: "Física de partículas y campo", code: "1C03", oecd_knowledge_subarea_id: 3)
OecdDiscipline.create(name: "Física nuclear", code: "1C04", oecd_knowledge_subarea_id: 3)
OecdDiscipline.create(name: "Física de plasmas y fluidos", code: "1C05", oecd_knowledge_subarea_id: 3)
OecdDiscipline.create(name: "Óptica", code: "1C06", oecd_knowledge_subarea_id: 3)
OecdDiscipline.create(name: "Acústica", code: "1C07", oecd_knowledge_subarea_id: 3)
OecdDiscipline.create(name: "Astronomía", code: "1C08", oecd_knowledge_subarea_id: 3)
OecdDiscipline.create(name: "Ingeniería civil", code: "2A01", oecd_knowledge_subarea_id: 5)
OecdDiscipline.create(name: "Ingeniería arquitectónica", code: "2A02", oecd_knowledge_subarea_id: 5)
OecdDiscipline.create(name: "Ingeniería de la construcción", code: "2A03", oecd_knowledge_subarea_id: 5)
OecdDiscipline.create(name: "Ingeniería estructural y municipal", code: "2A04", oecd_knowledge_subarea_id: 5)
OecdDiscipline.create(name: "Ingeniería de transporte", code: "2A05", oecd_knowledge_subarea_id: 5)
OecdDiscipline.create(name: "Ingeniería eléctrica y electrónica", code: "2B01", oecd_knowledge_subarea_id: 6)
OecdDiscipline.create(name: "Robótica y control automático", code: "2B02", oecd_knowledge_subarea_id: 6)
OecdDiscipline.create(name: "Automatización y sistemas de control", code: "2B03", oecd_knowledge_subarea_id: 6)
OecdDiscipline.create(name: "Ingeniería de sistemas y comunicaciones", code: "2B04", oecd_knowledge_subarea_id: 6)
OecdDiscipline.create(name: "Telecomunicaciones", code: "2B05", oecd_knowledge_subarea_id: 6)
OecdDiscipline.create(name: "Hardware y arquitectura de computadores", code: "2B06", oecd_knowledge_subarea_id: 6)
OecdDiscipline.create(name: "Anatomía y morfología (ciencias vegetales en 1.F)", code: "3A01", oecd_knowledge_subarea_id: 8)
OecdDiscipline.create(name: "Genética humana", code: "3A02", oecd_knowledge_subarea_id: 8)
OecdDiscipline.create(name: "Inmunología", code: "3A03", oecd_knowledge_subarea_id: 8)
OecdDiscipline.create(name: "Neurociencias", code: "3A04", oecd_knowledge_subarea_id: 8)
OecdDiscipline.create(name: "Farmacología y farmacia", code: "3A05", oecd_knowledge_subarea_id: 8)
OecdDiscipline.create(name: "Medicina química", code: "3A06", oecd_knowledge_subarea_id: 8)
OecdDiscipline.create(name: "Toxicología", code: "3A07", oecd_knowledge_subarea_id: 8)
OecdDiscipline.create(name: "Fisiología (incluye citología)", code: "3A08", oecd_knowledge_subarea_id: 8)
OecdDiscipline.create(name: "Patología", code: "3A09", oecd_knowledge_subarea_id: 8)
OecdDiscipline.create(name: "Tiene 29", code: "3B01-3B29", oecd_knowledge_subarea_id: 9)
OecdDiscipline.create(name: "Tiene 14", code: "3C01-3C14", oecd_knowledge_subarea_id: 10)


StateResearcher.create(name: "Activo")
StateResearcher.create(name: "Inactivo")

30.times do
  name_aux = Faker::Name.initials
  last_name = Faker::Name.last_name
  Researcher.create(identification_number: Faker::Number.number(10).to_s,
                    orcid_id: Faker::Alphanumeric.alphanumeric(10),
                    scientific_signature: last_name.concat(", ", name_aux),
                    oas_researcher_id: rand(1..20).to_s,
                    mobile_number: Faker::PhoneNumber.cell_phone_with_country_code,
                    address: Faker::Address.full_address
  )
end

# 15.times do |i|
#   GroupMember.create(role_id: rand(1..2),
#                      researcher_id: i + 1,
#                      research_group_id: (i+4)/4,
#                      state_researcher_id: 1
#   )
# end
#
# 100.times do |i|
#   GmPeriod.create(initialDate: "20/10/2019", role_id: 1, group_member_id: i + 1)
# end
# 100.times do |i|
#   GmPeriod.create(initialDate: "20/10/2019", role_id: 2, group_member_id: i + 101)
# end


# StateSeedbed.create(name: "Activo")
# StateSeedbed.create(name: "Inactivo")
# 100.times do
#   ResearchSeedbed.create(
#     name: Faker::Company.name,
#     acronym: Faker::Company.suffix,
#     description: Faker::Lorem.paragraphs,
#     # faculty_ids: Array.new(2) { rand(1..5) },
#     curricular_project_ids: Array.new(2) { rand(1..15) },
#     cidcRegistrationDate: Faker::Date.backward(50),
#     cidcActNumber: Faker::Number.number(4),
#     facultyRegistrationDate: Faker::Date.backward(50),
#     facultyActNumber: Faker::Number.number(4),
#     state_seedbed_id: rand(1..2),
#     snies_id: rand(1..10),
#     email: Faker::Internet.email,
#     webpage: Faker::Internet.url,
#     mission: Faker::Lorem.paragraphs,
#     vision: Faker::Lorem.paragraphs,
#     research_focus_ids: Array.new(2) { rand(1..5) },
#   )
# end
#
#
# EntityType.create(name: "Publica")
# EntityType.create(name: "Privada")
# EntityType.create(name: "Mixta")
# AgreementStatus.create(name: "Activo")
# AgreementStatus.create(name: "Inactivo")
# AgreementStatus.create(name: "Aprobado")
# AgreementStatus.create(name: "Vigente")
# AgreementStatus.create(name: "Finalizado")
# AgreementStatus.create(name: "Cancelado")
# AgreementStatus.create(name: "En prueba")
# AgreementStatus.create(name: "Aplazado")
# AgreementStatus.create(name: "En proceso de finalizacion")
# AgreementType.create(name: "Marco")
# AgreementType.create(name: "Especifico")
# AgreementType.create(name: "Acuerdo de Cooperacion")
# AgreementType.create(name: "Contrato")
# AgreementType.create(name: "Inter Administrativo")
# Agreement.create(name: "Prueba", startDate: "2019-09-10", finalDate: "2019-09-10", agreementNumber: 5200, agreement_status_id: 1, agreement_type_id: 1, duration: 2, availability: 300, bizagiNumber: 300, description: "Acuerdo")
# FundingEntity.create(name: "Colciencias", entity_type_id: 1,country: "Colombia",city: "Bogota",mobileNumber:503241,address:"Cra 88")
# Contribution.create(funding_entity_id: 1, agreement_id: 1, inKindContribution: 50000, cashContribution: 50000)
# Contribution.create(funding_entity_id: 1, agreement_id: 1, inKindContribution: 50000, cashContribution: 50000)
# ArpRole.create(name: "Investigador Principal")
# ArpRole.create(name: "CoInvestigador")
# ArpRole.create(name: "Auxiliar de investigacion")
# ArpRole.create(name: "Estudiante de pregrado")
# ArpRole.create(name: "Estudiante de maestria")
# ArpRole.create(name: "Estudiante de doctorado")
# ArpRole.create(name: "Joven investigador")
# ProductType.create(name:"Articulo")
# ProductType.create(name:"Capitulo de libro")
# ProductType.create(name:"Libro")

puts "Seed complete"
