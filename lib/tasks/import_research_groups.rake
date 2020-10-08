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
			:acronym
		] # Additional mapping needed
	}
) do |row|
	groups = ResearchGroup.create(
		name: row[:name],
		acronym: row[:acronym],
		group_state_id: rand(1..2),
		group_type_id: rand(1..3),
		cidc_registration_date: '01/01/2020',
		cidc_act_number: 'test',
		faculty_registration_date: '01/01/2020',
		faculty_act_number: 'test',
		snies_id: rand(1..3),
		email: 'test@test.com'
	)
	puts "Importing research group: '#{groups.name}'"
end
puts "Research groups data successfully imported!"
end
end
