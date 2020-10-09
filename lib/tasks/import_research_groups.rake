require 'csv'
namespace :import_research_groups do
	desc "Import research_groups data from spreadsheet"
	task data: :environment do
		puts 'Cleaning up Model'
		ResearchGroup.destroy_all
		ActiveRecord::Base.connection.reset_pk_sequence!('research_groups')
		CSV.foreach('lib/data/ListGrupos.csv', {:headers => [
			:code,
			:faculty,
			:name,
			:curricular_project,
			:acronym,
			:group_type,
			:group_state,
			:cidc_registration_date,
			:director,
			:director_doc,
			:focus,
			:colciencias_code,
		] # Additional mapping needed
	}
) do |row|
        # Transform
# 		faculty = case row[:faculty]
#         when "1"
#         3
#         when "2"
#         1
#         when "1"
#         2
#         else
#         1
#         end

		group_type_id = case row[:group_type]
        when "Grupo"
        1
        when "Semillero"
        2
        else
        1
        end

		group_state_id = case row[:group_state]
        when "Activo"
        1
        when "Inactivo"
        2
        else
        2
        end
	groups = ResearchGroup.create(
		name: row[:name],
		acronym: row[:acronym],
        group_state_id: group_state_id,
        group_type_id: group_type_id,
		cidc_registration_date: row[:cidc_registration_date],
		cidc_act_number: '123',
		faculty_registration_date: '01/01/2020',
		faculty_act_number: '123',
		snies_id: rand(1..3),
		email: 'test@test.com',
		colciencias_code: row[:colciencias_code]
	)
	puts "Importing research group: '#{groups.name}'"
end
puts "Research groups data successfully imported!"
end
end
